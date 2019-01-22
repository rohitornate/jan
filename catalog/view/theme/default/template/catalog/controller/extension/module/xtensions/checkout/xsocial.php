<?php
class ControllerExtensionModuleXtensionsCheckoutXsocial extends Controller {
	public $data = array();

	public function __construct($registry) {
		parent::__construct($registry);
		$this->data = $this->load->language('checkout/checkout');
		$this->data = array_merge($this->data,$this->load->language($this->config->get('xtensions_language_path')));
		$this->data += $this->xtensions_checkout->getXtensionsData($this->config->get('config_store_id'), 'xtensions_best_checkout');
		$xconfig = $this->data['xconfig'];
		$this->data['misc_options'] = $misc_options = $xconfig['options'];
		$this->data['clean_login'] = $misc_options['login_type'] == 'clean' ? true : false;
		$social_options = $this->data['social_options'] = $xconfig['social'];
	}

	public function index() {	
		$social_options = $this->data['social_options'];
		$this->data += array(
			'isFacebook' => false,
			'fb_appId' => '',
			'isGoogle' => false,
			'google_client_id' => '',
			'isLinkedin' => false,
			'linkedin_api_key' => '' 
		);
		if (isset($social_options['facebook']['status']) && $social_options['facebook']['appId']) {
			$this->data['isFacebook'] = true;
			$this->data['fb_appId'] = $social_options['facebook']['appId'];
		}
		
		if (isset($social_options['google']['status']) && $social_options['google']['client_id']) {
			$this->data['isGoogle'] = true;
			$this->data['google_client_id'] = $social_options['google']['client_id'];
		}
		
		if (isset($social_options['linkedin']['status']) && $social_options['linkedin']['api_key']) {
			$this->data['isLinkedin'] = true;
			$this->data['linkedin_api_key'] = $social_options['linkedin']['api_key'];
		}
		
		$this->data['xtensions_controller_path'] = $this->config->get('xtensions_controller_path');
		
		return $this->load->view($this->config->get('xtensions_view_path').'xsocial.tpl', $this->data);
	}

