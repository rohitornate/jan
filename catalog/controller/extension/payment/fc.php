<?php
require_once(DIR_SYSTEM . 'fc_util.php');

class ControllerExtensionPaymentfc extends Controller {
	public function index() {

		require_once(DIR_SYSTEM . 'fc_constants.php');
		
		$this->load->language('extension/payment/fc');
		$data['button_confirm'] = $this->language->get('button_confirm');
		
		$this->load->model('checkout/order');
    
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		
		$data['merchant'] = $this->config->get('fc_merchant');
		$data['trans_id'] = "".$this->session->data['order_id'];
		$data['amount'] = "".$this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
		$data['channel_id'] = "WEB";

		$data['email']     =  '';
		$data['mobile_no'] =  '';
		
		if(isset($data['email'])){
			$data['email'] = $order_info['email'];
		}
		
		if(isset($data['mobile_no'])){
			$data['mobile_no']= preg_replace('#[^0-9]{0,13}#is','',$order_info['telephone']);
		}
		
		
		if($this->config->get('fc_environment') == "P") {
			$data['action_url'] = $FC_PAYMENT_URL_PROD;
		} else {
			$data['action_url'] = $FC_PAYMENT_URL_TEST;
		}
		
		if($_SERVER['HTTPS']){
			$data['callback_url'] = HTTPS_SERVER .$callbackurl_fc;
		}else{
			$data['callback_url'] = HTTP_SERVER .$callbackurl_fc;
		}
		
		$parameters = array(
			"merchantId" => $data['merchant'],
            "merchantTxnId"  => $data['trans_id'],
            "amount" => $data['amount'],
            "channel" => $data['channel_id'],
			"mobile" => $data['mobile_no'],
			"email" => $data['email'],
			"furl" => $data['callback_url'],
			"surl" => $data['callback_url'],
		);

		$merKey = FCUtility::decrypt($this->config->get('fc_key'),$fc_key);
		$merKey = rtrim($merKey);
		$data['checkSum'] = FCUtility::generateChecksumForJson($parameters, $merKey);

		error_log(print_r($parameters, TRUE));
		error_log(print_r($data['checkSum'], TRUE));

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/payment/fc.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/extension/payment/fc.tpl', $data);
		} else {
			return $this->load->view('extension/payment/fc.tpl', $data);
		}
	}
	
	public function callback(){
	
		require_once(DIR_SYSTEM . 'fc_constants.php');
		$param = array();
		foreach($_POST as $key=>$value)
		{
		   	if($key != "route" && $key != "checksum") {
				$param[$key] = $_POST[$key];
		  	}
		}

		$isValidChecksum = false;
		$txnstatus = false;
		$authStatus = false;
		$mer = FCUtility::decrypt($this->config->get('fc_key'),$fc_key);
		$mer = rtrim($mer);
		if(isset($_POST['checksum']))
		{
			$checksum = $_POST['checksum'];
			$return = FCUtility::generateChecksumForJson($param, $mer);
			if($return == $checksum)
				$isValidChecksum = true;
		}
		$order_id = $_POST['merchantTxnId'];
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($order_id);

		
		if( $param['status'] == "COMPLETED") {
			$txnstatus = true;
		}
		
		
		if ($order_info) 
		{
			
			$this->language->load('extension/payment/fc');
			$data['title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
			$data['language'] = $this->language->get('code');
			$data['direction'] = $this->language->get('direction');
			$data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
			$data['text_response'] = $this->language->get('text_response');
			$data['text_success'] = $this->language->get('text_success');
			$data['text_success_wait'] = sprintf($this->language->get('text_success_wait'), $this->url->link('checkout/success'));
			$data['text_failure'] = $this->language->get('text_failure');
			$data['text_failure_wait'] = sprintf($this->language->get('text_failure_wait'), $this->url->link('checkout/cart'));
			
			
			if ($txnstatus && $isValidChecksum) {
				$authStatus = true;
							    
				$this->load->model('checkout/order');
				
					
			  $this->model_checkout_order->addOrderHistory($order_id, $this->config->get('fc_order_status_id'));
				
				
				$data['continue'] = $this->url->link('checkout/success');
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/payment/fc_success.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/extension/payment/fc_success.tpl';
				} else {
					$this->template = 'extension/payment/fc_success.tpl';
				}
					
				$this->children = array(
					'common/column_left',
					'common/column_right',
					'common/content_top',
					'common/content_bottom',
					'common/footer',
					'common/header'
				);
				
				$this->response->setOutput($this->load->view($this->template,$data));
				
			} else {
				$this->load->model('checkout/order');

				$data['continue'] = $this->url->link('checkout/cart');
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/payment/fc_failure.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/extension/payment/fc_failure.tpl';
				} else {
					$this->template = 'extension/payment/fc_failure.tpl';
				}
				
				$this->children = array(
					'common/column_left',
					'common/column_right',
					'common/content_top',
					'common/content_bottom',
					'common/footer',
					'common/header'
				);
	
				$this->response->setOutput($this->load->view($this->template,$data));
			}
		}
	}
}
?>
