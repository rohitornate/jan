<?php
class ControllerXcheckoutXGoogleCaptcha extends Controller {
    public function index($setting) {
        $this->load->language('extension/captcha/google_captcha');

		$data['text_captcha'] = $this->language->get('text_captcha');

		$data['entry_captcha'] = $this->language->get('entry_captcha');        
		$data['view'] = $setting['view'];
		$data['site_key'] = $this->config->get('google_captcha_key');

        $data['route'] = $this->request->get['route']; 

		return $this->load->view('xtensions/checkout/xgoogle_captcha', $data);
    }

    public function validate($setting) {    	
		if (empty($this->session->data['captcha'])) {
			$this->load->language('extension/captcha/google_captcha');

			$recaptcha = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . urlencode($this->config->get('google_captcha_secret')) . '&response=' . $this->request->post['g-recaptcha-response'] . '&remoteip=' . $this->request->server['REMOTE_ADDR']);
	
			$recaptcha = json_decode($recaptcha, true);
	
			if ($recaptcha['success']) {
				$this->session->data['captcha']	= true;
			} else {
				return $this->language->get('error_captcha');
			}
		}
    }
}
