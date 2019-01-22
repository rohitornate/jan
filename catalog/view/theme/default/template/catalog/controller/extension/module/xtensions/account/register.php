<?php
class ControllerExtensionModuleXtensionsAccountRegister extends Controller {
	private $error = array();
	public $data = array();

	public function index() {
		if ($this->customer->isLogged()) {
			$this->xtensions_checkout->redirect($this->url->link('account/account', '', true));
		}
		$this->data = $this->load->language('account/register');
		$this->data += $this->load->language($this->config->get('xtensions_language_path'));
		
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('account/customer');
		$this->data += $this->xtensions_checkout->getXtensionsData($this->config->get('config_store_id'), 'xtensions_best_checkout');
		$xconfig = $this->data['xconfig'];	
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate($xconfig)) {
			$this->submit($xconfig);
		}
		
		foreach ($this->config->get('xtensions_checkout_account_register') as $key) {
			// @formatter:off
			if (isset($this->request->post[$key])) {
				$field_value[$key] = $this->request->post[$key];
			} else if(in_array($key, array('postcode','country_id','zone_id'))  && isset($xconfig['options'][$key])){
				$field_value[$key] = $xconfig['options'][$key];
			} elseif (in_array($key, array('postcode','country_id','zone_id')) && isset($this->session->data['shipping_address'][$key])) {
				$field_value[$key] = $this->session->data['shipping_address'][$key];
			} else {
				$field_value[$key] = '';
			}		
			// @formatter:off
		}		

