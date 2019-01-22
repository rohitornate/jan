<?php
class ControllerExtensionModuleShipwayLoginPanel extends Controller
{
    private $error = array();
    
    public function index()
    {
        $this->language->load('extension/module/shipway_login_panel');
        
        $this->document->setTitle($this->language->get('site_title'));
        
        $this->load->model('setting/setting');
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('shipway_login', $this->request->post);
			$this->config->set('shipway_login',$this->request->post['shipway_login']);            
            $this->session->data['success'] = $this->language->get('text_success');
            $this->updateCarriers();
            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
        }
        
        $data['heading_title'] = $this->language->get('heading_title');
        
        $data['text_enabled']        = $this->language->get('text_enabled');
        $data['text_disabled']       = $this->language->get('text_disabled');
        $data['text_content_top']    = $this->language->get('text_content_top');
        $data['text_content_bottom'] = $this->language->get('text_content_bottom');
        $data['text_column_left']    = $this->language->get('text_column_left');
        $data['text_column_right']   = $this->language->get('text_column_right');
        
        $data['entry_layout']     = $this->language->get('entry_layout');
        $data['entry_position']   = $this->language->get('entry_position');
        $data['entry_status']     = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        
        $data['button_save']       = $this->language->get('button_save');
        $data['button_back']       = $this->language->get('button_back');
        $data['button_add_module'] = $this->language->get('button_add_module');
        $data['button_remove']     = $this->language->get('button_remove');
        
		$data['hasShipWayAccount']	= true;
		
		if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
		
		if(!$this->config->get('shipway_login')){
			$data['hasShipWayAccount']	= false;
		}
		//echo "<pre>";print_r($data);//die;
        $data['breadcrumbs'] = array();
        
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/shipway_login_panel', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $data['action'] = $this->url->link('extension/module/shipway_login_panel', 'token=' . $this->session->data['token'], 'SSL');
        
		$data['action_carrier_status'] = $this->url->link('extension/module/shipway_login_panel/update_carrier_status', 'token=' . $this->session->data['token'], 'SSL');
        
        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
        
        $data['modules'] = array();
        
        if (isset($this->request->post['shipway_login'])) {
            $data['shipway_loginid']    = $this->request->post['shipway_login']['loginid'];
            $data['shipway_licencekey'] = $this->request->post['shipway_login']['licencekey'];
        } elseif ($this->config->get('shipway_login')) {
            $shipway_login                    = $this->config->get('shipway_login');
            $data['shipway_loginid']    = $shipway_login['loginid'];
            $data['shipway_licencekey'] = $shipway_login['licencekey'];
        } else {
            $data['shipway_loginid']    = "";
            $data['shipway_licencekey'] = "";
        }
       
	    $this->load->model('shipway/courier_tracking');
		$data['carrier_list'] = $this->model_shipway_courier_tracking->getCourierList();
		$data['carrier_count'] = count($this->data['carrier_list']);
		
		
        $this->load->model('design/layout');
        
        $data['layouts'] = $this->model_design_layout->getLayouts();
        $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/shipway_login_panel.tpl', $data));

    }
    public function update_carrier_status(){		

		$carriers = isset($this->request->post['carriers'])?$this->request->post['carriers']:array();
			
		$this->load->model('shipway/courier_tracking');
		$this->model_shipway_courier_tracking->disableAllCourier();	
			
		if(!empty($carriers)){
			$this->model_shipway_courier_tracking->enableCourier($carriers);
		}	
		$this->session->data['success'] = "Couriers has been updated.";
		$this->response->redirect($this->url->link('extension/module/shipway_login_panel', 'token=' . $this->session->data['token'], 'SSL'));
	}
    public function install()
    {
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sw_couriers` (
						  `courier_id` int(11) NOT NULL,
						  `name` varchar(255) NOT NULL,
						  status int(2) NOT NULL,
						  PRIMARY KEY (`courier_id`)
						)");
        
        
        $this->db->query("Alter Table `" . DB_PREFIX . "order` ADD COLUMN `awbno` varchar(32) default '' NOT NULL after `comment`;");
        
        $this->db->query("Alter Table `" . DB_PREFIX . "order` ADD COLUMN `courier_id` int(11) NOT NULL after `awbno`;");
    }
    
    public function uninstall()
    {
        $this->cache->delete('sw_couriers');
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "sw_couriers`");
        $this->db->query("Alter Table `" . DB_PREFIX . "order` DROP `awbno`;");
        $this->db->query("Alter Table `" . DB_PREFIX . "order` DROP `courier_id`;");
		$this->db->query("DELETE FROM `". DB_PREFIX ."setting` WHERE `code` = 'shipway_login' ");
    }
    
    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/shipway_login_panel')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
		$shipway_login = $this->request->post['shipway_login'];
		if(!isset($shipway_login['loginid']) || !isset($shipway_login['licencekey']) || empty($shipway_login['loginid']) || empty($shipway_login['licencekey'])){
			$this->error['warning'] = 'Please fill Login Id and Licence key.';
		}
        if(!$this->authenticate($shipway_login['loginid'],$shipway_login['licencekey'])){
			$this->error['warning'] = 'Login failed.';			
		}
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
    
    public function pushAWB()
    {        
        $shipway_login = $this->config->get('shipway_login');
        
        $data = array(
            'carrier_id' => $this->request->post['courier_id'],
            'order_id' => $this->request->post['order_id'],
            'awb' => $this->request->post['awbno'],
            'username' => $shipway_login['loginid'],
            'password' => $shipway_login['licencekey']
        );
        
        $this->load->model('shipway/courier_tracking');
        $this->model_shipway_courier_tracking->assignAwb($data);        
    }
	
	private function authenticate($username,$password){
		 $url         = "https://shipway.in/api/authenticateUser";
        $data_string = array(
            "username" => $username,
            "password" => $password
        );
        $data_string = json_encode($data_string);
        $curl        = curl_init();
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type:application/json'
        ));
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        $output = curl_exec($curl);		
		curl_close($curl);
        
		$output = json_decode($output);	
		if(isset($output->status) && strtolower($output->status) == 'success'){
			return true;
		}
		return false;
	}
	public function updateCarriers(){
		$json=array();
		$shipway_login  = $this->config->get('shipway_login');
		if(!empty($shipway_login)){
		
			$url         = "https://shipway.in/api/getcarrier";
			$data_string = array(
				"username" => $shipway_login['loginid'],
				"password" => $shipway_login['licencekey']
			);
			
			$data_string = json_encode($data_string);
			$curl        = curl_init();
			curl_setopt($curl, CURLOPT_HTTPHEADER, array(
				'Content-Type:application/json'
			));
			curl_setopt($curl, CURLOPT_URL, $url);
			curl_setopt($curl, CURLOPT_POST, true);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
			curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
			$output = curl_exec($curl);

			curl_close($curl);
			
			$output = (array)json_decode($output);
			
			if(!empty($output)){
			
				$this->load->model('shipway/courier_tracking');
				unset($_SESSION['sw_courier']);
				foreach($output as $key => $carrier_name){
				
					$this->model_shipway_courier_tracking->updateCourier($key,$carrier_name);
				}
		
				$json['msg']="Couriers has been synchronized with shipway.";
				$_SESSION['success'] = (!isset($_SESSION['success'])) ? "Couriers has been synchronized with shipway." : $_SESSION['success'];
			}
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
?>