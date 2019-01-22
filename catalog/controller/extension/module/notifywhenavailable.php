<?php
class ControllerExtensionModuleNotifyWhenAvailable extends Controller
{
    private $data = array();
    
    public function index($setting)
    {
        if (version_compare(VERSION, '2.2.0.0', '<')) {
            $curent_template = $this->config->get('config_template');
        } else {
            $curent_template = $this->config->get($this->config->get('config_theme') . '_directory');
        }
        
        $this->language->load('extension/module/notifywhenavailable');
        
        if (file_exists('catalog/view/theme/' . $curent_template . '/stylesheet/notifywhenavailable.css')) {
            $this->document->addStyle('catalog/view/theme/' . $curent_template . '/stylesheet/notifywhenavailable.css');
        } else {
            $this->document->addStyle('catalog/view/theme/default/stylesheet/notifywhenavailable.css');
        }
        
        $this->document->addScript('catalog/view/javascript/notifywhenavailable/notifywhenavailable.js');
        
        if (strcmp($curent_template, 'journal2') === 0) {
            if (file_exists('catalog/view/theme/' . $curent_template . '/stylesheet/notifywhenavailable_journal.css')) {
                $this->document->addStyle('catalog/view/theme/' . $curent_template . '/stylesheet/notifywhenavailable_journal.css');
            } else {
                $this->document->addStyle('catalog/view/theme/default/stylesheet/notifywhenavailable_journal.css');
            }
        }
        
        $this->data['NotifyWhenAvailable_Button'] = $this->language->get('NotifyWhenAvailable_Button');
        
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['nwa_data']['notifywhenavailable'] = str_replace('http', 'https', $this->config->get('notifywhenavailable'));
        } else {
            $this->data['nwa_data']['notifywhenavailable'] = $this->config->get('notifywhenavailable');
        }
        
        if (!isset($this->data['nwa_data']['notifywhenavailable']['CustomTitle'][$this->config->get('config_language')])) {
            $this->data['nwa_data']['notifywhenavailable']['CustomTitle'] = '';
        } else {
            $this->data['nwa_data']['notifywhenavailable']['CustomTitle'] = $this->data['nwa_data']['notifywhenavailable']['CustomTitle'][$this->config->get('config_language')];
        }
        
        if (!isset($this->data['nwa_data']['notifywhenavailable']['ButtonLabel'][$this->config->get('config_language')])) {
            $this->data['nwa_data']['notifywhenavailable']['ButtonLabel'] = $this->language->get('NotifyWhenAvailable_Button');
        } else {
            $this->data['nwa_data']['notifywhenavailable']['ButtonLabel'] = $this->data['nwa_data']['notifywhenavailable']['ButtonLabel'][$this->config->get('config_language')];
        }

        $this->data['button_cart'] = $this->language->get('button_cart');

