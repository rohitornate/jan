<?php
class ModelExtensionTotalGiftTeaser extends Model { 

	private $moduleName;
	private $moduleTotal2;
    private $modulePath;
	private $moduleVersion;
    private $extensionsLink;
    private $error = array(); 
    private $data = array();

    public function __construct($registry) {
        parent::__construct($registry);
        
        // Config Loader
        $this->config->load('isenselabs/giftteaser');
        
        // Module Constants
        $this->moduleName           = $this->config->get('giftteaser_name');
        $this->moduleTotal2      	= $this->config->get('giftteaser_total2');
		$this->moduleName           = $this->config->get('giftteaser_name');
        $this->modulePath           = $this->config->get('giftteaser_path');
		$this->totalPath         	= $this->config->get('giftteaser_total_path2');
	    $this->moduleVersion        = $this->config->get('giftteaser_version');   
		$this->moduleData_module    = $this->config->get('giftteaser_module_data');        

        // Load Language
        $this->load->language($this->totalPath);

        // Global Variables      
        $this->data['moduleName']  		 = $this->moduleName;
        $this->data['modulePath']   	 = $this->modulePath;
		$this->data['feedPath']   	 	 = $this->feedPath;
		$this->data['moduleData_module'] = $this->moduleData_module;
    }
	
  public function getTotal($totals) {
	 $total = &$totals['total'];
	 $taxes = &$totals['taxes'];
	 $total_data = &$totals['totals'];

    $this->load->model('setting/setting');

    $setting = $this->model_setting_setting->getSetting($this->moduleName, $this->config->get('config_store_id'));

    if($setting[$this->moduleName]['Enabled'] && $setting[$this->moduleName]['Enabled'] == 'yes' ) {
      $amount = 0;

      $title = $this->language->get('text_gift_teaser');
      $text_refresh_gifts = $this->language->get('text_refresh_gifts');

      if (!empty($this->session->data['gift_teaser_exclude'])) {

        if (!empty($this->request->get['route']) && $this->request->get['route'] == 'module/cart') {
          $title .= ' (<a onclick="jQuery.ajax({url:\'index.php?route='.$this->modulePath.'/refresh_gifts\', success: function() { location = location; }});">' . $text_refresh_gifts . '</a>)';
        } else if (!empty($this->request->get['route']) && stripos($this->request->get['route'], 'cart') !== false) {
          $title .= ' (<a onclick="jQuery.ajax({url:\'index.php?route='.$this->modulePath.'/refresh_gifts\', success: function() { location = location; }});">' . $text_refresh_gifts . '</a>)';
        }
      }

      $cart_products = $this->cart->getProducts(); 
	  $show = false;
      foreach ($cart_products as $key => $cart_product) {
        if (!empty($cart_product['gift_teaser'])) {
          $amount += $cart_product['quantity'] * (float)$this->tax->calculate($cart_product['real_price'], $cart_product['real_tax_class_id'], $this->config->get('config_tax'));
	      $show = true;
        }
      }
	  
	  $total -= 0;
	  
		if ($show==true || !empty($this->session->data['gift_teaser_exclude'])) {
		  $total_data[] = array(
			'code'       => $this->moduleTotal2,
			'title'      => $title,
			'text'       => '' . $this->currency->format($amount, $this->config->get('config_currency')),
			'value'      => $amount,
			'sort_order' => $this->config->get($this->moduleTotal2.'_sort_order')
		  );
		}
    }
  }

}
?>