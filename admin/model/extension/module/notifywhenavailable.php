<?php 
class ModelExtensionModuleNotifyWhenAvailable extends Model {
	public function __construct($register) {
		if (!defined('IMODULE_ROOT')) define('IMODULE_ROOT', substr(DIR_APPLICATION, 0, strrpos(DIR_APPLICATION, '/', -2)) . '/');
		if (!defined('IMODULE_SERVER_NAME')) define('IMODULE_SERVER_NAME', substr((defined('HTTP_CATALOG') ? HTTP_CATALOG : HTTP_SERVER), 7, strlen((defined('HTTP_CATALOG') ? HTTP_CATALOG : HTTP_SERVER)) - 8));
		parent::__construct($register);
	}
	
	public function install(){
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "notifywhenavailable`
	(`notifywhenavailable_id` INT(11) NOT NULL AUTO_INCREMENT, 
	 `customer_email` VARCHAR(200) NULL DEFAULT NULL,
	 `customer_name` VARCHAR(100) NULL DEFAULT NULL,
	 `product_id` INT(11) NULL DEFAULT '0',
	 `selected_options` TEXT NULL DEFAULT NULL,
	 `date_created` DATETIME  NOT NULL DEFAULT '0000-00-00 00:00:00',
	 `store_id` int(11) DEFAULT NULL,
	 `customer_notified` TINYINT(1) NOT NULL DEFAULT '0',
	 `language` VARCHAR(100) NULL DEFAULT '".$this->config->get('config_language')."',
	  PRIMARY KEY (`notifywhenavailable_id`));");

	  $this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=1 WHERE `name` LIKE'%NotifyWhenAvailable by iSenseLabs%'");
	  $modifications = $this->load->controller('extension/modification/refresh');	
	}
	
	public function uninstall()	{
		  $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "notifywhenavailable`");
		  $this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=0 WHERE `name` LIKE'%NotifyWhenAvailable by iSenseLabs%'");
	  	$modifications = $this->load->controller('extension/modification/refresh');	
	}

	public function getAllSubscribedCustomers($store_id=0) {	
		$query =  $this->db->query("SELECT DISTINCT super.*, product.name as product_name FROM `" . DB_PREFIX . "notifywhenavailable` super 
			JOIN `" . DB_PREFIX . "product_description` product on super.product_id = product.product_id
			WHERE customer_notified=0 
            and store_id = " . (int)$store_id . "
			ORDER BY `date_created` DESC");
		
		return $query->rows; 
	}
	
	public function viewcustomers($page=1, $limit=8, $store_id=0) {	
		if ($page) {
			$start = ($page - 1) * $limit;
		}

		$query =  $this->db->query("SELECT DISTINCT super.*, product.name as product_name FROM `" . DB_PREFIX . "notifywhenavailable` super 
		LEFT JOIN `" . DB_PREFIX . "product_description` product on super.product_id = product.product_id
		WHERE customer_notified=0 
        AND store_id = " . (int)$store_id . "
		ORDER BY `date_created` DESC
		LIMIT ".$start.", ".$limit);

		return $query->rows; 
	}
	
	public function viewnotifiedcustomers($page=1, $limit=8, $store_id=0) {	
		if ($page) {
			$start = ($page - 1) * $limit;
		}

		$query =  $this->db->query("SELECT DISTINCT super.*, product.name as product_name FROM `" . DB_PREFIX . "notifywhenavailable` super 
		JOIN `" . DB_PREFIX . "product_description` product on super.product_id = product.product_id
		WHERE customer_notified=1
		AND store_id = " . (int)$store_id . "
		ORDER BY `date_created` DESC
		LIMIT ".$start.", ".$limit);

		return $query->rows; 
	}
	
	public function getTotalCustomers($store_id=0){
			$query = $this->db->query("SELECT COUNT(*) as `count`  FROM `" . DB_PREFIX . "notifywhenavailable` WHERE customer_notified=0 AND store_id=".$store_id);
		return $query->row['count']; 
	}
	
	public function getTotalNotifiedCustomers($store_id=0){
			$query = $this->db->query("SELECT COUNT(*) as `count`  FROM `" . DB_PREFIX . "notifywhenavailable` WHERE customer_notified=1 AND store_id=".$store_id);
		return $query->row['count']; 
	}
	
	public function sendEmailWhenAvailable($product_id, $store_id = 0) {	
		$product_info = $this->model_catalog_product->getProduct($product_id);

		$store_id = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_to_store` 
			WHERE product_id = ".$product_id." AND store_id='" . (int)$store_id . "'
			LIMIT 1");	

		if ($store_id->num_rows == 0) return;

		$store_id = $store_id->row['store_id'];
		
		$this->load->model('tool/image');
		if ($product_info['image']) { $image = $this->model_tool_image->resize($product_info['image'], 200, 200); } else { $image = false; }
			
		$customers = $this->db->query("SELECT * FROM `" . DB_PREFIX . "notifywhenavailable` 
			WHERE product_id = ".$product_id." AND customer_notified=0 and store_id = ".$store_id."
			ORDER BY `date_created` DESC");					

		$this->load->model('setting/setting');

		$NotifyWhenAvailable = $this->model_setting_setting->getSetting('notifywhenavailable', $store_id);
								
		$NotifyWhenAvailable = $NotifyWhenAvailable['notifywhenavailable'];

		if (empty($NotifyWhenAvailable['Enabled']) || $NotifyWhenAvailable['Enabled'] == 'no') return;
				
		foreach($customers->rows as $cust) {
			if(!isset($NotifyWhenAvailable['EmailText'][$cust['language']])){
				$EmailText = '';
				$EmailSubject = '';
			} else {
				$EmailText = $NotifyWhenAvailable['EmailText'][$cust['language']];
				$EmailSubject = $NotifyWhenAvailable['EmailSubject'][$cust['language']];
			}

			$customer_store = $this->getCurrentStore($store_id);
		
			$string = html_entity_decode($EmailText);
			$patterns = array();
			$patterns[0] = '/{c_name}/';
			$patterns[1] = '/{p_name}/';
			$patterns[2] = '/{p_model}/';
			$patterns[3] = '/{p_image}/';
			$patterns[4] = '/http:\/\/{p_link}/';
			$replacements = array();
			$replacements[0] = $cust['customer_name'];
			$replacements[1] = "<a href='" . $customer_store['url'] . "index.php?route=product/product&product_id=".$product_id."' target='_blank'>".$product_info['name']."</a>";
			$replacements[2] = $product_info['model'];
			$replacements[3] = "<img src='".$image."' />";
			$replacements[4] =  $customer_store['url'] ."index.php?route=product/product&product_id=".$product_id;

			$text = preg_replace($patterns, $replacements, $string);

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			$mail->setTo($cust['customer_email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject(html_entity_decode($EmailSubject, ENT_QUOTES, 'UTF-8'));
			$mail->setHtml($text);
			$mail->send();

			$update_customers = $this->db->query("UPDATE `" . DB_PREFIX . "notifywhenavailable` 		
				SET customer_notified=1		
				WHERE product_id = '".$product_id."' AND customer_email='" . $this->db->escape($cust['customer_email']) . "' AND customer_notified=0 AND store_id='" . (int)$store_id . "'");
		}
	}

	public function getCatalogURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_CATALOG;
        } else {
            $storeURL = HTTP_CATALOG;
        } 
        return $storeURL;
    }

    public function getCurrentStore($store_id) { 
    	$this->load->model('setting/store');   
        if($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name'] = $this->config->get('config_name');
            $store['url'] = $this->getCatalogURL(); 
        }
        return $store;
    }
}
