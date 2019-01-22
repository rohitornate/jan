<?php
class ModelExtensionTotalOnlineDiscount extends Model {
	public function getTotal($total) {
		if ((isset($this->session->data['payment_method']))
				&& ($this->session->data['payment_method']['code'] == 'payu') 
				|| ($this->session->data['payment_method']['code'] == 'paytm')
				
			) {
				
			$total_calc  = $total['total'] / 100 * 5;
			
			
			$total['totals'][] = array(
				'code'       => 'Dscountssss On Online Payment',
				'title'      => 'Discount111 On Online Payment',
				'value'      => -$total_calc,
				'sort_order' => $this->config->get('cod_order_fee_total_sort_order')
			);

			$total['total'] -= $total_calc;
		}
	}
}