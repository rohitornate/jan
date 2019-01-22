<?php
class ControllerStartupSeoUrl extends Controller {
    // Custom SEO URL Start 
                   public $url_list;
        
                    public function __construct($params) {
                        parent::__construct($params);
                        $this->url_list = $this->getURLList();
                    }
                    
                    public function getURL($route) {
             
                        if( count($this->url_list) > 0) {
                            foreach ($this->url_list as $key => $value) {
                                if($route == $key) {
                                    return '/'.$value;
                                }
                            }
                        }
                        return false;
                    }
                    public function setURL($_route) {
                        if( count($this->url_list) > 0 ){
                            foreach ($this->url_list as $key => $value) {
                                if($_route == $value) {
                                    return $key;
                                }
                            }
                        }
                        return false;
                    }
                    public function getURLList() {
                        $sql = "SELECT * FROM oc_custom_seo_url WHERE keyword !='' and query !=''  ORDER BY query ASC";
                        $query = $this->db->query($sql);
                        $url_list = array();
                        $url_list['common/home'] = '';
                        if( count($query->rows) > 0 ){
                            foreach ($query->rows as $urlnew) {
                                $url_list[$urlnew['query']] = $urlnew['keyword'];
                            }
                        }
                        return $url_list;
                    }
                    // Custom SEO URL end
	public function index() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}

		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);

			// remove any empty arrays from trailing
			if (utf8_strlen(end($parts)) == 0) {
				array_pop($parts);
			}

			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");

				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);

					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}

					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}

					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}
					if ($url[0] == 'simple_blog_category_id') {
						$this->request->get['simple_blog_category_id'] = $url[1];
					}
					if ($url[0] == 'simple_blog_article_id') {
						$this->request->get['simple_blog_article_id'] = $url[1];
					}
					if ($url[0] == 'simple_blog_author_id') {
						$this->request->get['simple_blog_author_id'] = $url[1];
					}

					if ($query->row['query'] && $url[0] != 'information_id' && $url[0] != 'manufacturer_id' && $url[0] != 'category_id' && $url[0] != 'product_id' && $url[0] != 'product_id' && $url[0] != 'simple_blog_article_id' && $url[0] != 'simple_blog_author_id' && $url[0] != 'simple_blog_category_id') {
						$this->request->get['route'] = $query->row['query'];
					}
				} else {
					$this->request->get['route'] = 'error/not_found';

					break;
				}
			}
 // Custom SEO URL Start 
                    if ( $_s = $this->setURL($this->request->get['_route_']) ) {
                        $this->request->get['route'] = $_s;
                    }
                    // Custom SEO URL end
			if (!isset($this->request->get['route'])) {
				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';
				} elseif (isset($this->request->get['path'])) {
					$this->request->get['route'] = 'product/category';
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				} elseif (isset($this->request->get['information_id'])) {
					$this->request->get['route'] = 'information/information';
				} elseif (isset($this->request->get['simple_blog_category_id'])) {
					$this->request->get['route'] = 'simple_blog/category';
				} elseif (isset($this->request->get['simple_blog_article_id'])) {
					$this->request->get['route'] = 'simple_blog/article/view';
				} elseif (isset($this->request->get['simple_blog_author_id'])) {
					$this->request->get['route'] = 'simple_blog/author';
				}
			}
		}
	}

	public function rewrite($link) {
		$url_info = parse_url(str_replace('&amp;', '&', $link));

		$url = '';

		$data = array();

		parse_str($url_info['query'], $data);
//echo '<pre>'; print_r($data); die();
		foreach ($data as $key => $value) {
			if (isset($data['route'])) {
                             // Custom SEO URL Start 
                   if( $_u = $this->getURL($data['route']) ){
                        $url .= $_u;
                        unset($data[$key]);
                    }
                    if (isset($data['route']) && (($data['route'] == 'product/product' && $key == 'product_id') ||
                            (($data['route'] == 'product/manufacturer/info' ||
                                    $data['route'] == 'product/product') && $key == 'manufacturer_id') ||
                            ($data['route'] == 'information/information' && $key == 'information_id' ) ||
                            ($data['route'] == 'simple_blog/category' && $key == 'simple_blog_category_id') || 
                            ($data['route'] == 'simple_blog/article/view' && $key == 'simple_blog_article_id') ||
                            ($data['route'] == 'simple_blog/author' && $key == 'simple_blog_author_id'))) {
				//if (isset($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id') || ($data['route'] == 'simple_blog/category' && $key == 'simple_blog_category_id') || ($data['route'] == 'simple_blog/article/view' && $key == 'simple_blog_article_id') || ($data['route'] == 'simple_blog/author' && $key == 'simple_blog_author_id')) {
                                   // echo "SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'"; die();
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");

					if ($query->num_rows && $query->row['keyword']) {
						$url .= '/' . $query->row['keyword'];

						unset($data[$key]);
					}
				} elseif ($key == 'path') {
					$categories = explode('_', $value);

					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");

						if ($query->num_rows && $query->row['keyword']) {
							$url .= '/' . $query->row['keyword'];
						} else {
							$url = '';

							break;
						}
					}

					unset($data[$key]);
				}
			}
		}

		if ($url) {
                    $url1=explode('/', $url);
                    $url='/'.end($url1);
			unset($data['route']);

			$query = '';

			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . rawurlencode((string)$key) . '=' . rawurlencode((is_array($value) ? http_build_query($value) : (string)$value));
				}

				if ($query) {
					$query = '?' . str_replace('&', '&amp;', trim($query, '&'));
				}
			}

			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
			return $link;
		}
	}
}
