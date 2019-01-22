<?php
class XtensionsCheckout extends Controller {
	private $active;
	private $single_box;
	private $xfields;
	private $totals;
	private $isMobile;

	/* Constructor */
	public function __construct($registry) {
		parent::__construct($registry);
		$this->db = $registry->get('db');
		if(!file_exists(DIR_SYSTEM.'library/xtensions/xtensionsplatform.php')){
			$this->isMobile = false;
		}else{
			require_once DIR_SYSTEM.'library/xtensions/xtensionsplatform.php';
			$platform = new XtensionsPlatform($registry);		
			$this->isMobile = $platform->isMobile();
		}
		$this->config->load('xtensions/xcheckout');	
	}
	
	/* Getters */
	public function getXtensionsData($store_id, $module) {
		$setting_data = $this->cache->get($module.".". (int)$store_id);
		if(!$setting_data){			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "xtensions WHERE store_id = '" . (int)$store_id . "' AND module = '" . $this->db->escape($module) . "'");
			$setting_data = $query->rows;
			$this->cache->set($module.".". (int)$store_id,$setting_data);				
		}
		foreach ($setting_data as $result) {
			if (!$result['serialized']) {
				$setting_data[$result['key']] = $result['value'];
			} else {
				$setting_data[$result['key']] = json_decode($result['value'], true);
			}
		}
		return array(
			'xconfig' => $setting_data 
		);
	}

	public function isActive($module, $store_id = 0) {
		$this->install();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "xtensions WHERE `key`='status' AND store_id = '" . (int)$store_id . "' AND module = '" . $this->db->escape($module) . "'");
		if ($query->rows) {
			return $query->row['value'];
		} else {
			return false;
		}
	}
	
	public function isMobile(){
		return $this->isMobile;
	}

	/* address getters with formatting- formatting includes custom fields- start */
	public function getAddresses($obj) {
		$address_data = array();
		
		$query = $obj->db->query("SELECT * FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$obj->customer->getId() . "'");
		
		foreach ($query->rows as $result) {
			$country_query = $obj->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$result['country_id'] . "'");
			
			if ($country_query->num_rows) {
				$country = $country_query->row['name'];
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
				$address_format = $country_query->row['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';
				$address_format = '';
			}
			
			$zone_query = $obj->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$result['zone_id'] . "'");
			
			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}
			$identified_data = $this->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getCustomFieldByIdentifier($this->unserialize($result['custom_field']), 'address');
			
			$address_data[$result['address_id']] = array(
				'address_id' => $result['address_id'],
				'identified_data' => $identified_data,
				'firstname' => $result['firstname'],
				'lastname' => $result['lastname'],
				'company' => $result['company'],
				'company_id' => isset($result['company_id']) ? $result['company_id'] : "",
				'tax_id' => isset($result['tax_id']) ? $result['tax_id'] : "",
				'address_1' => $result['address_1'],
				'address_2' => $result['address_2'],
				'postcode' => $result['postcode'],
				'city' => $result['city'],
				'zone_id' => $result['zone_id'],
				'zone' => $zone,
				'zone_code' => $zone_code,
				'country_id' => $result['country_id'],
				'country' => $country,
				'iso_code_2' => $iso_code_2,
				'iso_code_3' => $iso_code_3,
				'address_format' => $address_format,
				'custom_field' => $this->unserialize($result['custom_field']) 
			);
		}
		
		foreach ($address_data as $result) {
			$formatted_address = $this->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getFormattedAddress($address_data[$result['address_id']]);
			$linear_address = $this->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getLinearAddress($address_data[$result['address_id']]);
			$address_data[$result['address_id']] = array_merge($address_data[$result['address_id']], array(
				'formatted_address' => $formatted_address 
			));
			$address_data[$result['address_id']] = array_merge($address_data[$result['address_id']], array(
				'linear_address' => $linear_address 
			));
		}
		
		return $address_data;
	}

	public function getAddress($obj, $address_id) {
		$address_query = $obj->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "address WHERE address_id = '" . (int)$address_id . "' AND customer_id = '" . (int)$obj->customer->getId() . "'");
		
		if ($address_query->num_rows) {
			$country_query = $obj->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$address_query->row['country_id'] . "'");
			
			if ($country_query->num_rows) {
				$country = $country_query->row['name'];
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
				$address_format = $country_query->row['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';
				$address_format = '';
			}
			
			$zone_query = $obj->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$address_query->row['zone_id'] . "'");
			
			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}
			$identified_data = $this->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getCustomFieldByIdentifier($this->unserialize($address_query->row['custom_field']), 'address');
			$address_data = array(
				'address_id' => $address_query->row['address_id'],
				'identified_data' => $identified_data,
				'firstname' => $address_query->row['firstname'],
				'lastname' => $address_query->row['lastname'],
				'company' => $address_query->row['company'],
				'company_id' => isset($address_query->row['company_id']) ? $address_query->row['company_id'] : "",
				'tax_id' => isset($address_query->row['tax_id']) ? $address_query->row['tax_id'] : "",
				'address_1' => $address_query->row['address_1'],
				'address_2' => $address_query->row['address_2'],
				'postcode' => $address_query->row['postcode'],
				'city' => $address_query->row['city'],
				'zone_id' => $address_query->row['zone_id'],
				'zone' => $zone,
				'zone_code' => $zone_code,
				'country_id' => $address_query->row['country_id'],
				'country' => $country,
				'iso_code_2' => $iso_code_2,
				'iso_code_3' => $iso_code_3,
				'address_format' => $address_format,
				'custom_field' => $this->unserialize($address_query->row['custom_field']) 
			);
			$formatted_address = $this->getXtensionsModel($this->config->get('xtensions_custom_fields_model_path'))->getFormattedAddress($address_data);
			$address_data = array_merge($address_data, array(
				'formatted_address' => $formatted_address 
			));
			return $address_data;
		} else {
			return false;
		}
	}

	/* address getters with formatting- formatting includes custom fields- end */
	
	public function getInformations($store_id = 0){
		$query = $this->db->query("SELECT i.*, id.title, its.store_id FROM " . DB_PREFIX . "information i JOIN " . DB_PREFIX . "information_to_store its ON i.information_id = its.information_id LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND its.store_id = '" . (int)$store_id ."' ORDER BY i.sort_order");
		
		return $query->rows;
	}
	
	/* Fill up the missing fields for register page with blank data if fields are hidden- start */
	public function getRegisterPostData($data, $page = 'r') {
		$fields = array(
			'firstname',
			'lastname',
			'email',
			'telephone',
			'fax',
			'company',
			'company_id',
			'tax_id',
			'address_1',
			'address_2',
			'city',
			'postcode',
			'zone_id',
			'country_id',
			'newsletter' 
		);
		foreach ($fields as $field) {
			$defaults[$field] = '';
		}
		if ($page != 'r') {
			$custom_fields['custom_field']['account'] = isset($data['custom_field']) ? $data['custom_field'] : array();
			$defaults['noaddress'] = true;
		} else {
			$custom_fields = array();
			$mod_data = $this->xtensions_checkout->getXtensionsData($this->config->get('config_store_id'), 'xtensions_best_checkout');
			$xconfig = $mod_data['xconfig'];
			$hide_address = isset($xconfig['options']['hide_address']) ? $xconfig['options']['hide_address'] : false;
			if ($hide_address) {
				$defaults['noaddress'] = true;
			}
		}
		$defaults = array_merge($defaults, $data, $custom_fields);
		return $defaults;
	}

	/* Fill up the missing fields for register page with blank data if fields are hidden- end */
	
	
	public function getActivitySession($obj) {
		if (!isset($obj->session->data['xtensions_activity'])) {
			$token = token(32);
			$token_query = $obj->db->query("SELECT * FROM `" . DB_PREFIX . "best_customer_activity` WHERE activity_session_id = '" . $obj->db->escape($token) . "'");
			if ($token_query->num_rows) {
				return $this->getActivitySession($obj);
			} else {
				$obj->session->data['xtensions_activity'] = $token;
			}
		}
		return $obj->session->data['xtensions_activity'];
	}

	public function unsetActivitySession($obj) {
		if (isset($obj->session->data['xtensions_activity'])) {
			unset($obj->session->data['xtensions_activity']);
		}
	}

	/* Engine functions for data rendering- start */
	public function getChildren($children) {
		foreach ($children as $child) {
			if(is_array($child)){
				$data[basename($child['key'])] = $this->load->controller($child['key'],$child['data']);
			}else{
				$data[basename($child)] = $this->load->controller($child);
			}
		}
		return $data;
	}

	public function redirect($url, $status = 302) {
		$this->response->redirect($url);
	}

	public function renderView($obj) {
		return $this->load->view($obj->template, $obj->data);
	}

	public function unserialize($data = array()) {
		return json_decode($data, true);
	}

	public function get_numeric($val) {
		if (is_numeric($val)) {
			return $val + 0;
		}
		return 0;
	}

	/* Engine functions for data rendering- end */
	
	/* Admin related and installation functions - start */
	public function validate(&$obj, $store_id, $module) {
		if (!$obj->user->hasPermission('modify', $this->config->get('xtensions_admin_xcheckout_path'))) {
			$obj->error['warning'] = $obj->language->get('error_permission');
			return false;
		}
		$this->editSetting($obj->request->post, $store_id, $module);
		$obj->session->data['success'] = $obj->language->get('text_success');
		$this->redirect($obj->url->link($this->config->get('xtensions_admin_xcheckout_path'), 'store_id=' . $store_id . '&token=' . $obj->session->data['token'], 'SSL'));
	}
	
	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "xtensions` (`setting_id` int(11) NOT NULL AUTO_INCREMENT, `store_id` int(11) NOT NULL DEFAULT '0', `module` varchar(256) NOT NULL, `key` varchar(64) NOT NULL, `value` longtext NOT NULL, `serialized` tinyint(4) NOT NULL, PRIMARY KEY (`setting_id`)) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;");
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "xcustom_field` (`custom_field_id` int(11) NOT NULL,`xsort_order` float(8,4) NOT NULL, `minimum` int(11) NOT NULL DEFAULT '0', `maximum` int(11) NOT NULL DEFAULT '0', `mask` varchar(32) NOT NULL, `identifier` varchar(32) NOT NULL, `isnumeric` tinyint(4) NOT NULL DEFAULT '0', `email_display` tinyint(4) NOT NULL DEFAULT '0',`order_display` tinyint(4) NOT NULL DEFAULT '0',`list_display` tinyint(4) NOT NULL DEFAULT '0', `invoice` tinyint(4) NOT NULL DEFAULT '0', PRIMARY KEY (`custom_field_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;");
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "xcustom_field_description` (`custom_field_id` int(11) NOT NULL, `language_id` int(11) NOT NULL, `error` text NOT NULL, `tips` text NOT NULL, PRIMARY KEY (`custom_field_id`,`language_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;");
		$default = $this->db->query("SELECT * FROM `" . DB_PREFIX . "xtensions` WHERE store_id = 0");
		if(!$default->rows){
			$config = $this->config->get('xtensions_default');
			foreach ($config as $key=>$value){
				$this->db->query("INSERT INTO " . DB_PREFIX . "xtensions SET store_id = '0',  module = '" . $this->db->escape('xtensions_best_checkout') . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "', serialized = '1'");	
			}
			$this->cache->delete("xtensions_best_checkout.0");
		}
		$stores = $this->db->query("SELECT * FROM `" . DB_PREFIX . "store`");
		foreach ($stores->rows as $store){
			$default = $this->db->query("SELECT * FROM `" . DB_PREFIX . "xtensions` WHERE store_id = '". $store['store_id'] ."'");
			if(!$default->rows){
				$config = $this->config->get('xtensions_default');
				foreach ($config as $key=>$value){
					$this->db->query("INSERT INTO " . DB_PREFIX . "xtensions SET store_id = '". $store['store_id'] ."',  module = '" . $this->db->escape('xtensions_best_checkout') . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "', serialized = '1'");	
				}
			}
			$this->cache->delete("xtensions_best_checkout.".$store['store_id']);
		}
	}	
	
	private function editSetting($data, $store_id, $module) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "xtensions` WHERE store_id = '" . (int)$store_id . "'  AND module = '" . $this->db->escape($module) . "'");
		foreach ($data as $key => $value) {
			if (!is_array($value)) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "xtensions SET store_id = '" . (int)$store_id . "',  module = '" . $this->db->escape($module) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
			} else {
				$this->db->query("INSERT INTO " . DB_PREFIX . "xtensions SET store_id = '" . (int)$store_id . "',  module = '" . $this->db->escape($module) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($value, true)) . "', serialized = '1'");
			}
		}
		if (isset($data['options']['override_format'])) {
			$this->db->query("update " . DB_PREFIX . "country  set address_format ='" . $this->db->escape($data['options']['address_format']) . "'");
		}
		if (isset($data['sort_order']['custom_fields'])) {
			foreach ($data['sort_order']['custom_fields'] as $custom_field_id => $xsort_order){
				$this->db->query("UPDATE " . DB_PREFIX . "xcustom_field  SET xsort_order ='" . $this->db->escape($xsort_order) . "' WHERE custom_field_id = '" . (int)$custom_field_id . "'");
			}
		}
		$this->cache->delete($module.".". (int)$store_id);
	}

	public function getRawFields() {
		return $this->config->get('xtensions_checkout_rawfields');
	}

	private function convertValues($data, $value, $display_name) {
		$values = array();
		foreach ($data as $sub_data) {
			$values[] = array(
				'value_id' => $sub_data[$value],
				'display_name' => $sub_data[$display_name] 
			);
		}
		return $values;
	}

	public function getRefinedFields($xconfig, $config, $section, $sub_section='', $field_value = array(), $error = array()) {
		$field_data = array();
		$raw_fields = $this->getRawFields();		
		$hide_address = isset($xconfig['options']['hide_address']) && $section == 'register' ? $xconfig['options']['hide_address'] : false;
		if($sub_section){
			$display_or_required = $xconfig[$section][$sub_section];	
		}else{
			$display_or_required = $xconfig[$section];	
		}
		
		$sort_order = isset($xconfig['sort_order'])?$xconfig['sort_order']:array();
		$validation = isset($xconfig['validation'])?$xconfig['validation']:array();
		$titles = isset($xconfig['titles'])?$xconfig['titles']:array();
		foreach ($this->config->get($config) as $key) {
			$select_values = array();
			if (!$hide_address && $key == 'country_id') {
				$this->load->model('localisation/country');
				$select_values = $this->model_localisation_country->getCountries();
				$select_values = $this->convertValues($select_values, 'country_id', 'name');
				// @formatter:off
				$select_values = array_merge(array(array('value_id' => '','display_name' => $this->language->get('text_select'))), $select_values);
				// @formatter:on
			}
			$field_default = $raw_fields[$key];
			
			if ($field_default[$section] || ($section == 'edit' && $field_default['location'] == 'both') || ($section == 'checkout' && $field_default['checkout'])) {				
				$title =  ((isset($titles[$key]['title'][(int)$this->config->get('config_language_id')]) && $titles[$key]['title'][(int)$this->config->get('config_language_id')]) ? $titles[$key]['title'][(int)$this->config->get('config_language_id')] : $this->language->get($field_default['entry_var']));
				$tooltip =  ((isset($titles[$key]['tooltip'][(int)$this->config->get('config_language_id')]) && $titles[$key]['tooltip'][(int)$this->config->get('config_language_id')]) ? $titles[$key]['tooltip'][(int)$this->config->get('config_language_id')] :'');
				$field_data[$key] = array(
					'show' => (isset($display_or_required[$key]['show']) ? $display_or_required[$key]['show'] : ((isset($field_default['mandatory']) && $section != 'social') ? $field_default['mandatory'] : false)),
					'required' => (isset($display_or_required[$key]['required']) ? $display_or_required[$key]['required'] : ((isset($field_default['mandatory']) || (isset($field_default['required_default']) && $field_default['required_default'])) ? true : false)),					
					'value' => isset($field_value[$key]) ? $field_value[$key] : '',
					'select_values' => $select_values,
					'properties' => $field_default,
					'location' => $field_default['location'],
					'sort_order' => (isset($sort_order['fields'][$key]) ? $sort_order['fields'][$key] : $field_default['sort_order']),
					'type' => (isset($validation[$key]['numeric']) && $validation[$key]['numeric']) ? 'tel' : $field_default['type'],
					'title' => $title,
					'override' => isset($validation[$key]['override']) ? $validation[$key]['override'] : false,
					'minimum' => isset($validation[$key]['minimum']) ? $validation[$key]['minimum'] : false,
					'maximum' => isset($validation[$key]['maximim']) ? $validation[$key]['maximim'] : false,
					'numeric' => (isset($validation[$key]['numeric']) && $validation[$key]['numeric']) ? 'numeric' : '',
					'is_mask' => (isset($validation[$key]['mask']) && $validation[$key]['mask']) ? true : false,
					'mask' => (isset($validation[$key]['mask']) && $validation[$key]['mask']) ? $validation[$key]['mask'] : '',
					'regex' => (isset($validation[$key]['regex']) && $validation[$key]['regex']) ? $validation[$key]['regex'] : '',
					'error' => isset($error[$key]) ? $error[$key] : '',
					'validate_email' => (isset($field_default['validate_email']) ? $field_default['validate_email'] : false),
					'section' => $field_default['section'],
					'dependency' => isset($field_default['dependency'])?$field_default['dependency']:'',
					'tooltip' => $tooltip,
					'error_message' => ((isset($validation[$key]['message'][(int)$this->config->get('config_language_id')]) && $validation[$key]['message'][(int)$this->config->get('config_language_id')]) ? $validation[$key]['message'][(int)$this->config->get('config_language_id')] : (isset($field_default['error_var']) ? $this->language->get($field_default['error_var']) : '')),
					'hide_guest' => isset($field_default['guest']) && !$field_default['guest']?true:false,					
				);
			}
		}
		return $field_data;
	}
	
	public function generateForm($obj,$field_data,$field_value,$section='',$guest_payment_shipping=''){
		$sort_order = array();
		$obj->data['mask'] = array();
		foreach ($field_data as $key => $value) {
			if($value['is_mask']){
				if(isset($value['custom_field'])){
					$obj->data['mask']['input-custom_field'.$value['custom_field_id']] = $value['mask'];
				}else{
					$obj->data['mask']['input-'.$key] = $value['mask'];
				}
			}
			if($value['show']){
				if(($key !='customer_group_id') || ($key=='customer_group_id' && count($obj->data['customer_groups']) > 1)){
					$sort_order[$key] = $value['sort_order'];
				}else{
					$sort_order[$key] = 999;
				}
			}else{
				$sort_order[$key] = 999;
			}
		}
		array_multisort($sort_order, SORT_ASC, $field_data);
		
		foreach ($field_data as $key => $value) {
			$splitDec = explode(".", $sort_order[$key]);
			if(!isset($splitDec[0])){
				$splitDec[0] = '0';
			}
			if(!isset($splitDec[1])){
				$splitDec[1] = '0';
			}
			$new_data[$splitDec[0]][$splitDec[1]][$key] = $value;			
		}
		$fields = array();
		// @formatter:off
		$field_position_class = array(2=>array(1=>'group-left',2=>'group-right'),3=>array(1=>'group-left',2=>'group-middle',3=>'group-right'),4=>array(1=>'group-left',2=>'group-middle',3=>'group-middle',4=>'group-right'));
		$field_class = array(2=>'group-half',3=>'group-thirty',4=>'group-twenty-five');
		foreach ($new_data as $key => $field) {	
			$fieldcount = $this->count_recursive($field, 1);
			if($fieldcount > 1){
				$count = 0;
				$field_html = array();
				foreach ($field as $newkey => $newfield){					
					foreach ($newfield as $newnewkey => $newnewfield){
						$count++;
						if($section=='guest_address'){
							$field_value_custom_key = $field_value[$guest_payment_shipping]['value_custom_field'];
						}else{
							$field_value_custom_key = $field_value['value_custom_field'];
						}
						if($section == 'login'){
							$field_view = array('key' => $newnewkey,'field' => $newnewfield,'customer_group_id' => $obj->data['customer_group_id'],'customer_groups' => $obj->data['customer_groups'],'entry_customer_group' => $obj->language->get('entry_customer_group'),'text_select' => $obj->language->get('text_select'),'button_upload' => $obj->language->get('button_upload'),'text_loading' => $obj->language->get('text_loading'),'error_custom_field'=>$obj->data['error_custom_field'],'value_custom_field'=>$field_value['value_custom_field']);
						}else{
							$field_view = array('key' => $newnewkey,'field' => $newnewfield,'text_select' => $obj->language->get('text_select'),'button_upload' => $obj->language->get('button_upload'),'text_loading' => $obj->language->get('text_loading'),'error_custom_field'=>$obj->data['error_custom_field'],'value_custom_field'=>$field_value_custom_key);	
						}
						$class = isset($field_class[$fieldcount])?$field_class[$fieldcount]:'group-twenty-five';
						$sub_class4 = isset($field_position_class[$fieldcount][$count])?$field_position_class[$fieldcount][$count]:'group-middle';
						$container = '<div class="'.$class.' '.$sub_class4.'">%s</div>';
						$field_html[$newkey][$newnewkey] = $obj->load->view($obj->config->get('xtensions_view_path').'makefields', $field_view);
						$field_html[$newkey][$newnewkey] = sprintf($container,$field_html[$newkey][$newnewkey]);
					}					
				}
				$fields[] = $this->recursive_implode($field_html,'').'<div class="clearfix"></div>';	
			}else{			
				foreach ($field as $newkey => $newfield){					
					foreach ($newfield as $newnewkey => $newnewfield){
						if($section=='guest_address'){
							$field_value_custom_key = $field_value[$guest_payment_shipping]['value_custom_field'];
						}else{
							$field_value_custom_key = $field_value['value_custom_field'];
						}
						if($section == 'login'){
							$field_view = array('key' => $newnewkey,'field' => $newnewfield,'customer_group_id' => $obj->data['customer_group_id'],'customer_groups' => $obj->data['customer_groups'],'entry_customer_group' => $obj->language->get('entry_customer_group'),'text_select' => $obj->language->get('text_select'),'button_upload' => $obj->language->get('button_upload'),'text_loading' => $obj->language->get('text_loading'),'error_custom_field'=>$obj->data['error_custom_field'],'value_custom_field'=>$field_value['value_custom_field']);			
						}else{
							$field_view = array('key' => $newnewkey,'field' => $newnewfield,'text_select' => $obj->language->get('text_select'),'button_upload' => $obj->language->get('button_upload'),'text_loading' => $obj->language->get('text_loading'),'error_custom_field'=>$obj->data['error_custom_field'],'value_custom_field'=>$field_value_custom_key);	
						}									
						$fields[] = $obj->load->view($obj->config->get('xtensions_view_path').'makefields', $field_view);
					}							
				}
			}			
		}
		// @formatter:on
		if($section=='guest_address'){
			return $fields;
		}else{
			$obj->data['fields']['checkout'] = $fields;
		}
	}
	
	public function recursive_implode(array $array, $glue = ',', $include_keys = false, $trim_all = false){
		$glued_string = '';
		// Recursively iterates array and adds key/value to glued string
		array_walk_recursive($array, function($value, $key) use ($glue, $include_keys, &$glued_string)
		{
			$include_keys and $glued_string .= $key.$glue;
			$glued_string .= $value.$glue;
		});
		// Removes last $glue from string
		strlen($glue) > 0 and $glued_string = substr($glued_string, 0, -strlen($glue));
		// Trim ALL whitespace
		$trim_all and $glued_string = preg_replace("/(\s)/ixsm", '', $glued_string);
		return (string) $glued_string;
	}
	
	public function count_recursive($array, $limit) { 
	    $count = 0; 
	    foreach ($array as $id => $_array) { 
	        if (is_array ($_array) && $limit > 0) { 
	            $count += $this->count_recursive($_array, $limit - 1); 
	        } else { 
	            $count += 1; 
	        } 
	    } 
    	return $count; 
	}
	
	public function validateFields($key,$field,$post_key){
		$error = '';
		// @formatter:off
		if($field['is_mask']){
			$post_key = rtrim($post_key,'_');
		}
		if (in_array($field['type'], array('text','date','textarea','datetime','time','password','email','tel')) && !$field['dependency']) {
			if ((utf8_strlen(trim($post_key)) < $field['minimum']) || (utf8_strlen(trim($post_key)) > $field['maximum'])) {
				$error = $field['error_message'];
			}
			if ($field['numeric'] && !is_numeric($post_key)) {
				$error = $field['error_message'];
			}
			if ($field['regex'] && !filter_var($post_key, FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $field['regex'])))) {
				$error = $field['error_message'];
			}
			if (isset($field['validate_email']) && $field['validate_email'] && !filter_var($post_key, FILTER_VALIDATE_EMAIL)) {
				$error = $field['error_message'];
			}
		} else if (in_array($field['type'], array('select','radio')) && !$field['dependency']) {
			if (!isset($post_key) || $post_key == '' || !is_numeric($post_key)) {
				$error = $field['error_message'];
			}
		} else if($field['dependency']){
			if($post_key != $this->request->post[$field['dependency']]){
				$error = $field['error_message'];
			}
		}
		// @formatter:on
		return $error;
	}

	public function validateCustomField($custom_field,$custom_field_post){
		$error = '';
		if($custom_field['is_mask']){
			$custom_field_post = rtrim($custom_field_post,'_');
		}
		// @formatter:off
		if (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($custom_field_post, FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
			$error = sprintf($this->language->get('error_custom_field_validate'), $custom_field['name']);
		}
		if($custom_field['required']){
			if (($custom_field['type'] != 'text') && ($custom_field['type'] != 'textarea') && $custom_field['required'] && empty($custom_field_post)) {
				$error = $custom_field['error'];
			} else if ($custom_field['type'] == 'text' || $custom_field['type'] == 'textarea') {					
				if ((utf8_strlen($custom_field_post) < $custom_field['minimum']) || (utf8_strlen($custom_field_post) > $custom_field['maximum'])) {
					$error = $custom_field['error'];
				}
			}
		}
		// @formatter:on	
		return $error;
	}
	
	public function getXtensionsModel($model){
		$string = 'model_' . str_replace('/', '_', $model);
		if(!$this->registry->has($string)){
			$this->load->model($model);
		}
		return $this->registry->get($string);
	}
	
	public function setTotals($totals){
		$this->totals = $totals;
	}
	
	public function getTotals(){
		return $this->totals;
	}
	
	public function uninstallModule(){
		$this->db->query("UPDATE `" . DB_PREFIX . "xtensions` SET `value` = 0 WHERE `key` = 'status'");
		$this->cache->delete("xtensions_best_checkout");
	}
	
	public function installModule(){
		$this->config->load('xtensions/xcheckout');
		$arrContextOptions=array(
						    "ssl"=>array(
						        "verify_peer"=>false,
						        "verify_peer_name"=>false,
						    ),
		); 
		$request  = array(
						'email' => $this->config->get('config_email'),
						'store' => HTTP_CATALOG,
						'module' => $this->config->get('xtensions_module'),
						'module_title' => $this->config->get('xtensions_module_title'),
						'module_version' =>$this->config->get('xtensions_checkout_version'),
						'oc_version' => VERSION
				);
		@file_get_contents($this->config->get('xtensions_support').'modsupport?'.http_build_query($request),false,stream_context_create($arrContextOptions));
	}	
}