	public function validateSocialUser() {
		$json = array();
		if (!$this->customer->isLogged()) {
			$this->session->data['user_info'] = $this->request->post;
			if (isset($this->request->post['email'])) {
				$this->load->model('account/customer');
				$this->load->language('account/register');
				if (!$this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
					if(isset($this->data['social_options']['additional']) && $this->data['social_options']['additional']=='yes'){
						$json['additionalform'] = $this->generateAdditionalForm();	
					}else{
						$json['redirect'] = $this->addUser($this->config->get('config_customer_group_id'));
					}
					
				} else {
					$this->customer->login($this->request->post['email'], '', true);
					$json['redirect'] = $this->url->link('checkout/checkout');
				}
			} else {
				$json['redirect'] = $this->url->link('checkout/checkout');
			}
		} else {
			$json['redirect'] = $this->url->link('checkout/checkout');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function generateAdditionalForm() {		
		$xconfig = $this->data['xconfig'];
		$this->data['misc_options'] = $misc_options = $xconfig['options'];
		$this->data['customer_groups'] = array();
		
		if (isset($this->request->post['pictureUrl'])) {
			if ($this->request->post['pictureUrl'] == 'blank') {
				$this->data['pictureUrl'] = 'image/catalog/xtensions/blankuser.jpg';
			} else {
				if ($this->request->post['platform'] != 'facebook') {
					$this->data['pictureUrl'] = $this->request->post['pictureUrl'];
				} else {
					$this->data['pictureUrl'] = isset($this->request->post['pictureUrl']['data']['url']) ? $this->request->post['pictureUrl']['data']['url'] : 'image/catalog/xtensions/blankuser.jpg';
				}
			}
		}		
		$this->data['platform'] = $this->request->post['platform'];
		$this->data['name'] = $this->request->post['firstname'] . " " . $this->request->post['lastname'];
		
		foreach ($this->config->get('xtensions_social') as $key) {
			if (isset($this->request->post[$key])) {
				$field_value[$key] = $this->request->post[$key];
			} else {
				$field_value[$key] = '';
			}
		}
		$field_value['confirm_email'] = $field_value['email'];
		
		$this->data['customer_groups'] = array();
		
		if (is_array($this->config->get('config_customer_group_display'))) {
			$this->load->model('account/customer_group');
			
			$customer_groups = $this->model_account_customer_group->getCustomerGroups();
			
			foreach ($customer_groups as $customer_group) {
				if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$this->data['customer_groups'][] = $customer_group;
				}
			}
		}
		
		$this->data['customer_group_id'] = $this->config->get('config_customer_group_id');
		
		$custom_fields = $this->xtensions_checkout->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getCustomFields();
		$field_value['value_custom_field'] = array();
		$field_data = $this->xtensions_checkout->getRefinedFields($xconfig, 'xtensions_social', 'social', 'fields', $field_value, array());
		foreach ($custom_fields as $custom_field) {
			if ($custom_field['location'] == 'account') {
				$field_data[$custom_field['identifier']] = $custom_field;
				$field_data[$custom_field['identifier']]['custom_field'] = true;
				$field_data[$custom_field['identifier']]['show'] = true;
				$field_data[$custom_field['identifier']]['section'] = $custom_field['location'];
			}
		}		
		$this->xtensions_checkout->generateForm($this,$field_data,$field_value,'login');
		$display_agree = (isset($field_data['agree']['show']) && $field_data['agree']['show']) ? true : false;
		if ($display_agree && $this->config->get('config_account_id')) {
			$this->load->model('catalog/information');
			
			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));
			
			if ($information_info) {
				$this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_account_id'), 'SSL'), $information_info['title'], $information_info['title']);
			} else {
				$this->data['text_agree'] = '';
			}
		} else {
			$this->data['text_agree'] = '';
		}
		$this->data['entry_newsletter'] = sprintf($this->language->get('entry_newsletter_checkout'), $this->config->get('config_name'));
		$this->data['display_newsletter'] = $field_data['newsletter']['show'];
		$this->data['xtensions_controller_path'] = $this->config->get('xtensions_controller_path');
		$this->template = $this->config->get('xtensions_view_path').'xsocialform.tpl';
		return $this->xtensions_checkout->renderView($this);
	}

	public function validate() {
		$this->language->load('checkout/checkout');
		$json = array();
		if ($this->customer->isLogged()) {
			$json['redirect'] = $this->url->link('checkout/checkout', '', 'SSL');
		}
		
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}
		
		if (!$json) {
			$this->load->model('account/customer');
			
			// Customer Group
			$xconfig = $this->xtensions_checkout->getXtensionsData($this->config->get('config_store_id'), 'xtensions_best_checkout');
			$field_data = $this->xtensions_checkout->getRefinedFields($xconfig['xconfig'], 'xtensions_social', 'social', 'fields');
			foreach ($field_data as $key => $field) {
				if ($field['show'] && $field['required']  && $field['type'] != 'checkbox') {
					$field_error = $this->xtensions_checkout->validateFields($key,$field,$this->request->post[$key]);
					if($field_error){
						$json['error'][$key] = $field_error;
					}
				}
			}
			$this->load->model('account/customer_group');
			
			if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
				$customer_group_id = $this->request->post['customer_group_id'];
			} else {
				$customer_group_id = $this->config->get('config_customer_group_id');
			}
			// Custom field validation
			
			$custom_fields = $this->xtensions_checkout->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getCustomFields($customer_group_id);
			
			foreach ($custom_fields as $custom_field) {
				if ($custom_field['location'] == 'account') {
					$custom_field_post = isset($this->request->post['custom_field'][$custom_field['custom_field_id']])?$this->request->post['custom_field'][$custom_field['custom_field_id']]:null;
					$custom_field_error = $this->xtensions_checkout->validateCustomField($custom_field,$custom_field_post);
					if($custom_field_error){
						$json['error']['custom_field' . $custom_field['custom_field_id']] = $custom_field_error;
					}
				}
			}
			$display_agree = (isset($field_data['agree']['show']) && $field_data['agree']['show']) ? true : false;
			if ($display_agree && $this->config->get('config_account_id')) {
				$this->load->model('catalog/information');
				
				$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));
				
				if ($information_info && !isset($this->request->post['socialagree'])) {
					$json['error']['warningagree'] = sprintf($this->language->get('error_agree'), $information_info['title']);
				}
			}
			if (!$json) {
				$json['redirect'] = $this->addUser($customer_group_id);
			}
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	private function addUser($customer_group_id){	
		$field_data = $this->request->post;
		if(!isset($field_data['password'])){
			$field_data['password'] = token(6);
		}
		unset($this->session->data['guest']);
		unset($this->session->data['payment_address']);
		unset($this->session->data['shipping_address']);
		unset($this->session->data['agree']);
		$customer_id = $this->model_account_customer->addCustomer($this->xtensions_checkout->getRegisterPostData($field_data, 'c'));
		// Clear any previous login attempts for unregistered accounts.
		$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
		
		$customer_group = $this->model_account_customer_group->getCustomerGroup($customer_group_id);
		if ($customer_group && !$customer_group['approval']) {
			$this->customer->login($this->request->post['email'], $field_data['password']);
			$redirect = $this->url->link('checkout/checkout', '', 'SSL');
		} else {
			$redirect = $this->url->link('account/success');
		}
		// Add to activity log
		if ($this->config->get('config_customer_activity')) {
			$this->load->model('account/activity');
			
			if (isset($this->request->post['firstname']) || isset($this->request->post['lastname'])) {
				$name = (isset($this->request->post['firstname']) ? $this->request->post['firstname'] . ' ' : '') . '' . (isset($this->request->post['lastname']) ? $this->request->post['lastname'] : '');
			} else {
				$name = $this->request->post['email'];
			}
			$activity_data = array(
				'customer_id' => $this->customer->getId(),
				'name' => $name 
			);
			$this->model_account_activity->addActivity('register', $activity_data);
		}
		
		return $redirect;
	}
}
?>
