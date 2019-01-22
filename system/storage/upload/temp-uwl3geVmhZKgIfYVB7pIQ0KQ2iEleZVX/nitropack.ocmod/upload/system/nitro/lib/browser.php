<?php
class NitroBrowser {
    public static $connections = array();
    public $hosts_cache = array();
    public $URL;
    public $sock;
    public $timeout;
    public $read_chunk_size = 8192;
    public $max_response_size;
    public $buffer = '';
    public $headers = array();
    public $post_data = "";
    public $request_headers = array();
    public $http_version = '1.1';
    public $status_code = 200;
    public $body = '';
    public $auto_deflate = true;
    public $accept_deflate = true;

    private $end_of_chunks = false;
    private $chunk_remainder = 0;
    private $data_size = 0;

    private $data_callback = NULL;
    private $data_drain_file = NUll;
    private $is_gzipped = false;

    private $cookies = array();
    private $cookie_jar = "";

    public function __construct($URL, $cookie_jar = NULL) {
        $this->URL = $URL;

        $this->timeout = 5;//in seconds
        $this->max_response_size = 1024 * 1024 * 5;

        $this->cookie_jar = $cookie_jar;

        if ($this->cookie_jar && file_exists($this->cookie_jar)) {
            $this->cookies = json_decode(file_get_contents($this->cookie_jar), true);
        }
    }

    public function __destruct() {
        //$this->disconnect(); this is commented so we can keep the connection-alive
    }

    public function disconnect() {
        if (is_resource($this->sock)) {
            fclose($this->sock);
        }
    }

    public function setURL($URL) {
        $this->URL = $URL;
    }

    public function setPostData($data) {
        $this->post_data = !empty($data) ? http_build_query($data) : "";
    }

    public function setDataCallback($callback) {
        if (is_callable($callback)) {
            $this->data_callback = $callback;
        } else {
            $this->data_callback = NULL;
        }
    }

    public function setDataDrainFile($file) {
        if (is_resource($file)) {
            $this->data_drain_file = $file;
            stream_set_blocking($this->data_drain_file, false);
        } else if (is_string($file)) {
            $dir = dirname($file);
            if (!is_dir($dir) && !@mkdir($dir, 0755, true)) {
                $this->data_drain_file = NULL;
                return;
            }
            $this->data_drain_file = fopen($file, "w");
            stream_set_blocking($this->data_drain_file, false);
        } else {
            $this->data_drain_file = NULL;
        }
    }

    public function setCookie($name, $value, $domain = null) {
        if (!$domain && $this->host) {
            $domain = $this->host;
        }

        if ($domain) {
            if (empty($this->cookies[$domain])) {
                $this->cookies[$domain] = array();
            }
            $this->cookies[$domain][$name] = $value;
        }

        if ($this->cookie_jar) {
            file_put_contents($this->cookie_jar, json_encode($this->cookies));
        }
    }

    public function removeCookie($name, $domain = null) {
        if (!$domain && $this->host) {
            $domain = $this->host;
        }

        if ($domain) {
            if (!empty($this->cookies[$domain][$name])) {
                unset($this->cookies[$domain][$name]);
            }
        }

        if ($this->cookie_jar) {
            file_put_contents($this->cookie_jar, json_encode($this->cookies));
        }
    }

    public function clearCookies($domain) {
        if (isset($this->cookies[$domain])) {
            unset($this->cookies[$domain]);
        }

        if ($this->cookie_jar) {
            file_put_contents($this->cookie_jar, json_encode($this->cookies));
        }
    }

    public function parseURL() {
        if (!empty($this->URL)) {
            $this->URL = $this->encodeURL($this->URL);
            $info = parse_url($this->URL);
            if (count($info) == 1 && !empty($info['path'])) { // for some reason example.com is considered path
                if (preg_match('/\w+\.\w+/', $info['path'])) {
                    $this->host = $info['path'];
                    $this->port = 80;
                    $this->path = '/';
                } else {
                    if ($info['path'][0] == '/') {
                        $this->path = $info['path'];;
                    } else {
                        $this->path = rtrim($this->path, '/') . '/' . $info['path'];
                    }
                }
            } else {
                if (!empty($info['host'])) {
                    $this->host = $info['host'];
                } else if (empty($this->host)) {
                    throw new URLInvalidException('Invalid URL');
                }

                if (!empty($info['scheme']) && !in_array($info['scheme'], array('http', 'https'))) {
                    throw new URLUnsupportedProtocolException('Unsupported protocol');
                }

                $this->port = !empty($info['port']) ? $info['port'] : ( (!empty($info['scheme']) && $info['scheme'] == 'https') ? 443 : 80 );

                $this->path = !empty($info['path']) ? $info['path'] : '/';

                if (!empty($info['query'])) {
                    $this->path .= '?' . $info['query'];
                }
            }
            $this->addr = $this->gethostbyname($this->host);

        } else {
            throw new URLEmptyException('URL is empty');
        }
    }

