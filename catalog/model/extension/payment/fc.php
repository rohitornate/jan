<?php 
class ModelExtensionPaymentFC extends Model {
  	public function getMethod($address, $total) {
		$this->language->load('extension/payment/fc');
	
		if ($this->config->get('fc_total') > 0 && $this->config->get('fc_total') > $total) {
			$status = false;
		} else {
			$status = true;
		}

		$method_data = array();

		if ($status) {
                    $method_data = array( 
                            'code'       => 'fc',
                            'title'      => $this->language->get('text_title'),
                            'sort_order' => '1',
                            'terms'      => ''
                    );
                }
            return $method_data;
  	}
}
?>