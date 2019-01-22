<?php

class ControllerExtensionModuleBetaout extends Controller {

    private $error = array();
    public $data = false;

    public function install() {
        $this->db->query("CREATE TABLE " . DB_PREFIX . "betaout(
                        customer_id INT DEFAULT 0,
                        session VARCHAR (500),
                        cart_obj TEXT
                        )ENGINE=InnoDB DEFAULT CHARSET=utf8;");
//    $this->db->query("drop TABLE " . DB_PREFIX . "betaout");
    }

    public function uninstall() {
        $this->db->query("DROP TABLE " . DB_PREFIX . "betaout;");
    }

    public function index() {
        $this->load->language('extension/module/betaout');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('betaout', $this->request->post);

            //Write the settings to the betaout-proxy file

            $this->session->data['success'] = $this->language->get('text_success');


            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');

        $data['text_module'] = $this->language->get('text_module');
        $data['entry_api_key'] = $this->language->get('entry_api_key');
        $data['entry_tracker_location'] = $this->language->get('entry_tracker_location');
        $data['entry_site_id'] = $this->language->get('entry_site_id');

        $data['help_api_key'] = $this->language->get('help_api_key');
        $data['help_tracker_location2'] = $this->language->get('help_tracker_location2');
        $data['help_site_id2'] = $this->language->get('help_site_id2');
        $data['help_enable'] = $this->language->get('help_enable');


        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        }
        else {
            $data['error_warning'] = '';
        }
        if (isset($this->error['api_key'])) {
            $data['error_api_key'] = $this->error['api_key'];
        }
        else {
            $data['error_api_key'] = '';
        }

        if (isset($this->error['site_id'])) {
            $data['error_site_id'] = $this->error['site_id'];
        }
        else {
            $data['error_site_id'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
          'text' => $this->language->get('text_home'),
          'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
          'text' => $this->language->get('text_module'),
          'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
        );

        if (!isset($this->request->get['module_id'])) {
            $data['breadcrumbs'][] = array(
              'text' => $this->language->get('heading_title'),
              'href' => $this->url->link('extension/module/betaout', 'token=' . $this->session->data['token'], true)
            );
        }
        else {
            $data['breadcrumbs'][] = array(
              'text' => $this->language->get('heading_title'),
              'href' => $this->url->link('extension/module/betaout', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
            );
        }
        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('extension/module/betaout', 'token=' . $this->session->data['token'], true);
        }
        else {
            $data['action'] = $this->url->link('extension/module/betaout', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
        }

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

        if (isset($this->request->post['betaout_title'])) {
            $data['betaout_title'] = $this->request->post['betaout_title'];
        }
        else {
            $data['betaout_title'] = $this->config->get('betaout_title');
        }

        if (isset($this->request->post['betaout_api_key'])) {
            $data['betaout_api_key'] = $this->request->post['betaout_api_key'];
        }
        else {
            $data['betaout_api_key'] = $this->config->get('betaout_api_key');
        }


        if (isset($this->request->post['betaout_site_id'])) {
            $data['betaout_site_id'] = $this->request->post['betaout_site_id'];
        }
        else {
            $data['betaout_site_id'] = $this->config->get('betaout_site_id');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->data = $data;
        $this->response->setOutput($this->load->view('extension/module/betaout.tpl', $data));
    }

    public function validate() {

        if (strlen($this->request->post['betaout_api_key']) <= 31) {
            $this->error['warning'] = $this->language->get('error_api_key');
        }

        if (empty($this->request->post['betaout_site_id']) || !is_numeric($this->request->post['betaout_site_id'])) {
            $this->error['warning'] = $this->language->get('error_site_id');
        }

//        if (empty($this->request->post['betaout_api_key']) || is_numeric($this->request->post['betaout_api_key'])) {
//            $this->error['warning'] = $this->language->get('error_api_key');
//        }

        if (!$this->user->hasPermission('modify', 'extension/module/betaout')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

}

?>