    private function encodeURL($URL) {
        $url_length = strlen($URL);
        $x = 0;

        while ($x < $url_length) {
            $char = $URL[$x];
            if (ord($char) > 127) {

                if($char < 224){
                    $bytes = 2;
                }elseif($char < 240){
                    $bytes = 3;
                }elseif($char < 248){
                    $bytes = 4;
                }elseif($char == 252){
                    $bytes = 5;
                }else{
                    $bytes = 6;
                }

                $str =  substr($URL, $x, $bytes);

                $encoded = rawurlencode($str);
                $URL = substr($URL, 0, $x) . $encoded . substr($URL, $x+$bytes);
                $x += strlen($encoded);
                $url_length = strlen($URL);
            } else {
                $x++;
            }
        }

        return $URL;
    }

    public function gethostbyname($host) {
        if (!isset($this->hosts_cache[$host])) {
            $this->hosts_cache[$host] = gethostbyname($host);
        }

        return $this->hosts_cache[$host];
    }

    public function fetch($follow_redirects = true, $method = "GET") {
        if ($this->data_drain_file) {
            ftruncate($this->data_drain_file, 0);
            fseek($this->data_drain_file, 0, SEEK_SET);
        }

        $this->body = NULL;//because of PHP's memory management
        $this->body = '';
        $this->buffer = '';
        $this->end_of_chunks = false;
        $this->chunk_remainder = 0;
        $this->data_size = 0;
        $this->is_gzipped = false;

        $this->http_method = strtoupper($method);

        $this->parseURL();
        $this->connect();
        $this->sendRequest($this->getRequestHeaders());
        $this->download();

        if ($follow_redirects && !empty($this->headers['Location'])) {
            $this->setURL($this->headers['Location']);
            $this->fetch(true, $this->http_method);
        } else {
            if ($this->is_gzipped && $this->auto_deflate) {
                $test_inflate = @gzinflate(substr($this->body, 10, -8));

                if ($test_inflate !== FALSE) {
                    $this->body = $test_inflate;
                }

                if ($this->data_drain_file) {
                    stream_set_blocking($this->data_drain_file, true);
                    fseek($this->data_drain_file, 0, SEEK_SET);
                    fwrite($this->data_drain_file, $this->body);
                    fflush($this->data_drain_file);
                    stream_set_blocking($this->data_drain_file, false);
                }
            } else if ($this->data_drain_file) {
                stream_set_blocking($this->data_drain_file, true);
                fflush($this->data_drain_file);
                stream_set_blocking($this->data_drain_file, false);
            }
        }
    }

    public function setHeader($header, $value) {
        $this->request_headers[$header] = $value;
    }

    public function removeHeader($header) {
        if (isset($this->request_headers[$header])) {
            unset($this->request_headers[$header]);
        }
    }

    public function getHeaders() {
        return $this->headers;
    }

    public function getBody() {
        return $this->body;
    }

    public function getStatusCode() {
        return $this->status_code;
    }

    public function connect() {
        if (isset(self::$connections[$this->addr.':'.$this->port])) {
            $this->sock = self::$connections[$this->addr.':'.$this->port];
            if (is_resource($this->sock) && !feof($this->sock)) {// check if the connection is still alive
                return;
            }
        }

        if (stripos(ini_get('disable_functions'), 'stream_socket_client') !== FALSE) {
            throw new RuntimeException("stream_socket_client is disabled.");    
        }

        $ctx = stream_context_create(array(
            "ssl" => array(
                "verify_peer" => false,
                "verify_peer_name" => false,
                "allow_self_signed" => true,
                "SNI_enabled" => true,
                "SNI_server_name" => $this->host,
                "peer_name" => $this->host
            )
        ));

        $errno = $errorMessage = NULL;
        $this->sock = stream_socket_client("tcp://$this->addr:$this->port", $errno, $errorMessage, $this->timeout, STREAM_CLIENT_CONNECT, $ctx);

        if($this->sock === false) {
            throw new SocketOpenException('Unable to open socket to: ' . $this->host .' on port ' . $this->port);
        }

        $crypto_method = STREAM_CRYPTO_METHOD_TLS_CLIENT;

        if (defined('STREAM_CRYPTO_METHOD_TLSv1_2_CLIENT')) {
            $crypto_method |= STREAM_CRYPTO_METHOD_TLSv1_2_CLIENT;
            $crypto_method |= STREAM_CRYPTO_METHOD_TLSv1_1_CLIENT;
        }

        set_error_handler(array($this, 'error_sink'));
        if ($this->port == 443) {
            if (!@stream_socket_enable_crypto($this->sock, true, $crypto_method)) {
                restore_error_handler();
                throw new SocketOpenException('Unable to establish secure connection to: ' . $this->host .' on port ' . $this->port);
            }
        }
        restore_error_handler();

        self::$connections[$this->addr.':'.$this->port] = $this->sock;
    }

