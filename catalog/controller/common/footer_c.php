<?php
class Controllercommonfooterc extends Controller {
	public function index() {
            $link_array = explode('/',$_SERVER['QUERY_STRING']);
                $data['end'] = end($link_array);
                //search autocomplete
                $this->load->language('product/search');
                $data['text_empty'] = $this->language->get('text_empty');

            	$data['text_view_all_results'] = $this->config->get('live_search_view_all_results')[$this->config->get('config_language_id')]['name'];
                $data['live_search_ajax_status'] = $this->config->get('live_search_ajax_status');
                $data['live_search_show_image'] = $this->config->get('live_search_show_image');
                $data['live_search_show_price'] = $this->config->get('live_search_show_price');
                $data['live_search_show_description'] = $this->config->get('live_search_show_description');
                $data['live_search_href'] = $this->url->link('product/search', 'search=');
                $data['live_search_min_length'] = $this->config->get('live_search_min_length');
                //search autocomplete end
                
		$this->load->language('common/footer');
		
		
		/* AbandonedCarts - Begin */
		$this->load->model('setting/setting');

		$abandonedCartsSettings = $this->model_setting_setting->getSetting('abandonedcarts', $this->config->get('store_id'));

		if (isset($abandonedCartsSettings['abandonedcarts']['Enabled']) && $abandonedCartsSettings['abandonedcarts']['Enabled']=='yes') { 
		$this->register_abandonedCarts();
		}
		/* AbandonedCarts - End */
		
		

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer_c', $data);
	}
	/* AbandonedCarts - Begin */
protected function register_abandonedCarts() {

    $ip = (!empty($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : '*HiddenIP*';
    if (isset($_SERVER["HTTP_CF_CONNECTING_IP"])) {
        $ip = $_SERVER["HTTP_CF_CONNECTING_IP"];
    }
    
    if (isset($this->session->data['abandonedCart_ID']) & !empty($this->session->data['abandonedCart_ID'])) {
        $id = $this->session->data['abandonedCart_ID'];
    } else if ($this->customer->isLogged()) {
        $id = (!empty($this->session->data['abandonedCart_ID'])) ? $this->session->data['abandonedCart_ID'] : $this->customer->getEmail();
    } else {
        $id = (!empty($this->session->data['abandonedCart_ID'])) ? $this->session->data['abandonedCart_ID'] : session_id();
    }

    $exists = $this->db->query("SELECT * FROM `" . DB_PREFIX . "abandonedcarts` WHERE `restore_id` = '$id' AND `ordered`=0");
    $cart = $this->cart->getProducts();
    $store_id = (int)$this->config->get('config_store_id');
    $cart = (!empty($cart)) ? $cart : '';
    
    $lastpage = "$_SERVER[REQUEST_URI]";
    
    $checker = $this->customer->getId();
    if (!empty($checker)) {
        $customer = array(
            'id'        => $this->customer->getId(), 
            'email'     => $this->customer->getEmail(),		
            'telephone' => $this->customer->getTelephone(),
            'firstname' => $this->customer->getFirstName(),
            'lastname'  => $this->customer->getLastName(),
            'language'  => $this->session->data['language']
        );
    } 

    $route = isset($this->request->get['route']) ? $this->request->get['route'] : '';
    if ($route!='checkout/success') {
      if (empty($exists->row)) {
          if (!empty($cart)) {
              if (!isset($customer)) {
                  $customer = array(
                      'language' => $this->session->data['language']
                  );
              }
              $cart = json_encode($cart);
              $customer = (!empty($customer)) ? json_encode($customer) : '';
              $this->db->query("INSERT INTO `" . DB_PREFIX . "abandonedcarts` SET `cart`='".$this->db->escape($cart)."', `customer_info`='".$this->db->escape($customer)."', `last_page`='$lastpage', `ip`='$ip', `date_created`=NOW(), `date_modified`=NOW(), `restore_id`='".$id."', `store_id`='".$store_id."'");
              $this->session->data['abandonedCart_ID'] = $id;
          } 
      } else {
          if (!empty($cart)) {
              $cart = json_encode($cart);
              $this->db->query("UPDATE `" . DB_PREFIX . "abandonedcarts` SET `cart` = '".$this->db->escape($cart)."', `last_page`='".$this->db->escape($lastpage)."', `date_modified`=NOW() WHERE `restore_id`='$id'");
          }
          if (isset($customer)) {
              $customer = json_encode($customer);
              $this->db->query("UPDATE `" . DB_PREFIX . "abandonedcarts` SET `customer_info` = '".$this->db->escape($customer)."', `last_page`='".$this->db->escape($lastpage)."', `date_modified`=NOW() WHERE `restore_id`='$id'");
          }
      }
    }
}
/* AbandonedCarts - End */
}
