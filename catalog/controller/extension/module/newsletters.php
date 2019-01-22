<?php
class ControllerExtensionModuleNewsletters extends Controller {
	public function index() {
		$this->load->language('extension/module/newsletter');
		$this->load->model('extension/module/newsletters');
		$this->load->model('catalog/category');
		
		$this->model_catalog_category->createNewsletter();

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_brands'] = $this->language->get('text_brands');
		$data['text_index'] = $this->language->get('text_index');
		
		$data['brands'] = array();
		
		
		$this->response->setOutput($this->load->view('product/category', $data));
		
		//~ if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/module/newsletters.tpl')) {
			//~ return $this->load->view($this->config->get('config_template') . '/template/extension/module/newsletters.tpl', $data);
		//~ } else {
			//~ return $this->load->view('default/template/extension/module/newsletters.tpl', $data);
		//~ }
	}
	public function news()
	{
		$this->load->model('extension/module/newsletters');
		$this->load->model('catalog/category');
		
		$json = array();
		$json['message'] = $this->model_catalog_category->subscribes($this->request->post);
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}
	
}