    public function sendRequest($request) {
        stream_set_blocking($this->sock, false);
        $startTime = microtime(true);
        do {
            $wrote = fwrite($this->sock, $request);

            if ($wrote === false) {
                fclose($this->sock);
                throw new SocketWriteException('Cannot write to socket');
            }
            fflush($this->sock);

            if ((microtime(true) - $startTime) > $this->timeout) {
                fclose($this->sock);
                throw new SocketWriteException('Writing to socket timed out');
            }

            $request = substr($request, $wrote);
        } while($request);
        stream_set_blocking($this->sock, true);
    }

    public function download() {
        stream_set_blocking($this->sock, false);
        $this->headers = array();
        $data_len = $this->max_response_size;
        $is_chunked = false;

        $startTime = microtime(true);
        do {
            if ($is_chunked) {
                $chunk = $this->read_chunk_size;
            } else {
                $chunk = min(($data_len - $this->data_size), $this->read_chunk_size);
            }

            $data = fread($this->sock, $chunk);
            if (strlen($data)) {
                $this->data_size += strlen($data);
                
                if ($this->headers && !$is_chunked && (!$this->is_gzipped || !$this->auto_deflate)) {
                    if ($this->data_drain_file) {
                        fwrite($this->data_drain_file, $data);
                    } else {
                        $this->buffer .= $data;
                    }

                    if ($this->data_callback) {
                        $this->data_callback($data);
                    }
                } else {
                    $this->buffer .= $data;
                }
            } else {
                usleep(2000);
            }

            if ($this->data_size > $this->max_response_size) {
                fclose($this->sock);
                throw new ResponseTooLargeException('Response data exceeds the limit of ' . $this->max_response_size . ' bytes');
            }

            if ((microtime(true) - $startTime) > $this->timeout) {
                fclose($this->sock);
                throw new SocketConTimedOutException("Reading data from the remote host timed out");
            }

            if (!$this->headers && $this->extractHeaders()) {
                if ($this->http_method == 'HEAD') break;

                foreach ($this->headers as $name => $value) {
                    switch (strtolower($name)) {
                        case 'content-length':
                            $data_len = (int)$value;

                            if ($data_len > $this->max_response_size) {
                                fclose($this->sock);
                                throw new ResponseTooLargeException('Response data exceeds the limit of ' . $this->max_response_size . ' bytes');
                            }
                            break;
                        case 'content-encoding':
                            if (strtolower($value) == 'gzip') {
                                $this->is_gzipped = true;
                            }
                            break;
                        case 'transfer-encoding':
                            if (strtolower($value) != 'identity') {
                                $is_chunked = true;
                            }
                    }

                    if (strtolower($name) == 'location') {
                        break 2;
                    }
                }

                if (strlen($this->buffer) && !$is_chunked && (!$this->is_gzipped || !$this->auto_deflate) && $this->data_drain_file) {
                    fwrite($this->data_drain_file, $this->buffer);
                    $this->buffer = NULL;
                    $this->buffer = "";
                }
            }

            if ($is_chunked && !$this->end_of_chunks) {
                $this->parseChunks();
            }
        } while ($this->data_size < $data_len && !$this->hasStreamEnded());


        if (!$is_chunked && strlen($this->buffer)) {//if the response was not chunked, then the whole response is in the buffer, otherwise the chunks are already assembled in the body.
            $this->body = $this->buffer;
        }

        $this->buffer = NULL;
        $this->buffer = '';
        stream_set_blocking($this->sock, true);

        foreach ($this->headers as $name => $value) {
            if (strtolower($name) == 'connection' && $value == 'close') {
                $this->disconnect();
            }
        }
    }

    private function hasStreamEnded() {
        return $this->end_of_chunks && strpos($this->buffer, "\r\n\r\n") !== false;
    }

