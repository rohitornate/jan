<?php
class ControllerExtensionModuleSignup extends Controller {
	public $error = array();
	public $data;

	public function index() {
		$this->language->load('extension/module/signup');
		$this->data = $this->xtensions->getXtensionsData();
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('sale/xcustom_field');
		$this->data['success'] = isset($this->session->data['success'])?$this->session->data['success']:'';
		if(isset($this->session->data['success'])){
			unset($this->session->data['success']);
		}
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->xtensions->validate($this);
		}
		$this->data['heading_title'] = $this->language->get('heading_title');
		$home = 'common/dashboard';
		$this->load->model('localisation/country');
		$this->data['custom_fields'] = $this->model_sale_xcustom_field->getCustomFieldsAll();
		$this->data['countries'] = $this->model_localisation_country->getCountries();
		$this->data['token'] = $this->session->data['token'];
		$this->data['button_save'] = "Save & Stay";
		$this->data['button_cancel'] = "Back to modules";
		$this->data['text_edit'] = 'Edit:';
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		$this->data['breadcrumbs'] = array(
		array('text'=>$this->language->get('text_home'),'href'=>$this->url->link($home,'token=' . $this->session->data['token'], 'SSL'),'separator'=>false),
		array('text'=>$this->language->get('text_module'),'href'=> $this->url->link('extension/module','token=' . $this->session->data['token'], 'SSL'),'separator' => ' :: '),
		array('text'=>$this->language->get('heading_title'),'href'=> $this->url->link('extension/module/signup','token=' . $this->session->data['token'], 'SSL'),'separator' => ' :: ')
		);

		$this->data['action'] = $this->url->link('extension/module/signup', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();

		if (isset($this->request->post['signup_module'])) {
			$this->data['modules'] = $this->request->post['signup_module'];
		} elseif ($this->config->get('signup_module')) {
			$this->data['modules'] = $this->config->get('signup_module');
		}
		$this->template =  'extension/module/signup.tpl';
		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view($this->template, $this->data));
			
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
?>
