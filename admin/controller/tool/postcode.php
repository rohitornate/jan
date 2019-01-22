<?php

class ControllertoolPostCode extends Controller {

	private $error = array();

 

	public function index() {

		$this->load->language('tool/postcode');

 

		$this->document->setTitle($this->language->get('heading_title'));

 		

		$this->load->model('tool/postcode');

		$this->model_tool_postcode->createTable();

		$this->getList();

	}



	public function insert() {

		$this->load->language('tool/postcode');



		$this->document->setTitle($this->language->get('heading_title'));

		

		$this->load->model('tool/postcode');

		



		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateEForm()) {

			$this->model_tool_postcode->addpin($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');



			$url = '';



			if (isset($this->request->get['filter_zipcode'])) {

				$url .= '&filter_zipcode=' . urlencode(html_entity_decode($this->request->get['filter_zipcode'], ENT_QUOTES, 'UTF-8'));

			}

			

			if (isset($this->request->get['filter_message'])) {

				$url .= '&filter_message=' . urlencode(html_entity_decode($this->request->get['filter_message'], ENT_QUOTES, 'UTF-8'));

			}

			if (isset($this->request->get['filter_status'])) {

				$url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));

			}



			if (isset($this->request->get['page'])) {

				$url .= '&page=' . $this->request->get['page'];

			}



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}



			if (isset($this->request->get['order'])) {

				$url .= '&order=' . $this->request->get['order'];

			}

			

			$this->response->redirect($this->url->link('tool/postcode', 'token=' . $this->session->data['token'].$url, 'SSL'));

		}



		$this->getForm();

	}



	public function update() {

		$this->load->language('tool/postcode');



		$this->document->setTitle($this->language->get('heading_title'));		

		

		$this->load->model('tool/postcode');

		

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_tool_postcode->editpin($this->request->get['zip_code_id'], $this->request->post);

			

			$this->session->data['success'] = $this->language->get('text_success');

			

			$url = '';



			if (isset($this->request->get['filter_zipcode'])) {

				$url .= '&filter_zipcode=' . urlencode(html_entity_decode($this->request->get['filter_zipcode'], ENT_QUOTES, 'UTF-8'));

			}


			if (isset($this->request->get['filter_status'])) {

				$url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));

			}
		
			if (isset($this->request->get['page'])) {

				$url .= '&page=' . $this->request->get['page'];

			}



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}



			if (isset($this->request->get['order'])) {

				$url .= '&order=' . $this->request->get['order'];

			}

			

			$this->response->redirect($this->url->link('tool/postcode', 'token=' . $this->session->data['token'].$url, 'SSL'));

		}



		$this->getForm();

	}

		

	public function delete() { 

		$this->load->language('tool/postcode');



		$this->document->setTitle($this->language->get('heading_title'));		

		

		$this->load->model('tool/postcode');

		

		if (isset($this->request->post['selected']) && $this->validateForm()) {

      		foreach ($this->request->post['selected'] as $zip_code_id) {

				$this->model_tool_postcode->delete($zip_code_id);	

			}

						

			$this->session->data['success'] = $this->language->get('text_success');

			

			$url = '';



			if (isset($this->request->get['page'])) {

				$url .= '&page=' . $this->request->get['page'];

			}



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}



			if (isset($this->request->get['order'])) {

				$url .= '&order=' . $this->request->get['order'];

			}

			

			$this->response->redirect($this->url->link('tool/postcode', 'token=' . $this->session->data['token'].$url, 'SSL'));

		}



		$this->getList();

	}



	private function getList() {

		

		if (isset($this->request->get['filter_zipcode'])) {

			$filter_zipcode = $this->request->get['filter_zipcode'];

		} else {

			$filter_zipcode = null;

		}

		if (isset($this->request->get['filter_status'])) {

			$filter_status = $this->request->get['filter_status'];

		} else {

			$filter_status = null;

		}
		
		if (isset($this->request->get['filter_message'])) {

			$filter_message = $this->request->get['filter_message'];

		} else {

			$filter_message = null;

		}


		$url = '';



		if (isset($this->request->get['filter_zipcode'])) {

			$url .= '&filter_zipcode=' . urlencode(html_entity_decode($this->request->get['filter_zipcode'], ENT_QUOTES, 'UTF-8'));

		}

		

		if (isset($this->request->get['filter_message'])) {

			$url .= '&filter_message=' . urlencode(html_entity_decode($this->request->get['filter_message'], ENT_QUOTES, 'UTF-8'));

		}
		
		if (isset($this->request->get['filter_status'])) {

			$url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));

		}

		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}



		if (isset($this->request->get['page'])) {

			$url .= '&page=' . $this->request->get['page'];

		}



  		$data['breadcrumbs'][] = array(

       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),

       		'text'      => $this->language->get('text_home'),

      		'separator' => FALSE

   		);



  		$data['breadcrumbs'][] = array(

       		'href'      => $this->url->link('tool/postcode', 'token=' . $this->session->data['token'], 'SSL'),

       		'text'      => $this->language->get('heading_title'),

      		'separator' => ' :: '

   		);

							

		

		$data['insert'] 				= $this->url->link('tool/postcode/insert', 'token=' . $this->session->data['token'].$url, 'SSL');

		$data['delete'] 				= $this->url->link('tool/postcode/delete', 'token=' . $this->session->data['token'].$url, 'SSL');

		

		$data['links'][0]['href']		= $this->url->link('tool/postcode', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][1]['href']		= $this->url->link('tool/postcodesetting', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][5]['href']		= $this->url->link('tool/postcodenew', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][6]['href']		= $this->url->link('tool/postcodeimport', 'token=' . $this->session->data['token'] . '&pagename=zip_zone', 'SSL');	

		$data['links'][0]['text']		= "Postcode List";

		$data['links'][1]['text']		= "Setting";

		$data['links'][5]['text']		= "New Post Code";

		$data['links'][6]['text']		= "Import/Export Postcodes";

		$data['links'][0]['type']		= "primary";

		$data['links'][1]['type']		= "primary";

		$data['links'][5]['type']		= "success";

		$data['links'][6]['type']		= "success";

		$data['links'][0]['font']		= "list";

		$data['links'][1]['font']		= "cogs";

		$data['links'][5]['font']		= "list-alt";

		$data['links'][6]['font']		= "download";

		

		

		if (isset($this->request->get['sort'])) {

			$sort = $this->request->get['sort'];

		} else {

			$sort = 'zip_code_id';

		}

		

		if (isset($this->request->get['order'])) {

			$order = $this->request->get['order'];

		} else {

			$order = 'ASC';

		}

		

		if (isset($this->request->get['page'])) {

			$page = $this->request->get['page'];

		} else {

			$page = 1;

		}

		

		$data1 = array(

			'filter_zipcode'	  => $filter_zipcode, 

			'filter_message' => $filter_message,

			'filter_status'   => $filter_status,
			'sort'            => $sort,

			'order'           => $order,

			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),

			'limit'           => $this->config->get('config_limit_admin')

		);

		

		$pin_total = $this->model_tool_postcode->getTotalpins($data1);

		$results = $this->model_tool_postcode->getpins($data1,($page - 1) * $this->config->get('config_limit_admin'),$this->config->get('config_limit_admin'));


		$data['pins'] = array();

		foreach ($results as $result) {

			$action = array();

			

			$action[] = array(

				'text' => $this->language->get('text_edit'),

				'href' => $this->url->link('tool/postcode/update', 'token=' . $this->session->data['token'] . '&zip_code_id=' . $result['zip_code_id'].$url, 'SSL')

			);		



			$data['pins'][] = array(

				'zip_code_id' 		 => $result['zip_code_id'],

				'message' 		 => html_entity_decode($result['message']),

				'zip_code' 	 => $result['zip_code'],

				'date_added' 	 => $result['date_added'],

				'status' 	 => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),

				'action'     => $action

			);

		}	

	

		$data['heading_title'] = $this->language->get('heading_title');

		

		$data['text_no_results'] = $this->language->get('text_no_results');



		$data['date_added'] = $this->language->get('date_added');

		$data['status'] = $this->language->get('status');

		$data['message'] = $this->language->get('message');

		
		$data['text_enabled'] = $this->language->get('text_enabled');		

		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['zip_code'] = $this->language->get('zip_code');

		$data['text_list'] = $this->language->get('text_list');

		$data['button_filter'] = $this->language->get('button_filter');

		

		$data['column_action'] = $this->language->get('column_action');



		$data['button_insert'] = $this->language->get('button_insert');

		$data['button_delete'] = $this->language->get('button_delete');

		$data['token'] = $this->session->data['token'];


		$url = '';



		if (isset($this->request->get['filter_zipcode'])) {

			$url .= '&filter_zipcode=' . urlencode(html_entity_decode($this->request->get['filter_zipcode'], ENT_QUOTES, 'UTF-8'));

		}

		

		if (isset($this->request->get['filter_message'])) {

			$url .= '&filter_message=' . urlencode(html_entity_decode($this->request->get['filter_message'], ENT_QUOTES, 'UTF-8'));

		}


		if (isset($this->request->get['filter_status'])) {

			$url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));

		}


		if ($order == 'ASC') {

			$url .= '&order=DESC';

		} else {

			$url .= '&order=ASC';

		}



		if (isset($this->request->get['page'])) {

			$url .= '&page=' . $this->request->get['page'];

		}

 

		$data['sort_zip_code'] = $this->url->link('tool/postcode', 'token=' . $this->session->data['token'] . '&sort=zip_code' . $url, 'SSL');
		
		$data['sort_message'] = $this->url->link('tool/postcode', 'token=' . $this->session->data['token'] . '&sort=message' . $url, 'SSL');

		$data['sort_status'] = $this->url->link('tool/postcode', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		
		$data['sort_date_added'] = $this->url->link('tool/postcode', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');



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

		

		$url = "";

		

		if (isset($this->request->get['filter_zipcode'])) {

			$url .= '&filter_zipcode=' . urlencode(html_entity_decode($this->request->get['filter_zipcode'], ENT_QUOTES, 'UTF-8'));

		}

		

		if (isset($this->request->get['filter_message'])) {

			$url .= '&filter_message=' . urlencode(html_entity_decode($this->request->get['filter_message'], ENT_QUOTES, 'UTF-8'));

		}

		
		if (isset($this->request->get['filter_status'])) {

			$url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));

		}

		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}

		

		$pagination = new Pagination();

		$pagination->total = $pin_total;

		$pagination->page  = $page;

		$pagination->limit = $this->config->get('config_limit_admin');

		$pagination->url   = $this->url->link('tool/postcode', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');



		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($pin_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($pin_total - $this->config->get('config_limit_admin'))) ? $pin_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $pin_total, ceil($pin_total / $this->config->get('config_limit_admin')));



		$data['filter_zipcode'] = $filter_zipcode;

		$data['filter_message'] = $filter_message;

		$data['filter_status'] = $filter_status;

		$data['sort'] = $sort;

		$data['order'] = $order;

		$data['sort_name'] = $this->url->link('tool/postcode/', 'token=' . $this->session->data['token']);

		

		$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this->load->controller('common/footer');



		$this->response->setOutput($this->load->view('tool/postcode_list.tpl', $data));

 	}



	private function getForm() {

		$url = '';



		if (isset($this->request->get['filter_zipcode'])) {

			$url .= '&filter_zipcode=' . urlencode(html_entity_decode($this->request->get['filter_zipcode'], ENT_QUOTES, 'UTF-8'));

		}

		

		if (isset($this->request->get['filter_message'])) {

			$url .= '&filter_message=' . urlencode(html_entity_decode($this->request->get['filter_message'], ENT_QUOTES, 'UTF-8'));

		}


		if (isset($this->request->get['filter_status'])) {

			$url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));

		}

		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}



		if (isset($this->request->get['page'])) {

			$url .= '&page=' . $this->request->get['page'];

		}

		$data['heading_title'] = $this->language->get('heading_title');

		

		$data['date_added'] = $this->language->get('date_added');

		$data['status'] = $this->language->get('status');

		$data['zone_name'] = $this->language->get('zone_name');

		$data['message'] = $this->language->get('message');

		

		$data['zip_code'] = $this->language->get('zip_code');
		

		$data['token'] = $this->session->data['token'];

		$data['text_default'] = $this->language->get('text_default');

		$data['text_form'] = $this->language->get('text_form');

		$data['version'] = str_replace(".","",VERSION);

		$data['button_save'] = $this->language->get('button_save');

		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['text_enabled'] = $this->language->get('text_enabled');		

		$data['text_disabled'] = $this->language->get('text_disabled');



		$data['tab_general'] = $this->language->get('tab_general');



 		if (isset($this->error['warning'])) {

			$data['error_warning'] = $this->error['warning'];

		} else {

			$data['error_warning'] = '';

		}

	

  		$data['breadcrumbs'] = array();



  		$data['breadcrumbs'][] = array(

       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),

       		'text'      => $this->language->get('text_home'),

      		'separator' => FALSE

   		);



  		$data['breadcrumbs'][] = array(

       		'href'      => $this->url->link('tool/postcode', 'token=' . $this->session->data['token'], 'SSL'),

       		'text'      => $this->language->get('heading_title'),

      		'separator' => ' :: '

   		);

			

		if (!isset($this->request->get['zip_code_id'])) {

			$data['action'] = $this->url->link('tool/postcode/insert', 'token=' . $this->session->data['token'].$url, 'SSL');

		} else {

			$data['action'] = $this->url->link('tool/postcode/update', 'token=' . $this->session->data['token'] . '&zip_code_id=' . $this->request->get['zip_code_id'].$url, 'SSL');

		}

		

		$data['token'] = $this->session->data['token'];

		  

    	$data['cancel'] = $this->url->link('tool/postcode', 'token=' . $this->session->data['token'].$url, 'SSL');



    	$data['links'][0]['href']		= $this->url->link('tool/postcode', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][1]['href']		= $this->url->link('tool/postcodesetting', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][5]['href']		= $this->url->link('tool/postcodenew', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][6]['href']		= $this->url->link('tool/postcodeimport', 'token=' . $this->session->data['token'] . '&pagename=zip_zone', 'SSL');	

		$data['links'][0]['text']		= "Postcode List";

		$data['links'][1]['text']		= "Setting Page";

		$data['links'][5]['text']		= "New Post Code";

		$data['links'][6]['text']		= "Import/Export Postcodes";

		$data['links'][0]['type']		= "primary";

		$data['links'][1]['type']		= "primary";

		$data['links'][5]['type']		= "success";

		$data['links'][6]['type']		= "success";

		$data['links'][0]['font']		= "list";

		$data['links'][1]['font']		= "cogs";

		$data['links'][5]['font']		= "list-alt";

		$data['links'][6]['font']		= "download";

		



		if (isset($this->request->get['zip_code_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {

			$pin_info = $this->model_tool_postcode->getpin($this->request->get['zip_code_id']);

		}		

		
		if (isset($this->request->get['zip_code_id'])) {

			$data['zip_code_id'] = $this->request->get['zip_code_id'];

		}



		$this->load->model('setting/store');

		if (isset($this->request->post['message_idmessage_id'])) {

			$data['message_id'] = $this->request->post['message_id'];

		} elseif (isset($pin_info)) {

			$data['message_id'] = $pin_info['message'];

		} else {

			$data['message_id'] = '';

		}

		if (isset($this->request->post['pin_code'])) {

			$data['pin_code'] = $this->request->post['pin_code'];

		} elseif (isset($pin_info)) {

			$data['pin_code'] = $pin_info['zip_code'];

		} else {

			$data['pin_code'] = '';

		}
		if (isset($this->request->post['status_value'])) {

			$data['status_value'] = $this->request->post['status_value'];

		} elseif (isset($pin_info)) {

			$data['status_value'] = $pin_info['status'];

		} else {

			$data['status_value'] = '1';

		}

		$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this->load->controller('common/footer');



		$this->response->setOutput($this->load->view('tool/postcode_form.tpl', $data));

	}



	private function validateForm() {

		

		$this->load->model('tool/postcode');

		

		if (!$this->user->hasPermission('modify', 'tool/postcode')) {

			$this->error['warning'] = $this->language->get('error_permission');

		}



	 	if(isset($this->request->post['zip_code_id']) and $this->request->post['zip_code_id']!=""){

			if(trim($this->request->post['pin_code']) == "") {

			 	$this->error['warning'] = $this->language->get('error_pin_empty');

			}



			if($this->model_tool_postcode->checkpin($this->request->post['pin_code'],$this->request->post['zip_code_id'])) {

			 	$this->error['warning'] = $this->language->get('error_pin_exist');

			} 	



		}



		if (!$this->error) {

			return TRUE;

		} else {

			return FALSE;

		}

	}



	private function validateEForm() {

		

		$this->load->model('tool/postcode');

		

		if (!$this->user->hasPermission('modify', 'tool/postcode')) {

			$this->error['warning'] = $this->language->get('error_permission');

		}



	 	if(isset($this->request->post['zip_code_id']) and $this->request->post['zip_code_id']!=""){



	 		if(trim($this->request->post['pin_code']) == "") {

			 	$this->error['warning'] = $this->language->get('error_pin_empty');

			} 



			if($this->model_tool_postcode->checkepin($this->request->post['pin_code'])) {

			 	$this->error['warning'] = $this->language->get('error_pin_exist');

			} 	

		}

	

		if (!$this->error) {

			return TRUE;

		} else {

			return FALSE;

		}

	}



}

?>