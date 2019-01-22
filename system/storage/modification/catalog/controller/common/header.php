<?php
class ControllerCommonHeader extends Controller {
	public function index() {

$this->load->libraryFB('facebookcommonutils');
$data['facebook_pixel_id_FAE'] =
$this->config->get('facebook_pixel_id');
$source = 'exopencart';
$opencart_version = VERSION;
$plugin_version = $this->facebookcommonutils->getPluginVersion();
$agent_string = sprintf(
'%s-%s-%s',
$source,
$opencart_version,
$plugin_version);
$facebook_pixel_pii_FAE = array();
if ($this->config->get('facebook_pixel_use_pii') === 'true'
&& $this->customer->isLogged()) {
$facebook_pixel_pii_FAE['em'] =
$this->facebookcommonutils->getEscapedString(
$this->customer->getEmail());
$facebook_pixel_pii_FAE['fn'] =
$this->facebookcommonutils->getEscapedString(
$this->customer->getFirstName());
$facebook_pixel_pii_FAE['ln'] =
$this->facebookcommonutils->getEscapedString(
$this->customer->getLastName());
$facebook_pixel_pii_FAE['ph'] =
$this->facebookcommonutils->getEscapedString(
$this->customer->getTelephone());
}
$data['facebook_pixel_pii_FAE'] = json_encode(
$facebook_pixel_pii_FAE,
JSON_PRETTY_PRINT | JSON_FORCE_OBJECT);
$facebook_pixel_params_FAE = array('agent' => $agent_string);
$data['facebook_pixel_params_FAE'] = json_encode(
$facebook_pixel_params_FAE,
JSON_PRETTY_PRINT | JSON_FORCE_OBJECT);
$data['facebook_pixel_event_params_FAE'] =
(isset($this->request->post['facebook_pixel_event_params_FAE'])
&& $this->request->post['facebook_pixel_event_params_FAE'])
? $this->request->post['facebook_pixel_event_params_FAE']
: '';
// flushing away the facebook_pixel_event_params_FAE
// in the controller to ensure that subsequent fires
// for the same param is not performed
$this->request->post['facebook_pixel_event_params_FAE'] = '';

		// Analytics
		$this->load->library('user');
		$this->user = new User($this->registry);
		
		
		$this->load->model('extension/extension');
		$this->load->model('tool/image');
		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
		//	$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		
		
		
		
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');

          $data['pixel'] = $this->document->getPixel();
      
		$data['direction'] = $this->language->get('direction');
                //$link = $_SERVER['QUERY_STRING'];
                $link_array = explode('/',$_SERVER['QUERY_STRING']);
                $data['end'] = end($link_array);
		$data['name'] = $this->config->get('config_name');

         $data['fbpixel_id'] = $this->config->get('fbpixel_id');
         $data['fbpixel_status'] = $this->config->get('fbpixel_status');
      

		
		
		
		
		$data['robots'] = '';
				$extendedseo = $this->config->get('extendedseo');
				if (isset($extendedseo['robots'])) {
					$data['robots'] = '<meta name="robots" content="index">';
					}
				
				foreach ($data['links'] as $link) { 
					if ($link['rel']=='canonical') {$hasCanonical = true;
					if (isset($_SERVER['HTTP_USER_AGENT']) && preg_match('/bot|crawl|slurp|spider/i', $_SERVER['HTTP_USER_AGENT'])) {
					$this->db->query("insert into " . DB_PREFIX . "bots_report (link, bot, ip, `date`) values ('".$link['href']."','".$_SERVER['HTTP_USER_AGENT']."','".$_SERVER['REMOTE_ADDR']."',now());");
					}
					}
				}
				
				if (isset($this->request->get['route']) && !isset($hasCanonical) && (strpos($this->request->get['route'], 'error') === false)) {
					if (isset($_SERVER['HTTP_USER_AGENT']) && preg_match('/bot|crawl|slurp|spider/i', $_SERVER['HTTP_USER_AGENT'])) {
					$this->db->query("insert into " . DB_PREFIX . "bots_report (link, bot, ip, `date`) values ('".$this->url->link($this->request->get['route'])."','".$_SERVER['HTTP_USER_AGENT']."','".$_SERVER['REMOTE_ADDR']."',now());");
					}
				}
				
				$data['canonical_link'] = '';
				$canonicals = $this->config->get('canonicals'); 
				//if (!isset($hasCanonical) && isset($this->request->get['route']) && (isset($canonicals['canonicals_extended']))) {
				//	$data['canonical_link'] = $this->url->link($this->request->get['route']);					
				//	}
		
		//print_r($data['canonical_link']);
		
		
		/*----------------onj_code_starts----------------*/		
				$data['track_action']=$this->url->link('information/shipway_track');
				$data['hasAccount'] = $this->config->get('shipway_login');
				/*----------------onj_code_ends----------------*/
		
		
		
		
		
		
		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		if (is_file(DIR_IMAGE . 'logo1.png')) {
			
			//echo "<img src='image/logo1.png'>";
		$data['logo1'] =$this->model_tool_image->resize('logo1.png', 400, 400);
		}else{
			$data['logo1']=  $this->model_tool_image->resize('image/logo1.png', 400, 400);
		}
		
		$this->load->language('common/header');

		
		
		
		
		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['timmer'] = $this->config->get('config_timer_status');

		$data['ga_tracking_type'] = $this->config->get('config_ga_tracking_type');
		$data['ga_exclude_admin'] = $this->config->get('config_ga_exclude_admin');
		$data['ua_tracking'] = $this->config->get('config_ua_tracking');
		$data['ga_domain'] = $this->config->get('config_ga_domain');
		$data['ga_remarketing'] = $this->config->get('config_ga_remarketing');
		$data['ga_cookie'] = $this->config->get('config_ga_cookie');
		$data['user_logged'] = $this->user->isLogged();
		$data['template'] = $this->config->get('config_template');
		
		
		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		//META FOLLOW
     
	   if (isset($this->request->get['product_id'])) {
            $this->load->model('catalog/product');
            $follow_query = $this->model_catalog_product->getNoFollow($this->request->get['product_id']);
            if ($follow_query) {
                $data['follow'] = $follow_query;
            } else {
                $data['follow'] = 'FOLLOW, INDEX';
            }
        } else {
            $data['follow'] = 'FOLLOW, INDEX';
        }
		
		$data['categories'] = array();

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
				if (is_file(DIR_IMAGE . $category['image'])) {
					$image = $this->model_tool_image->resize($category['image'], 391, 269);
				} else {
					$image = $this->model_tool_image->resize('no_image.png', 100, 100);
				}
		//	print_r($image);	exit;
				// Level 1
				$data['categories'][] = array(
					'category_id'     => $category['category_id'],
					'name'     => $category['name'],
						'icon'     => $category['icon_image'],
					'children' => $children_data,
					'image1' => $category['image'],
					'image'    => $image,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}
			

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
			
			if (strpos($data['class'], 'product-product') !== false) {
				  $this->document->addOGMeta('property="og:type"', 'product');
				} elseif (strpos($data['class'], 'information') !== false) {
				  $this->document->addOGMeta('property="og:type"', 'article');
				} else {
				  $this->document->addOGMeta('property="og:type"', 'website');
				}
			
		} else {
			$data['class'] = 'common-home';
			
				$this->document->addOGMeta('property="og:type"', 'website');
		}

		
		$data['logo_meta'] = str_replace(' ', '%20', $this->model_tool_image->resize($this->config->get('config_logo'), 300, 300));
				$data['ogmeta'] = $this->document->getOGMeta();
		if($this->document->isMobile()){
	//	$this->response->setOutput($this->load->view('common/m_home', $data));
		return $this->load->view('common/m_header', $data);
		
		}else{
		
		return $this->load->view('common/header', $data);
	//	$this->response->setOutput($this->load->view('common/home', $data));
		}		
		
		//return $this->load->view('common/header', $data);
	}
	
}
