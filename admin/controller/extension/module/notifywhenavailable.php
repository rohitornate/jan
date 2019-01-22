<?php

class ControllerExtensionModuleNotifyWhenAvailable extends Controller
{
    
    private $data = array();
    private $error = array();
    private $version;
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->config->load('isenselabs/notifywhenavailable');
        // Module VERSION
        $this->version = $this->config->get('notifywhenavailable_moduleVersion');
    }
    
    public function index()
    {
        $this->language->load('extension/module/notifywhenavailable');
        $this->load->model('extension/module/notifywhenavailable');
        $this->load->model('catalog/product');
        $this->load->model('setting/store');
        $this->load->model('setting/setting');
        $this->load->model('localisation/language');
        
        $this->document->setTitle($this->language->get('heading_title'));
        $this->document->addScript('view/javascript/notifywhenavailable/cron.js');
        
        /* OpenCart resources */
        
        $this->document->addScript('view/javascript/summernote/summernote.js');
        $this->document->addScript('view/javascript/summernote/opencart.js');
        $this->document->addStyle('view/javascript/summernote/summernote.css');
        
        /* OpenCart resources */
        
        $this->document->addStyle('view/stylesheet/notifywhenavailable.css');
        
        if (!isset($this->request->get['store_id'])) {
            $this->request->get['store_id'] = 0;
        }
        
        $catalogURL = $this->getCatalogURL();
        $store      = $this->getCurrentStore($this->request->get['store_id']);
        
        if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
            
            if (!empty($_POST['OaXRyb1BhY2sgLSBDb21'])) {
                $this->request->post['notifywhenavailable']['LicensedOn'] = $_POST['OaXRyb1BhY2sgLSBDb21'];
            }
            
            if (!empty($_POST['cHRpbWl6YXRpb24ef4fe'])) {
                $this->request->post['notifywhenavailable']['License'] = json_decode(base64_decode($_POST['cHRpbWl6YXRpb24ef4fe']), true);
            }
            
            $store = $this->getCurrentStore($this->request->post['store_id']);
            $this->model_setting_setting->editSetting('notifywhenavailable', $this->request->post, $this->request->post['store_id']);
            
            if ($this->request->post['notifywhenavailable']["ScheduleEnabled"] == 'yes') {
                $this->editCron($this->request->post, $store['store_id']);
            }
            
            $this->session->data['success'] = $this->language->get('text_success');
            
            $this->response->redirect($this->url->link('extension/module/notifywhenavailable', 'store_id=' . $this->request->post['store_id'] . '&token=' . $this->session->data['token'], 'SSL'));
        }
        
        $languages = $this->model_localisation_language->getLanguages();
        
        $this->data['languages'] = $languages;
        
        //2.2.0.0 language flag image fix
        
        foreach ($this->data['languages'] as $key => $value) {
            if (version_compare(VERSION, '2.2.0.0', "<")) {
                $this->data['languages'][$key]['flag_url'] = 'view/image/flags/' . $this->data['languages'][$key]['image'];
            } else {
                $this->data['languages'][$key]['flag_url'] = 'language/' . $this->data['languages'][$key]['code'] . '/' . $this->data['languages'][$key]['code'] . '.png"';
            }
        }
        
        $firstLanguage = array_shift($languages);
        
        $this->data['firstLanguageCode'] = $firstLanguage['code'];
        
        $this->data['heading_title'] = $this->language->get('heading_title') . ' ' . $this->version;
        
        $language_variables = array(
            'text_default',
            'button_cancel',
            'preorder_enabled',
            'text_add',
            'text_enabled',
            'text_disabled',
            'text_remove',
            'text_remove_all',
            'text_settings',
            'text_settings_help',
            'text_scheduled',
            'text_scheduled_help',
            'text_scheduled_help_sec',
            'text_receive_notifications',
            'text_receive_notifications_help',
            'text_type',
            'text_type_help',
            'text_settings_help',
            'text_schedule',
            'text_schedule_help',
            'text_fixed',
            'text_periodic',
            'text_test_cron',
            'text_test_cron_help',
            'text_test_cron_help_sec',
            'text_test_cron_help_third',
            'text_cron_disabled',
            'text_close',
            'text_schedule_cron',
            'text_alternative_cron',
            'text_alternative_cron_help',
            'text_alternative_cron_help_two',
            'text_stock_status',
            'text_stock_status_help',
            'text_admin_notifications',
            'text_admin_notifications_help',
            'text_popup_width',
            'text_popup_width_help',
            'text_design',
            'text_design_help',
            'text_button_label',
            'text_button_label_help',
            'text_popup_title',
            'text_popup_title_help',
            'text_notification_customer',
            'text_notification_customer_help',
            'text_notification_mail',
            'text_notification_mail_help',
            'text_notification_subject',
            'text_email_text',
            'text_email_text_help',
            'text_email_text_help_sec',
            'text_email_subject',
            'text_custom_css',
            'text_custom_css_help',
            'text_most_wanted_ofs',
            'text_most_wanted_all_time',
            'text_count',
            'text_product'
        );
        
        foreach ($language_variables as $language_variable) {
            $this->data[$language_variable] = $this->language->get($language_variable);
        }
        
        $this->load->model('localisation/stock_status');
        
        $this->data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();
        
        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }
        
        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }
        
        $this->data['breadcrumbs'] = array();
        
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/notifywhenavailable', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $this->data['action'] = $this->url->link('extension/module/notifywhenavailable', 'token=' . $this->session->data['token'], 'SSL');
        
        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        
        if (isset($this->request->post['notifywhenavailable'])) {
            foreach ($this->request->post['notifywhenavailable'] as $key => $value) {
                $this->data['nwa_data']['notifywhenavailable'][$key] = $this->request->post['notifywhenavailable'][$key];
            }
        } else {
            $configValue                               = $this->config->get('notifywhenavailable');
            $this->data['nwa_data']['notifywhenavailable'] = $configValue;
        }
        
        $run_query = $this->db->query("SELECT `product_id`,`customer_notified`, COUNT(`customer_notified`) as cust_count FROM `" . DB_PREFIX . "notifywhenavailable` 
            WHERE store_id = " . $store['store_id'] . "
            GROUP BY `product_id`,`customer_notified`");
        
        $this->data['products'] = array();
        
        if (isset($run_query->rows)) {
            foreach ($run_query->rows as $row) {
                $this->data['products'][$row['product_id']][$row['customer_notified']] = $row['cust_count'];
            }
        }

        $this->data['most_wanted_products_ofs'] = array();

        $most_wanted_ofs_query = $this->db->query("SELECT product_id, customer_notified, COUNT(`customer_notified`) as cust_count 
            FROM `" . DB_PREFIX . "notifywhenavailable`
            WHERE store_id = " . $store['store_id'] . "
            AND customer_notified = 0
            GROUP BY product_id, customer_notified
            ORDER BY cust_count DESC
            LIMIT 20");

        if(!empty($most_wanted_ofs_query)) {
            foreach($most_wanted_ofs_query->rows as $key => $value) {
                $product_info = $this->model_catalog_product->getProduct($value['product_id']);
                $most_wanted_ofs_query->rows[$key]['name'] = $product_info['name'];
            }
            $this->data['most_wanted_products_ofs'] = $most_wanted_ofs_query->rows;
        }

        $this->data['most_wanted_products_all_time'] = array();

        $most_wanted_all_time_query = $this->db->query("SELECT product_id, customer_notified, COUNT(`customer_notified`) as cust_count 
            FROM `" . DB_PREFIX . "notifywhenavailable`
            WHERE store_id = " . $store['store_id'] . "
            GROUP BY product_id
            ORDER BY cust_count DESC
            LIMIT 20");

        if(!empty($most_wanted_all_time_query)) {
            foreach($most_wanted_all_time_query->rows as $key => $value) {
                $product_info = $this->model_catalog_product->getProduct($value['product_id']);
                $most_wanted_all_time_query->rows[$key]['name'] = $product_info['name'];
            }
            $this->data['most_wanted_products_all_time'] = $most_wanted_all_time_query->rows;
        }
        
        $this->data['stores']       = array_merge(array(
            0 => array(
                'store_id' => '0',
                'name' => $this->config->get('config_name') . ' (' . $this->data['text_default'] . ')',
                'url' => HTTP_SERVER,
                'ssl' => HTTPS_SERVER
            )
        ), $this->model_setting_store->getStores());
        $this->data['store']        = $store;
        $this->data['nwa_data']         = $this->model_setting_setting->getSetting('notifywhenavailable', $store['store_id']);
        $this->data['modules']      = $this->model_setting_setting->getSetting('notifywhenavailable_module', $store['store_id']);
        $this->data['product_info'] = $this->model_catalog_product;
        $this->data['token']        = $this->session->data['token'];
        $this->data['header']       = $this->load->controller('common/header');
        $this->data['column_left']  = $this->load->controller('common/column_left');
        $this->data['footer']       = $this->load->controller('common/footer');

        //Check if PreOrder is installed and enabled  

        
        $this->data['preorder'] = $this->model_setting_setting->getSetting('preorder', $store['store_id']);
        
        $this->response->setOutput($this->load->view('extension/module/notifywhenavailable.tpl', $this->data));
    }
    
    private function editCron($data = array(), $store_id)
    {
        $cronCommands   = array();
        $cronFolder     = dirname(DIR_APPLICATION) . '/vendors/notifywhenavailable/';
        $dateForSorting = array();
        
        if (isset($data['notifywhenavailable']["ScheduleType"]) && $data['notifywhenavailable']["ScheduleType"] == 'F') {
            if (isset($data['notifywhenavailable']["FixedDates"])) {
                
                foreach ($data['notifywhenavailable']["FixedDates"] as $date) {
                    $buffer           = explode('/', $date);
                    $bufferDate       = explode('.', $buffer[0]);
                    $bufferTime       = explode(':', $buffer[1]);
                    $cronCommands[]   = (int) $bufferTime[1] . ' ' . (int) $bufferTime[0] . ' ' . (int) $bufferDate[0] . ' ' . (int) $bufferDate[1] . ' * php ' . $cronFolder . 'sendMails.php ' . $store_id;
                    $dateForSorting[] = $bufferDate[2] . '.' . $bufferDate[1] . '.' . $bufferDate[0] . '.' . $buffer[1];
                }
                
                asort($dateForSorting);
                
                $sortedDates = array();
                
                foreach ($dateForSorting as $date) {
                    $newDate       = explode('.', $date);
                    $sortedDates[] = $newDate[2] . '.' . $newDate[1] . '.' . $newDate[0] . '/' . $newDate[3];
                }
                
                $data = $sortedDates;
                
            }
            
        }
        
        if (isset($data['notifywhenavailable']["ScheduleType"]) && $data['notifywhenavailable']["ScheduleType"] == 'P') {
            $cronCommands[] = $data['notifywhenavailable']['PeriodicCronValue'] . ' php ' . $cronFolder . 'sendMails.php ' . $store_id;
            
        }
        
        if (isset($cronCommands) && $this->isEnabled('shell_exec')) {
            $cronCommands      = implode(PHP_EOL, $cronCommands);
            $currentCronBackup = shell_exec('crontab -l');
            $currentCronBackup = explode(PHP_EOL, $currentCronBackup);
            
            foreach ($currentCronBackup as $key => $command) {
                if (strpos($command, 'php ' . $cronFolder . 'sendMails.php ' . $store_id) || empty($command)) {
                    unset($currentCronBackup[$key]);
                }
            }
            
            $currentCronBackup = implode(PHP_EOL, $currentCronBackup);
            file_put_contents($cronFolder . 'cron.txt', $currentCronBackup . PHP_EOL . $cronCommands . PHP_EOL);
            exec('crontab -r');
            exec('crontab ' . $cronFolder . 'cron.txt');
        }
        
    }
    
    public function install()
    {
        $this->load->model('extension/module/notifywhenavailable');
        $this->model_extension_module_notifywhenavailable->install();
    }
    
    public function uninstall()
    {
        $this->load->model('setting/setting');
        $this->load->model('setting/store');
        $this->model_setting_setting->deleteSetting('notifywhenavailable_module', 0);
        
        $stores = $this->model_setting_store->getStores();
        
        foreach ($stores as $store) {
            $this->model_setting_setting->deleteSetting('notifywhenavailables', $store['store_id']);
        }
        
        $this->load->model('extension/module/notifywhenavailable');
        $this->model_extension_module_notifywhenavailable->uninstall();
    }
    
    private function getCatalogURL()
    {
        
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_CATALOG;
        } else {
            $storeURL = HTTP_CATALOG;
        }
        
        return $storeURL;
        
    }
    
    private function getServerURL()
    {
        
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_SERVER;
        } else {
            $storeURL = HTTP_SERVER;
        }
        
        return $storeURL;
        
    }
    
    
    
    private function getCurrentStore($store_id)
    {
        
        if ($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name']     = $this->config->get('config_name');
            $store['url']      = $this->getCatalogURL();
        }
        
        return $store;
        
    }
    
    public function getcustomers()
    {
        
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
            $page = 1;
        }
        
        if (!empty($this->request->get['store_id'])) {
            $store_id = (int) $this->request->get['store_id'];
        } else {
            $store_id = 0;
        }
        
        $this->load->model('extension/module/notifywhenavailable');
        $this->language->load('extension/module/notifywhenavailable');
        
        $this->data['store_id'] = $store_id;
        $this->data['token']    = $this->session->data['token'];
        $this->data['limit']    = 8;
        $this->data['total']    = $this->model_extension_module_notifywhenavailable->getTotalCustomers($this->data['store_id']);
        
        $this->data['text_customer_email'] = $this->language->get('text_customer_email');
        $this->data['text_customer_name']  = $this->language->get('text_customer_name');
        $this->data['text_product']        = $this->language->get('text_product');
        $this->data['text_date']           = $this->language->get('text_date');
        $this->data['text_language']       = $this->language->get('text_language');
        $this->data['text_actions']        = $this->language->get('text_actions');
        $this->data['text_remove']         = $this->language->get('text_remove');
        $this->data['text_remove_all']     = $this->language->get('text_remove_all');
        $this->data['text_export_csv']     = $this->language->get('text_export_csv');
        
        $pagination        = new Pagination();
        $pagination->total = $this->data['total'];
        $pagination->page  = $page;
        $pagination->limit = $this->data['limit'];
        $pagination->url   = $this->url->link('extension/module/notifywhenavailable/getcustomers', 'token=' . $this->session->data['token'] . '&page={page}&store_id=' . $this->data['store_id'], 'SSL');
        
        $this->data['pagination'] = $pagination->render();
        $this->data['sources']    = $this->model_extension_module_notifywhenavailable->viewcustomers($page, $this->data['limit'], $this->data['store_id']);
        
        $this->data['results'] = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
        
        $this->template = 'extension/module/notifywhenavailable/viewcustomers.tpl';
        
        $this->response->setOutput($this->load->view($this->template, $this->data));
    }
    
    public function getarchive()
    {
        
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
            $page = 1;
        }
        
        if (!empty($this->request->get['store_id'])) {
            $store_id = (int) $this->request->get['store_id'];
        } else {
            $store_id = 0;
        }
        
        $this->language->load('extension/module/notifywhenavailable');
        $this->load->model('extension/module/notifywhenavailable');
        
        $this->data['store_id'] = $store_id;
        $this->data['token']    = $this->session->data['token'];
        $this->data['limit']    = 8;
        $this->data['total']    = $this->model_extension_module_notifywhenavailable->getTotalNotifiedCustomers($this->data['store_id']);
        
        $this->data['text_customer_email'] = $this->language->get('text_customer_email');
        $this->data['text_customer_name']  = $this->language->get('text_customer_name');
        $this->data['text_product']        = $this->language->get('text_product');
        $this->data['text_date']           = $this->language->get('text_date');
        $this->data['text_language']       = $this->language->get('text_language');
        $this->data['text_actions']        = $this->language->get('text_actions');
        $this->data['text_remove']         = $this->language->get('text_remove');
        $this->data['text_remove_all']     = $this->language->get('text_remove_all');
        
        $pagination        = new Pagination();
        $pagination->total = $this->data['total'];
        $pagination->page  = $page;
        $pagination->limit = $this->data['limit'];
        $pagination->url   = $this->url->link('extension/module/notifywhenavailable/getarchive', 'token=' . $this->session->data['token'] . '&page={page}&store_id=' . $this->data['store_id'], 'SSL');
        
        $this->data['pagination'] = $pagination->render();
        $this->data['sources']    = $this->model_extension_module_notifywhenavailable->viewnotifiedcustomers($page, $this->data['limit'], $this->data['store_id']);
        
        $this->data['results'] = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
        
        $this->template = 'extension/module/notifywhenavailable/archive.tpl';
        
        $this->response->setOutput($this->load->view($this->template, $this->data));
    }
    
    public function removecustomer()
    {
        
        if (isset($_POST['notifywhenavailable_id'])) {
            $run_query = $this->db->query("DELETE FROM `" . DB_PREFIX . "notifywhenavailable` WHERE `notifywhenavailable_id`=" . (int) $_POST['notifywhenavailable_id']);
            
            if ($run_query)
                echo "Success!";
        }
        
    }
    
    public function exporttocsv()
    {
        $option   = '';
        $filename = fopen('php://memory', 'w');
        
        fputcsv($filename, array(
            'Customer Email',
            'Customer Name',
            'Product',
            'Option',
            'Date',
            'Language'
        ), ';');
        
        $query = $this->db->query("SELECT DISTINCT n.customer_email, n.customer_name, pd.name, n.selected_options, n.date_created, n.language FROM `" . DB_PREFIX . "notifywhenavailable` AS n LEFT JOIN `" . DB_PREFIX . "product_description` AS pd ON (n.product_id=pd.product_id) ORDER BY n.`date_created` DESC");
        
        foreach ($query->rows as $row) {
            if ($row['selected_options'] != NULL) {
                $options = unserialize($row['selected_options']);
                foreach ($options as $item) {
                    $option = $item['name'];
                }
            } else {
                $option = '';
            }
            
            fputcsv($filename, array(
                $row['customer_email'],
                $row['customer_name'],
                $row['name'],
                $option,
                $row['date_created'],
                $row['language']
            ), ';');
        }
        
        fseek($filename, 0);
        header('Content-Type: application/csv');
        header('Content-Disposition: attachement; filename="NotifyWhenAvailable_WaitingList_Export.csv"');
        fpassthru($filename);
        fclose($filename);
    }
    
    public function removeallcustomers()
    {
        
        if (isset($_POST['remove']) && ($_POST['remove'] == true)) {
            $run_query = $this->db->query("DELETE FROM `" . DB_PREFIX . "notifywhenavailable` WHERE `customer_notified`='0'");
            if ($run_query)
                echo "Success!";
        }
        
    }
    
    public function removeallarchive()
    {
        
        if (isset($_POST['remove']) && ($_POST['remove'] == true)) {
            $run_query = $this->db->query("DELETE FROM `" . DB_PREFIX . "notifywhenavailable` WHERE `customer_notified`='1'");
            if ($run_query)
                echo "Success!";
        }
        
    }
    
    protected function validateForm()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/notifywhenavailable')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        
        return !$this->error;
    }
    
    public function testcron()
    {
        
        $data['cronjob_status'] = 'Disabled';
        $cronFolder             = dirname(DIR_APPLICATION) . '/vendors/notifywhenavailable/';
        
        if ($this->isEnabled('shell_exec')) {
            $data['shell_exec_status'] = 'Enabled';
        } else {
            $data['shell_exec_status'] = 'Disabled';
        }
        
        if ($data['shell_exec_status'] == 'Enabled') {
            if (shell_exec('crontab -l')) {
                $data['cronjob_status']    = 'Enabled';
                $curentCronjobs            = shell_exec('crontab -l');
                $data['current_cron_jobs'] = explode(PHP_EOL, $curentCronjobs);
                file_put_contents($cronFolder . 'cron.txt', '* * * * * echo "test" ' . PHP_EOL);
            } else {
                file_put_contents($cronFolder . 'cron.txt', '* * * * * echo "test" ' . PHP_EOL);
                
                if (file_exists($cronFolder . 'cron.txt')) {
                    exec('crontab ' . $cronFolder . 'cron.txt');
                    
                    if (shell_exec('crontab -l')) {
                        $data['cronjob_status'] = 'Enabled';
                        shell_exec('crontab -r');
                    } else {
                        $data['cronjob_status'] = 'Disabled';
                    }
                }
            }
        }
        
        if (file_exists($cronFolder . 'cron.txt')) {
            $data['folder_permission'] = "Writable";
            unlink($cronFolder . 'cron.txt');
        } else {
            if ($data['shell_exec_status'] == 'Disabled') {
                $data['folder_permission'] = "File does not exist and the shell_exec function is disabled.";
            } else {
                $data['folder_permission'] = "Unwritable";
            }
        }
        
        $data['cron_folder'] = $cronFolder;
        $data['token']       = $this->session->data['token'];
        
        $this->response->setOutput($this->load->view('extension/module/notifywhenavailable/test_cron.tpl', $data));
    }
    
    private function isEnabled($func)
    {
        return is_callable($func) && false === stripos(ini_get('disable_functions'), $func);
    }
    
}
