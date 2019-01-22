<?php

class ControllerModulemockingfish extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('module/mockingfish');

        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');


        $browser = ($this->request->server['HTTP_USER_AGENT']);
        if (preg_match('/(?i)msie [1-7]/', $browser)) {
            $data['IE7'] = true;
        } else {
            $data['IE7'] = false;
        }
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('mockingfish', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));

            if ($this->request->post['mockingfish']['general']['enable'] == 0) {
                
            }
        }
        // Adding Styles for mockingfish Page
        $this->document->addStyle('view/stylesheet/mockingfish/theme/fonts/font-awesome/css/font-awesome.min.css');
        $this->document->addStyle('view/stylesheet/mockingfish/lte/css/AdminLTE.css');
        $this->document->addStyle('view/stylesheet/mockingfish/lte/css/velsof_lte.css');
        $this->document->addStyle('view/stylesheet/mockingfish/theme/scripts/plugins/notifications/notyfy/jquery.notyfy.css');
        $this->document->addStyle('view/stylesheet/mockingfish/theme/scripts/plugins/notifications/notyfy/themes/default.css');
        $this->document->addStyle('view/stylesheet/mockingfish/theme/scripts/plugins/notifications/Gritter/css/jquery.gritter.css');

        // Adding scripts for mockingfish
        $this->document->addScript('view/javascript/mockingfish/theme/plugins/notifications/Gritter/js/jquery.gritter.min.js');
        $this->document->addScript('view/javascript/mockingfish/theme/plugins/notifications/notyfy/jquery.notyfy.js');
        $this->document->addScript('view/javascript/mockingfish/theme/demo/notifications.js');


        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_general_enable'] = $this->language->get('text_general_enable');
        $data['text_general_mockinfish_code'] = $this->language->get('text_general_mockingfish_code');
        $data['text_general'] = $this->language->get('text_general');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['button_save_and_stay'] = $this->language->get('button_save_and_stay');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        //Tooltips
        $data['general_enable_tooltip'] = $this->language->get('general_enable_tooltip');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['code'])) {
            $data['error_code'] = $this->error['code'];
        } else {
            $data['error_code'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/mockingfish', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('module/mockingfish', 'token=' . $this->session->data['token'], 'SSL');
        $data['token'] = $this->session->data['token'];
        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['mockingfish_status'])) {
            $data['mockingfish_status'] = nl2br($this->request->post['mockingfish_status']);
        } else {
            $data['mockingfish_status'] = $this->config->get('mockingfish_status');
        }
        if (isset($this->request->post['mockingfish_code'])) {
            $this->request->post['mockingfish_code'] = nl2br($this->request->post['mockingfish_code']);
            $data['mockingfish_code'] = $this->request->post['mockingfish_code'];
        } else {
            $data['mockingfish_code'] = $this->config->get('mockingfish_code');
        }

        $this->template = 'module/mockingfish.tpl';

//                $this->children = array(
//			'common/header',
//			'common/footer'
//		);
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
//		$this->response->setOutput($this->render());
        $this->response->setOutput($this->load->view('module/mockingfish.tpl', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/mockingfish')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        if ($this->request->post['mockingfish_status'] == 1) {
            if (!$this->request->post['mockingfish_code']) {
                $this->error['code'] = $this->language->get('error_code');
            }
        }
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function validateSaveAndStay() {
        $this->error['warning'] = '';

        $this->load->language('module/mockingfish');

        if ($this->request->post['mockingfish_status'] == 1) {
            if ($this->request->post['mockingfish_code'] == '') {
                $this->error['warning'] = $this->language->get('error_code');
            }
        }
        $json = array();

        if ($this->error['warning'] == '') {

            $json['error'] = '0';
        } else {
            $json['error'] = $this->error['warning'];
        }
        $this->response->setOutput(json_encode($json));
    }

}
