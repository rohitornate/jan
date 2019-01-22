<?php
####################################################################################################
#  CDN Integration for Opencart  #
####################################################################################################
class Controllerextensionmodulecdn extends Controller {
	
	private $error = array(); 
	public function index() {
		$this->load->language('module/cdn');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cdn', $this->request->post);		
					 
			$this->session->data['success'] = $this->language->get('text_success');
			$link = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true);
						
			$this->response->redirect($link);

		}

		$text_strings = array(
			'heading_title',
			'button_save',
			'button_cancel',
			'text_enabled',
			'text_disabled',
			'entry_cdn_status',
			'entry_cdn_domain',
			'entry_cdn_images',
			'entry_cdn_js',
			'entry_cdn_css',
			'entry_theme_name',
			'text_edit'
		);
		
		foreach ($text_strings as $text) {
			$data[$text] = $this->language->get($text);
		}
		$config_data = array(
			'cdn_status',
			'cdn_domain',
			'cdn_theme',
			'cdn_images',
			'cdn_js',
			'cdn_css'
		);
		
		foreach ($config_data as $conf) {
			$data[$conf] = (isset($this->request->post[$conf])) ? $this->request->post[$conf] : $this->config->get($conf);
		}		
	
 		$data['error_warning'] = (isset($this->error['warning'])) ? $this->error['warning'] : '';
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/module/cdn', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('extension/module/cdn', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

	    
		
		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');
		$data['column_left'] = $this->load->controller('common/column_left');

		$this->response->setOutput($this->load->view('module/cdn.tpl', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/cdn')) {
			$this->error['warning'] = $this->language->get('error_permission');
		} elseif (isset($this->request->post['cdn_domain'])) {
			if (!preg_match('/cdn77.net$/is', $this->request->post['cdn_domain'])) {
				$result = dns_get_record($this->request->post['cdn_domain']);
				$last = array_pop($result);
				
			}
		}
		
		return (!$this->error);
	}


}
?>