<?php
class ControllerExtensionModuleXtensionsCheckout extends Controller {
	public $error = array();
	public $data = array();
	
	public function __construct($registry){
		parent::__construct($registry);
		if(!isset($this->xtensions_checkout)){
			$xtensions_checkout = new XtensionsCheckout($this->registry);
			$this->registry->set('xtensions_checkout', $xtensions_checkout);
		}	
	}

	public function index() {
		$this->data = $this->language->load($this->config->get('xtensions_admin_xcheckout_path'));
		$this->xtensions_checkout->install();
		$this->load->model('setting/store');
		$this->data['stores'] = $stores = $this->model_setting_store->getStores();
		if (isset($this->request->get['store_id'])) {
			$this->data['store_id'] = $store_id = $this->request->get['store_id'];
		} else {
			$this->data['store_id'] = $store_id = 0;
		}
		$this->load->model('setting/setting');		
		// count($this->request->post,COUNT_RECURSIVE);
		$this->data += $this->xtensions_checkout->getXtensionsData($store_id, 'xtensions_best_checkout');
		$this->data['config_license'] = $this->model_setting_setting->getSetting('xtensions_checkout');
		$this->document->setTitle($this->language->get('heading_title'));		
		$this->data['success'] = isset($this->session->data['success']) ? $this->session->data['success'] : '';
		if (isset($this->session->data['success'])) {
			unset($this->session->data['success']);
		}
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->xtensions_checkout->validate($this, $store_id, 'xtensions_best_checkout');
		}
		$this->data['heading_title'] = $this->language->get('heading_title');
		$home = 'common/dashboard';
		$this->load->model('localisation/country');
		$this->data['custom_fields'] = $this->xtensions_checkout->getXtensionsModel($this->config->get('xtensions_custom_fields_path'))->getCustomFieldsAll();
		$this->data['countries'] = $this->model_localisation_country->getCountries();
		$this->data['informations'] = $this->xtensions_checkout->getInformations($store_id);
		$this->data['token'] = $this->session->data['token'];
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		$this->data['breadcrumbs'] = array(
			array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link($home, 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false 
			),
			array(
				'text' => $this->language->get('text_module'),
				'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: ' 
			),
			array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link($this->config->get('xtensions_admin_xcheckout_path'), 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: ' 
			) 
		);
		
		$this->data['action'] = $this->url->link($this->config->get('xtensions_admin_xcheckout_path'), 'store_id=' . $store_id . '&token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', 'SSL');
		
		$this->data['modules'] = array();
		$this->data['fields'] = $this->xtensions_checkout->getRawFields();	
		
		$this->data['xtensions_admin_xcheckout_path'] = $this->config->get('xtensions_admin_xcheckout_path');
		$this->data['xtensions_custom_color'] = $this->config->get('xtensions_custom_color');
		$this->data['xtensions_color_section'] = $this->config->get('xtensions_color_section');
		$setting = $this->model_setting_setting->getSetting('config',$store_id);
		$this->load->model('extension/extension');
		$this->data['payments'] = $this->model_extension_extension->getInstalled('payment');
		$this->load->model('tool/image');
		$this->data['placeholder'] = $this->model_tool_image->resize('no_image.png', 62, 40);
		$this->data['contact_telephone'] = $setting['config_telephone'];
		$this->data['contact_email'] = $setting['config_email'];
		$this->document->addScript($this->config->get('xtensions_admin_xcheckout_asset_path').'/colorpicker/js/bootstrap-colorpicker.js');
		$this->document->addStyle($this->config->get('xtensions_admin_xcheckout_asset_path').'/colorpicker/css/bootstrap-colorpicker.css');
		$this->document->addStyle($this->config->get('xtensions_admin_xcheckout_asset_path').'/xcheckout.css');
		$this->data['xtensions_design'] = $this->config->get('xtensions_design');
		$this->data['xtensions_version'] = $this->config->get('xtensions_checkout_version');
		$this->data['xtensions_module'] = $this->config->get('xtensions_module');
		$this->data['xtensions_support'] = $this->config->get('xtensions_support');
		$this->data['xtensions_docs'] = $this->config->get('xtensions_docs');
		$this->template = $this->config->get('xtensions_admin_xcheckout_path');
		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');		
		$this->response->setOutput($this->load->view($this->template, $this->data));
	}

	public function country() {
		$json = array();
		
		$this->load->model('localisation/country');
		
		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);
		
		if ($country_info) {
			$this->load->model('localisation/zone');
			
			$json = array(
				'country_id' => $country_info['country_id'],
				'name' => $country_info['name'],
				'iso_code_2' => $country_info['iso_code_2'],
				'iso_code_3' => $country_info['iso_code_3'],
				'address_format' => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone' => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status' => $country_info['status'] 
			);
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function install(){
		$this->xtensions_checkout->installModule();
	}
	
	public function uninstall(){
		$this->xtensions_checkout->uninstallModule();
	}
	
	public function license(){
		$fields = array('activation_code','license_code','date_support','user_name');
		foreach ($fields as $field){
			$data['xtensions_checkout_'.$field] = isset($this->request->get[$field])?$this->request->get[$field]:'';
		}
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('xtensions_checkout', $data);
		$json['success'] = 'Domain verified';
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
?>
