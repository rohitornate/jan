<?php   


class ControllerCommonpincode extends Controller {   
	public function index() {
		$this->load->model('catalog/pincode');
		$status = $this->model_catalog_pincode->install_status();
		if($status['total'] > 0){
			$this->language->load('common/pincode');
			$this->document->setTitle($this->language->get('heading_title'));
			$data['heading_title'] = $this->language->get('heading_title');
			
			$this->language->load('common/pincode');
			$this->load->model('catalog/pincode');
			
		//	print_r($data['breadcrumbs']);
		//	exit;
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			$data = array(
				'start' => ($page - 1) * $this->config->get('config_admin_limit'),
				'limit' => $this->config->get('config_admin_limit')
			);
			
			$url = '';
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$select = "";
			if(isset($_GET['myselect'])){
				$select = "WHERE p.service_available =".$_GET['myselect'];
				$downloadcsv = $this->url->link('common/pincode/download', 'token=' . $this->session->data['token']."&myselect=".$_GET['myselect']. $url, 'SSL');
			}
			else{
				$downloadcsv = $this->url->link('common/pincode/download', 'token=' . $this->session->data['token']. $url, 'SSL');
			}
			$data['downloadcsv']= $downloadcsv;
			
			$picodes = $this->model_catalog_pincode->getmypin($data,$select);
			$count = $this->model_catalog_pincode->pincount($select);
			
			$no_rows[] = $count;
			$pin_code[] = $picodes;
			$data['pincode'] = $pin_code;
			$data['count'] = $no_rows;
			$pins = array();
			
			foreach ($picodes as $result) {
				$data['pincodes'][] = array(
					'pin' => $result['pincode'],
					'service' => $result['service_available'],
					'id'  => $result['id'],
					'delivery'  => $result['delivery_time']
				);
			}
			
			if(isset($_GET['editpin'])){
				$data['delivery_time'] = $this->model_catalog_pincode->getmydelivery();
				$pinid = $_GET['editpin'];
				$pin_cod = $this->model_catalog_pincode->editmypin($pinid);
				$pins[] = $pin_cod;
				$data['pin_code'] = $pins;
			}
			$data['breadcrumbs'] = array();
				
			$data['breadcrumbs'][] = array(
					'text'      => $this->language->get('text_home'),
					'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
					'separator' => false
			);
				
			$data['breadcrumbs'][] = array(
					'text'      => 'Postcode Service Availability Checker',
					'href'      => $this->url->link('common/pincode', 'token=' . $this->session->data['token'], 'SSL'),
					'separator' => ' :: '
			);
			$data['add'] = $this->url->link('common/pincode/insert', 'token=' . $this->session->data['token'] . $url, true);
			$data['insert_delivery'] = $this->url->link('common/pincode/delivery_time', 'token=' . $this->session->data['token'] . $url, true);
				
			$pagination = new Pagination();
			$pagination->total = $no_rows[0]['count(*)'];
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_admin_limit');
			$pagination->text = $this->language->get('text_pagination');
			if(isset($_GET['myselect'])){
				$pagination->url = $this->url->link('common/pincode', 'token=' . $this->session->data['token'] . '&allpin=1&myselect='.$_GET['myselect'].'&page={page}', 'SSL');
			}
			else{
				$pagination->url = $this->url->link('common/pincode', 'token=' . $this->session->data['token'] . '&allpin=1&page={page}', 'SSL');
			}
			$data['pagination'] = $pagination->render();
			
		//print_r($data);exit;
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
				
		$this->response->setOutput($this->load->view('common/pincode.tpl', $data));
		
	}
		
  	}
	public function getlist(){
		
		
		
	}
	
	
	
	public function support(){
		$this->template = 'common/pincode_support.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
	}
	public function setting(){
		
		//print_r($_POST);exit;
		$this->load->model('catalog/pincode');
		$status = $this->model_catalog_pincode->install_status();
		if($status['total'] > 0){
			if(isset($_POST['pincode_checkout_status'])){
				$this->load->model('setting/setting');
				$this->model_setting_setting->editSetting('pcheckout', $this->request->post);
				//$this->redirect($this->url->link('common/pincode/setting', 'token=' . $this->session->data['token'], 'SSL')); 
				$this->response->redirect($this->url->link('common/pincode/setting', 'token=' . $this->session->data['token'] , true));
			}
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('common/pincode_setting.tpl', $data));
			//$this->template = 'common/pincode_setting.tpl';
			//$this->children = array(
			//	'common/header',
			//	'common/footer'
			//);
			//$this->response->setOutput($this->render());
		} else {
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}
	
