<?php

class ControllerAccountLogin extends Controller {

    private $error = array();

    public function index() {
        include_once 'gpConfig.php';
        require_once 'fbconfig.php';
        $this->load->model('account/customer');
        if (isset($_SESSION['FBID'])) {
            $customer_info = $this->model_account_customer->getCustomerByEmail($_SESSION['EMAIL']);
            if (!$customer_info) {
                $data = array(
                    'email' => $_SESSION['EMAIL'],
                    'fbname' => $_SESSION['FULLNAME']
                );
                $this->model_account_customer->addCustomer($data);
            }
            $this->customer->login($_SESSION['EMAIL'], '', true);
            //  echo $logoutUrl = $facebook->getLogoutUrl(); die();
        } else {
            // show login url
            $data['urloutput'] = $helper->getLoginUrl();
        }

        //login with Google

        if (isset($_GET['code'])) {
            $gClient->authenticate($_GET['code']);
            $_SESSION['token'] = $gClient->getAccessToken();
            header('Location: ' . filter_var($redirectURL, FILTER_SANITIZE_URL));
        }

        if (isset($_SESSION['token'])) {
            $gClient->setAccessToken($_SESSION['token']);
        }
	
        if ($gClient->getAccessToken()) {
            //Get user profile data from google
            $gpUserProfile = $google_oauthV2->userinfo->get();

            //Initialize User class
            //$user = new User();
            //Insert or update user data to the database
            $gpUserData = array(
                'oauth_provider' => 'google',
                'oauth_uid' => $gpUserProfile['id'],
                'first_name' => $gpUserProfile['given_name'],
                'last_name' => $gpUserProfile['family_name'],
                'email' => $gpUserProfile['email'],
                'locale' => $gpUserProfile['locale'],
                'picture' => $gpUserProfile['picture']
            );
          
            if (!empty($gpUserData)) {
//                $customer_info = $this->model_account_customer->getCustomerByEmail($gpUserData['email']);
//                if (!$customer_info) {
//                    $data = array(
//                        'email' => $gpUserData['email'],
//                        'firstname' => $gpUserData['first_name']
//                    );
//                    $this->model_account_customer->addCustomer($data);
//                    $this->customer->login($gpUserData['email'], '', true);
//                } else {
                   $this->customer->login($gpUserData['email'], '', true); 
                //}
                //echo $gpUserData['email']; die();
                
                //$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
                //$this->response->redirect($this->url->link('account/edit', '', true));
                //  echo $logoutUrl = $facebook->getLogoutUrl(); die();
            }
          
        } else {
            $authUrl = $gClient->createAuthUrl();
            $data['output'] = filter_var($authUrl, FILTER_SANITIZE_URL);
        }
        //login with google end
        // Login override for admin users
        if (!empty($this->request->get['token'])) {
            $this->customer->logout();
            $this->cart->clear();

            unset($this->session->data['order_id']);
            unset($this->session->data['payment_address']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['shipping_address']);
            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['comment']);
            unset($this->session->data['coupon']);
            unset($this->session->data['reward']);
            unset($this->session->data['voucher']);
            unset($this->session->data['vouchers']);

            $customer_info = $this->model_account_customer->getCustomerByToken($this->request->get['token']);

            if ($customer_info && $this->customer->login($customer_info['email'], '', true)) {
                // Default Addresses
                $this->load->model('account/address');

                if ($this->config->get('config_tax_customer') == 'payment') {
                    $this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
                }

                if ($this->config->get('config_tax_customer') == 'shipping') {
                    $this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
                }

                $this->response->redirect($this->url->link('account/edit', '', true));
            }
        }

        if ($this->customer->isLogged()) {
            
            $this->response->redirect($this->url->link('account/edit', '', true));
          
        }
		$data['xtensions_controller_path'] = $this->config->get('xtensions_controller_path');

        $this->load->language('account/login');

        $this->document->setTitle($this->language->get('heading_title'));

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			
			
