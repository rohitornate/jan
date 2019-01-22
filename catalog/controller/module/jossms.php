<? /* This file encoded by Raizlabs PHP Obfuscator http://www.raizlabs.com/software */ ?>
<?php


class ControllerModuleJosSms extends Controller {
	private $error = array ();
	protected function index() {
		$this->language->load ( 'module/jossms' );
		$this->data ['heading_title'] = $this->language->get ( 'heading_title' );
		$this->data ['text_nohp'] = $this->language->get ( 'text_nohp' );
		$this->data ['text_message'] = $this->language->get ( 'text_message' );
		$this->data ['text_characters'] = $this->language->get ( 'text_characters' );
		$this->data ['button_send'] = $this->language->get ( 'button_send' );
		$this->data ['text_success'] = $this->language->get ( 'text_success' );
		$this->data ['error_nohp'] = '';
		$this->data ['error_message'] = '';
		$this->data ['success'] = '';
		$this->data ['error'] = '';
		$this->data ['error_limit'] = '';
		$this->load->model ( 'setting/setting' );
		if (($this->request->server ['REQUEST_METHOD'] == 'POST')) {
			if (! empty ( $_SERVER ['HTTP_CLIENT_IP'] )) {
				$ip = $_SERVER ['HTTP_CLIENT_IP'];
			} elseif (! empty ( $_SERVER ['HTTP_X_FORWARDED_FOR'] )) {
				$ip = $_SERVER ['HTTP_X_FORWARDED_FOR'];
			} else {
				$ip = $_SERVER ['REMOTE_ADDR'];
			}
			$tgl = date ( 'y-m-d' );
			if (! $this->request->post ['nohp']) {
				$this->data ['error_nohp'] = $this->language->get ( 'error_nohp' );
			} else if (! $this->request->post ['message']) {
				$this->data ['error_message'] = $this->language->get ( 'error_message' );
			} else {
				$ceklimit = $this->config->get ( 'smslimit' );
				$traceip = $this->config->get ( $ip );
				if ($traceip == "") {
					$visitor_data = array (
							$ip => '1:' . $tgl 
					);
					$this->model_setting_setting->joseditSetting ( 'jossendsms', $visitor_data );
					$traceip = '0';
					$tglnya = $tgl;
				} else {
					$traceip = $this->config->get ( $ip );
					$pecah = explode ( ":", $traceip );
					$traceip = $pecah [0];
					$tglnya = $pecah [1];
				}
				if (($ceklimit != 0 || $ceklimit != "") && $ceklimit <= $traceip && $tgl == $tglnya) {
					$this->data ['error_limit'] = $this->language->get ( 'error_limit' );
				} else {
					if ($tgl != $tglnya) {
						$traceip = 1;
					} else {
						$traceip = $traceip + 1;
					}
					$this->load->model ( 'libraries/jossms' );
					$gateway = $this->config->get ( 'gateway' );
					$text = urlencode ( substr ( $this->request->post ['message'], 0, 150 ) );
					$destination = $this->request->post ['nohp'];
					$getresponse = $this->model_libraries_jossms->send_message ( $destination, $text, $gateway );
					$status = $getresponse;
					if ($status == "Success") {
						$this->data ['success'] = $this->language->get ( 'text_success' );
						$this->db->query ( "UPDATE " . DB_PREFIX . "setting SET `value` = '" . $traceip . ":" . $tgl . "' WHERE `key` = '" . $ip . "'" );
					} else {
						$this->data ['error'] = $this->language->get ( 'text_error' );
					}
				}
			}
		}
		if (file_exists ( DIR_TEMPLATE . $this->config->get ( 'config_template' ) . '/template/module/jossms.tpl' )) {
			$this->template = $this->config->get ( 'config_template' ) . '/template/module/jossms.tpl';
		} else {
			$this->template = 'default/template/module/jossms.tpl';
		}
		$this->render ();
	}
	protected function validate() {
		if (! $this->request->post ['nohp']) {
			$this->error ['nohp'] = $this->language->get ( 'error_nohp' );
		}
		if (! $this->request->post ['message']) {
			$this->error ['message'] = $this->language->get ( 'error_message' );
		}
		if (! $this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>