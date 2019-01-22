<?php
class ControllerFacebookFacebookAdsExtension extends Controller {
  private $faeLog;

  public function __construct($registry) {
    parent::__construct($registry);
    $this->faeLog = new Log(FacebookCommonUtils::FAE_LOG_FILENAME);
  }

  public function index() {
    $this->load->libraryFB('facebookcommonutils');
    $this->load->libraryFB('facebookgraphapi');

    $this->load->language('facebook/facebookadsextension');
    $this->document->setTitle($this->language->get('heading_title'));

    // Run currency update
    if ($this->config->get('config_currency_auto')) {
      $this->load->model('localisation/currency');
      $this->model_localisation_currency->refresh();
    }

    $this->load->model('catalog/product');

    $this->load->model('facebook/facebooksetting');
    $facebook_setting = $this->model_facebook_facebooksetting->getSettings();

    $data = array();
    $data['heading_title'] = $this->language->get('heading_title');
    $data['breadcrumbs'] = array();
    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_home'),
      'href' => $this->url->link(
      'common/dashboard',
      'token=' . $this->session->data['token'],
      true)
    );
    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('heading_title'),
      'href' => $this->url->link(
      'facebook/facebookadsextension',
      'token=' . $this->session->data['token'],
      true)
    );

    $data['token'] = $this->session->data['token'];
    $data['debug_url'] = (isset($this->request->get['debug_url']))
      ? $this->request->get['debug_url']
      : '';
    $data[FacebookCommonUtils::FACEBOOK_DIA_SETTING_ID] =
      isset($facebook_setting[FacebookCommonUtils::FACEBOOK_DIA_SETTING_ID])
      ? $facebook_setting[FacebookCommonUtils::FACEBOOK_DIA_SETTING_ID]
      : '';
    $data[FacebookCommonUtils::FACEBOOK_PIXEL_ID] =
      isset($facebook_setting[FacebookCommonUtils::FACEBOOK_PIXEL_ID])
      ? $facebook_setting[FacebookCommonUtils::FACEBOOK_PIXEL_ID]
      : '';
    $data['base_currency'] = $this->config->get('config_currency');
    $data['store_name'] = $this->config->get('config_name');
    $data['opencart_version'] = VERSION;
    $data['plugin_version'] = $this->facebookcommonutils->getPluginVersion();

    $data['total_visible_products'] =
      $this->model_catalog_product->getTotalProducts();
    $data['sample_feed'] = $this->load->controller(
      'facebook/facebookproduct/getSampleProductFeed');
    if (!$data['sample_feed']) {
      $data['sample_feed'] = '[[]]';
    }

    $data['download_log_link'] = $this->url->link(
      'facebook/facebookadsextension/downloadfaelogfile',
      'token=' . $this->session->data['token'],
      true);

    $data['sub_heading_title'] = $this->language->get('sub_heading_title');
    $data['body_text'] = $this->language->get('body_text');
    $data['button_text'] = ($data[FacebookCommonUtils::FACEBOOK_DIA_SETTING_ID])
      ? $this->language->get('button_manage_settings')
      : $this->language->get('button_get_started');
    $data['resync_text'] = $this->language->get('resync_text');
    $data['resync_confirm_text'] = $this->language->get('resync_confirm_text');
    $data['download_log_file_text'] =
      $this->language->get('download_log_file_text');
    $data['header'] = $this->load->controller('common/header');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['footer'] = $this->load->controller('common/footer');

    $data['download_log_file_error_warning'] =
      isset($this->session->data['download_log_file_error_warning'])
      ? $this->session->data['download_log_file_error_warning']
      : '';
    $this->session->data['download_log_file_error_warning'] = '';

    // checking if there is a facebook upload id
    // to decide if the initial product sync has taken place
    $data['initial_product_sync'] =
      isset($facebook_setting[FacebookCommonUtils::FACEBOOK_UPLOAD_ID])
      ? 'true'
      : 'false';

    $this->response->setOutput(
      $this->load->view('facebook/facebookadsextension.tpl', $data));
  }

  public function updateSettings() {
    $data = array();

    if (isset(
      $this->request->post[FacebookCommonUtils::FACEBOOK_DIA_SETTING_ID])) {
      $data[FacebookCommonUtils::FACEBOOK_DIA_SETTING_ID] =
        $this->request->post[FacebookCommonUtils::FACEBOOK_DIA_SETTING_ID];
    }

    if (isset($this->request->post[FacebookCommonUtils::FACEBOOK_PIXEL_ID])) {
      $data[FacebookCommonUtils::FACEBOOK_PIXEL_ID] =
        $this->request->post[FacebookCommonUtils::FACEBOOK_PIXEL_ID];
    }

    if (isset(
      $this->request->post[FacebookCommonUtils::FACEBOOK_PIXEL_USE_PII])) {
      $data[FacebookCommonUtils::FACEBOOK_PIXEL_USE_PII] =
        $this->request->post[FacebookCommonUtils::FACEBOOK_PIXEL_USE_PII];
    }

    if (isset($this->request->post[FacebookCommonUtils::FACEBOOK_CATALOG_ID])) {
      $data[FacebookCommonUtils::FACEBOOK_CATALOG_ID] =
        $this->request->post[FacebookCommonUtils::FACEBOOK_CATALOG_ID];
    }

    if (isset($this->request->post[FacebookCommonUtils::FACEBOOK_PAGE_ID])) {
      $data[FacebookCommonUtils::FACEBOOK_PAGE_ID] =
        $this->request->post[FacebookCommonUtils::FACEBOOK_PAGE_ID];
    }

    if (isset($this->request->post[FacebookCommonUtils::FACEBOOK_PAGE_TOKEN])) {
      $data[FacebookCommonUtils::FACEBOOK_PAGE_TOKEN] =
        $this->request->post[FacebookCommonUtils::FACEBOOK_PAGE_TOKEN];
    }

    $this->faeLog->write('Updating FAE settings - ' . http_build_query($data));
    $this->load->model('facebook/facebooksetting');
    $this->model_facebook_facebooksetting->updateSettings($data);

    $json = array('success' => 'true');
    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
    $this->faeLog->write('Complete - Updating FAE settings');
  }

  public function clearAllFacebookProducts() {
    $result = $this->load->controller(
      'facebook/facebookproduct/clearAllFacebookProducts');
    $json = array('success' => 'true');
    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }

  public function syncAllProducts() {
    $result = $this->load->controller(
      'facebook/facebookproduct/syncAllProducts');
    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($result));
  }

  public function deleteSettings() {
    $this->faeLog->write('Deleting FAE settings');
    $this->load->model('facebook/facebooksetting');
    $this->model_facebook_facebooksetting->deleteSettings();

    $json = array('success' => 'true');
    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
    $this->faeLog->write('Complete - Deleting FAE settings');
  }

  public function downloadFAELogFile() {
    $this->load->language('facebook/facebookadsextension');
    $file = DIR_LOGS . FacebookCommonUtils::FAE_LOG_FILENAME;

    if (file_exists($file) && filesize($file) > 0) {
      $this->response->addheader('Pragma: public');
      $this->response->addheader('Expires: 0');
      $this->response->addheader('Content-Description: File Transfer');
      $this->response->addheader('Content-Type: application/octet-stream');
      $this->response->addheader('Content-Disposition: attachment; ' .
        'filename="' . $this->config->get('config_name') .
        '_' . date('Y-m-d_H-i-s', time()) .
        '_' . FacebookCommonUtils::FAE_LOG_FILENAME . '"');
      $this->response->addheader('Content-Transfer-Encoding: binary');

      $this->response->setOutput(
        file_get_contents($file, FILE_USE_INCLUDE_PATH, null));
    } else {
      $this->session->data['download_log_file_error_warning'] =
        sprintf(
          $this->language->get('download_log_file_error_warning'),
          basename($file),
          '0B');
      $this->response->redirect($this->url->link(
        'facebook/facebookadsextension',
        'token=' . $this->session->data['token'],
        true));
    }
  }

  public function syncAllProductsUsingFeed() {
    try {
      $result = $this->load->controller(
        'facebook/facebookproductfeed/syncAllProductsUsingFeed');
      $this->response->addHeader('Content-Type: application/json');
      $this->response->setOutput(json_encode($result));
    } catch (Exception $e) {
      header("HTTP/1.1 400 " . $e->getMessage());
    }
  }

  public function getInitialProductSyncStatus() {
    try {
      $result = $this->load->controller(
        'facebook/facebookproductfeed/getInitialProductSyncStatus');
      $this->response->addHeader('Content-Type: application/json');
      $this->response->setOutput(json_encode($result));
    } catch (Exception $e) {
      header("HTTP/1.1 400 " . $e->getMessage());
    }
  }

  public function isWritableProductFeedFolderAvailable() {
    try {
      $result = $this->load->controller(
        'facebook/facebookproductfeed/isWritableProductFeedFolderAvailable');
      $this->response->addHeader('Content-Type: application/json');
      $this->response->setOutput(json_encode(array('available' => $result)));
    } catch (Exception $e) {
      header("HTTP/1.1 400 " . $e->getMessage());
    }
  }
}