			/* AbandonedCarts - Begin */

$this->load->model('setting/setting');

$abandonedCartsSettings = $this->model_setting_setting->getSetting('abandonedcarts', $this->config->get('store_id'));

if (isset($abandonedCartsSettings['abandonedcarts']['Enabled']) && $abandonedCartsSettings['abandonedcarts']['Enabled']=='yes') { 
    $this->db->query("DELETE FROM `" . DB_PREFIX . "abandonedcarts` WHERE `restore_id` = '".session_id()."'");

    $cart = $this->cart->getProducts();
    $cart = (!empty($cart)) ? $cart : '';
    
    if (!empty($cart)) {
        if (isset($this->session->data['abandonedCart_ID']) & !empty($this->session->data['abandonedCart_ID'])) {
            $id = $this->session->data['abandonedCart_ID'];
        } else if ($this->customer->isLogged()) {
            $id = (!empty($this->session->data['abandonedCart_ID'])) ? $this->session->data['abandonedCart_ID'] : $this->customer->getEmail();
        } else {
            $id = (!empty($this->session->data['abandonedCart_ID'])) ? $this->session->data['abandonedCart_ID'] : session_id();
        }
        $exists = $this->db->query("SELECT * FROM `" . DB_PREFIX . "abandonedcarts` WHERE `restore_id` = '$id' AND `ordered`=0 ORDER BY `date_created`")->row;
        
        if (empty($exists['customer_info'])) { 
            $customer = array(
                    'id'=> $this->customer->getId(), 
                    'email' => $this->customer->getEmail(),		
                    'telephone' => $this->customer->getTelephone(),
                    'firstname' => $this->customer->getFirstName(),
                    'lastname' => $this->customer->getLastName(),
                    'language' => $this->session->data['language']
            );
            $customer = json_encode($customer);
            $this->db->query("UPDATE `" . DB_PREFIX . "abandonedcarts` SET `customer_info` = '".$this->db->escape($customer)."', `restore_id`='".$this->customer->getEmail()."' WHERE `restore_id`='$id'");
            
            $this->session->data['abandonedCart_ID'] = $this->customer->getEmail();
        }
    }
}
/* AbandonedCarts - End */
     
            // Unset guest
            unset($this->session->data['guest']);

            // Default Shipping Address
            $this->load->model('account/address');

            if ($this->config->get('config_tax_customer') == 'payment') {
                $this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
            }

            if ($this->config->get('config_tax_customer') == 'shipping') {
                $this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
            }

            // Wishlist
            if (isset($this->session->data['wishlist']) && is_array($this->session->data['wishlist'])) {
                $this->load->model('account/wishlist');

                foreach ($this->session->data['wishlist'] as $key => $product_id) {
                    $this->model_account_wishlist->addWishlist($product_id);

                    unset($this->session->data['wishlist'][$key]);
                }
            }

            // Add to activity log
            if ($this->config->get('config_customer_activity')) {
                $this->load->model('account/activity');

                $activity_data = array(
                    'customer_id' => $this->customer->getId(),
                    'name' => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
                );

                $this->model_account_activity->addActivity('login', $activity_data);
            }

            // Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
            if (isset($this->request->post['redirect']) && $this->request->post['redirect'] != $this->url->link('account/logout', '', true) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
                $this->response->redirect(str_replace('&amp;', '&', $this->request->post['redirect']));
            } else {
                $this->response->redirect($this->url->link('account/edit', '', true));
            }
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('account/edit', '', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_login'),
            'href' => $this->url->link('account/login', '', true)
        );

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_new_customer'] = $this->language->get('text_new_customer');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_register_account'] = $this->language->get('text_register_account');
        $data['text_returning_customer'] = $this->language->get('text_returning_customer');
        $data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
        $data['text_forgotten'] = $this->language->get('text_forgotten');

        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_password'] = $this->language->get('entry_password');

        $data['button_continue'] = $this->language->get('button_continue');
        $data['button_login'] = $this->language->get('button_login');

        if (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } elseif (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['action'] = $this->url->link('account/login', '', true);
        $data['register'] = $this->url->link('account/register', '', true);
        $data['forgotten'] = $this->url->link('account/forgotten', '', true);

        // Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
        if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
            $data['redirect'] = $this->request->post['redirect'];
        } elseif (isset($this->session->data['redirect'])) {
            $data['redirect'] = $this->session->data['redirect'];

            unset($this->session->data['redirect']);
        } else {
            $data['redirect'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['email'])) {
            $data['email'] = $this->request->post['email'];
        } else {
            $data['email'] = '';
        }

        if (isset($this->request->post['password'])) {
            $data['password'] = $this->request->post['password'];
        } else {
            $data['password'] = '';
        }

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
       
        $this->response->setOutput($this->load->view('account/login', $data));
    }

    protected function validate() {
        // Check how many login attempts have been made.
        $login_info = $this->model_account_customer->getLoginAttempts($this->request->post['email']);

        if ($login_info && ($login_info['total'] >= $this->config->get('config_login_attempts')) && strtotime('-1 hour') < strtotime($login_info['date_modified'])) {
            $this->error['warning'] = $this->language->get('error_attempts');
        }

        // Check if customer has been approved.
        $customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);

        if ($customer_info && !$customer_info['approved']) {
            $this->error['warning'] = $this->language->get('error_approved');
        }

        if (!$this->error) {
            if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
                $this->error['warning'] = $this->language->get('error_login');

                $this->model_account_customer->addLoginAttempt($this->request->post['email']);
            } else {
                $this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
            }
        }

        return !$this->error;
    }

}
