<?php
class ControllerXcheckoutXBasicCaptcha extends Controller {
	public function index($setting) {
		$this->load->language('extension/captcha/basic_captcha');

		$data['text_captcha'] = $this->language->get('text_captcha');

		$data['entry_captcha'] = $this->language->get('entry_captcha');

		$data['view'] = $setting['view'];

		$data['route'] = $this->request->get['route']; 

		return $this->load->view('xtensions/checkout/xbasic_captcha', $data);
	}

	public function validate($setting) {
		$this->load->language('extension/captcha/basic_captcha');

		if (empty($this->session->data[$setting['view'].'_captcha']) || ($this->session->data[$setting['view'].'_captcha'] != $this->request->post[$setting['view'].'_captcha'])) {
			return $this->language->get('error_captcha');
		}
	}

	public function captcha() {
		$view = $this->request->get['view'];
		$image_number = substr(sha1(mt_rand()), 17, 6);

		$image = imagecreatetruecolor(150, 35);

		$width = imagesx($image);
		$height = imagesy($image);

		$black = imagecolorallocate($image, 0, 0, 0);
		$white = imagecolorallocate($image, 255, 255, 255);
		$red = imagecolorallocatealpha($image, 255, 0, 0, 75);
		$green = imagecolorallocatealpha($image, 0, 255, 0, 75);
		$blue = imagecolorallocatealpha($image, 0, 0, 255, 75);

		imagefilledrectangle($image, 0, 0, $width, $height, $white);
		imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $red);
		imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $green);
		imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $blue);
		imagefilledrectangle($image, 0, 0, $width, 0, $black);
		imagefilledrectangle($image, $width - 1, 0, $width - 1, $height - 1, $black);
		imagefilledrectangle($image, 0, 0, 0, $height - 1, $black);
		imagefilledrectangle($image, 0, $height - 1, $width, $height - 1, $black);

		imagestring($image, 10, intval(($width - (strlen($image_number) * 9)) / 2), intval(($height - 15) / 2), $image_number, $black);
		$this->session->data[$view.'_captcha'] = $image_number;
		header('Content-type: image/jpeg');

		imagejpeg($image);

		imagedestroy($image);
		exit();
	}
}
