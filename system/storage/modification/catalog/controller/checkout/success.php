<?php
class ControllerCheckoutSuccess extends Controller {
	public function index() {

$this->load->libraryFB('facebookcommonutils');
$products = $this->cart->getProducts();
if (sizeof($products)) {
$params = new DAPixelConfigParams(array(
'eventName' => 'Purchase',
'products' => $products,
'currency' => $this->currency,
'currencyCode' => $this->session->data['currency'],
'hasQuantity' => true));
$facebook_pixel_event_params_FAE =
$this->facebookcommonutils->getDAPixelParamsForProducts($params);
// stores the pixel params in the session
$this->request->post['facebook_pixel_event_params_FAE'] =
addslashes(json_encode($facebook_pixel_event_params_FAE));
// update the product availability on Facebook
$this->facebookcommonutils->updateProductAvailability(
$this->registry,
$products);
}

			$this->load->model('account/order');

		$this->load->language('checkout/success');

		if (isset($this->session->data['order_id'])) {

      $this->load->model('checkout/order');

        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        $prduct_ids = array();
          foreach ($this->cart->getProducts() as $prducts) {
            $prduct_ids[] = $prducts['product_id'];
          }

        $pixel = "fbq('track', 'Purchase', {
        content_ids: [". implode(',', $prduct_ids) ."],
        content_type: 'product',
        value: ". $order_info['total'] .",
        currency: $this->session->data['currency']
        });";

      $this->document->setPixel($pixel);
      
			
			$this->user = new User($this->registry);
			$this->load->model('checkout/order');
			$data['orderDetails'] = $this->model_checkout_order->getOrder($this->session->data['order_id']);
			$orderDetails = $this->model_checkout_order->getOrder($this->session->data['order_id']);
			$data['orderProduct'] = $this->model_checkout_order->getOrderProduct($this->session->data['order_id']);
			$data['orderProductOptions'] = $this->model_checkout_order->getOrderProductOptions($this->session->data['order_id']);
			$data['orderDetails']['shipping_total'] = (isset($this->session->data['shipping_method']['cost'])) ? $this->session->data['shipping_method']['cost'] : 0;
			$data['ga_tracking_type'] = $this->config->get('config_ga_tracking_type');
			$data['ga_exclude_admin'] = $this->config->get('config_ga_exclude_admin');
			$data['ga_cookie'] = $this->config->get('config_ga_cookie');
			$data['ga_conversion_id'] = $this->config->get('config_ga_conversion_id');
			$data['ga_label'] = $this->config->get('config_ga_label');
			$data['ga_adwords'] = $this->config->get('config_adwords');
			$data['user_logged'] = $this->user->isLogged();
			$data['route'] = $this->request->get['route'];
			//print_r($data);
			
			
			
			
			$message_order = ' {firstname}, Your Order Has been Successfully Placed. Order Id : {order_id} . For Call Support 91 8600718666 www.ornatejewels.com ';
			
				$storename = 'www.ornatejewels.com';
				if($message_order != ""){
					$this->load->model('libraries/jossms');
					$gateway = 'mvaayoo';
					$parsing = array ( '{firstname}', '{lastname}', '{email}', '{telephone}','{order_id}' );
					$replace = array ( $this->db->escape($orderDetails['firstname']), $this->db->escape($orderDetails['lastname']), $this->db->escape($orderDetails['email']), $this->db->escape($orderDetails['telephone']),$this->session->data['order_id'] );
					$pesan = str_replace( $parsing, $replace, $message_order );
					
					$query = $this->db->query("SELECT `iso_code_2` FROM " . DB_PREFIX . "country WHERE country_id = '" . (int)$data['country_id'] . "'");
					$isoc = $query->row['iso_code_2'];
					//print_r($pesan);//exit;
					$phone_number = $this->model_libraries_jossms->getConvertPhonePrefix($this->db->escape($orderDetails['telephone']),$isoc);
					$getresponse = $this->model_libraries_jossms->send_message($phone_number, $pesan, $gateway);
					//echo $getresponse;exit;
				}
			
			
			
			
			
			
			
			
			
			
			
			
			

			/* PersistentCart - Begin */
			$this->load->model('setting/setting');
			$PersistentCart = $this->model_setting_setting->getSetting('PersistentCart', $this->config->get('config_store_id'));
			if (isset($PersistentCart['PersistentCart']['Enabled']) && ($PersistentCart['PersistentCart']['Enabled']=='yes')) {
				if (!$this->customer->isLogged()) {
					if ($PersistentCart['PersistentCart']['CartData'] == 'cookies' || $PersistentCart['PersistentCart']['CartData'] == 'cookies_files') {
						setcookie("persistent_cart", '', time()-10, '/');
					}
					
					if ($PersistentCart['PersistentCart']['CartData'] == 'files' || $PersistentCart['PersistentCart']['CartData'] == 'cookies_files') {
						$ip = $_SERVER['REMOTE_ADDR'];
						$file = (dirname(DIR_APPLICATION)).'/vendors/persistentcart/'.$ip.'.txt';
						if (file_exists($file)) {
							unlink($file);
						}
					}
				}
			}
			/* PersistentCart - End */
			
