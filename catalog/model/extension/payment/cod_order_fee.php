<?php
class ModelExtensionPaymentCodOrderFee extends Model {
	public function getMethod($address, $total) {
		$this->load->language('extension/payment/cod_order_fee');

		if ($this->config->get('cod_order_fee_min_total') > 0 && $total > $this->config->get('cod_order_fee_min_total')){
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();
		
		if ($this->session->data['shipping_method']['code']=='flat.flat'){$status = false; }

		if ($status) {
			$method_data = array(
				'code'       => 'cod_order_fee',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('cod_order_fee_sort_order')
			);
		}

		return $method_data;
	}
}