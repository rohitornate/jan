<?php
class ControllerCheckoutCart extends Controller {
	
	/* AbandonedCarts - Begin */
	private function update_abandonedCarts() {

    $this->load->model('setting/setting');
    
    $abandonedCartsSettings = $this->model_setting_setting->getSetting('abandonedcarts', $this->config->get('store_id'));
    $abandonedCartsSettings = isset($abandonedCartsSettings['abandonedcarts']) ? $abandonedCartsSettings['abandonedcarts'] : array();
    
    if ($abandonedCartsSettings['Enabled']=='yes') {
			if (isset($this->session->data['abandonedCart_ID']) & !empty($this->session->data['abandonedCart_ID'])) {
				$id = $this->session->data['abandonedCart_ID'];
			} else if ($this->customer->isLogged()) {
				$id = (!empty($this->session->data['abandonedCart_ID'])) ? $this->session->data['abandonedCart_ID'] : $this->customer->getEmail();
			} else {
				$id = (!empty($this->session->data['abandonedCart_ID'])) ? $this->session->data['abandonedCart_ID'] : session_id();
			}

			$ABcart = $this->cart->getProducts();

			$exists = $this->db->query("SELECT * FROM `" . DB_PREFIX . "abandonedcarts` WHERE `restore_id` = '$id' AND `ordered`=0");

			if (!empty($exists->row) && empty($ABcart)) {
				$this->db->query("DELETE FROM `" . DB_PREFIX . "abandonedcarts` WHERE `restore_id` = '$id'");
				$this->session->data['abandonedCart_ID']=''; 
				unset($this->session->data['abandonedCart_ID']);
			} else if (!empty($exists->row) && !empty($ABcart))	{
				$cart = json_encode($ABcart);
				$this->db->query("UPDATE `" . DB_PREFIX . "abandonedcarts` SET `cart` = '".$this->db->escape($cart)."', `date_modified`=NOW() WHERE `restore_id`='$id'");
			}
		}
	}