	public function insert(){
		$this->language->load('common/pincode');
		$this->load->model('catalog/pincode');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$status = $this->model_catalog_pincode->install_status();
		if($status['total'] > 0){
			if($this->request->post){
				foreach($this->request->post['data'] as $data){
					$count = $this->model_catalog_pincode->checkmypin($data['pin']);
					if($count['count(*)'] == 0){
						$this->model_catalog_pincode->putmypin($data['pin'],$data['service'],$data['delivery']);
					}
				}
				$this->redirect($this->url->link('common/pincode', 'token=' . $this->session->data['token']."&allpin=1", 'SSL')); 
			}
			
			$data['delivery_time'] = $this->model_catalog_pincode->getmydelivery();
			
			
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
					'text'      => $this->language->get('text_home'),
					'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
					'separator' => false
			);
			
			$data['breadcrumbs'][] = array(
					'text'      => 'Postcode Service Availability Checker',
					'href'      => $this->url->link('common/pincode', 'token=' . $this->session->data['token'], 'SSL'),
					'separator' => ' :: '
			);
			$data['add'] = $this->url->link('common/pincode/insert', 'token=' . $this->session->data['token'] , true);
			$data['action'] = $this->url->link('common/pincode/insert', 'token=' . $this->session->data['token'] , true);
			$data['cancel'] = $this->url->link('common/pincode', 'token=' . $this->session->data['token'] , true);
			$data['action_upload'] = $this->url->link('common/pincode/upload', 'token=' . $this->session->data['token'] , true);
			$data['action_download'] = $this->url->link('common/pincode/download', 'token=' . $this->session->data['token'] , true);
			
			//$this->template = 'common/pincode_insert.tpl';
		//	$this->children = array(
			//	'common/header',
			//	'common/footer'
			//);
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('common/pincode_insert.tpl', $data));
			
