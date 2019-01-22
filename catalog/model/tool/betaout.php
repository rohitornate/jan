<?php

class ModelToolBetaout extends Model {

    // Used to store Betaout Tracker object (don't touch!)
    private $t;

    /* Variables defined to be used later in the code */
    /* ---------------------------------------------------------------------------------------- */
    private $betaout_https_url; // Betaout installation URL (https).
    private $betaout_http_url; // Betaout installation URL.
    private $betaout_site_id;  // The Site ID for the site in Betaout.
    // False for basic page tracking.
    private $betaout_use_sku;  // True - Report Betaout SKU from Opencart 'SKU'.  
    // False - Report Betaout SKU from Opencart 'Model'.
    private $betaout_api_key;  // True - to enable the use of the betaout proxy script to hide trhe betaout URL.
    private $baseurl;
    private $productId = "";
    private $catId = "";
    private $brandName = "";

    // False - for regular Betaout tracking.
    // The full path to the BetaoutTracker.php file
    /* ---------------------------------------------------------------------------------------- */

    // Function to set various things up
    // Not 100% certain where most efficient to run, so just blanket running before each big block of API code
    // Called internally by other functions
    private function init() {
        // Load config data
        $this->load->model('setting/setting');

        $this->model_setting_setting->getSetting('betaout');

        $this->betaout_http_url = $this->config->get('config_url') . 'betaout/';
        $this->betaout_https_url = $this->config->get('config_url') . 'betaout/';
        $this->betaout_site_id = $this->config->get('betaout_site_id');
        $this->betaout_api_key = $this->config->get('betaout_api_key');

//        $this->session->data['betaout_visitorid'] = "gh"; // $this->t->getVisitorId();

        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        $this->load->model('account/order');
        $this->load->model('checkout/order');
        $this->load->model('catalog/category'); //model_catalog_category
        $this->load->model('betaout/boutclass');
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->baseurl = $this->config->get('config_ssl');
        }
        else {
            $this->baseurl = $this->config->get('config_url');
        }
    }

    // Returns the text needed for the JAVASCRIPT method of setEcommerceView
    // (to be inserted in javascript footer as it occurs on every page)
    // Other ecommerce actions not on every page use PHP API.
    // Private as this is called internally to this class by getFooterText()
    private function setEcommerceView() {
        /* Get the Category info */
        // First, check the GET variable 'path' is set
        // Set to false - category reporting not fully supported in this version
        /* Get the Product info */
        // Read the product ID from the GET variable

        $this->productId = $product_id = $this->request->get['product_id'];

        $i = 0;
        $productarray = array();
        // Look up the product info using the product ID                    
        // Uses function from the catalog/product model
        $product = $this->model_catalog_product->getProduct($product_id);
        $abc = $this->get_category_names_by_product($product['product_id']);
        $productOptions = $this->model_catalog_product->getProductOptions($product_id);
        $this->catId = $abc[0]['cat_id'];
        // Get the individual pieces of info
        if ($this->betaout_use_sku) {
            $product_info_sku = '"' . $product['sku'] . '"';
        }
        else {
            $product_info_sku = '"' . $product['model'] . '"';
        }
        $betaout_product = '"' . $product['name'] . '"';
        $betaout_price = (string) $product['price'];


        $productarray[$i]['name'] = $product['name'];
        $productarray[$i]['sku'] = $product_info_sku;
        $productarray[$i]['price'] = $product['price'];
        $productarray[$i]['id'] = $product['product_id'];
        $productarray[$i]['image_url'] = $this->baseurl . 'image/' . $product['image'];
        $productarray[$i]['product_url'] = $this->baseurl . "?route=product/product&product_id=" . $product['product_id'];
        $productarray[$i]['categories'] = $abc;
        $productarray[$i]['brandName'] = $this->brandName = $product['manufacturer'];
        $productarray[$i]['currency'] = $this->session->data['currency'];
        $productarray[$i]['stock_availability'] = $product['quantity'];
        if (!empty($productOptions)) {
            $specs = array();
            $option_count = 0;
            foreach ($productOptions as $productOption) {
                if (!empty($productOption['product_option_value'])) {
                    $specs[$productOption['name']] = $productOption['product_option_value'][0]['name'];
                    $option_count++;
                }
            }
            $productarray[$i]['specs'] = $specs;
        }
        $productarray[$i]['product_group_id'] = $this->catId;
        $productarray[$i]['product_group_name'] = $abc[0]['cat_name'];

        // If there is no 'product_id' GET variable, then we are not in a product
        // So set the appropriate 'false' text to use (see betaout JavaScript function)

        $parray = array('identifiers' => $this->betaout_get_defaults(),
          'activity_type' => 'view',
          'products' => $productarray);

        $betaoutparams = array_merge($parray, $this->betaout_system_property());
        $requesturl = 'http://api.betaout.com/v2/ecommerce/activities';
        $result = $this->betaout_make_request($requesturl, $betaoutparams);

        return $result;
    }

    public function track() {
        $this->init();
        $pq = $this->session->data['pro_qty'];
        $cart_info = $this->cart->getProducts();
        foreach ($cart_info as $info) {
            if ($info['quantity'] != $pq[$info['product_id']]["qty"]) {
                $this->cartUpdate($info['product_id'], $info['quantity']);
            }
        }
    }

    public function cartUpdate($id, $qty) {
        $product = $this->model_catalog_product->getProduct($id);
        $abc = $this->get_category_names_by_product($id);
        $productd = $pro_qty = array();
        if ($this->betaout_use_sku) {
            $product_info_sku = $product['sku'];
        }
        else {
            $product_info_sku = $product['model'];
        }
        $i = 0;
        $identifire_arr = $this->betaout_get_defaults();
        if (isset($identifire_arr["email"]) && !empty($identifire_arr["email"])) {
            $session_key = base64_encode($identifire_arr["email"]);
        }
        $cartinfo = array("total" => $this->cart->getTotal(),
          'revenue' => $this->cart->getSubTotal(),
          'abandon_cart_url' => $this->url->link('betaout/abandonment/cart', 'ids=' . $session_key),
          'currency' => $this->session->data['currency']);

        $productd[$i]['name'] = $product['name'];
        $productd[$i]['sku'] = $product_info_sku;
        $productd[$i]['price'] = $product['price'];
        $productd[$i]['id'] = $product['product_id'];
        $productd[$i]['categories'] = $abc;
        $productd[$i]['quantity'] = $qty;
        $productd[$i]['currency'] = $this->session->data['currency'];

        $parray = array('identifiers' => $this->betaout_get_defaults(),
          "products" => $productd,
          "cart_info" => $cartinfo,
          "activity_type" => "update_cart"
        );

        $default = $this->betaout_system_property();
        $betaoutparams = array_merge($default, $parray);
        $requesturl = 'http://api.betaout.com/v2/ecommerce/activities';
        $result = $this->betaout_make_request($requesturl, $betaoutparams);

        $this->session->data['pro_qty'][$i]["qty"] = $qty;

        return;
    }

    // Tracks a cart update with Betaout PHP API
    // Calls BetaoutTracker 'addEcommerceItem' iteratively for each product in cart
    // Calls BetaoutTracker 'doTrackEcommerceCartUpdate' at the end to track the cart update

    public function trackEcommerceCartUpdate() {

        $this->init();
        $productd = $productIdArray = $pro_qty = $padd = $productarray = array();
        /* Get the Cart info */
        // First, check if the cart has items in
        // Read all the info about items in the cart
        $cart_info = $this->cart->getProducts();
        // For product in the cart...
        $i = null;
        foreach ($cart_info as $cart_item) {
            // Get the info for this product ID                 
            // Uses function from the catalog/product model
            $product = $this->model_catalog_product->getProduct($cart_item['product_id']);

            $abc = $this->get_category_names_by_product($cart_item['product_id']);

            if ($this->betaout_use_sku) {
                $product_info_sku = $product['sku'];
            }
            else {
                $product_info_sku = $product['model'];
            }
            $i = $product['product_id'];

            $productarray[$i]['name'] = $product['name'];
            $productarray[$i]['sku'] = $product_info_sku;
            $productarray[$i]['price'] = $product['price'];
            $productarray[$i]['id'] = $product['product_id'];
            $productarray[$i]['categories'] = $abc;
            $productarray[$i]['quantity'] = $cart_item['quantity'];

            $pro_qty[$i]["qty"] = $cart_item['quantity'];
            if (isset($cart_item['option'])) {
                $pro_qty[$i]["option"] = $cart_item['option'];
            }

            array_push($productIdArray, $product['product_id']);
        }


        $prev_cookie = isset($this->session->data['cookie']) ? $this->session->data['cookie'] : FALSE;

        $this->session->data['cookie'] = implode(',', $productIdArray);
        $added = array_diff($productIdArray, explode(',', $prev_cookie));


        $carray = $this->session->data['cookie'] == NULL ? NULL : explode(',', $this->session->data['cookie']);
        $parray = explode(',', $prev_cookie);

        if ((count($parray)) > (count($carray))) {

            $deleted = array_diff(explode(',', $prev_cookie), $productIdArray);
        }
        else {
            $deleted = array();
        }

        $adcount = count($added);
        $deletecount = count($deleted);
        $session_key = "";
        $identifire_arr = $this->betaout_get_defaults();
        if (isset($identifire_arr["email"]) && !empty($identifire_arr["email"])) {
            $session_key = base64_encode($identifire_arr["email"]);
        }
        $cartinfo = array("total" => $this->cart->getTotal(),
          'revenue' => $this->cart->getSubTotal(),
          'abandon_cart_url' => $this->url->link('betaout/abandonment/cart', 'ids=' . $session_key),
          'currency' => $this->session->data['currency']);
        if ($adcount) {

            foreach ($added as $id) {
                $padd[0] = $productarray[$id];
                $parray = array('identifiers' => $identifire_arr,
                  "products" => $padd,
                  "cart_info" => $cartinfo,
                  "activity_type" => "add_to_cart"
                );

//                $this->session->data['btest'] = json_encode($parray);
                $default = $this->betaout_system_property();
                $betaoutparams = array_merge($default, $parray);
                $requesturl = 'http://api.betaout.com/v2/ecommerce/activities';
                $result = $this->betaout_make_request($requesturl, $betaoutparams);
            }
        }

        if ($deletecount) {
            foreach ($deleted as $id) {

                $product = $this->model_catalog_product->getProduct($id);
                $abc = $this->get_category_names_by_product($id);

                if ($this->betaout_use_sku) {
                    $product_info_sku = $product['sku'];
                }
                else {
                    $product_info_sku = $product['model'];
                }
                $i = 0;

                $productd[$i]['name'] = $product['name'];
                $productd[$i]['sku'] = $product_info_sku;
                $productd[$i]['price'] = $product['price'];
                $productd[$i]['id'] = $product['product_id'];
                $productd[$i]['categories'] = $abc;
                $productd[$i]['quantity'] = 1;

                $parray = array('identifiers' => $this->betaout_get_defaults(),
                  "products" => $productd,
                  "cart_info" => $cartinfo,
                  "activity_type" => "remove_from_cart"
                );
//                $this->session->data['btest'] = json_encode($parray);
                $default = $this->betaout_system_property();
                $betaoutparams = array_merge($default, $parray);
                $requesturl = 'http://api.betaout.com/v2/ecommerce/activities';
                $result = $this->betaout_make_request($requesturl, $betaoutparams);
            }
        }
        if ($adcount == 0 && $deletecount == 0) {

            $pq = $this->session->data['pro_qty'];

            foreach ($cart_info as $info) {
                if ($info['quantity'] != $pq[$info['product_id']]["qty"]) {
                    $productarray[$info['product_id']]['quantity'] = $info['quantity'] - $pq[$info['product_id']]["qty"];
                    $padd[0] = $productarray[$info['product_id']];
                    $parray = array('identifiers' => $this->betaout_get_defaults(),
                      "products" => $padd,
                      "cart_info" => $cartinfo,
                      "activity_type" => "add_to_cart"
                    );
//                    $this->session->data['btest'] = json_encode($parray);
                    $default = $this->betaout_system_property();
                    $betaoutparams = array_merge($default, $parray);
                    $requesturl = 'http://api.betaout.com/v2/ecommerce/activities';
                    $result = $this->betaout_make_request($requesturl, $betaoutparams);
                }
            }
        }
        if (!$session_key == "") {
            $bout_cid = isset($identifire_arr["customer_id"]) ? $identifire_arr["customer_id"] : 0;
            $this->model_betaout_boutclass->updateCart($session_key, $bout_cid, json_encode($pro_qty));
        }
        $this->session->data['pro_qty'] = $pro_qty;
        return true;
    }

    private function get_category_names_by_product($id, $array = true) {

        $_categories = $this->model_catalog_product->getCategories($id);
        if (!is_array($_categories)) {
            if ($array)
                return array();
            else
                return "[]";
        }
        $categories = array();
        foreach ($_categories as $key) {
            $category = $this->model_catalog_category->getCategory($key['category_id']);

            if (isset($category['parent_id'])) {

                if ($category['parent_id'] == 0) {
                    array_push($categories, array('cat_name' => $category['name'] != null ? $category['name'] : "", 'cat_id' => $category['category_id'] != null ? $category['category_id'] : "", 'parent_cat_id' => 0));
                }
                else {
                    $pcategory = $this->model_catalog_category->getCategory($category['parent_id']);

                    if ($category['name'] != null && $category['category_id'] != null && $category['name'] != '' && $category['category_id'] != '')
                        array_push($categories, array('cat_name' => $category['name'], 'cat_id' => $category['category_id'], 'parent_cat_id' => $category['parent_id']));

                    while (isset($pcategory['parent_id'])) {
                        if ($pcategory['name'] != null && $pcategory['category_id'] != null && $pcategory['name'] != '' && $pcategory['category_id'] != '')
                            array_push($categories, array('cat_name' => $pcategory['name'], 'cat_id' => $pcategory['category_id'], 'parent_cat_id' => $pcategory['parent_id']));

                        $pcategory = $this->model_catalog_category->getCategory($pcategory['parent_id']);
                    }
                }
            }
        }
        return $categories;
    }

    // Tracks an order with Betaout PHP API
    // Calls BetaoutTracker 'addEcommerceItem' iteratively for each product in order
    // Calls BetaoutTracker 'doTrackEcommerceOrder' at the end to track order
    public function trackEcommerceOrder($order_id) {

        $this->init();
        $productarray = array();
        $or_status = $this->model_checkout_order->getOrder($order_id);
        $order_info = $this->model_account_order->getOrder($order_id);
        $order_info_products = $this->model_account_order->getOrderProducts($order_id);
        $order_info_totals = $this->model_account_order->getOrderTotals($order_id);
        $i = $tax = 0;
        $currency = $this->session->data['currency'];
        // Add ecommerce items for each product in the order before tracking

        foreach ($order_info_products as $order_product) {


            $productOptions = $this->model_account_order->getOrderOptions($order_id, $order_product['order_product_id']);
            // Get the info for this product ID 
            $product_info = $this->model_catalog_product->getProduct($order_product['product_id']);

            $abc = $this->get_category_names_by_product($order_product['product_id']);
            // Decide whether to use 'Model' or 'SKU' from product info
            if ($this->betaout_use_sku) {
                $product_info_sku = (string) $product_info['sku'];
            }
            else {
                $product_info_sku = (string) $product_info['model'];
            }
            $tax +=$order_product['tax'];

            $productarray[$i]['name'] = $order_product['name'];
            $productarray[$i]['sku'] = $product_info_sku;
            $productarray[$i]['price'] = $order_product['price'];
            $productarray[$i]['id'] = $order_product['product_id'];
            $productarray[$i]['categories'] = $abc;
            $productarray[$i]['quantity'] = $order_product['quantity'];
            if (!empty($productOptions)) {
                $specs = array();
                $option_count = 0;
                foreach ($productOptions as $productOption) {

                    $specs[$productOption['name']] = $productOption['value'];
                    $option_count++;
                }
                $productarray[$i]['specs'] = $specs;
            }

            $i++;
        }

        $order_shipping = 0;
        $order_subtotal = 0;
        $order_taxes = 0;
        $order_grandtotal = 0;
        $order_discount = 0;
        $promo_code = "";
        // Find out shipping / taxes / total values
        foreach ($order_info_totals as $order_totals) {
            switch ($order_totals['code']) {
                case "shipping":
                    $order_shipping += $order_totals['value'];
                    break;
                case "sub_total":
                    $order_subtotal += $order_totals['value'];
                    break;
                case "tax":
                    $order_taxes += $order_totals['value'];
                    break;
                case "total":
                    $order_grandtotal += $order_totals['value'];
                    break;
                case "coupon":
                    $order_discount += $order_totals['value'];
                    $promo_code+=$this->session->data['coupon'] + " ";
                    break;
                case "voucher":
                    $order_discount += $order_totals['value'];
                    $promo_code+=$this->session->data['coupon'] + " ";
                    break;
                default:
                    break;
            }
        }

        $cartinfo = array("order_id" => $order_id,
          "revenue" => $order_subtotal,
          "shipping" => $order_shipping,
          "tax" => $tax,
          "discount" => $order_discount,
          "total" => $order_grandtotal,
          "status" => $or_status['order_status'],
          "payment_method" => $order_info['payment_method'],
          "shipping_method " => $or_status['shipping_method'],
          "currency" => $currency
        );
        if ($promo_code != "") {
            $cartinfo = array_merge($cartinfo, array(
              "coupon" => $promo_code
            ));
        }

        $identifire = array();
        if (!$this->customer->isLogged()) {
            $identifire["email"] = $or_status["email"];
            $identifire["phone"] = $or_status["telephone"];
        }
        else {
            $identifire = $this->betaout_get_defaults();
        }
        $parray = array('identifiers' => $identifire,
          "products" => $productarray,
          "order_info" => $cartinfo,
          "activity_type" => "purchase");


        $default = $this->betaout_system_property();
        $betaoutparams = array_merge($default, $parray);
        $requesturl = 'http://api.betaout.com/v2/ecommerce/activities';
        $result = $this->betaout_make_request($requesturl, $betaoutparams);
        $session_key = base64_encode($identifire['email']);
        $this->model_betaout_boutclass->boutCartClear($session_key);
        $this->session->data['cookie'] = NULL;

        return $result;
    }

    public function betaoutidentify($email) {
        $default = array("identifiers" => $this->betaout_get_defaults());
        $requesturl = 'https://api.betaout.com/v2/user/identify';

        if (isset($default['identifiers']['email'])) {
            $_ampUser = array(
              "customer_id" => isset($default['identifiers']["customer_id"]) ? $default['identifiers']["customer_id"] : "",
              "email" => $default['identifiers']['email'],
              "phone" => $default['identifiers']["phone"]
            );

            setcookie("_ampUSER", base64_encode(json_encode($_ampUser)));
            setcookie("_ampUITN", "");
        }
    }

    public function orderUpdateFromAdmin() {
        $this->init();

        isset($this->request->get['product_id']);
        $order_id = $this->request->get['order_id'];

        $productarray = array();
        $or_status = $this->model_checkout_order->getOrder($order_id);
        $order_info = $this->model_account_order->getOrder($order_id);
        $order_info_products = $this->model_account_order->getOrderProducts($order_id);
        $order_info_totals = $this->model_account_order->getOrderTotals($order_id);
        $i = $tax = 0;
        $currency = $this->session->data['currency'];

        

            $betaout_order_status = "";
            if (
                $or_status['order_status'] == "Partially Shipped" ||
                $or_status['order_status'] == "Reshipped" ||
                $or_status['order_status'] == "Fully Shipped" ||
                $or_status['order_status'] == "Self RTO" ||
                $or_status['order_status'] == "Delivered" ||
                $or_status['order_status'] == "Shipped" ||
                $or_status['order_status'] == "Picklisted" ||
                $or_status['order_status'] == "Processing" ||
                $or_status['order_status'] == "Confirmed" ||
                $or_status['order_status'] == "Forward Shipped" ||
                $or_status['order_status'] == "Order Splited" ||
                $or_status['order_status'] == "RTO SELF" ||
                $or_status['order_status'] == "Partially Shipped" ||
                $or_status['order_status'] == "Ready To Ship"
            ) {
                $betaout_order_status = "purchase";
            }
            else if (
                $or_status['order_status'] == "Refunded" ||
                $or_status['order_status'] == "Canceled" ||
                $or_status['order_status'] == "RTO"
            ) {
                $betaout_order_status = "order_refunded";
            } else {
                $betaout_order_status = "order_placed";
            }
            
            if ($betaout_order_status != "") {
            // Add ecommerce items for each product in the order before tracking
            foreach ($order_info_products as $order_product) {
                // Get the info for this product ID 
                $product_info = $this->model_catalog_product->getProduct($order_product['product_id']);
                $productOptions = $this->model_account_order->getOrderOptions($order_id, $order_product['order_product_id']);

                $abc = $this->get_category_names_by_product($order_product['product_id']);
                // Decide whether to use 'Model' or 'SKU' from product info
                if ($this->betaout_use_sku) {
                    $product_info_sku = (string) $product_info['sku'];
                }
                else {
                    $product_info_sku = (string) $product_info['model'];
                }
                $tax +=$order_product['tax'];

                $productarray[$i]['name'] = $order_product['name'];
                $productarray[$i]['sku'] = $product_info_sku;
                $productarray[$i]['price'] = $order_product['price'];
                $productarray[$i]['id'] = $order_product['product_id'];
                $productarray[$i]['categories'] = $abc;
                $productarray[$i]['quantity'] = $order_product['quantity'];
                $productarray[$i]['currency'] = $this->session->data['currency'];
                if (!empty($productOptions)) {
                    $specs = array();
                    $option_count = 0;
                    foreach ($productOptions as $productOption) {
                        $specs[$productOption['name']] = $productOption['value'];
                        $option_count++;
                    }
                    $productarray[$i]['specs'] = $specs;
                }
                $i++;
            }

            $order_shipping = 0;
            $order_subtotal = 0;
            $order_taxes = 0;
            $order_grandtotal = 0;
            $order_discount = 0;
            $promo_code = "";
            // Find out shipping / taxes / total values
            foreach ($order_info_totals as $order_totals) {
                switch ($order_totals['code']) {
                    case "shipping":
                        $order_shipping += $order_totals['value'];
                        break;
                    case "sub_total":
                        $order_subtotal += $order_totals['value'];
                        break;
                    case "tax":
                        $order_taxes += $order_totals['value'];
                        break;
                    case "total":
                        $order_grandtotal += $order_totals['value'];
                        break;
                    case "coupon":
                        $order_discount += $order_totals['value'];
                        $promo_code+=$this->session->data['coupon'] + " ";
                        break;
                    case "voucher":
                        $order_discount += $order_totals['value'];
                        $promo_code+=$this->session->data['coupon'] + " ";
                        break;
                    default:
                        break;
                }
            }

            $cartinfo = array("order_id" => $order_id,
              "revenue" => $order_subtotal,
              "shipping" => $order_shipping,
              "tax" => $tax,
              "discount" => $order_discount,
              "total" => $order_grandtotal,
              "status" => $or_status['order_status'],
              "payment_method" => $order_info['payment_method'],
              "shipping_method " => $or_status['shipping_method'],
              "currency" => $currency
            );
            if ($promo_code != "") {
                $cartinfo = array_merge($cartinfo, array(
                  "coupon" => $promo_code
                ));
            }

            $identifire = array();
            if (!$this->customer->isLogged()) {
                $identifire["email"] = $or_status["email"];
                $identifire["phone"] = $or_status["telephone"];
            }
            else {
                $identifire = $this->betaout_get_defaults();
            }
            $parray = array('identifiers' => $identifire,
              "products" => $productarray,
              "order_info" => $cartinfo,
              "activity_type" => $betaout_order_status);


            $default = $this->betaout_system_property();
            $betaoutparams = array_merge($default, $parray);
            $requesturl = 'http://api.betaout.com/v2/ecommerce/activities';
            $result = $this->betaout_make_request($requesturl, $betaoutparams);
        }
    }

    public function categoryPageView() {

        $this->init();

        $parts = explode('_', (string) $this->request->get['path']);

        $category_id = (int) array_pop($parts);
        $category_info = $this->model_catalog_category->getCategory($category_id);

        if (isset($category_info["name"])) {
            $events = array(
              "events" => array("name" => "catagory_view",
                "timestamp" => time(),
                "event_property" => array(
                  "append" => array(
                    "catagory_name" => $category_info["name"])
                ))
            );
            $identifire = $this->betaout_get_defaults();
            $parray = array('identifiers' => $identifire,
              "events" => $events,
            );

            $default = $this->betaout_system_property();
            $betaoutparams = array_merge($default, $parray);

            $requesturl = 'http://api.betaout.com/v2/user/events';
            $result = $this->betaout_make_request($requesturl, $betaoutparams);
        }
    }
    public function userSignUp() {
        if ($this->customer->isLogged()) {
            $this->init();
            $this->load->model('account/address');
            $this->load->model('account/customer');
            $events = array(
              "events" => array("name" => "sign_up",
                "timestamp" => time(),
                "event_property" => array(
                  "update" => array(
                    "sign_up_url" => $this->baseurl)
                ))
            );
            $identifire = $this->betaout_get_defaults();
            $parray = array('identifiers' => $identifire,
              "events" => $events,
            );

            $default = $this->betaout_system_property();
            $betaoutparams = array_merge($default, $parray);
            
            $requesturl = 'http://api.betaout.com/v2/user/events';
            $result = $this->betaout_make_request($requesturl, $betaoutparams);
            $this->session->data['new_user'] = 0;

            /*
             * Update User Property Query Start Here
             * All User property which is found at the time of
             * Account Created Time that are updated on betaout.
             * 
             */
            $customer = $this->model_account_customer->getCustomer($this->customer->getId());

            $address = $this->model_account_address->getAddress($this->customer->getAddressId());

            $update_array = array_filter(array("firstname" => $this->customer->getFirstName(),
              "lastname" => $this->customer->getLastName(),
              "active_state" => $customer['status'],
              "last_order_id" => "",
              "verified_email" => $customer['approved'] == 1 ? "1" : "0",
              "user_tags" => "",
              "company" => $address['company'],
              "address1" => $address['address_1'],
              "address2" => $address['address_2'],
              "city" => $address['city'],
              "state" => $address['zone'],
              "country" => $address['country'],
              "pin_code" => $address['postcode'],
              "firstseen_date" => time(),
//          "province_code" => $address['province_code'],
              "country_code" => $address['iso_code_3'],
            ));
            $parray = array("timestamp" => time(),
              'identifiers' => $identifire,
              "properties" => array(
                "update" => $update_array));

            $default = $this->betaout_system_property();
            $betaoutparams = array_merge($default, $parray);
            
            $requesturl = 'https://api.betaout.com/v2/user/properties';
            $result = $this->betaout_make_request($requesturl, $betaoutparams);
        }
    }

    public function userAccountPage() {

        if ($this->customer->isLogged()) {
            $this->init();
            $this->load->model('account/address');
            $this->load->model('account/customer');
            
            $customer = $this->model_account_customer->getCustomer($this->customer->getId());

            $address = $this->model_account_address->getAddress($this->customer->getAddressId());
            $events = array(
              "events" => array("name" => "account_page_view",
                "timestamp" => time(),
                "event_property" => array(
                  "update" => array(
                    "signup_date" =>  strtotime($customer["date_added"]))
                ))
            );
            
            $identifire = $this->betaout_get_defaults();
            $parray = array('identifiers' => $identifire,
              "events" => $events,
            );

            $default = $this->betaout_system_property();
            $betaoutparams = array_merge($default, $parray);
            
            $requesturl = 'http://api.betaout.com/v2/user/events';
            $result = $this->betaout_make_request($requesturl, $betaoutparams);
            $this->session->data['new_user'] = 0;

            /*
             * Update User Property Query Start Here
             * All User property which is found at the time of
             * Account Created Time that are updated on betaout.
             * 
             */

            $update_array = array_filter(array("firstname" => $this->customer->getFirstName(),
              "lastname" => $this->customer->getLastName(),
              "active_state" => $customer['status'],
              "last_order_id" => "",
              "verified_email" => $customer['approved'] == 1 ? "1" : "0",
              "user_tags" => "",
              "company" => $address['company'],
              "address1" => $address['address_1'],
              "address2" => $address['address_2'],
              "city" => $address['city'],
              "state" => $address['zone'],
              "country" => $address['country'],
              "pin_code" => $address['postcode'],
              "firstseen_date" => strtotime($customer["date_added"]),
              "country_code" => $address['iso_code_3'],
            ));
            $parray = array("timestamp" => time(),
              'identifiers' => $identifire,
              "properties" => array(
                "update" => $update_array));

            $default = $this->betaout_system_property();
            $betaoutparams = array_merge($default, $parray);
            
            $requesturl = 'https://api.betaout.com/v2/user/properties';
            $result = $this->betaout_make_request($requesturl, $betaoutparams);
        }
    }

    // Returns the Betaout Javascript text to place at the page footer
    // Generates based on Betaout URLs and settings
    // Includes code for setEcommerceView, depending on whether this option is set
    public function getFooterText() {

        $this->init();

        $customer_fname = "";
        $email = "";
        $phone = "";
        $cid = "";
        $newLettere = "";
        $newLettern = "";


        if ($this->customer->getNewsletter()) {
            $newLettere = $this->customer->getEmail();
            $newLettern = $this->customer->getFirstName();
        }
        if ($this->customer->isLogged()) {
            $customer_fname = $this->customer->getFirstName();
            $email = $this->customer->getEmail();
            $phone = $this->customer->getTelePhone();
            $cid = $this->session->data['customer_id'];
        }
        if (isset($this->request->get['product_id'])) {
            $this->setEcommerceView();
        }


        $betaout_footer = '<script type="text/javascript">
        var _bout = _bout || []; var
        _boutAKEY = "' . $this->betaout_api_key . '"; var
        _boutPID = "' . $this->betaout_site_id . '";
        function _boutS(u) {
        var d = document, f = d.getElementsByTagName("script")[0], _sc = d.createElement("script");
        _sc.type = "text/javascript"; _sc.async = true; _sc.src = u; f.parentNode.insertBefore(_sc, f);
        }
        _boutS("//js.betaout.com/jal-v2.min.js");
        _bout.push(["identify", { "customer_id": "' . $cid . '", "email": "' . $email . '", "phone": "' . $phone . '"},'
            . '{"productId": "' . $this->productId . '", "categoryId": "' . $this->catId . '", "brandName": "' . $this->brandName . '"} ]);
      </script>';
        return $betaout_footer;
    }

    public function betaout_get_defaults() {
        $token = "";
        if (isset($_COOKIE['_ampUITN'])) {
            $token = $_COOKIE['_ampUITN'];
        }
        $email = "";
        $cemail = "";
        $phone = "";
        $cid = "";
        if ($this->customer->isLogged()) {
//            $bout_cookie = json_decode(base64_decode($_COOKIE['_ampUSER']));
            $email = $this->customer->getEmail();

//            $cid = isset($bout_cookie->customer_id) ? $bout_cookie->customer_id : "";
            $cid = $this->customer->getId();
            $phone = $this->customer->getTelePhone();
        }
        elseif (isset($this->session->data['guest'])) {
            $email = $this->session->data['guest']['email'];
            $phone = $this->session->data['guest']['telephone'];
        }
        elseif (isset($_COOKIE['_ampUSER'])) {

            $bout_cookie = json_decode(base64_decode($_COOKIE['_ampUSER']));
            $email = $bout_cookie->email;
            $cid = isset($bout_cookie->customer_id) ? $bout_cookie->customer_id : "";
            $phone = $bout_cookie->phone;
            $cemail = $bout_cookie->email;
        }

        if ($email != "" && !is_null($email) && (isset($_COOKIE['_ampUSER']) && $email == $cemail)) {
            $token = "";
        }
        $properties = array();
//        $http_referer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : FALSE;
        if ($email != "") {
            $properties = array_merge($properties, array(
//            'customer_id' => $cid,
              'email' => $email,
              'phone' => $phone,
            ));
            if ($cid != "") {
                $properties = array_merge($properties, array('customer_id' => $cid));
            }
        }

        if ($token != "") {
            $properties = array_merge($properties, array(
              'token' => $token,
            ));
        }
        if (isset($this->session->data['guest']) && $token != "") {
            $properties = array_merge($properties, array(
//            'customer_id' => $cid==""?:$cid,
              'email' => $email,
              'phone' => $phone,
              'token' => $token,
            ));

            if ($cid != "") {
                $properties = array_merge($properties, array('customer_id' => $cid));
            }
        }
        // Let other modules alter the defaults.

        return $properties;
    }

    public function betaout_system_property() {
        $http_referer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : FALSE;
        $properties = array(
          'apikey' => $this->betaout_api_key,
          'project_id' => $this->betaout_site_id,
          'ip' => $_SERVER['REMOTE_ADDR'],
          'useragent' => $_SERVER['HTTP_USER_AGENT'],
          'referrer' => $http_referer,
        );
        return $properties;
    }

    public function betaout_make_request($requesturl, $params) {


        try {
            $data_string = json_encode($params);
            $ch = curl_init($requesturl);
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($ch, CURLOPT_TIMEOUT, 5);
            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

            $result = curl_exec($ch);
        }
        catch (Exception $e) {
            
        }
        return $result;
    }

}