	private function register_abandonedCarts() {
		$this->load->model('setting/setting');
		$abandonedCartsSettings = $this->model_setting_setting->getSetting('abandonedcarts', $this->config->get('store_id'));
		if (isset($abandonedCartsSettings['abandonedcarts']['Enabled']) && $abandonedCartsSettings['abandonedcarts']['Enabled']=='yes') { 
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
	
	

			protected function register_persistentCart() {
			
				$this->load->model('setting/setting');
				$data = $this->model_setting_setting->getSetting('PersistentCart', $this->config->get('config_store_id'));
				if (isset($data['PersistentCart']['Enabled']) && ($data['PersistentCart']['Enabled']=='yes')) {
					if (!$this->customer->isLogged()) {
						if ($data['PersistentCart']['CartData'] == 'cookies' || $data['PersistentCart']['CartData'] == 'cookies_files') {
							setcookie("persistent_cart", '', time()-10, '/');
						}
						
						if ($data['PersistentCart']['CartData'] == 'files' || $data['PersistentCart']['CartData'] == 'cookies_files') {
							$ip = (!empty($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : '0.0.0.0';
							$file = (dirname(DIR_APPLICATION)).'/vendors/persistentcart/'.$ip.'.txt';
							if (file_exists($file)) {
								unlink($file);
							}
						}
					}
				}
			}
			
			protected function log_persistentCart() {
				$this->load->model('setting/setting');
				$data = $this->model_setting_setting->getSetting('PersistentCart', $this->config->get('config_store_id'));
				if (isset($data['PersistentCart']['Enabled']) && ($data['PersistentCart']['Enabled']=='yes')) {
					if (!$this->customer->isLogged()) {
						if ($data['PersistentCart']['CartData'] == 'cookies' || $data['PersistentCart']['CartData'] == 'cookies_files') {
							if (isset($_COOKIE['persistent_cart']) && (empty($this->session->data['cart']))) {
								$cart = unserialize(base64_decode($_COOKIE['persistent_cart']));
								foreach ($cart as $key => $value) {
									if (!array_key_exists($key, $this->session->data['cart'])) {
										$this->session->data['cart'][$key] = $value;
									} else {
										$this->session->data['cart'][$key] += $value;
									}
								}
							}  
							
							if (!empty($this->session->data['cart'])) {
								$cart = base64_encode(serialize($this->session->data['cart']));
								setcookie("persistent_cart", $cart, strtotime('+'.$data['PersistentCart']['Limit'].'days'), '/');
							}
						}
						
						if ($data['PersistentCart']['CartData'] == 'files' || $data['PersistentCart']['CartData'] == 'cookies_files') {
							$ip = (!empty($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : '0.0.0.0';
							$folder = (dirname(DIR_APPLICATION)).'/vendors/persistentcart/'.$ip.'.txt';
							if (file_exists($folder)) {
								if (empty($this->session->data['cart'])) {
									$file_cont = file_get_contents($folder);
									$cart = unserialize(base64_decode($file_cont));
									foreach ($cart as $key => $value) {
										if (!array_key_exists($key, $this->session->data['cart'])) {
											$this->session->data['cart'][$key] = $value;
										} else {
											$this->session->data['cart'][$key] += $value;
										}
									}
								}
							} 
							
							if (!empty($this->session->data['cart'])) {
								$cart = base64_encode(serialize($this->session->data['cart']));
								$file_cart = 'empty';
								if (file_exists($folder)) {
									$file_cart = file_get_contents($folder);
								}
								if ($cart!=$file_cart) {
									$fp = fopen($folder,"wb");
									fwrite($fp,$cart);
									fclose($fp);
								}
							}
						}
						
						if (($data['PersistentCart']['CartData'] == 'files') || ($data['PersistentCart']['CartData'] == 'cookies_files')) {
							$folder = (dirname(DIR_APPLICATION)).'/vendors/persistentcart/';
							$files = scandir($folder);
							if (sizeof($files)>0) {
								foreach($files as $file) {
									if ($file!='.' && $file!='..' && file_exists($folder.$file)) {
										$days = filectime($folder.$file)+($data['PersistentCart']['Limit']*86400);
										if (time()>$days) {
											unlink($folder.$file);
										}
									}
								}
							}
						}
					}
				}
			}
			
	public function index() {
            $link_array = explode('/',$_SERVER['QUERY_STRING']);
                $data['end'] = end($link_array);
		$this->load->language('checkout/cart');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/home'),
			'text' => $this->language->get('text_home')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('checkout/cart'),
			'text' => $this->language->get('heading_title')
		);

		if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {
			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_recurring_item'] = $this->language->get('text_recurring_item');
			$data['text_next'] = $this->language->get('text_next');
			$data['text_next_choice'] = $this->language->get('text_next_choice');

			$data['column_image'] = $this->language->get('column_image');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_total'] = $this->language->get('column_total');

			$data['button_update'] = $this->language->get('button_update');
			$data['button_remove'] = $this->language->get('button_remove');
			$data['button_shopping'] = $this->language->get('button_shopping');
			$data['button_checkout'] = $this->language->get('button_checkout');

			if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
				$data['error_warning'] = $this->language->get('error_stock');
			} elseif (isset($this->session->data['error'])) {
				$data['error_warning'] = $this->session->data['error'];

				unset($this->session->data['error']);
			} else {
				$data['error_warning'] = '';
			}

			if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
				$data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
			} else {
				$data['attention'] = '';
			}

			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}

			$data['action'] = $this->url->link('checkout/cart/edit', '', true);

			if ($this->config->get('config_cart_weight')) {
				$data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$data['weight'] = '';
			}

			$this->load->model('tool/image');
			$this->load->model('tool/upload');
			$this->load->model('catalog/product');

			$data['products'] = array();

			$products = $this->cart->getProducts();

$this->load->libraryFB('facebookcommonutils');
if (sizeof($products)) {
$params = new DAPixelConfigParams(array(
'eventName' => 'AddToCart',
'products' => $products,
'currency' => $this->currency,
'currencyCode' => $this->session->data['currency'],
'hasQuantity' => true));
$facebook_pixel_event_params_FAE =
$this->facebookcommonutils->getDAPixelParamsForProducts($params);
// stores the pixel params in the session
$this->request->post['facebook_pixel_event_params_FAE'] =
addslashes(json_encode($facebook_pixel_event_params_FAE));
}


			foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}

				$option_data = array();

				foreach ($product['option'] as $option) {
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
                                $allPrice = $this->model_catalog_product->getAllPrice($product['product_id']);
                              //  echo '<pre>'; print_r($allPrice); die();
				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
                                        if($allPrice){
                                        $custom_price = $this->currency->format($allPrice['price'], $this->session->data['currency']);
                                        $custom_special = $this->currency->format($allPrice['special'], $this->session->data['currency']);
                                        $discount = $allPrice['price']-$allPrice['special'];
                                        $custom_discount = $this->currency->format($discount, $this->session->data['currency']);
                                        $spclwithformat = $allPrice['special'];
                                        }else{
                                            $custom_price=false;
                                            $custom_special=false;
                                            $discount=false;
                                            $custom_discount=false;
                                            $spclwithformat=false;
                                        }
					$price = $this->currency->format($unit_price, $this->session->data['currency']);
					$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
					$total1 = $unit_price * $product['quantity'];
				} else {
					$price = false;
					$total = false;
					$total1 = false;
				}

				$recurring = '';

				if ($product['recurring']) {
					$frequencies = array(
						'day'        => $this->language->get('text_day'),
						'week'       => $this->language->get('text_week'),
						'semi_month' => $this->language->get('text_semi_month'),
						'month'      => $this->language->get('text_month'),
						'year'       => $this->language->get('text_year'),
					);

					if ($product['recurring']['trial']) {
						$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
					}

					if ($product['recurring']['duration']) {
						$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					} else {
						$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					}
				}
				
				
				$data['products'][] = array(
					'cart_id'   => $product['cart_id'],
					'product_id'   => $product['product_id'],
					'thumb'     => $image,
					
					'name'      => $product['name'],
					'model'     => $product['model'],
					'option'    => $option_data,
					'recurring' => $recurring,
					'quantity'  => $product['quantity'],
					'stock'     => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					'reward'    => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					'price'     => $price,
                                        'custom_price'=>$custom_price,
                                        'custom_special'=>$custom_special,
                                        'custom_special_withoutformat'=>$spclwithformat,
                                        'custom_discount'=>$custom_discount,
					'total'     => $total,
					'total1'     => $total1,
					'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
			}

			
			
			if (isset($this->request->post['coupon'])) {
				$data['coupon'] = $this->request->post['coupon'];			
			} elseif (isset($this->session->data['coupon'])) {
				$data['coupon'] = $this->session->data['coupon'];
			} else {
				$data['coupon'] = '';
			}
			
			if (isset($this->request->post['coupon_value'])) {
				$data['coupon_value'] = $this->request->post['coupon_value'];			
			} elseif (isset($this->session->data['coupon_value'])) {
				$data['coupon_value'] = $this->session->data['coupon_value'];
			} else {
				$data['coupon_value'] = '';
			}
			if(isset($this->session->data['coupon'])){
				$data['removeIcon']='1';
            }else{
                $data['removeIcon']='0';
            }
			
			// Gift Voucher
			$data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency']),
						'remove'      => $this->url->link('checkout/cart', 'remove=' . $key)
					);
				}
			}

