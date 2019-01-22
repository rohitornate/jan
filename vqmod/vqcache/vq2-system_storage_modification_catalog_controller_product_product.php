<?php
class ControllerProductProduct extends Controller {
	private $error = array();

	public function index() {

				
		/** + OSWorX */
		$this->setLastViewed();
    			
			
		$this->load->language('product/product');
		
		if(isset($this->request->get['product_id'])){
				$recent_product = array();
				$recent_product[]=$this->request->get['product_id'];

				$this->session->data['recent_product_id'][]=$recent_product;
				foreach ($this->session->data['recent_product_id'] as $key => $value) {
				$recent_product[]=$value[0];
				}
				setcookie('recent_product', json_encode($recent_product), time()+31104000);
				//unset($this->session->data['recent_product_id']);	
		}
		

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
$data['config_telephone'] = $this->config->get('config_telephone');
		$this->load->model('catalog/category');

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
                
		$this->load->model('catalog/product');

                $havequestion = $this->model_catalog_product->gethavequestion($product_id);
               // echo '<pre>'; print_r($havequestion); die();
                foreach($havequestion as $questions){
                    $date = $questions['date_added'];
                    $month = date("M",strtotime($date)); 
                    $data['haveaquestion'][] = array(
                        'question'=>$questions['detail'],
                        'answer'=>$questions['answer'],
                        'month'=>$month,
                    );
                }

		$product_info = $this->model_catalog_product->getProduct($product_id);
//print_r($product_info);
		if ($product_info) {

$this->load->libraryFB('facebookcommonutils');
$params = new DAPixelConfigParams(array(
'eventName' => 'ViewContent',
'products' => array($product_info),
'currency' => $this->currency,
'currencyCode' => $this->session->data['currency'],
'hasQuantity' => false));
$facebook_pixel_event_params_FAE =
$this->facebookcommonutils->getDAPixelParamsForProducts($params);
// stores the pixel event params in the session
$this->request->post['facebook_pixel_event_params_FAE'] =
addslashes(json_encode($facebook_pixel_event_params_FAE));

			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				//'text' => $product_info['name'],
				
				'text' => utf8_substr(strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')), 0, 27) . '..',
				
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

$extendedseo = $this->config->get('extendedseo');
			$this->document->setTitle(((isset($category_info['name']) && isset($extendedseo['categoryintitle']) )?($category_info['name'].' : '):'').($product_info['meta_title']?$product_info['meta_title']:$product_info['name']));
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);

  		$pixel = "fbq('track', 'ViewContent', {
        content_ids: ['".$this->request->get['product_id']."'],
        content_type: 'product',
        value: ".$product_info['price'].",
        currency: '".$this->session->data['currency']."'
        });";

      $this->document->setPixel($pixel);
  		
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addOGMeta('property="og:url"', $this->url->link('product/product', 'product_id=' . $this->request->get['product_id']) );
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
		
			$data['logged'] = $this->customer->isLogged();
			$data['firstname'] = $this->customer->getFirstName();
			$parent_category=$this->model_catalog_product->getParentCategory($product_id);
			$data['category_name']=$parent_category['name'];
			$data['heading_title'] = ($product_info['custom_h1'] <> '')?$product_info['custom_h1']:$product_info['name'];

				$data['NotifyWhenAvailable']  = $this->config->get('notifywhenavailable');
				$this->language->load('extension/module/notifywhenavailable');
				$data['NotifyWhenAvailable_Button'] = $this->language->get('NotifyWhenAvailable_Button');
						
                        $data['sku'] = $product_info['sku'];
						 $data['quantity'] = $product_info['quantity'];
						 
			if ($this->model_catalog_product->getFullPath($this->request->get['product_id'])) {
					
					$path = '';
			
					$parts = explode('_', (string)$this->model_catalog_product->getFullPath($this->request->get['product_id']));
					
					$category_id = (int)array_pop($parts);
											
					foreach ($parts as $path_id) {
						if (!$path) {
							$path = $path_id;
						} else {
							$path .= '_' . $path_id;
						}
						
						$category_info = $this->model_catalog_category->getCategory($path_id);
						
						if ($category_info) {
							$data['mbreadcrumbs'][] = array(
								'text'      => $category_info['name'],
								'href'      => $this->url->link('product/category', 'path=' . $path)								
							);
						}
					}
					
					$category_info = $this->model_catalog_category->getCategory($category_id);
					
					if ($category_info) {			
						$url = '';
											
						$data['mbreadcrumbs'][] = array(
							'text'      => $category_info['name'],
							'href'      => $this->url->link('product/category', 'path=' . $this->model_catalog_product->getFullPath($this->request->get['product_id']))						
						);
					}
			
				
				} else {
				$data['mbreadcrumb'] = false;
				}
				