        return $this->load->view('extension/module/notifywhenavailable.tpl', $this->data);
        
    }
    
    public function submitform()
    {
	//print_r($_POST);	
		
		
        $send_email       = false;
        $selected_options = NULL;
      //  print_r($this->session->data['nwa']);exit;
        if (isset($this->session->data['nwa'][$this->request->post['NWAProductID']]['selected_options'])) {
		//	echo "ddd";

		   $selected_options = serialize($this->session->data['nwa'][$this->request->post['NWAProductID']]['selected_options']);
            unset($this->session->data['nwa'][$this->request->post['NWAProductID']]['selected_options']);
        }
       // exit;
        if(!empty($this->session->data['language'])) {
            $language = $this->session->data['language'];
        } else {
            $language = $this->config->get('config_language');
        }

        if (isset($this->request->post['NWAYourName']) && isset($this->request->post['NWAYourEmail'])) {
            $run_query = $this->db->query("INSERT INTO `" . DB_PREFIX . "notifywhenavailable` 
					(customer_email, customer_name, product_id , date_created, store_id, language)
					VALUES ('" . $this->db->escape($this->request->post['NWAYourEmail']) . "', '" . $this->db->escape($this->request->post['NWAYourName']) . "', '" . $this->db->escape($this->request->post['NWAProductID']) . "' ,NOW(), '" . $this->config->get('config_store_id') . "' ,'" . $language . "')
			");
            
            if ($run_query) {
                echo "Success!";
                $send_email = true;
            }
        } else {
            echo "Error! There is no data!";
        }
        
        if ($send_email == true) {
            
            if (isset($this->request->post['NWAProductID'])) {
                $this->load->model('catalog/product');
                $product = $this->model_catalog_product->getProduct($this->request->post['NWAProductID']);
            }
            
            $this->data['nwa_data']['notifywhenavailable'] = $this->config->get('notifywhenavailable');
            
            /*
            Send confirmation to customer
            */
            if ($this->data['nwa_data']['notifywhenavailable']['CustomerNotification'] == 'yes') {
                
                if (isset($this->request->post['store_id'])) {
                    $store_id = $this->request->post['store_id'];
                } else if (isset($this->request->get['store_id'])) {
                    $store_id = $this->request->get['store_id'];
                } else {
                    $store_id = 0;
                }
                $store_data = $this->getStore($store_id);
                if (!isset($this->data['nwa_data']['notifywhenavailable']['NotificationEmailText'])) {
                    $EmailText    = '';
                    $EmailSubject = '';
                } else {
                    $EmailText    = $this->data['nwa_data']['notifywhenavailable']['NotificationEmailText'][$this->config->get('config_language_id')];
                    $EmailSubject = $this->data['nwa_data']['notifywhenavailable']['NotificationEmailSubject'][$this->config->get('config_language_id')];
                }
                
                $customerEmail = $this->request->post['NWAYourEmail'];
                
                $string          = html_entity_decode($EmailText);
                $patterns        = array();
                $patterns[0]     = '/{name}/';
                $patterns[1]     = '/{product_name}/';
                $patterns[2]     = '/{product_model}/';
                $replacements    = array();
                $replacements[0] = $this->request->post['NWAYourName'];
                $replacements[1] = $product['name'];
                $replacements[2] = $product['model'];
                
                $text = preg_replace($patterns, $replacements, $string);
                
                $mailToUser                = new Mail();
                $mailToUser->protocol      = $this->config->get('config_mail_protocol');
                $mailToUser->parameter     = $this->config->get('config_mail_parameter');
                $mailToUser->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
                $mailToUser->smtp_username = $this->config->get('config_mail_smtp_username');
                $mailToUser->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
                $mailToUser->smtp_port     = $this->config->get('config_mail_smtp_port');
                $mailToUser->smtp_timeout  = $this->config->get('config_mail_smtp_timeout');
               
                $mailToUser->setTo($customerEmail);
                $mailToUser->setFrom($this->config->get('config_email'));
                $mailToUser->setSender($store_data['name']);
                $mailToUser->setSubject($EmailSubject);
                $mailToUser->setHtml($text);
                $mailToUser->send();
            }
            
            /*
            Send notification to admin
            */
            if ($this->data['nwa_data']['notifywhenavailable']['Notifications'] == 'yes') {        
                $text = "Someone wants to be notified about a product that currently is out of stock!<br /><br />
                User Name: " . $this->request->post['NWAYourName'] . "<br />
                User Email: " . $this->request->post['NWAYourEmail'] . "<br />";
                $text .= "Selected Product: " . $product['name'] . "<br /><br />";
                $text .= "You can find more information in your <a href='" . HTTP_SERVER . "admin/index.php?route=module/notifywhenavailable'>admin panel</a>!";

                $mail = new Mail();
                $mail->protocol = $this->config->get('config_mail_protocol');
                $mail->parameter = $this->config->get('config_mail_parameter');
                $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
                $mail->smtp_username = $this->config->get('config_mail_smtp_username');
                $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
                $mail->smtp_port = $this->config->get('config_mail_smtp_port');
                $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

                $mail->setTo($this->config->get('config_email'));
                $mail->setFrom($this->config->get('config_email'));
                $mail->setSender($this->config->get('config_name'));
                $mail->setSubject(html_entity_decode("Someone used the option NotifyWhenAvailable", ENT_QUOTES, 'UTF-8'));
                $mail->setHtml($text);
                $mail->send();
            }
        }
    }
    
    public function shownotifywhenavailableform()
    {
        $this->language->load('extension/module/notifywhenavailable');
        $this->data['heading_title']                    = $this->language->get('heading_title');
        $this->data['NotifyWhenAvailable_Title']        = $this->language->get('NotifyWhenAvailable_Title');
        $this->data['NotifyWhenAvailable_SubmitButton'] = $this->language->get('NotifyWhenAvailable_SubmitButton');
        $this->data['NotifyWhenAvailable_Error1']       = $this->language->get('NotifyWhenAvailable_Error1');
        $this->data['NotifyWhenAvailable_Error2']       = $this->language->get('NotifyWhenAvailable_Error2');
        $this->data['NotifyWhenAvailable_Success']      = $this->language->get('NotifyWhenAvailable_Success');
        $this->data['NWA_YourName']                     = $this->language->get('NWA_YourName');
        $this->data['NWA_YourEmail']                    = $this->language->get('NWA_YourEmail');
        
        if (version_compare(VERSION, '2.2.0.0', '<')) {
            $curent_template = $this->config->get('config_template');
        } else {
            $curent_template = preg_replace('/^theme_/', "", $this->config->get('config_theme'));
        }
        
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['nwa_data']['notifywhenavailable'] = str_replace('http', 'https', $this->config->get('notifywhenavailable'));
        } else {
            $this->data['nwa_data']['notifywhenavailable'] = $this->config->get('notifywhenavailable');
        }
        
        if (!isset($this->data['nwa_data']['notifywhenavailable']['CustomText'][$this->config->get('config_language')])) {
            $this->data['nwa_data']['notifywhenavailable']['CustomText'] = '';
        } else {
            $this->data['nwa_data']['notifywhenavailable']['CustomText'] = $this->data['nwa_data']['notifywhenavailable']['CustomText'][$this->config->get('config_language')];
        }
        
        if ((isset($this->request->get['route'])) && ($this->request->get['route'] == "product/product")) {
            $this->data['NotifyWhenAvailableCurrentURL'] = $this->url->link("product/product", "product_id=" . $this->request->get['product_id'], "");
        } else {
            if (strpos(HTTP_SERVER, 'www.') && strpos(HTTPS_SERVER, 'www.')) {
                $siteName = $_SERVER["SERVER_NAME"];
            } else {
                $siteName = str_replace("www.", "", $_SERVER['SERVER_NAME']);
            }
            $this->data['NotifyWhenAvailableCurrentURL'] = "http://" . $siteName . $_SERVER["REQUEST_URI"];
        }
        
        if (isset($this->request->get['product_id'])) {
            $product_id = (int) $this->request->get['product_id'];
        } else {
            $product_id = 0;
        }
        
        $checker = $this->customer->getId();
        if (!empty($checker)) {
            $this->data['customer_email'] = $this->customer->getEmail();
            $this->data['customer_name']  = $this->customer->getFirstName() . ' ' . $this->customer->getLastName();
        } else {
            $this->data['customer_email'] = '';
            $this->data['customer_name']  = '';
        }
        
        $this->data['NotifyWhenAvailableProductID'] = $product_id;
        
        
        return $this->load->view('extension/module/notifywhenavailable_form.tpl', $this->data);
    }
    
    public function sendMails()
    {
        $this->load->model('setting/setting');
        $this->load->model('catalog/product');
        
        if (isset($this->request->post['store_id'])) {
            $store_id = $this->request->post['store_id'];
        } else if (isset($this->request->get['store_id'])) {
            $store_id = $this->request->get['store_id'];
        } else {
            $store_id = 0;
        }
        
        $store_data = $this->getStore($store_id);
        
        $settings = $this->model_setting_setting->getSetting('notifywhenavailable', $store_id);
        $settings = (isset($settings['notifywhenavailable'])) ? $settings['notifywhenavailable'] : array();
        
        if (isset($settings['Enabled']) && $settings['Enabled'] == 'yes' && isset($settings['ScheduleEnabled']) && $settings['ScheduleEnabled'] = 'yes') {
            $query = $this->db->query("SELECT super.*, product.name as product_name FROM `" . DB_PREFIX . "notifywhenavailable` super 
				JOIN `" . DB_PREFIX . "product_description` product on super.product_id = product.product_id
				WHERE customer_notified=0 and language_id = " . (int) $this->config->get('config_language_id') . " and store_id = " . (int) $store_id . "
				ORDER BY `date_created` DESC");
            
            $counter = 0;
            $report  = array();
            foreach ($query->rows as $row) {
                $send                    = false;
                $row['selected_options'] = unserialize($row['selected_options']);
                
                $product = $this->model_catalog_product->getProduct($row['product_id']);
                if (sizeof($row['selected_options']) == 0) {
                    if ($product['quantity'] > 0) {
                        $send = true;
                    }
                } else {
                    $product_options = $this->model_catalog_product->getProductOptions($row['product_id']);
                    $matchCount      = 0;
                    $userCount       = count($row['selected_options']);
                    foreach ($row['selected_options'] as $row_options) {
                        foreach ($product_options as $product_option) {
                            foreach ($product_option['product_option_value'] as $options) {
                                if ((($row_options['option_value_id'] == $options['option_value_id']) && ($row_options['product_option_value_id'] == $options['product_option_value_id']) && (($options['quantity'] > 0)))) {
                                    $send = true;
                                }
                            }
                        }
                    }
                }
                
                if ($send) {
                    $this->sendEmailWhenAvailable($row, $store_data);
                    $counter++;
                    $report[] = $row['customer_name'] . ' (' . $row['customer_email'] . ') - ' . $row['product_name'];
                }
            }
            
            $result = "Cron was executed successfully! A total of <strong>" . $counter . "</strong> emails were sent to the customers.<br />";
            
            if ($counter > 0 && sizeof($report) > 0) {
                $result .= "<br />Here is a list with the notified customers:<br /><ul>";
                foreach ($report as $rep) {
                    $result .= "<li>" . $rep . "</li>";
                }
                $result .= "</ul>";
            }
            
            if (isset($settings['CronNotify']) && $settings['CronNotify'] == 'yes') {
                
                if (VERSION < '2.0.2.0' || (VERSION > '2.0.3.0' && VERSION < '2.1.0.1')) {
                    $mailToUser = new Mail($this->config->get('config_mail'));
                } else {
                    $mailToUser                = new Mail();
                    $mailToUser->protocol      = $this->config->get('config_mail_protocol');
                    $mailToUser->parameter     = $this->config->get('config_mail_parameter');
                    $mailToUser->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
                    $mailToUser->smtp_username = $this->config->get('config_mail_smtp_username');
                    $mailToUser->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
                    $mailToUser->smtp_port     = $this->config->get('config_mail_smtp_port');
                    $mailToUser->smtp_timeout  = $this->config->get('config_mail_smtp_timeout');
                } 
                $mailToUser->setTo($this->config->get('config_email'));
                $mailToUser->setFrom($this->config->get('config_email'));
                $mailToUser->setSender($store_data['name']);
                $mailToUser->setSubject(html_entity_decode('NotifyWhenAvailable Sheduled Task', ENT_QUOTES, 'UTF-8'));
                $mailToUser->setHtml($result);
                $mailToUser->setText(html_entity_decode($result, ENT_QUOTES, 'UTF-8'));
                $mailToUser->send();
            } else {
                echo $result;
            }
        }
    }
    
    public function sendEmailWhenAvailable($row, $store_data)
    {
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        $this->load->model('setting/setting');
        
        $product_id   = $row['product_id'];
        $product_info = $this->model_catalog_product->getProduct($product_id);
        if ($product_info['image']) {
            $image = $this->model_tool_image->resize($product_info['image'], 200, 200);
        } else {
            $image = false;
        }
        
        $NotifyWhenAvailable = $this->model_setting_setting->getSetting('notifywhenavailable', $row['store_id']);
        $NotifyWhenAvailable = (isset($NotifyWhenAvailable['notifywhenavailable'])) ? $NotifyWhenAvailable['notifywhenavailable'] : array();
        
        if (!isset($NotifyWhenAvailable['EmailText'][$row['language']])) {
            $EmailText    = '';
            $EmailSubject = '';
        } else {
            $EmailText    = $NotifyWhenAvailable['EmailText'][$row['language']];
            $EmailSubject = $NotifyWhenAvailable['EmailSubject'][$row['language']];
        }
        
        $string          = html_entity_decode($EmailText);
        $patterns        = array();
        $patterns[0]     = '/{c_name}/';
        $patterns[1]     = '/{p_name}/';
        $patterns[2]     = '/{p_model}/';
        $patterns[3]     = '/{p_image}/';
        $patterns[4]     = '/http:\/\/{p_link}/';
        $replacements    = array();
        $replacements[0] = $row['customer_name'];
        $replacements[1] = "<a href='" . $store_data['url'] . "index.php?route=product/product&product_id=" . $product_id . "' target='_blank'>" . $product_info['name'] . "</a>";
        $replacements[2] = $product_info['model'];
        $replacements[3] = "<img src='" . $image . "' />";
        $replacements[4] = $store_data['url'] . "index.php?route=product/product&product_id=" . $product_id;
        
        $text = preg_replace($patterns, $replacements, $string);
        
        
       
        $mailToUser                = new Mail();
        $mailToUser->protocol      = $this->config->get('config_mail_protocol');
        $mailToUser->parameter     = $this->config->get('config_mail_parameter');
        $mailToUser->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mailToUser->smtp_username = $this->config->get('config_mail_smtp_username');
        $mailToUser->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mailToUser->smtp_port     = $this->config->get('config_mail_smtp_port');
        $mailToUser->smtp_timeout  = $this->config->get('config_mail_smtp_timeout');
    
        $mailToUser->setTo($row['customer_email']);
        $mailToUser->setFrom($this->config->get('config_email'));
        $mailToUser->setSender($store_data['name']);
        $mailToUser->setSubject(html_entity_decode($EmailSubject, ENT_QUOTES, 'UTF-8'));
        $mailToUser->setHtml($text);
        $mailToUser->send();
        
        
        $update_customers = $this->db->query("UPDATE `" . DB_PREFIX . "notifywhenavailable` SET customer_notified=1 WHERE product_id = " . $product_id . " and store_id = " . $row['store_id']);
    }
    
    public function checkQuantityNWA()
    {
        
        $json = array();
        
        if (isset($this->request->post['product_ids'])) {
            $product_ids = $this->request->post['product_ids'];
        } elseif (isset($this->request->post['product_id'])) {
        	$product_ids[] = $this->request->post['product_id'];
        } else {
            $product_ids = array();
        }
        
        $this->load->model('catalog/product');
        $this->load->language('extension/module/notifywhenavailable');
        $this->load->model('setting/setting');

        if (!empty($product_ids)) {
            foreach ($product_ids as $product_id) {
                $product_info = $this->model_catalog_product->getProduct($product_id);

                try {
                    $this->load->model('extension/module/preorder');
                    $preorder = $this->model_extension_module_preorder->checkPreOrder($product_id); 
                    if(!empty($preorder['preorder_product'])) {
                        $product_data['PO'] = $preorder['preorder_product'];
                    }                 
                   
                } catch(\Exception $e) {
                    // Exception handler
                }                

                if (isset($this->request->post['store_id'])) {
                    $store_id = $this->request->post['store_id'];
                } elseif (isset($this->request->get['store_id'])) {
                    $store_id = $this->request->get['store_id'];
                } else {
                    $store_id = 0;
                }
                
                $nwa_settings = $this->model_setting_setting->getSetting('notifywhenavailable', $store_id);
             
                if ($product_info['quantity'] <= 0  && isset($nwa_settings['notifywhenavailable']['stock_status'][$product_info['stock_status_id']]) && $nwa_settings['notifywhenavailable']['stock_status'][$product_info['stock_status_id']] == 'on') {
                    $product_data['product_id'] = $product_id;
                    $product_data['NWA_text'] = $nwa_settings['notifywhenavailable']['ButtonLabel'][$this->config->get('config_language')];
                }
                 
                if ($product_info) {
                    if (isset($this->request->post['quantity'])) {
                        $quantity = (int) $this->request->post['quantity'];
                    } else {
                        $quantity = 1;
                    }
                    
                    if (isset($this->request->post['option'])) {
                        $option = array_filter($this->request->post['option']);
                    } else {
                        $option = array();
                    }
                    
                    $product_options       = $this->model_catalog_product->getProductOptions($product_id);
                    $product_option_values = array();
                    
                    foreach ($product_options as $product_option) {
                        if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
                            $json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
                        }
                        
                        if (isset($option) && !empty($option) && (empty($json['error']) && !isset($json['error']))) {
                            switch ($product_option['type']) {
                                case 'radio':
                                    $temp_option_values      = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value as a JOIN " . DB_PREFIX . "option_value_description as b ON a.option_value_id = b.option_value_id WHERE product_option_value_id = '" . (int) $option[$product_option['product_option_id']] . "' AND product_option_id = '" . (int) $product_option["product_option_id"] . "'");
                                    $product_option_values[] = $temp_option_values->row;
                                    break;
                                
                                case 'checkbox':
                                    foreach ($option[$product_option['product_option_id']] as $checkbox_id) {
                                        $temp_option_values      = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value as a JOIN " . DB_PREFIX . "option_value_description as b ON a.option_value_id = b.option_value_id WHERE product_option_value_id = '" . (int) $checkbox_id . "' AND product_option_id = '" . (int) $product_option["product_option_id"] . "'");
                                        $product_option_values[] = $temp_option_values->row;
                                        
                                    }
                                    break;
                                case 'select':
                                    $temp_option_values      = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value as a JOIN " . DB_PREFIX . "option_value_description as b ON a.option_value_id = b.option_value_id WHERE product_option_value_id = '" . (int) $option[$product_option['product_option_id']] . "' AND product_option_id = '" . (int) $product_option["product_option_id"] . "'");
                                    $product_option_values[] = $temp_option_values->row;
                                    break;
                            }
                        }
                        
                    }
                     
                    if (empty($json['error']) && !isset($json['error'])) {
                        foreach ($product_option_values as $product_selected_options) {
                            if ($product_options && isset($product_selected_options['quantity']) && ($product_selected_options['quantity'] <= 0 && isset($nwa_settings['notifywhenavailable']['stock_status'][$product_info['stock_status_id']]) && $nwa_settings['notifywhenavailable']['stock_status'][$product_info['stock_status_id']] == 'on')) {
                                $product_data['product_id'] = $product_id;
                                $product_data['NWA_text'] = $nwa_settings['notifywhenavailable']['ButtonLabel'][$this->config->get('config_language')];
                            }
                        }
                        $this->session->data['nwa'][$product_id]['selected_options'] = $product_option_values;
                    }
                }

                if(!empty($product_data)) {
                    $json[] = $product_data;
                }
            }
        }
        
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    private function getStore($store_id)
    {
        $this->load->model('setting/store');
        if ($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name']     = $this->config->get('config_name');
            $store['url']      = $this->getCatalogURL();
        }
        return $store;
    }
    
    private function getCatalogURL()
    {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTP_SERVER;
        } else {
            $storeURL = HTTPS_SERVER;
        }
        return $storeURL;
    }
}