			// Totals
			$this->load->model('extension/extension');

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;
			
			// Because __call can not keep var references so we put them into an array. 			
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			
			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);
						
						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}

				$sort_order = array();

				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $totals);
			}

			$data['totals'] = array();

			foreach ($totals as $total) {
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
				);
			}

			
				
		/** OSWorX replaced */
		$data['continue'] = $this->getLastViewed();
            	
			

			$data['checkout'] = $this->url->link('checkout/checkout', '', true);

			$this->load->model('extension/extension');

			$data['modules'] = array();
			
			$files = glob(DIR_APPLICATION . '/controller/extension/total/*.php');

			if ($files) {
				foreach ($files as $file) {
					$result = $this->load->controller('extension/total/' . basename($file, '.php'));
					
					if ($result) {
						$data['modules'][] = $result;
					}
				}
			}

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('checkout/cart', $data));
		} else {
			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_error'] = $this->language->get('text_empty');

			$data['button_continue'] = $this->language->get('button_continue');

			
				
		/** OSWorX replaced */
		$data['continue'] = $this->getLastViewed();
            	
			

			unset($this->session->data['success']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function add() {
//echo '<pre>'; print_r($this->request->post); die();
		$this->load->language('checkout/cart');

		$json = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = (int)$this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if (isset($this->request->post['quantity']) && ((int)$this->request->post['quantity'] >= $product_info['minimum'])) {
				$quantity = (int)$this->request->post['quantity'];
			} else {
				$quantity = $product_info['minimum'] ? $product_info['minimum'] : 1;
			}
			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();
			}

			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

			foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
					$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}

			if (isset($this->request->post['recurring_id'])) {
				$recurring_id = $this->request->post['recurring_id'];
			} else {
				$recurring_id = 0;
			}

			$recurrings = $this->model_catalog_product->getProfiles($product_info['product_id']);

			if ($recurrings) {
				$recurring_ids = array();

				foreach ($recurrings as $recurring) {
					$recurring_ids[] = $recurring['recurring_id'];
				}

				if (!in_array($recurring_id, $recurring_ids)) {
					$json['error']['recurring'] = $this->language->get('error_recurring_required');
				}
			}

			if (!$json) {
				if(isset($this->session->data['cart'])) {
$oldCart = $this->session->data['cart']; 
}
$this->cart->add($this->request->post['product_id'], $quantity, $option, $recurring_id);
				/*
				 // BOF - Betaout Opencart mod
                $this->load->model('tool/betaout');
                                //$this->model_tool_betaout->track();
                $this->model_tool_betaout->trackEcommerceCartUpdate();
                // EOF - Betaout Opencart mod
				*/

				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/cart'));

$this->load->model('setting/setting');
$giftTeaser = $this->model_setting_setting->getSetting('giftteaser', $this->config->get('config_store_id'));
if (empty($giftTeaser['giftteaser']['Enabled']) || $giftTeaser['giftteaser']['Enabled'] == 'no') { } else {
$this->load->language('extension/module/giftteaser');
$addition = '';
foreach ($this->cart->getProducts() as $key => $val) {
if (!empty($val['gift_teaser']) && $val['gift_teaser']==true ) {
if (!isset($this->session->data['success_addition'])) {
$addition = $this->language->get('gift_added_to_cart');
}
}
}	
$json['success'] .= $addition;	
}

$this->register_abandonedCarts();
				// Unset all shipping and payment methods
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);

				// Totals
				$this->load->model('extension/extension');

				$totals = array();
				$taxes = $this->cart->getTaxes();
				$total = 0;
		
				// Because __call can not keep var references so we put them into an array. 			
				$total_data = array(
					'totals' => &$totals,
					'taxes'  => &$taxes,
					'total'  => &$total
				);

				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$sort_order = array();

					$results = $this->model_extension_extension->getExtensions('total');

					foreach ($results as $key => $value) {
						$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
					}

					array_multisort($sort_order, SORT_ASC, $results);

					foreach ($results as $result) {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('extension/total/' . $result['code']);

							// We have to put the totals in an array so that they pass by reference.
							$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
						}
					}

					$sort_order = array();

					foreach ($totals as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}

					array_multisort($sort_order, SORT_ASC, $totals);
				}

				$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function edit() {
		$this->load->language('checkout/cart');

		$json = array();

		// Update
		if (!empty($this->request->post['quantity'])) {
			foreach ($this->request->post['quantity'] as $key => $value) {
				$this->cart->update($key, $value);
				/*
				// BOF - Betaout Opencart mod
                            $this->load->model('tool/betaout');
                            $this->model_tool_betaout->track();
            // EOF - Betaout Opencart mod
			
			*/
			}

			$this->session->data['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);
$this->checkGifts();
			$this->update_abandonedCarts();

			$this->response->redirect($this->url->link('checkout/cart'));
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}


public function giftTeaserOptions() {
$this->language->load('extension/module/giftteaser');
$this->load->model('catalog/product');
$this->load->model('tool/image');
$this->document->addStyle('catalog/view/theme/default/stylesheet/giftteaser.css');
$product_info= $this->model_catalog_product->getProduct($this->request->get['product_id']);
$product_options = $this->model_catalog_product->getProductOptions($this->request->get['product_id']);
if ($product_info['image']) {
$image = $this->model_tool_image->resize($product_info['image'], 80, 80);
} else {
$image = false;
}
if ($this->config->get('config_review_status')) {
$rating = (int)$product_info['rating'];
} else {
$rating = false;
}
$product_options = $this->model_catalog_product->getProductOptions($product_info['product_id']);
$data['options'] = array();
foreach ($product_options as $option) { 
if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') { 
$option_value_data = array();
foreach ($option['product_option_value'] as $option_value) {
if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
} else {
$price = false;
}
$option_value_data[] = array(
'product_option_value_id' => $option_value['product_option_value_id'],
'option_value_id'         => $option_value['option_value_id'],
'name'                    => $option_value['name'],
'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
);
}
}
$data['options'][] = array(
'product_option_id' => $option['product_option_id'],
'option_id'         => $option['option_id'],
'name'              => $option['name'],
'type'              => $option['type'],
'option_value'      => $option_value_data,
'required'          => $option['required']
);                  
} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
$data['options'][] = array(
'product_option_id' => $option['product_option_id'],
'option_id'         => $option['option_id'],
'name'              => $option['name'],
'type'              => $option['type'],
'option_value'      => $option['option_value'],
'required'          => $option['required']
);                      
}
}
$data['gift'] = array(
'product_id' => $product_info['product_id'],
'thumb'      => $image,
'name'       => $product_info['name'],
'rating'     => $rating,
'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
'href'       => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
'options' => $data['options']
);
$data['text_select'] = $this->language->get('text_select');
$data['text_option'] = $this->language->get('text_option');
$data['text_option_heading'] =  $this->language->get('gift_added_to_cart');
$data['heading_title'] = $this->language->get('heading_title');
$data['button_cart'] = $this->language->get('button_cart');
$data['Continue'] = $this->language->get('Continue');
if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
$data['data']['giftTeaser'] = str_replace('http', 'https', $this->config->get('giftteaser'));
} else {
$data['data']['giftTeaser'] = $this->config->get('giftteaser');
}
$this->response->setOutput($this->load->view('extension/module/giftteaser/giftteaser_options', $data));
}
public function checkGifts() { 
$this->load->model('extension/module/giftteaser');
$json = $this->model_extension_module_giftteaser->checkGifts();
$this->response->setOutput(json_encode($json));   
}
public function GiftAdd() { 
$this->language->load('checkout/cart');
$json = array();
if (isset($this->request->post['product_id'])) {
$product_id = $this->request->post['product_id'];
} else {
$product_id = 0;
}
$this->load->model('catalog/product');
$product_info = $this->model_catalog_product->getProduct($product_id);
if ($product_info) {            
if (isset($this->request->post['quantity'])) {
$quantity = $this->request->post['quantity'];
} else {
$quantity = 1;
}
if (isset($this->request->post['option'])) {
$option = array_filter($this->request->post['option']);
} else {
$option = array();  
}
if (isset($this->request->post['recurring_id'])) {
$recurring_id = $this->request->post['recurring_id'];
} else {
$recurring_id = 0;
}
$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);
foreach ($product_options as $product_option) {
if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
}
}
$recurrings = $this->model_catalog_product->getProfiles($product_info['product_id']);
if ($recurrings) {
$recurring_ids = array();
foreach ($recurrings as $recurring) {
$recurring_ids[] = $recurring['recurring_id'];
}
if (!in_array($recurring_id, $recurring_ids)) {
$json['error']['recurring'] = $this->language->get('error_recurring_required');
}
}
if (!$json) { 
$this->cart->prepareGiftTeaserArg($gift = true);
$this->cart->add($this->request->post['product_id'], $quantity, $option, $recurring_id);
$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/cart'));
$this->load->model('extension/module/giftteaser');
$this->load->model('setting/setting');
$giftTeaser = $this->model_setting_setting->getSetting('giftteaser', $this->config->get('config_store_id'));
if (empty($giftTeaser['giftteaser']['Enabled']) || $giftTeaser['giftteaser']['Enabled'] == 'no') { } else {
$this->load->language('extension/module/giftteaser');
$prods = $this->cart->getProducts(); 
$addition = '';
foreach ($prods as $prod) {
if ($prod['gift_teaser']==true && !isset($this->session->data['gift_teaser_success'])) {
$addition = $this->language->get('gift_added_to_cart');
$this->session->data['gift_teaser_success'] = true;
}
}
if(isset($json['success'])) {
$json['success'] .= $addition;
}   
}
unset($this->session->data['shipping_method']);
unset($this->session->data['shipping_methods']);
unset($this->session->data['payment_method']);
unset($this->session->data['payment_methods']);
} else {
$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
}
}
$this->response->setOutput(json_encode($json));       
}

	public function remove() {
		$this->load->language('checkout/cart');

		$json = array();

		// Remove
		if (isset($this->request->post['key'])) {
			$this->cart->remove($this->request->post['key']);

			/* PersistentCart - Begin */
			$this->load->model('setting/setting');
			$PersistentCart = $this->model_setting_setting->getSetting('PersistentCart', $this->config->get('config_store_id'));
			if (isset($PersistentCart['PersistentCart']) && $PersistentCart['PersistentCart']['Enabled']=='yes') {
				$this->register_persistentCart();
			}
			/* PersistentCart - End */
			
			
			/*
			 // BOF - Betaout Opencart mod
            $this->load->model('tool/betaout');
            $this->model_tool_betaout->trackEcommerceCartUpdate();
            // EOF - Betaout Opencart mod
			*/
			$this->update_abandonedCarts();

			unset($this->session->data['vouchers'][$this->request->post['key']]);

			$json['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);
$this->checkGifts();

			// Totals
			$this->load->model('extension/extension');

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array. 			
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);

						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}

				$sort_order = array();

				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $totals);
			}

			$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