		$this->data['country_id'] = $field_value['country_id'];
		$this->data['zone_id'] = $field_value['zone_id'];
		$this->data['breadcrumbs'] = array();
		
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);
		
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_register'),
			'href' => $this->url->link('account/register', '', true)
		);
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('account/login', '', true));
		
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');		
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['custom_field'])) {
			$this->data['error_custom_field'] = $this->error['custom_field'];
		} else {
			$this->data['error_custom_field'] = array();
		}
		
		$this->load->model('localisation/country');		
		
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
		
		if (isset($this->request->post['customer_group_id'])) {
			$this->data['customer_group_id'] = $this->request->post['customer_group_id'];
		} else {
			$this->data['customer_group_id'] = $this->config->get('config_customer_group_id');
		}
		
		$custom_fields = $this->xtensions_checkout->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getCustomFields();
		
		if (isset($this->request->post['custom_field'])) {
			if (isset($this->request->post['custom_field']['account'])) {
				$account_custom_field = $this->request->post['custom_field']['account'];
			} else {
				$account_custom_field = array();
			}
			
			if (isset($this->request->post['custom_field']['address'])) {
				$address_custom_field = $this->request->post['custom_field']['address'];
			} else {
				$address_custom_field = array();
			}
			
			$this->data['register_custom_field'] = $account_custom_field + $address_custom_field;
		} else {
			$this->data['register_custom_field'] = array();
		}
		
		$this->data['single_box'] = $single_box = isset($xconfig['options']['single_box']) ? $xconfig['options']['single_box'] : false;
		$this->data['hide_address'] = $hide_address = isset($xconfig['options']['hide_address']) ? $xconfig['options']['hide_address'] : false;		
		
		$field_data = $this->xtensions_checkout->getRefinedFields($xconfig,'xtensions_checkout_account_register', 'register', '', $field_value, $this->error);
		foreach ($custom_fields as $custom_field) {
			$field_data[$custom_field['identifier']] = $custom_field;
			$field_data[$custom_field['identifier']]['custom_field'] = true;
			$field_data[$custom_field['identifier']]['section'] = $custom_field['location'];
		}		
		$this->data['mask'] = array();
		$sort_order = array();
		foreach ($field_data as $key => $value) {
			if($value['is_mask']){
				if(isset($value['custom_field'])){
					$this->data['mask']['input-custom-field'.$value['custom_field_id']] = $value['mask'];
				}else{
					$this->data['mask']['input-'.$key] = $value['mask'];
				}
			}
			$sort_order[$key] = $value['sort_order'];
		}
		array_multisort($sort_order, SORT_ASC, $field_data);		
		
		$this->data['field_data'] = $field_data;
		$this->data['fields'] = array();
		foreach ($this->data['field_data'] as $key => $field) {
			// @formatter:off
			$field_view = array('key' => $key,'field' => $field,'customer_group_id' => $this->data['customer_group_id'],'customer_groups' => $this->data['customer_groups'],'entry_customer_group' => $this->language->get('entry_customer_group'),'text_select' => $this->language->get('text_select'),'button_upload' => $this->language->get('button_upload'),'text_loading' => $this->language->get('text_loading'),'error_custom_field'=>$this->data['error_custom_field'],'register_custom_field'=>$this->data['register_custom_field']);
			if ($single_box) {
				if ($key != 'newsletter') {					
					if ($hide_address && !in_array($field['section'], array('address'))) {
						$this->data['fields']['all'][] = $this->load->view($this->config->get('xtensions_account_view_path').'xtensions_form', $field_view);
					} else if (!$hide_address) {
						$this->data['fields']['all'][] = $this->load->view($this->config->get('xtensions_account_view_path').'xtensions_form', $field_view);
					}
				}
			} else {
				if (in_array($field['section'], array('account','password'))) {
					$this->data['fields'][$field['section']][] = $this->load->view($this->config->get('xtensions_account_view_path').'xtensions_form', $field_view);
				} else if (!$hide_address && in_array($field['section'], array('address'))) {
					$this->data['fields']['address'][] = $this->load->view($this->config->get('xtensions_account_view_path').'xtensions_form', $field_view);
				}
			}
			// @formatter:on
		}
		
		$this->data['action'] = $this->url->link('account/register', '', true);
		$this->data['display_country'] = (isset($field_data['country_id']['show']) && $field_data['country_id']['show'])?true:false;
		$this->data['display_newsletter'] = $field_data['newsletter']['show'];
		
		if (isset($this->request->post['newsletter'])) {
			$this->data['newsletter'] = $this->request->post['newsletter'];
		} else {
			$this->data['newsletter'] = 1;
		}
		
		$this->data['captcha'] = '';
		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$this->data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
		}
		
		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');
			
			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));
			
			if ($information_info) {
				$this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_account_id'), true), $information_info['title'], $information_info['title']);
			} else {
				$this->data['text_agree'] = '';
			}
		} else {
			$this->data['text_agree'] = '';
		}
		
		if (isset($this->request->post['agree'])) {
			$this->data['agree'] = $this->request->post['agree'];
		} else {
			$this->data['agree'] = false;
		}
		
		$children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header' 
		);
		$this->data += $this->xtensions_checkout->getChildren($children);
		
		$this->template = $this->config->get('xtensions_account_view_path').'register';
		
		return $this->xtensions_checkout->renderView($this);
	}

	private function submit($xconfig) {
		$customer_id = $this->model_account_customer->addCustomer($this->xtensions_checkout->getRegisterPostData($this->request->post));
		$this->customer->login($this->request->post['email'], $this->request->post['password']);
		
		unset($this->session->data['guest']);
		
		// Clear any previous login attempts for unregistered accounts.
		if (method_exists($this->model_account_customer, 'deleteLoginAttempts')) {
			$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
		}
		// Add to activity log
		if ($this->config->get('config_customer_activity')) {
			$this->load->model('account/activity');
			if (isset($xconfig['register']['firstname']['show']) || isset($xconfig['register']['lastname']['show'])) {
				$name = (isset($this->request->post['firstname']) ? $this->request->post['firstname'] . ' ' : '') . '' . (isset($this->request->post['lastname']) ? $this->request->post['lastname'] : '');
			} else {
				$name = $this->request->post['email'];
			}
			$activity_data = array(
				'customer_id' => $customer_id,
				'name' => $name 
			);
			$this->model_account_activity->addActivity('register', $activity_data);
		}
		$this->xtensions_checkout->redirect($this->url->link('account/success'));
	}

	public function validate($xconfig) {
		$field_data = $this->xtensions_checkout->getRefinedFields($xconfig, 'xtensions_checkout_account_register','register');
		$hide_address = isset($xconfig['options']['hide_address']) ? $xconfig['options']['hide_address'] : false;
		foreach ($field_data as $key => $field) {
			if ($field['show'] && $field['required']) {
				// @formatter:off
				if(!$hide_address || ($hide_address && $field['location'] != 'address') && $field['type'] != 'checkbox'){
					$field_error = $this->xtensions_checkout->validateFields($key,$field,$this->request->post[$key]);
					if($field_error){
						$this->error[$key] = $field_error;
					}
				}
				// @formatter:on
			}
		}
		
		if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}
		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');
			
			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));
			
			if ($information_info && !isset($this->request->post['agree'])) {
				$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');
			
			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}
		
		// Customer Group
		if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->post['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}
		// Custom field validation
		// @formatter:off
		$custom_fields = $this->xtensions_checkout->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getCustomFields($customer_group_id);
		foreach ($custom_fields as $custom_field) {
			if (($custom_field['location'] == 'account') || (($custom_field['location'] == 'address') && !$hide_address)) {
				$custom_field_post = isset($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])?$this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']]:null;				
				$custom_field_error = $this->xtensions_checkout->validateCustomField($custom_field,$custom_field_post);
				if($custom_field_error){
					$this->error['custom_field'][$custom_field['custom_field_id']] = $custom_field_error;
				}
			}
		}		
		// @formatter:on		
		return !$this->error;
	}

	public function customfield() {
		$json = array();
		
		// Customer Group
		if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->get['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}
		
		$custom_fields = $this->xtensions_checkout->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getCustomFields($customer_group_id);
		
		foreach ($custom_fields as $custom_field) {
			$json[] = array(
				'custom_field_id' => $custom_field['custom_field_id'],
				'required' => $custom_field['required'] 
			);
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
