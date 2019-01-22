<?php
class ModelExtensionTotalTotal extends Model {
	public function getTotal($total) {
	   //print_r($total['totals'][0]['value']);
		$this->load->language('extension/total/total');

		$total['totals'][] = array(
			'code'       => 'total',
			'title'      => $this->language->get('text_total'),
			'value'      => max(0, $total['total']),
			'sort_order' => $this->config->get('total_sort_order')
		);
		
		
		
	}
}