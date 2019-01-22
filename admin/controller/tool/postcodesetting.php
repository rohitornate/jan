<?php 

class ControllerToolpostcodesetting extends Controller { 

	private $error = array();

	

	public function index() {		

		$this->load->language('tool/postcodesetting');

		$this->load->model('tool/postcodesetting');

		$this->load->model('tool/postcode');

		$this->load->model('setting/setting');

		$this->load->model('tool/image');

		

		$this->load->model('tool/postcode');

		$this->model_tool_postcode->createTable();

		

		$this->document->setTitle($this->language->get('heading_title'));

				

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {

			$temp['imdev_config_postcodeproduct'] =  $this->request->post['imdev_config_postcodeproduct'];

 			$this->model_setting_setting->editSetting('imdev', $temp);

			$this->model_tool_postcodesetting->adddata($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

		}



		$data['heading_title'] = $this->language->get('heading_title');

		$data['button_save'] = $this->language->get('button_save');

		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_list'] = $this->language->get('text_list');

		$data['text_disabled'] = $this->language->get('text_disabled');

        $data['text_product_status'] = $this->language->get('text_product_status');


		$data['text_message'] = $this->language->get('text_message');

		$data['text_delivery'] = $this->language->get('text_delivery');

		$data['text_payment'] = $this->language->get('text_payment');

		$data['text_courier'] = $this->language->get('text_courier');

		$data['text_couriername'] = $this->language->get('text_couriername');

		$data['text_displaycodtext'] = $this->language->get('text_displaycodtext');

		$data['text_shipping'] = $this->language->get('text_shipping');

		$data['text_shippingmethod'] = $this->language->get('text_shippingmethod');

		$data['text_shippingmethods'] = $this->language->get('text_shippingmethods');

		$data['text_paymentmethods'] = $this->language->get('text_paymentmethods');

		$data['text_header'] = $this->language->get('text_header');

	
		$data['help_product_status'] = $this->language->get('help_product_status');

		$data['help_header'] = $this->language->get('help_header');

		$data['token'] = $this->session->data['token'];

		$data['version'] = str_replace(".","",VERSION);

		$data['tab_data'] = $this->language->get('tab_data');

		$data['tab_postcodensearchbox'] = $this->language->get('tab_postcodensearchbox');

		$data['tab_paymentpostcode'] = $this->language->get('tab_paymentpostcode');

		$data['tab_shippingpostcode'] = $this->language->get('tab_shippingpostcode');

		$data['tab_otherfeatures'] = $this->language->get('tab_otherfeatures');





		$data['languages'] = $this->model_tool_postcodesetting->getLanguages();

		

		$data['action'] = $this->url->link('tool/postcodesetting', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL');



		if(isset($this->request->post['dynamic'])) {

			$data['dynamic'] = $this->request->post['dynamic'];

		} else {

			$data['dynamic'] = $this->model_tool_postcodesetting->getdatad();

		}

		

		foreach ($data['languages'] as $key => $value) {	

			if(!isset($data['dynamic'][$value['language_id']])) {

				$data['dynamic'][$value['language_id']]['message']  = 'Enter Pincode';

				$data['dynamic'][$value['language_id']]['header']  = 'Check delivery at your pincode';

			}

		}



		


		if (isset($this->request->post['imdev_config_postcodeproduct'])) {

			$data['imdev_config_postcodeproduct'] = $this->request->post['imdev_config_postcodeproduct'];

		} else {

			$data['imdev_config_postcodeproduct'] = $this->config->get('imdev_config_postcodeproduct');

		}

		

		


		if (isset($this->error['warning'])) {

			$data['error_warning'] = $this->error['warning'];

		} else {

			$data['error_warning'] = '';

		}



		if (isset($this->session->data['success'])) {

			$data['success'] = $this->session->data['success'];

		

			unset($this->session->data['success']);

		} else {

			$data['success'] = '';

		}



   		$data['breadcrumbs'][] = array(

       		'text'      => $this->language->get('text_home'),

			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),     		

      		'separator' => false

   		);



   		$data['breadcrumbs'][] = array(

       		'text'      => $this->language->get('heading_title'),

			'href'      => $this->url->link('tool/postcodesetting', 'token=' . $this->session->data['token'], 'SSL'),

      		'separator' => ' :: '

   		);



		$data['links'][0]['href']		= $this->url->link('tool/postcode', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][1]['href']		= $this->url->link('tool/postcodesetting', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][5]['href']		= $this->url->link('tool/postcodenew', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][6]['href']		= $this->url->link('tool/postcodeimport', 'token=' . $this->session->data['token'] . '&pagename=zip_zone', 'SSL');	

		$data['links'][0]['text']		= "Postcode List";

		$data['links'][1]['text']		= "Setting Page";

		$data['links'][5]['text']		= "New Post Codes";

		$data['links'][6]['text']		= "Import/Export Postcodes";

		$data['links'][0]['type']		= "primary";

		$data['links'][1]['type']		= "primary";

		$data['links'][5]['type']		= "success";

		$data['links'][6]['type']		= "success";

		$data['links'][0]['font']		= "list";

		$data['links'][1]['font']		= "cogs";

		$data['links'][5]['font']		= "list-alt";

		$data['links'][6]['font']		= "download";

				

			$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this->load->controller('common/footer');



		$this->response->setOutput($this->load->view('tool/postcodesetting.tpl', $data));

	}



	private function validateForm() {

		

		$this->load->model('tool/postcodesetting');

		

		if (!$this->user->hasPermission('modify', 'tool/postcodesetting')) {

			$this->error['warning'] = $this->language->get('error_permission');

		}



		if (!$this->error) {

			return TRUE;

		} else {

			return FALSE;

		}

	}



}

?>