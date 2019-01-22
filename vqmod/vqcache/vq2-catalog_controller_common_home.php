<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->load->model('catalog/product');
		$this->load->model('catalog/review');
		$this->load->model('tool/image');
		$this->document->setTitle($this->config->get('config_meta_title'));

				$canonicals = $this->config->get('canonicals');
				if (isset($canonicals['canonicals_home'])) {
					$this->document->addLink($this->config->get('config_url'), 'canonical');
					}
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		/*----------------onj_code_starts----------------*/		
				$data['track_action']=$this->url->link('information/shipway_track');
				$data['hasAccount'] = $this->config->get('shipway_login');
				/*----------------onj_code_ends----------------*/
		
		$this->load->model('design/banner');		
				
		$results = $this->model_design_banner->getBanner(7);

		foreach ($results as $result) {		
		if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $result['image']
               // 'image' => $this->model_tool_image->resize($result['image'], 1449, 503)
					//'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}
		
				
				//$this->load->model('extension/module');
				
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
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
		}
	
	
	
	
	
	//print_r($data['newproducts']);exit;
	
	
	//offer
	
	$filter_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => 8
		);

		$offerresults = $this->model_catalog_product->getProductSpecials($filter_data);

		if ($offerresults) {
			foreach ($offerresults as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 200, 200);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', 200, 200);
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
					'thumb'       => $image,
					'name'        => $result['name'],
					
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
			
		}


	$data['categories'] = array();
$this->load->model('catalog/category');

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {  
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
					'category_id'  => $child['category_id'],
						'name'  => $child['name'] ,
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}
				
		//	print_r($image);	exit;
				// Level 1
				$data['categories'][] = array(
					'category_id'     => $category['category_id'],
					'name'     => $category['name'],
						'icon'     => $category['icon_image'],
					'children' => $children_data,
					
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
	
	
	


		
				
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
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
		}
				
                
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
                //echo '<pre>'; print_r($data['testimonials']); die();
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
if($this->document->isMobile()){
		$this->response->setOutput($this->load->view('common/m_home', $data));
		}else{
		
		
		$this->response->setOutput($this->load->view('common/home', $data));
		}
		
		
		//$this->response->setOutput($this->load->view('common/home', $data));
	}
	public function callback_request(){
		$this->load->model('catalog/category');
		$name = $this->request->post['name'];
            $email = $this->request->post['email'];
            $phone = $this->request->post['phone'];
            $message = $this->request->post['message'];
            $slot = $this->request->post['slot_time'];
          //  print_r($name);
          //  print_r($email);
          //  print_r($phone);
          //  print_r($message);
            
          //  print_r($slot);
            if($this->model_catalog_category->callback($this->request->post)){
            	echo '1';
            }
	}
	
	
}