				$data['review_no'] = $product_info['reviews'];	
				$data['rating'] = (int)$product_info['rating'];
				//print_r($product_info['reviews']);	exit;	 
$data['custom_alt'] = $product_info['custom_alt'];
$data['custom_imgtitle'] = $product_info['custom_imgtitle'];
			$data['text_select'] = 'Select Size';
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['alt'] = $product_info['alt'];
			$data['prod_url'] = $this->url->link('product/product', 'product_id=' . $this->request->get['product_id']);
			
			if($this->config->get('imdev_config_postcodeproduct')) {
		    $id = $this->config->get('config_language_id');
		    $this->load->model('tool/postcodepro');
 		    $data['pinpro'] = $this->model_tool_postcodepro->getDynamic($id);
				} else {
				$data['pinpro'] = array();
			}
			
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];


$data['mbreadcrumbs'] = array();

$data['mbreadcrumbs'][] = array(
'text'      => $this->language->get('text_home'),
'href'      => $this->url->link('common/home')
);

if ($this->model_catalog_product->getFullPath($this->request->get['product_id'])) {

$path = '';

$parts = explode('_', (string)$this->model_catalog_product->getFullPath($this->request->get['product_id']));

$category_id = (int)array_pop($parts);

foreach ($parts as $path_id) {
if (!$path) {
$path = $path_id;
} else {
$path .= '_' . $path_id;
}

$category_info = $this->model_catalog_category->getCategory($path_id);

if ($category_info) {
$data['mbreadcrumbs'][] = array(
'text'      => $category_info['name'],
'href'      => $this->url->link('product/category', 'path=' . $path)								
);
}
}

$category_info = $this->model_catalog_category->getCategory($category_id);

if ($category_info) {			
$url = '';

$data['mbreadcrumbs'][] = array(
'text'      => $category_info['name'],
'href'      => $this->url->link('product/category', 'path=' . $this->model_catalog_product->getFullPath($this->request->get['product_id']))						
);
}


} else {
$data['mbreadcrumb'] = false;
}

$data['review_no'] = $product_info['reviews'];		
$data['quantity'] = $product_info['quantity'];						
$data['currency_code'] = $this->session->data['currency'];
$data['richsnippets'] = $this->config->get('richsnippets');				



				$data['quantity'] = $product_info['quantity'];
						
			
			$extendedseo = $this->config->get('extendedseo');
			$data['description'] = ((isset($extendedseo['productseo']))?'<h2>'.$product_info['name'].'</h2>':'').html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
			