			$this->cart->clear();

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				if ($this->customer->isLogged()) {
					$activity_data = array(
						'customer_id' => $this->customer->getId(),
						'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
						'order_id'    => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_account', $activity_data);
				} else {
					$activity_data = array(
						'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
						'order_id' => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_guest', $activity_data);
				}
			}

			$order_id = $this->session->data['order_id'];
			
			
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
		}
		
		
	if (isset($order_id)) {
		
		

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', true), $this->url->link('account/order', '', true), $this->url->link('account/download', '', true), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$this->load->model('catalog/product');
		$this->load->model('setting/setting');
		
		
		
		
		$order_info = $this->model_account_order->getOrder($order_id);
		
		$store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);
		
		if ($store_info) {
			$data['store_name'] = $store_info['config_name'];
			$data['store_address'] = $store_info['config_address'];
			$data['store_emal'] = $store_info['config_email'];
			$data['store_tel'] = $store_info['config_telephone'];
		} else {
			$data['store_name'] = $this->config->get('config_name');
			$data['store_address'] = $this->config->get('config_address');
			$data['store_emal'] = $this->config->get('config_email');
			$data['store_tel'] = $this->config->get('config_telephone');
		}
		
		if ($order_info) {
			$this->document->setTitle($this->language->get('text_order'));
		
			$data['text_order_detail'] = $this->language->get('text_order_detail');
			$data['text_invoice_no'] = $this->language->get('text_invoice_no');
			$data['text_order_id'] = $this->language->get('text_order_id');
			$data['text_date_added'] = $this->language->get('text_date_added');
			$data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$data['text_shipping_address'] = $this->language->get('text_shipping_address');
			$data['text_payment_method'] = $this->language->get('text_payment_method');
			$data['text_payment_address'] = $this->language->get('text_payment_address');
			$data['text_history'] = $this->language->get('text_history');
			$data['text_comment'] = $this->language->get('text_comment');
		
			$data['column_name'] = $this->language->get('column_name');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_total'] = $this->language->get('column_total');
			$data['column_action'] = $this->language->get('column_action');
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_comment'] = $this->language->get('column_comment');
		
			$data['button_return'] = $this->language->get('button_return');
			$data['button_reorder'] = $this->language->get('button_reorder');
			$data['button_continue'] = $this->language->get('button_continue');
		
		
			$data['fname']=	$order_info['payment_firstname'];
		
			if ($order_info['invoice_no']) {
				$data['invoice_no'] = $order_info['invoice_prefix'] . $order_info['invoice_no'];
			} else {
				$data['invoice_no'] = '';
			}
		
			if ($order_info['email']) {
				$data['email'] = $order_info['email'];
			} else {
				$data['email'] = '';
			}
		
			$data['order_id'] = $order_id;
			$data['date_added'] = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));
		
			if ($order_info['payment_address_format']) {
				$format = $order_info['payment_address_format'];
			} else {
				$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
			}
		
			$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
			);
		
			$replace = array(
					'firstname' => $order_info['payment_firstname'],
					'lastname'  => $order_info['payment_lastname'],
					'company'   => $order_info['payment_company'],
					'address_1' => $order_info['payment_address_1'],
					'address_2' => $order_info['payment_address_2'],
					'city'      => $order_info['payment_city'],
					'postcode'  => $order_info['payment_postcode'],
					'zone'      => $order_info['payment_zone'],
					'zone_code' => $order_info['payment_zone_code'],
					'country'   => $order_info['payment_country']
			);
		
			$data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
		
			$data['payment_method'] = $order_info['payment_method'];
		
			if ($order_info['shipping_address_format']) {
				$format = $order_info['shipping_address_format'];
			} else {
				$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
			}
		
			$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
			);
		
			$replace = array(
					'firstname' => $order_info['shipping_firstname'],
					'lastname'  => $order_info['shipping_lastname'],
					'company'   => $order_info['shipping_company'],
					'address_1' => $order_info['shipping_address_1'],
					'address_2' => $order_info['shipping_address_2'],
					'city'      => $order_info['shipping_city'],
					'postcode'  => $order_info['shipping_postcode'],
					'zone'      => $order_info['shipping_zone'],
					'zone_code' => $order_info['shipping_zone_code'],
					'country'   => $order_info['shipping_country']
			);
		
			$data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
		
			$data['shipping_method'] = $order_info['shipping_method'];
		
			$data['products'] = array();
		
			$products = $this->model_account_order->getOrderProducts($order_id);
		
			$calc_total=0;
			$parent_category = array();
			foreach ($products as $product) {
				$option_data = array();
		
				$options = $this->model_account_order->getOrderOptions($order_id, $product['order_product_id']);
		
				foreach ($options as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
		
						if ($upload_info) {
							$value = $upload_info['name'];
						} else {
							$value = '';
						}
					}
		
					$option_data[] = array(
							'name'  => $option['name'],
							'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}
		
				$product_info = $this->model_catalog_product->getProduct($product['product_id']);
				
				
					$parent_category_data=$this->model_catalog_product->getProductCategory($product['product_id']);
			//	print_r($parent_category_data);
				
				foreach ($parent_category_data as $category){
				
					if($category['category_id']==114){
						$parent_category[]=$category['category_id'];
					
					}
				
				}
				
				
				if ($product_info) {
					$reorder = $this->url->link('account/order/reorder', 'order_id=' . $order_id . '&order_product_id=' . $product['order_product_id'], 'SSL');
				} else {
					$reorder = '';
				}
				$sum=$product['price']*$product['quantity'];
				$calc_total = $calc_total + $sum;
				$unit_price = $this->tax->calculate($product['price'], $product['tax'], $this->config->get('config_tax'));
				$total1 = $unit_price * $product['quantity'];
				
				//$data['total1'] = $unit_price * $product['quantity'];
				
				
				$data['products'][] = array(
						'product_id'     => $product['product_id'],
						'name'     => $product['name'],
						'model'    => $product['model'],
						'option'   => $option_data,
						'quantity' => $product['quantity'],
						'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
						'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
						'total1'     => $total1,
						'reorder'  => $reorder,
						'return'   => $this->url->link('account/return/add', 'order_id=' . $order_info['order_id'] . '&product_id=' . $product['product_id'], 'SSL')
				);
			}
		
			
			
			// Voucher
			$data['vouchers'] = array();
		
			$vouchers = $this->model_account_order->getOrderVouchers($order_id);
		
			foreach ($vouchers as $voucher) {
				$data['vouchers'][] = array(
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value'])
				);
			}
		
			// Totals
			$data['totals'] = array();
		
			$totals = $this->model_account_order->getOrderTotals($order_id);
		
			foreach ($totals as $total) {
				$data['totals'][] = array(
						'title' => $total['title'],
						'text'  => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']),
				);
			}
		
			$data['comment'] = nl2br($order_info['comment']);
		
			// History
			$data['histories'] = array();
		//add Cash back to wallet
			$calc_credit= $calc_total / 100 * 50;
			
			$customer_id = $this->customer->getId();
			
			
			$cashback_details=$this->model_account_order->getCreditDetails($customer_id);
			
			if(!$cashback_details){
			if(!empty($parent_category)){
			
			//$add_credit=$this->model_account_order->addCredit($calc_credit,$order_id);
			 
			}
			}
			
			$results = $this->model_account_order->getOrderHistories($order_id);
		
			foreach ($results as $result) {
				$data['histories'][] = array(
						'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
						'status'     => $result['status'],
						'comment'    => $result['notify'] ? nl2br($result['comment']) : ''
				);
			}
		
			$data['continue'] = $this->url->link('account/order', '', 'SSL');
		}
		
		
		
		
		
		
	
		
		
		
		

		/* AbandonedCarts - Begin */
			$this->load->model('setting/setting');

			$abandonedCartsSettings = $this->model_setting_setting->getSetting('abandonedcarts', $this->config->get('store_id'));

				if (isset($abandonedCartsSettings['abandonedcarts']['Enabled']) && $abandonedCartsSettings['abandonedcarts']['Enabled']=='yes') { 
					if (isset($this->session->data['abandonedCart_ID']) & !empty($this->session->data['abandonedCart_ID'])) {
						$id = $this->session->data['abandonedCart_ID'];
					} else if ($this->customer->isLogged()) {
						$id = (!empty($this->session->data['abandonedCart_ID'])) ? $this->session->data['abandonedCart_ID'] : $this->customer->getEmail();
					} else {
						$id = (!empty($this->session->data['abandonedCart_ID'])) ? $this->session->data['abandonedCart_ID'] : session_id();
				}

				$exists = $this->db->query("SELECT * FROM `" . DB_PREFIX . "abandonedcarts` WHERE `restore_id` = '$id' AND `ordered`=0");
					if (!empty($exists->rows)) {
						foreach ($exists->rows as $row) {
							if ($row['notified']!=0) {
								$this->db->query("UPDATE `" . DB_PREFIX . "abandonedcarts` SET `ordered` = 1 WHERE `restore_id` = '".$id."'");
							} else if ($row['notified']==0) {
								$this->db->query("DELETE FROM `" . DB_PREFIX . "abandonedcarts` WHERE `restore_id` = '$id' AND `id`='".$row['id']."'");
							}
						}
						$this->session->data['abandonedCart_ID']='';
						unset($this->session->data['abandonedCart_ID']);
					}
			}
/* AbandonedCarts - End */
		
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
		
		
			$this->response->setOutput($this->load->view('common/success', $data));
		
	} else {
			
		//	echo "hhh";
		//	$this->session->data['redirect'] = $this->url->link('account/order', '', true);
			
			$this->response->redirect($this->url->link('account/order', '', true));
	    }
		
	}
}