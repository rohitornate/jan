<?php  

class ControllerCommonPostCodepro extends Controller {

	protected function index() {
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/postcodepro.tpl')) {
			 $this->template = $this->config->get('config_template') . '/template/common/postcodepro.tpl';
			 } else { 
			 $this->template = 'default/template/common/postcodepro.tpl';
		}
	}	
	public function dynamo() {
		$id = $this->config->get('config_language_id');
		$this->load->model('tool/postcodepro');
		$pinpro = $this->model_tool_postcodepro->getDynamic($id);
		$json = array();
		if(!empty($pinpro)) {
			$pinpro['theme'] = $themes[$pinpro['theme']];
			$pinpro['style'] = $styles[$pinpro['style']];
			$pinpro['url'] = str_replace('amp;', '', $pinpro['url']);$json['data'] = $pinpro;
			}
			$this->response->setOutput(json_encode($json));
	}
	
	public function checkpin() {
		$this->load->model('tool/postcodepro');
		$pinpro = $this->model_tool_postcodepro->checkpin($this->request->post);
		$this->response->setOutput(json_encode($pinpro));
	}

	public function autocomplete() {

		$results = array();



		if (isset($this->request->get['postcode'])) {

			$this->load->model('tool/postcodepro');

			if (isset($this->request->get['postcode'])) {

				$postcode = $this->request->get['postcode'];

			} else {

				$postcode = '';

			}



			$results = $this->model_tool_postcodepro->getPostcodes($postcode);	

		}

		$this->response->addHeader('Content-Type: application/json');

		$this->response->setOutput(json_encode($results));

	}

	public function pincodeemail() {

		$this->load->model('tool/postcodepro');

		$this->model_tool_postcodepro->submitData($this->request->post);

	}



}

?>