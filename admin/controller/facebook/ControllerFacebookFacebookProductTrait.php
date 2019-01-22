<?php
trait ControllerFacebookFacebookProductTrait {
  private $faeLog;

  private function loadLibrariesForFacebookCatalog() {
    $this->faeLog = new Log(FacebookCommonUtils::FAE_LOG_FILENAME);
    $this->load->model('catalog/product');
    $this->load->model('localisation/currency');
    $this->loadFacebookModel('facebook/facebookproduct');
    $this->load->libraryFB('facebookcommonutils');
    $this->load->libraryFB('facebookgraphapi');
    $this->load->libraryFB('facebooktax');
    $this->load->libraryFB('facebookproductapiformatter');
    $this->load->libraryFB('facebookproductfeedformatter');

    $config_tax = $this->config->get('config_tax');
    $default_currency_code = $this->config->get('config_currency');
    $default_currency = $this->model_localisation_currency->getCurrencyByCode(
      $default_currency_code);
    $has_cents = $this->facebookcommonutils->doesDefaultCurrencySupportCents(
        $default_currency_code,
        $default_currency);
    $store_name = $this->config->get('config_name');

    $params = new FacebookProductFormatterParams(array(
      'configTax' => $config_tax,
      'currencyCode' => $default_currency_code,
      'hasCents' => $has_cents,
      'modelCatalogProduct' => $this->model_catalog_product,
      'storeName' => $store_name,
      'tax' => $this->facebooktax));

    $this->facebookproductapiformatter->setup($params);
    $this->facebookproductfeedformatter->setup($params);
  }

  private function loadFacebookModel($model_name) {
    // attempting to load the model if it is on the same folder path
    $full_model_filename =
      getcwd() . "/model/" . $model_name . ".php";
    $is_facebook_model_loaded = false;
    if (is_file($full_model_filename)) {
      try {
        $this->load->model($model_name);
        $is_facebook_model_loaded = true;
      } catch (Exception $e) {
        $is_facebook_model_loaded = false;
      }
    }

    // unable to load the model
    // this will happen for common models which are placed in
    // the admin folder and shared/re-used in catalog folder (store front)
    // in this case we will explictly load the full name of the model
    if (!$is_facebook_model_loaded) {
      require_once
        DIR_APPLICATION . "../admin/model/" . $model_name . ".php";
      switch ($model_name) {
        case "facebook/facebooksetting":
          $this->model_facebook_facebooksetting =
            new ModelFacebookFacebookSetting($this->registry);
          break;
        case "facebook/facebookproduct":
          $this->model_facebook_facebookproduct =
            new ModelFacebookFacebookProduct($this->registry);
          break;
      }
    }
  }

  private function getFacebookCatalogId() {
    return $this->getFacebookSetting(FacebookCommonUtils::FACEBOOK_CATALOG_ID);
  }

  private function getFacebookPageAccessToken() {
    return $this->getFacebookSetting(FacebookCommonUtils::FACEBOOK_PAGE_TOKEN);
  }

  private function getFacebookExternalMerchantSettings() {
    return $this->getFacebookSetting(
      FacebookCommonUtils::FACEBOOK_DIA_SETTING_ID);
  }

  private function getFacebookPageId() {
    return $this->getFacebookSetting(FacebookCommonUtils::FACEBOOK_PAGE_ID);
  }

  private function getFacebookSetting($setting_key) {
    $this->loadFacebookModel('facebook/facebooksetting');
    $facebook_setting = $this->model_facebook_facebooksetting->getSettings();
    return (isset($facebook_setting[$setting_key]))
      ? $facebook_setting[$setting_key]
      : null;
  }

  private function logError(
    $error_message,
    $error_data,
    $exception_message = null) {
    // logs to local log file
    $this->faeLog->write($error_message);
    // logs to Facebook FAE error end point if access token
    // and merchant settings id are available
    if ($this->getFacebookExternalMerchantSettings()
      && $this->getFacebookPageAccessToken()) {
      $fb_error_log_result = $this->logErrorToFacebook(
        $error_message,
        $error_data);
      $this->faeLog->write(json_encode($fb_error_log_result));
    }
    // throws exception if exception message is passed in
    if ($exception_message) {
      throw new Exception($exception_message);
    }
  }

  private function logErrorToFacebook($error_message, $error_data) {
    $error_data['opencart_plugin_version'] =
      $this->facebookcommonutils->getPluginVersion();
    return $this->facebookgraphapi->fblog(
      $this->getFacebookExternalMerchantSettings(),
      $this->getFacebookPageAccessToken(),
      $error_message,
      $error_data,
      true);
  }

  public function validateFAEAndProductSync($operation, $error_data) {
    // we are not using the getXXX methods to avoid repeated retrieval from DB
    $this->loadFacebookModel('facebook/facebooksetting');
    $facebook_setting = $this->model_facebook_facebooksetting->getSettings();

    // Five step verification

    // 1. Verify if the FAE setup is done
    if (!isset(
      $facebook_setting[FacebookCommonUtils::FACEBOOK_DIA_SETTING_ID])) {
      // FAE not setup so unable to log to API endpoint
      throw new Exception(
        FacebookCommonUtils::FAE_NOT_SETUP_EXCEPTION_MESSAGE);
    }

    // 2. Verify if the access token, page and catalog id exists
    $facebook_page_token =
      $facebook_setting[FacebookCommonUtils::FACEBOOK_PAGE_TOKEN];
    $catalog_id = $facebook_setting[FacebookCommonUtils::FACEBOOK_CATALOG_ID];
    $page_id = $facebook_setting[FacebookCommonUtils::FACEBOOK_PAGE_ID];
    if (!$catalog_id || !$page_id || !$facebook_page_token) {
      $this->logError(
        FacebookCommonUtils::NO_CATALOG_ID_PAGE_ID_ACCESS_TOKEN_ERROR_MESSAGE .
          $operation,
        $error_data,
        FacebookCommonUtils::INITIAL_PRODUCT_SYNC_EXCEPTION_MESSAGE);
    }

    // 3. Verify if the access token is valid
    try {
      $this->isAccessTokenValid($page_id, $facebook_page_token);
    } catch (Exception $e) {
      // not using the error_log as the access token is not valid,
      // hence cant log to fb endpoint
      throw new Exception(
        FacebookCommonUtils::ACCESS_TOKEN_INVALID_EXCEPTION_MESSAGE);
    }

    // 4. Verify if feed id is present
    if (!isset($facebook_setting[FacebookCommonUtils::FACEBOOK_FEED_ID])) {
      $this->logError(
        FacebookCommonUtils::FEED_NOT_CREATED_ERROR_MESSAGE . $operation,
        $error_data,
        FacebookCommonUtils::INITIAL_PRODUCT_SYNC_EXCEPTION_MESSAGE);
    }

    // 5. Verify if upload id is present
    if (!isset($facebook_setting[FacebookCommonUtils::FACEBOOK_UPLOAD_ID])) {
      $this->logError(
        FacebookCommonUtils::UPLOAD_NOT_CREATED_ERROR_MESSAGE . $operation,
        $error_data,
        FacebookCommonUtils::INITIAL_PRODUCT_SYNC_EXCEPTION_MESSAGE);
    }
  }

  private function isAccessTokenValid($page_id, $facebook_page_token) {
    $result = $this->facebookgraphapi->getFacebookPageId(
      $page_id,
      $facebook_page_token);
    return (isset($result['id']));
  }
}
