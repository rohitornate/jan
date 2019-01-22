<?php
class ControllerModulekdtracker extends Controller {
	public function index() {
		$this->load->language('module/kdtracker');
		$data['heading_title'] = $this->language->get('view_tracking_info');
        $data['view_order_id'] = $this->language->get('view_order_id');
        $data['view_tracking_info'] = $this->language->get('view_tracking_info');
        $data['view_tracking_status'] = $this->language->get('view_tracking_status');
        $data['view_update_time'] = $this->language->get('view_update_time');
        $data['view_company'] = $this->language->get('view_company'); 
        $data['button_search'] = $this->language->get('button_search'); 
        $data['entry_order_id'] = $this->language->get('entry_order_id');         
        $this->load->model('module/kdtracker_order');
        if(!empty($this->request->get['order_id'])){
        	$kdtracker= $this->model_module_kdtracker_order->getOrderTracking($this->request->get['order_id']);
	        if($kdtracker['tracking_info']){
		        $res = unserialize($kdtracker['tracking_info']);
		        $data['company'] = $kdtracker['ship_company'];
		        $data['phone'] = $res['phone'];
		        $data['url'] = $res['url'];
		        $data['nu'] = $res['nu'];
		        $express = $this->language->get('express');
		        $data['status'] = $express[$res['status']];
		        $data['ico'] = $res['ico'];
		        $data['tracking_info'] = $res['data'];
		        $data['kdtracker']=1;
	    	}else{
	    		$data['get']=$this->request->get;
	    		$data['kdtracker']=0;
	    	}		
        }else{
        	$data['get']=$this->request->get;
	    		$data['kdtracker']=0;
        }
        
		return $this->load->view('default/template/module/kdtracker.tpl', $data);
	}
}