<?php

class Controllertoolpostcodenew extends Controller {

	private $error = array();

 

	public function index() {

		$this->load->language('tool/postcodenew');

		$this->document->setTitle($this->language->get('heading_title'));

 		$this->load->model('tool/postcode');

		$this->model_tool_postcode->createTable();


		$this->getList();

	}

	private function getList() {

		$data['links'][0]['href']		= $this->url->link('tool/postcode', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][1]['href']		= $this->url->link('tool/postcodesetting', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][5]['href']		= $this->url->link('tool/postcodenew', 'token=' . $this->session->data['token'], 'SSL');	

		$data['links'][6]['href']		= $this->url->link('tool/postcodeimport', 'token=' . $this->session->data['token'] . '&pagename=zip_zone', 'SSL');	

		$data['links'][0]['text']		= "Postcode List";

		$data['links'][1]['text']		= "Setting Page";

		$data['links'][5]['text']		= "New Post Codes";

		$data['links'][6]['text']		= "Import/Export Postcodes";

		$data['links'][0]['type']   = "primary";

        $data['links'][1]['type']   = "primary";

        $data['links'][5]['type']   = "success";

        $data['links'][6]['type']   = "success";

        $data['links'][0]['font']   = "list";

        $data['links'][1]['font']   = "cogs";

        $data['links'][5]['font']   = "list-alt";

        $data['links'][6]['font']   = "download";

		$data['heading_title'] = $this->language->get('heading_title');


		$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('tool/postcodenew.tpl', $data));

 	}

}

?>