    private function parseChunks() {
        while(strlen($this->buffer)) {
            if (!$this->chunk_remainder) {
                $chunk_header_end = strpos($this->buffer, "\r\n");

                if ($chunk_header_end !== false) {
                    $chunk_header_str = substr($this->buffer, 0, $chunk_header_end);
                    $chunk_size = hexdec($chunk_header_str);

                    if ($chunk_size == 0) {
                        $this->end_of_chunks = true;
                        break;
                    }

                    $this->buffer = strlen($this->buffer) > $chunk_header_end + 2 ? substr($this->buffer, $chunk_header_end+2) : "";
                    $this->chunk_remainder = $chunk_size + 2;
                } else {
                    break;
                }
            } else {
                if ($this->buffer) {
                    $data = substr($this->buffer, 0, $this->chunk_remainder);
                    $read_len = strlen($data);
                    if ($read_len == $this->chunk_remainder) {
                        $data = substr($data, 0, -2);
                    }

                    $this->chunk_remainder -= $read_len;
                    $this->buffer = strlen($this->buffer) > $read_len ? substr($this->buffer, $read_len) : "";

                    if ($this->data_drain_file && (!$this->is_gzipped || !$this->auto_deflate)) {
                        fwrite($this->data_drain_file, $data);
                    } else {
                        $this->body .= $data;
                    }

                    if ($this->data_callback) {
                        $this->data_callback($data);
                    }
                }
            }
        }
    }

    public function extractHeaders() {
        if ($this->headers) return true;

        $headers_end = strpos($this->buffer, "\r\n\r\n");

        if ($headers_end) {
            $headers_str = substr($this->buffer, 0, $headers_end);
            $this->buffer = strlen($this->buffer) > $headers_end + 4 ? substr($this->buffer, $headers_end+4) : "";
            $this->data_size = strlen($this->buffer);
            preg_match_all('/^(.*)/mi', $headers_str, $headers);
            foreach ($headers[1] as $header) {
                $parts = explode(": ", trim($header));
                $name = array_shift($parts);
                $value = implode(": ", $parts);
                $this->headers[$name] = $value;

                if (strtolower($name) == "set-cookie") {
                    $cookie_parts = explode("; ", $value);
                    $cookie_domain = $this->host;
                    $cookie_name = "";
                    $cookie_value = "";
                    $cookie_exp_time = 0;

                    foreach ($cookie_parts as $i=>$part) {
                        $part_exploded = explode("=", $part);
                        $key = array_shift($part_exploded);
                        $part_value = implode("=", $part_exploded);

                        if ($i == 0) {
                            $cookie_name = $key;
                            $cookie_value = $part_value;
                        } else {
                            switch (strtolower($key)) {
                            case "domain":
                                $cookie_domain = $part_value;
                                break;
                            case "expires":
                                $cookie_exp_time = @strtotime($part_value);
                                break;
                            }
                        }
                    }

                    if (strlen($cookie_name) && strlen($cookie_value)) {
                        if ($cookie_exp_time < time()) {
                            $this->removeCookie($cookie_name, $cookie_domain);
                        } else {
                            $this->setCookie($cookie_name, $cookie_value, $cookie_domain);
                        }
                    }
                }
            }

            $statusline_keys = array_keys($this->headers);
            $statusline = $statusline_keys[0];

            if (preg_match('/HTTP\/([\d\.]+)\s(\d{3})/', $statusline, $matches)) {
                $this->http_version = (float)$matches[1];
                $this->status_code = (int)$matches[2];
            }

            return true;
        }

        return false;
    }

    public function getRequestHeaders() {
        $headers = array();
        $headers[] = $this->http_method . " " . $this->path . " HTTP/1.1";
        $headers[] = "Host: " . $this->host;

        if ($this->accept_deflate) {
            $headers[] = "Accept-Encoding: gzip";
        }

        $cookies_combined = array();
        foreach ($this->cookies as $domain=>$cookies) {
            if (preg_match("/".preg_quote(ltrim($domain, "."))."$/", $this->host)) {
                foreach ($cookies as $name=>$value) {
                    $cookies_combined[] = $name."=".$value;
                }
            }
        }

        if (!empty($cookies_combined)) {
            $headers[] = "Cookie: " . implode("; ", $cookies_combined);
        }

        if (!empty($this->request_headers)) {
            foreach ($this->request_headers as $name => $value) {
                $headers[] =  $name . ": " . $value;
            }
        }

        if ($this->post_data && $this->http_method == "POST") {
            $headers[] = "Content-Type: application/x-www-form-urlencoded";
            $headers[] = "Content-Length: " . strlen($this->post_data);
            return implode("\r\n", $headers) . "\r\n\r\n" . $this->post_data;
        } else {
            return implode("\r\n", $headers) . "\r\n\r\n";
        }
    }

    private function error_sink($errno, $errstr) {}
}

class URLException extends Exception {}
class URLEmptyException extends Exception {}
class URLInvalidException extends Exception {}
class URLUnsupportedProtocolException extends Exception {}
class SocketOpenException extends Exception {}
class SocketWriteException extends Exception {}
class SocketConTimedOutException extends Exception {}
class ResponseTooLargeException extends Exception {}