$data['description'] = ($product_info['custom_h2'] != '')?'<h2>'.$product_info['custom_h2'].'</h2>'.$data['description']:$data['description'];

				$parent_category_data=$this->model_catalog_product->getProductCategory($product_id);
			//	print_r($parent_category_data);
				//$data['parent_category'][] =array();
				$data['parent_category']=0;
				$data['new_arrival']=0;
				$data['new_arrival_category']=0;
				
				foreach ($parent_category_data as $category){
				
					if($category['category_id']==85){
						$data['parent_category']=1;
						$data['new_arrival_category']=1;
					
					}
					if($category['category_id']==182){
						$data['new_arrival']=1;
						$data['new_arrival_category']=1;
					
					}
					/*if($category['category_id']==183){
						$data['parent_category1']=1;
					
					}*/
				
				}
			
			
			
			if ($product_info['quantity'] <= 0) {
				$data['stock'] = 'Out Of Stock';
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = 'In Stock';
			} else {
				$data['stock'] = 'In Stock';
			}
                        if ($product_info['quantity'] <= 0) {
                            $data['soldout'] = '1';
                        }else{
                            $data['soldout'] = '0';
                        }
			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = '';
			}
			
			if ($product_info['image']) {
				$data['image1'] = $this->model_tool_image->resize($product_info['image'], 1000, 1000);
			} else {
				$data['image1'] = '';
			}
			

			if ($product_info['image']) {
				$data['thumb1'] = $this->model_tool_image->resize($product_info['image'], 75,75);
			} else {
				$data['thumb1'] = '';
			}
			if ($product_info['video_url']) {
				$data['video_url'] = $product_info['video_url'];
			} else {
				$data['video_url'] = '';
			}
			
			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], 1000,1000);
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
			if ($product_info['image']) {
					$this->document->addOGMeta('property="og:image"', str_replace(' ', '%20', $this->model_tool_image->resize($product_info['image'], 600, 315)) );
					$this->document->addOGMeta('property="og:image:width"', '600');
					$this->document->addOGMeta('property="og:image:height"', '315');
			    } else {
		    		$this->document->addOGMeta( 'property="og:image"', str_replace(' ', '%20', $this->model_tool_image->resize($this->config->get('config_logo'), 300, 300)) );
					$this->document->addOGMeta('property="og:image:width"', '300');
					$this->document->addOGMeta('property="og:image:height"', '300');
	     		}
				foreach ($results as $result) {
			    	$this->document->addOGMeta( 'property="og:image"', str_replace(' ', '%20', $this->model_tool_image->resize($result['image'], 600, 315)) );
					$this->document->addOGMeta('property="og:image:width"', '600');
					$this->document->addOGMeta('property="og:image:height"', '315');
       			}
			

			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], 1000,1000),
					'image_alt' => $result['image_alt'], 
					'thumb1' => $this->model_tool_image->resize($result['image'], 75, 75)

				);
			}
			//certificate.jpg
			$data['lastthumb'] =  $this->model_tool_image->resize('catalog/2.jpg', 75, 75);
			$data['lastimage'] =  $this->model_tool_image->resize('catalog/2.jpg', 400, 400);
			
			
			$data['lastthumb1'] =  $this->model_tool_image->resize('catalog/certificate.jpg', 75, 75);
			$data['lastimage1'] =  $this->model_tool_image->resize('catalog/certificate.jpg', 400, 400);
			
			$data['lastimagebig'] =  $this->model_tool_image->resize('catalog/2.jpg', 1000, 1000);
				
			

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				
				$data['final_price'] = $this->currency->format($this->tax->calculate($product_info['price']-($product_info['price']*0.1), $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				
				$data['cod_price'] = $this->currency->format($this->tax->calculate($product_info['price']+50, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				
			} else {
				$data['price'] = false;
				$data['final_price'] = false;
				$data['cod_price'] = false;
				
			}

			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['special'] = false;
			}
			
			if ((float)$product_info['special']) {
				
				
				
				$data['final_special'] = $this->currency->format($this->tax->calculate($product_info['special']-($product_info['special']*0.10), $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				
				$data['cod_special'] = $this->currency->format($this->tax->calculate($product_info['special']+50, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				
			} else {
				$data['special'] = false;
				$data['final_special']=false;
				
				$data['cod_special']=false;
			}
			
			
			
			if ((float)$product_info['special']) {
				$data['special1'] =$product_info['special'] ;
			} else {
				$data['special1'] = false;
			}
			
			 //summer sale offer 999
		//	if($product_info['special'] > 1000){
		//		$data['offer']  = 1;
		//	} else {
		//		$data['offer'] = 0;
		//	}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}
                        if($product_info['special']){
                        $discount_price = $product_info['price'] - $product_info['special'];
                        $data['discount_price'] = $this->currency->format($this->tax->calculate($discount_price, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                                        $discount_per = (($product_info['price'] - $product_info['special'])/$product_info['price'])*100;
                        $data['discount_percent'] = round($discount_per);
                        }
						else{
                        	$data['discount_percent']=false;
                        	$data['discount_price']=false;
                        }

      if(!$data['special']){
        $data['fbprice'] = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
      }else{
        $data['fbprice'] = $this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'));
      }
       $data['fbcurrency'] = $this->session->data['currency'];
      

$data['product_id'] = $this->request->get['product_id'];
$data['language']  = $this->config->get('config_language');
$this->load->model('extension/module/giftteaser');
$freeGifts = $this->model_extension_module_giftteaser->getCurrentGifts();	 	
$data['freeGifts'] = array();
foreach ($freeGifts as $freeGift) {
$descriptions = unserialize(base64_decode($freeGift['description']));
$data['freeGifts'][] = array(
'id' => $freeGift['item_id'],
'start_date'    => $freeGift['start_date'],
'end_date'    => $freeGift['end_date'],
'description' =>  html_entity_decode($descriptions['desc_' . $this->config->get('config_language')]),
);
}
$this->load->model('setting/setting');
$setting = $this->model_setting_setting->getSetting('giftteaser', $this->config->get('config_store_id'));
if(isset($setting['giftteaser'])) {
$data['giftTeaser_data'] = $setting['giftteaser']; 
}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}
//print_r($data['discount_percent']);			
//print_r($data['discount_price']);exit;
			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0) || (!empty($data['NotifyWhenAvailable']['Enabled']) && $data['NotifyWhenAvailable']['Enabled']=='yes')) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix'],
							'quantity'				  => $option_value['quantity']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}
			
			$meta_price = ( $data['special'] != false) ? $data['special'] : $data['price'] ;
				$meta_price = trim(trim(($data['special'] != false) ? $data['special'] : $data['price'], $this->currency->getSymbolLeft($this->session->data['currency'])), $this->currency->getSymbolRight($this->session->data['currency']));
				$decimal_point_meta_price = $this->language->get('decimal_point') ? $this->language->get('decimal_point') : '.';
                $thousand_point_meta_price = $this->language->get('thousand_point')? $this->language->get('thousand_point') : ' ';
                $meta_price = str_replace($thousand_point_meta_price, '', $meta_price);
                if ( $decimal_point_meta_price != '.' ) {
                  $meta_price = str_replace($decimal_point_meta_price, '.', $meta_price);
                }
                $meta_price = number_format((float)$meta_price, 2, '.', '');
				$this->document->addOGMeta('property="product:price:amount"', $meta_price);
				$this->document->addOGMeta('property="product:price:currency"', $this->session->data['currency']);

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['review_status'] = $this->config->get('config_review_status');

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}
			if ($this->customer->isLogged()) {
				$data['customer_email'] = $this->customer->getEmail();
			} else {
				$data['customer_email'] = '';
			}
			
			//new arrival
			$datanewarrival= $this->model_catalog_product->getModule('featured');
		
		
	//print_r($datanewarrival);	exit;
	
	
	if (!empty($datanewarrival['product'])) {
			$products = array_slice($datanewarrival['product'], 0, (int)$datanewarrival['limit']);
			//$products = array_slice($setting['product'], 0, (int)$setting['limit']);
			
		//print_r($products);	
			$data['lazy_load_width_height'] = 'width="' . $datanewarrival['width'] . '" height="' . $datanewarrival['height'] . '"';
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {

$this->load->libraryFB('facebookcommonutils');
$params = new DAPixelConfigParams(array(
'eventName' => 'ViewContent',
'products' => array($product_info),
'currency' => $this->currency,
'currencyCode' => $this->session->data['currency'],
'hasQuantity' => false));
$facebook_pixel_event_params_FAE =
$this->facebookcommonutils->getDAPixelParamsForProducts($params);
// stores the pixel event params in the session
$this->request->post['facebook_pixel_event_params_FAE'] =
addslashes(json_encode($facebook_pixel_event_params_FAE));

					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $datanewarrival['width'], $datanewarrival['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $datanewarrival['width'], $setting['datanewarrival']);
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$special = false;
					}
					if($product_info['special']){
                        $discount_price = $product_info['price'] - $product_info['special'];
                        $discount_price = $this->currency->format($this->tax->calculate($discount_price, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                                        $discount_per = (($product_info['price'] - $product_info['special'])/$product_info['price'])*100;
                        $discount_percent = round($discount_per);
                        }
						else{
                        	$discount_percent=false;
                        	$discount_price=false;
                        }

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					$data['newproducts'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						
						'price'       => $price,
						'special'     => $special,
					
					'price'       => $price,
					
                                        
						'tax'         => $tax,
						'rating'=> $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
		}
			
			
			
			
			
			
			
			
			
			
			//offer
			$filter_data_offer = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => 8
		);

		$offerresults = $this->model_catalog_product->getProductSpecials($filter_data_offer);

		if ($offerresults) {
			foreach ($offerresults as $result) {
				if ($result['image']) {
					$imageoffer = $this->model_tool_image->resize($result['image'], 200, 200);
				} else {
					$imageoffer = $this->model_tool_image->resize('placeholder.png', 200, 200);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$data['offerproducts'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $imageoffer,
					'name'        => $result['name'],
					
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'  => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
			
		}
			
			//best seller
			$bestresults = $this->model_catalog_product->getBestSellerProducts(8);

		if ($bestresults) {
			foreach ($bestresults as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 200, 200);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$data['bestseller'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'=> $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
		}
			
			

			//$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			//$data['rating'] = (int)$product_info['rating'];
//print_r($product_info['rating']);exit;
			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}
		
			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();
//$parent_category = array();
			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}
				
				if ($result['image']) {
					$image1 = $this->model_tool_image->resize($result['image'], 1000, 1000);
				} else {
					$image1 = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                                         $discount_price = $result['price'] - $result['special'];
                                        $discount_percent = (($result['price'] - $result['special'])/$result['price'])*100;
				} else {
					$special = false;
				}
				if ((float)$result['special']) {
					$special1 = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                                         $discount_price = $result['price'] - $result['special'];
                                        $discount_percent = (($result['price'] - $result['special'])/$result['price'])*100;
				} else {
					$special1 = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
			
				$new_arrival_related=$this->model_catalog_product->getProductCategoryForNewArrival($result['product_id']);
				
//print_r($special1);
				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'image'       => $image1,
					'thumb1'      => $product_info['image'],
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'special1'       => $special1,
					'price'       => $price,
					'special'     => $special,
					'category_id_new_arrical_related' => $new_arrival_related,
					//'category_id' => $parent_category,
                                        'discount_price'=> $this->currency->format($this->tax->calculate($discount_price, $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']),
                                        'discount_persent'=>round($discount_percent),
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,

				'quantity'  => $result['quantity'],
						
					
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			
			
			$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$data['total_review']=$review_total;
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		
		
		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);
		//$review_ratings = $this->model_catalog_review->getTotalReviewGroupbyRating($this->request->get['product_id']);
		//$data['review_ratings']=$review_ratings;
		//print_r($data['review_ratings']);
		
		
		$data['rating_1']=$this->model_catalog_review->getTotalReviewGroupbyRating($this->request->get['product_id'],1);
		
		
		$data['rating_2']=$this->model_catalog_review->getTotalReviewGroupbyRating($this->request->get['product_id'],2);
		$data['rating_3']=$this->model_catalog_review->getTotalReviewGroupbyRating($this->request->get['product_id'],3);
		$data['rating_4']=$this->model_catalog_review->getTotalReviewGroupbyRating($this->request->get['product_id'],4);
		$data['rating_5']=$this->model_catalog_review->getTotalReviewGroupbyRating($this->request->get['product_id'],5);
		
		if($review_total!=0){
		$data['rating_per_1']=$data['rating_1']*100/$review_total;
		$data['rating_per_2']=$data['rating_2']*100/$review_total;
		$data['rating_per_3']=$data['rating_3']*100/$review_total;
		$data['rating_per_4']=$data['rating_4']*100/$review_total;
		$data['rating_per_5']=$data['rating_5']*100/$review_total;
		}
		
			//print_r($data['rating_5']);
		//$data['rating_1']=$review_ratings[]
		
		
//exit;
 $testimonials = $this->model_catalog_review->getHomePageTestimonials();
              //echo '<pre>'; print_r($testimonials); //die();
                foreach($testimonials as $testimonial){
					if($testimonial['image']){
					$testi=$this->model_tool_image->resize($testimonial['image'], 120, 120);
					}else {
					$testi ="empty"	;
					}
						//print_r($testi);exit;
					
                    $data['testimonials'][] = array(
                        'author'    =>     $testimonial['author'],
                        'city'    =>     $testimonial['city'],
                        'text'    =>     $testimonial['text'],
                        'image'    =>     $testi,
						//  'image'    =>    $testimonial['image'],
                        'date_added'    =>     $testimonial['date_added'],
                    );
                }



		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}
			//$data['review_results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));
			
		
		
	
			
			
			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}


$richsnippets = $this->config->get('richsnippets');
$socialseo = '';
if (isset($richsnippets['ogsite'])) {
$socialseo .= '
<meta property="og:type" content="product"/>
<meta property="og:title" content="'.$product_info['name'].'"/>
<meta property="og:image" content="'.$data['popup'].'"/>
<meta property="og:url" content="'.$this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']).'"/>
<meta property="og:description" content="'.$product_info['meta_description'].'"/>
<meta property="product:price:amount" content="'.preg_replace( '/[^.,0-9]/', '',($data['special'] ? $data['special'] : $data['price'])).'"/>


<meta property="og:price:amount" content="'.preg_replace( '/[^.,0-9]/', '',($data['special'] ? $data['special'] : $data['price'])).'" />
<meta property="og:price:currency" content=INR />
<meta property="og:availability" content="instock" />
<meta property="product:price:currency" content="'.$this->session->data['currency'].'"/>';


}
if (isset($richsnippets['twittersite'])) {
$socialseo .= '
<meta name="twitter:card" content="product" />';
if (isset($richsnippets['twitteruser'])) { 
$socialseo .= '
<meta name="twitter:site" content="'.$richsnippets['twitteruser'].'" />';
} 
$socialseo .= '
<meta name="twitter:title" content="'.$product_info['name'].'" />
<meta name="twitter:description" content="'.$product_info['meta_description'].'" />
<meta name="twitter:image" content="'.$data['popup'].'" />
<meta name="twitter:label1" content="Price">
<meta name="twitter:data1" content="'.preg_replace( '/[^.,0-9]/', '',($data['special'] ? $data['special'] : $data['price'])).'">
<meta name="twitter:label2" content="Currency">
<meta name="twitter:data2" content="'.$this->session->data['currency'].'">
';
}
$this->document->setSocialSeo($socialseo);

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			//$this->response->setOutput($this->load->view('product/product', $data));
			
			if($this->document->isMobile()){
			$this->response->setOutput($this->load->view('product/m_product', $data));
			}else{
		
		
			$this->response->setOutput($this->load->view('product/product', $data));
		}
			
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
			);

$extendedseo = $this->config->get('extendedseo');
			$this->document->setTitle(((isset($category_info['name']) && isset($extendedseo['categoryintitle']) )?($category_info['name'].' : '):'').$this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function review() {
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if ((utf8_strlen($this->request->post['text']) < 2) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			//if (empty($this->request->post['price-rating']) || $this->request->post['price-rating'] < 0 || $this->request->post['price-rating'] > 5) {
			//	$json['error'] = $this->language->get('error_pri_rating');
			//}
			//if (empty($this->request->post['qua-rating']) || $this->request->post['qua-rating'] < 0 || $this->request->post['qua-rating'] > 5) {
			//	$json['error'] = $this->language->get('error_qua_rating');
			//}
			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_app_rating');
			}

			//if (empty($this->request->post['email'])) {
			//	$json['error'] = $this->language->get('error_email');
			//}
		//	if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
		//		$json['error'] = $this->language->get('error_name');
		//	}
			
			if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$json['error'] = $this->language->get('error_email_correct');
		}
			
			// Captcha
			/*if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}*/

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	public function mwrite() {
		$this->load->language('product/product');

		$json = array();
//print_r($_POST);exit;
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if ((utf8_strlen($this->request->post['text']) < 2) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			//if (empty($this->request->post['price-rating']) || $this->request->post['price-rating'] < 0 || $this->request->post['price-rating'] > 5) {
			//	$json['error'] = $this->language->get('error_pri_rating');
			//}
			//if (empty($this->request->post['qua-rating']) || $this->request->post['qua-rating'] < 0 || $this->request->post['qua-rating'] > 5) {
			//	$json['error'] = $this->language->get('error_qua_rating');
			//}
			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_app_rating');
			}

			if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$json['error'] = $this->language->get('error_email_correct');
		}
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}
			// Captcha
			/*if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}*/

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	

	public function getRecurringDescription() {
		$this->load->language('product/product');
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
        public function havaquestion(){
			
		
			$this->load->model('catalog/product');
			
			
			$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if ((utf8_strlen($this->request->post['detail']) < 2) || (utf8_strlen($this->request->post['detail']) > 1000)) {
				$json['error'] = $this->language->get('error_question_text');
			}

			

		//	if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
		//	$json['error'] = $this->language->get('error_email_correct');
		//}
			//if (empty($this->request->post['mobile'])) {
			//	$json['error'] = $this->language->get('error_mobile');
			//}
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_question_name');
			}
		//	if (empty(trim($this->request->post['mobile']))) {
		//	$json['error'] = 'Please Enter Mobile Number';
		//} else if ((utf8_strlen($this->request->post['mobile'])!= 10))
		//{
		//	$json['error'] = 'Mobile Number Must Be 10 Number';
		//}
			

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_product->havequestion($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success_question');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
			
			
			
			
			
			
			
			
			
			
			
			
         //   $this->load->model('catalog/product');
            
         //   $name = $this->request->post['name'];
         //   $email = $this->request->post['email'];
         //   $mobile = $this->request->post['mobile'];
         //   $detail = $this->request->post['detail'];
         //   if($this->model_catalog_product->havequestion($this->request->post)){
         //       echo '1';
         //   }
            
        }
		public function mhavaquestion(){
			//print_r($_POST);exit;
		
			$this->load->model('catalog/product');
			
			
			$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if ((utf8_strlen($this->request->post['mdetail']) < 2) || (utf8_strlen($this->request->post['mdetail']) > 1000)) {
				$json['error'] = $this->language->get('error_question_text');
			}

			

		//	if ((utf8_strlen($this->request->post['memail']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['memail'])) {
		//	$json['error'] = $this->language->get('error_email_correct');
		//}
		//	if (empty(trim($this->request->post['mmobile']))) {
		//	$json['error'] = 'Please Enter Mobile Number';
		//} else if ((utf8_strlen($this->request->post['mmobile']) < 10) || (utf8_strlen($this->request->post['mmobile']) > 12 || //preg_match("/^[0-9]+$/", $this->request->post['mmobile']) === 0)) {
		//	$json['error'] = 'Mobile Number Must Be 10 Number';
		//}
			if ((utf8_strlen($this->request->post['mname']) < 3) || (utf8_strlen($this->request->post['mname']) > 25)) {
				$json['error'] = $this->language->get('error_question_name');
			}
			

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_product->mhavequestion($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success_question');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
			
			
			
			
			
			
			
			
			
			
			
			
         //   $this->load->model('catalog/product');
            
         //   $name = $this->request->post['name'];
         //   $email = $this->request->post['email'];
         //   $mobile = $this->request->post['mobile'];
         //   $detail = $this->request->post['detail'];
         //   if($this->model_catalog_product->havequestion($this->request->post)){
         //       echo '1';
         //   }
            
        }
		
		
		public function pinCheck() {
        	$this->load->model('catalog/pincode');
        	$pin = array();
        	if(isset($_POST['pincode'])){
        		$_SESSION['pin_check_status'] = "1";
        		$pincode = $_POST['pincode'];
        		$_SESSION['pincode'] = "<b>".$_POST['pincode']."</b>";
        		$pin = $this->model_catalog_pincode->getPin($pincode);
        		$message_cod = $message_pre = $message_not = '';
        		$message_cod = html_entity_decode($this->config->get('pincode_msg_codavailable'), ENT_QUOTES, 'UTF-8');
        		$message_pre = html_entity_decode($this->config->get('pincode_msg_preavailable'), ENT_QUOTES, 'UTF-8');
        		$message_not = html_entity_decode($this->config->get('pincode_msg_unavailable'), ENT_QUOTES, 'UTF-8');
        		$text_color = $this->config->get('text_color');
        
        		if(!isset($message_cod) || $message_cod == ''){
        			$message_cod  = "COD and Prepaid Service is Available At Your Location";
        		}
        		if(!isset($message_pre) || $message_pre == ''){
        			$message_pre  = "Only Prepaid Service is Available At Your Location";
        		}
        		if(!isset($message_not) || $message_not == ''){
        			$message_not  = "Service is not Available at your location yet";
        		}
        			
        		if(isset($pin['id'])){
        			$service = $pin['service_available'];
        			if($service == '1'){
        					echo '<div class="pmessage" style="display:block;">
									<table>
									<tbody>
									<tr><td>
									<img src="catalog/view/theme/default/image/tick.png"></td>
									<td style="color:#b64f81">Delivery option for:"'.$_SESSION['pincode'].'" </td></tr>
									<tr><td><img src="https://ornate-bc57.kxcdn.com/catalog/view/theme/default/image/payment.png">
									</td><td style="color:#b64f81">'.$message_cod.'</td></tr>
									<tr>
									<td><img src="catalog/view/theme/default/image/payment.png"></td><td style="color:#b64f81">'.$_SESSION['pin_check_result'].'</td></tr></tbody></table>';
						
        
        			    	$_SESSION['pin_check_result'] = '<div class="pmessage" style="display:block;">
									<table>
									<tbody>
									<tr><td>
									<img src="catalog/view/theme/default/image/tick.png"></td>
									<td style="color:#b64f81">Delivery option for:"'.$_SESSION['pincode'].'" </td></tr>
									<tr><td><img src="https://ornate-bc57.kxcdn.com/catalog/view/theme/default/image/payment.png">
									</td><td style="color:#b64f81">'.$message_cod.'</td></tr>
									<tr>
									<td><img src="catalog/view/theme/default/image/payment.png"></td><td style="color:#b64f81">'.$_SESSION['pin_check_result'].'</td></tr></tbody></table>';
									
									
						
        
        				
        			}
        			else if($service == '0'){
        				echo '<div class="pmessage" style="display:block;">
									<table>
									<tbody>
									<tr><td>
									<img src="catalog/view/theme/default/image/tick.png"></td>
									<td style="color:#b64f81">Delivery option for:"'.$_SESSION['pincode'].'" </td></tr>
									<tr><td><img src="https://ornate-bc57.kxcdn.com/catalog/view/theme/default/image/payment.png">
									</td><td style="color:#b64f81">'.$message_cod.'</td></tr>
									<tr>
									<td><img src="catalog/view/theme/default/image/payment.png"></td><td style="color:#b64f81">'.$_SESSION['pin_check_result'].'</td></tr></tbody></table>';
						
        
        			    	$_SESSION['pin_check_result'] = '<div class="pmessage" style="display:block;">
									<table>
									<tbody>
									<tr><td>
									<img src="catalog/view/theme/default/image/tick.png"></td>
									<td style="color:#b64f81">Delivery option for:"'.$_SESSION['pincode'].'" </td></tr>
									<tr><td><img src="https://ornate-bc57.kxcdn.com/catalog/view/theme/default/image/payment.png">
									</td><td style="color:#b64f81">'.$message_cod.'</td></tr>
									<tr>
									<td><img src="catalog/view/theme/default/image/payment.png"></td><td style="color:#b64f81">'.$_SESSION['pin_check_result'].'</td></tr></tbody></table>';
        			}
        			else{
        				echo "<div class=''><img src='image/pincode/l.png' width='15' height='15'>Delivery option for: ".$_SESSION['pincode']."&nbsp;&nbsp;<form style='display: inline;'><input type = 'button'  onClick = 'showform1()' value='Change' class='pin-check' /></form><br />";
        				echo "<br><font color = '".$text_color."'>".$message_not."</font><br /></div>";
        
        				$_SESSION['pin_check_result'] = "<font color = '".$text_color."'>".$message_not."</font>";
        			//	$_SESSION['pin_check_delivery'] = '';
        			}
        		}
        		else{
					echo "<div class=''>";
        			echo "<img src='image/pincode/l.png' width='15' height='15'>Delivery option for: ".$_SESSION['pincode']."&nbsp;&nbsp;<form style='display: inline;'><input type = 'button'  onClick = 'showform1()' value='Change' class='pin-check' /></form><br >";
        			echo "<br><font color = '".$text_color."'>:".$message_not."</font><br /></div>";
        				
        			$_SESSION['pin_check_result'] = "<img src='image/pincode/x.png' width='10px' height='10px'>&nbsp;Status:<font color = '".$text_color."'>".$message_not."</font>";
        			//$_SESSION['pin_check_delivery'] = '';
        		}
        	}
        }
}
