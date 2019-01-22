<?php
class ModelExtensionTotalCodOrderFeeTotal extends Model {
	public function getTotal($total) {
		if ((isset($this->session->data['shipping_address']) && isset($this->session->data['payment_method']))
				&& ($this->session->data['payment_method']['code'] == 'cod_order_fee') 
				&& ($this->config->get('cod_order_fee_min_total') > 0 )
				&& ($total > $this->config->get('cod_order_fee_min_total'))
			) {
				
			$this->load->language('extension/total/cod_order_fee_total');
			
			$total_cod_order_fee = $this->config->get('cod_order_fee_fee');
			
			$total['totals'][] = array(
				'code'       => 'cod_order_fee_total',
				'title'      => $this->language->get('text_cod_order_fee'),
				'value'      => $total_cod_order_fee,
				'sort_order' => $this->config->get('cod_order_fee_total_sort_order')
			);

			$total['total'] += $total_cod_order_fee;
		}
			/*if ((isset($this->session->data['shipping_address']) && isset($this->session->data['payment_method']))
				&& ($this->session->data['payment_method']['code'] == 'payu') 
				
				)
			 {
			//$total_cod_order_fee = 5;
			
			$total_calc  = $total['total'] / 100 * 5;
			
			
			$total['totals'][] = array(
				'code'       => 'Dscount On Online Payment',
				'title'      => 'Discount On Online Payment',
				'value'      => -$total_calc,
				'sort_order' => $this->config->get('cod_order_fee_total_sort_order')
			);

			$total['total'] -= $total_calc;
			
		}*/
	}
}