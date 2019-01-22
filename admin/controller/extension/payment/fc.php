<?php
require_once(DIR_SYSTEM . 'fc_util.php');

class ControllerExtensionPaymentFC extends Controller
{
    private $error = array();

    //function executed at load of page
    public function index()
    {

        require_once(DIR_SYSTEM . 'fc_constants.php');
        $this->language->load('extension/payment/fc');

        $this->document->setTitle($this->language->get('heading_title'));
        $arr = array();

        foreach ($this->request->post as $key => $value) {
            if ($key == 'fc_key') {
                $arr[$key] = FCUtility::encrypt($value, $fc_key);
                continue;
            }
            $arr[$key] = $value;
        }

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('fc', $arr);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_all_zones'] = $this->language->get('text_all_zones');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_live'] = $this->language->get('text_live');
        $data['text_successful'] = $this->language->get('text_successful');
        $data['text_fail'] = $this->language->get('text_fail');
        $data['text_env_production'] = $this->language->get('text_env_production');
        $data['text_env_sdb'] = $this->language->get('text_env_sdb');

        $data['entry_merchant'] = $this->language->get('entry_merchant');
        $data['entry_merchant_help'] = $this->language->get('entry_merchant_help');
        $data['entry_merchantkey'] = $this->language->get('entry_merchantkey');
        $data['entry_merchantkey_help'] = $this->language->get('entry_merchantkey_help');
        $data['entry_order_status'] = $this->language->get('entry_order_status');
        $data['entry_environment'] = $this->language->get('entry_environment');
        $data['entry_environment_help'] = $this->language->get('entry_environment_help');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_total'] = $this->language->get('entry_total');
        $data['help_total'] = $this->language->get('help_total');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['merchant'])) {
            $data['error_merchant'] = $this->error['merchant'];
        } else {
            $data['error_merchant'] = '';
        }
        if (isset($this->error['key'])) {
            $data['error_key'] = $this->error['key'];
        } else {
            $data['error_key'] = '';
        }

        if (isset($this->request->post['fc_order_status_id'])) {
            $data['fc_order_status_id'] = $this->request->post['fc_order_status_id'];
        } else {
            $data['fc_order_status_id'] = $this->config->get('fc_order_status_id');
        }

        $this->load->model('localisation/order_status');

        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_payment'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/payment/fc', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('extension/payment/fc', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['fc_merchant'])) {
            $data['fc_merchant'] = $this->request->post['fc_merchant'];
        } else {
            $data['fc_merchant'] = $this->config->get('fc_merchant');
        }

        if (isset($this->request->post['fc_key'])) {

            $data['fc_key'] = $this->request->post['fc_key'];
        } else {
            $data['fc_key'] = $this->config->get('fc_key');

            $data['fc_key'] = "";
            if ($this->config->get('fc_key') != "") {
                $data['fc_key'] = FCUtility::decrypt($this->config->get('fc_key'), $fc_key);
            }

        }


        if (isset($this->request->post['fc_status'])) {
            $data['fc_status'] = $this->request->post['fc_status'];
        } else {
            $data['fc_status'] = $this->config->get('fc_status');
        }

        if (isset($this->request->post['fc_environment'])) {
            $data['fc_environment'] = $this->request->post['fc_environment'];
        } else {
            $data['fc_environment'] = $this->config->get('fc_environment');
        }


        if (isset($this->request->post['fc_sort_order'])) {
            $data['fc_sort_order'] = $this->request->post['fc_sort_order'];
        } else {
            $data['fc_sort_order'] = $this->config->get('fc_sort_order');
        }


        if (isset($this->request->post['fc_total'])) {
            $data['fc_total'] = $this->request->post['fc_total'];
        } else {
            $data['fc_total'] = $this->config->get('fc_total');
        }


        $this->template = 'extension/payment/fc.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');

        $data['footer'] = $this->load->controller('common/footer');
        //$this->response->setOutput($this->render());
        $this->response->setOutput($this->load->view('extension/payment/fc.tpl', $data));

    }

    //validate function to ensure required fields are filled before proceeding
    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/payment/fc')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['fc_merchant']) {
            $this->error['merchant'] = $this->language->get('error_merchant');
        }
        if (!$this->request->post['fc_key']) {
            $this->error['key'] = $this->language->get('error_key');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function orderAction()
    {
    }
}

?>