			//$this->response->setOutput($this->render());
		} else {
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}
	
	public function delete(){ 
		$this->language->load('common/pincode');
		$this->load->model('catalog/pincode');
		if (isset($this->request->post['selected'])){
			foreach ($this->request->post['selected'] as $id){
				$this->model_catalog_pincode->deletemypin($id);
			}
			$this->redirect($this->url->link('common/pincode', 'token=' . $this->session->data['token']."&allpin=1", 'SSL')); 
		}
	}
	public function update() {
		$this->load->model('catalog/pincode');
		if($this->request->post){
			$id = $_POST['id'];
			$epincode = $_POST['e_pin'];
			$eservice = $_POST['e_service'];
			$edelivery = $_POST['e_delivery'];
			$this->model_catalog_pincode->updatemypin($epincode,$eservice,$edelivery,$id);
		}
		$this->redirect($this->url->link('common/pincode', 'token=' . $this->session->data['token']."&allpin=1", 'SSL')); 
	}
	
	public function upload(){
		$this->language->load('common/pincode');
		$this->load->model('catalog/pincode');
		
		if(isset($this->request->post)){
			if ($_FILES["file_up"]["error"] > 0){
			  $data['warning2'] = $this->language->get('error_warning2');
			} 
		//	print_r($_POST);exit;
			$type = $_FILES["file_up"]["type"];
			$upload_service = $_POST['service'];
			$upload_delivery = $_POST['delivery'];
			//if($type == 'application/vnd.ms-excel'){
				$csv_file = $_FILES["file_up"]["tmp_name"];
				if (($getfile = fopen($csv_file, "r")) !== FALSE) {
					$data = fgetcsv($getfile, 1000, ",");
					while (($data = fgetcsv($getfile, 1000, ",")) !== FALSE) {
						for ($c=0; $c < 1; $c++) {
							$result = $data;
							$str = implode(",", $result);
							$slice = explode(",", $str);
						
							$col1 = $slice[0];
							$count = $this->model_catalog_pincode->checkmypin($col1);
							if($count['count(*)'] == 0){
								$this->model_catalog_pincode->uploadfile($col1,$upload_service,$upload_delivery);
								$data['success1'] = $this->language->get('text_success1');
							}
							else{
								$this->model_catalog_pincode->updateuploadpin($col1,$upload_service,$upload_delivery);
								$data['success1'] = $this->language->get('text_success1');
								
							}
						}
					}
				}
			//}
		}
		$this->redirect($this->url->link('common/pincode', 'token=' . $this->session->data['token']."&allpin=1", 'SSL')); 
	}
	
	public function download() {
		$select = "";
		if(isset($_GET['myselect'])){
			$select = "WHERE service_available =".$_GET['myselect'];
		}
		$this->load->model('catalog/pincode');
		$item=$this->model_catalog_pincode->download_csv($select); 
		header('Content-Type: text/csv; charset=utf-8');
		header("Content-Transfer-Encoding: UTF-8");
		header('Content-Disposition: attachment; filename=Pincode.csv');
		header("Pragma: no-cache");
		header("Expires: 0");
		$output = fopen("php://output", "w");
		fputcsv($output,array('Pincode'));
		foreach ($item as $row) {
			fputcsv($output, $row);
		}
		fclose($output);
		exit();
	}
	
	public function delivery_time(){
		$this->language->load('common/pincode');
		$this->load->model('catalog/pincode');
		$status = $this->model_catalog_pincode->install_status();
		if($status['total'] > 0){
			if(isset($this->request->post['data'])){
				foreach($this->request->post['data'] as $data){
					$count = $this->model_catalog_pincode->checkmydelivery($data['delivery']);
					if($count['total'] == 0 && $data['delivery'] != ''){
						$this->model_catalog_pincode->putmydelivery($data['delivery']);
					}
				}
			}
			
			if(isset($_GET['editdelivery'])){ 
				$data['delivery_time'] = $this->model_catalog_pincode->editmydelivery($_GET['editdelivery']);
			} else {
				$data['delivery_time'] = $this->model_catalog_pincode->getmydelivery();
			}
			$data['breadcrumbs'] = array();
				
			$data['breadcrumbs'][] = array(
					'text'      => $this->language->get('text_home'),
					'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
					'separator' => false
			);
				
			$data['breadcrumbs'][] = array(
					'text'      => 'Delivery Option',
					'href'      => $this->url->link('common/pincode', 'token=' . $this->session->data['token'], 'SSL'),
					'separator' => ' :: '
			);
			$data['add'] = $this->url->link('common/pincode/delivery_time', 'token=' . $this->session->data['token'] , true);
			$data['action'] = $this->url->link('common/pincode/delivery_time', 'token=' . $this->session->data['token'] , true);
			$data['cancel'] = $this->url->link('common/pincode', 'token=' . $this->session->data['token'] , true);
			//$this->template = 'common/pincode_insert.tpl';
			//	$this->children = array(
			//	'common/header',
			//	'common/footer'
			//);
				
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
				
			$this->response->setOutput($this->load->view('common/pincode_delivery.tpl', $data));
			
			
			
			//$this->template = 'common/pincode_delivery.tpl';
			//$this->children = array(
			//	'common/header',
			//	'common/footer'
			//);
			//$this->response->setOutput($this->render());
		} else {
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}
	
	public function update_delivery(){
		if(isset($this->request->post)){
			$this->load->model('catalog/pincode');
			$this->model_catalog_pincode->updatemydelivery($this->request->post);
			$this->redirect($this->url->link('common/pincode/delivery_time', 'token=' . $this->session->data['token'], 'SSL')); 
		} else{
			$this->redirect($this->url->link('common/pincode/delivery_time', 'token=' . $this->session->data['token'], 'SSL')); 
		}
		
	}
	
	public function delete_delivery(){
		if(isset($this->request->post) && !empty($this->request->post)){
			$this->load->model('catalog/pincode');
			$this->model_catalog_pincode->deletemydelivery($this->request->post);
			$this->redirect($this->url->link('common/pincode/delivery_time', 'token=' . $this->session->data['token'], 'SSL')); 
		} else{
			$this->redirect($this->url->link('common/pincode/delivery_time', 'token=' . $this->session->data['token'], 'SSL')); 
		}
	}
	

}
?>