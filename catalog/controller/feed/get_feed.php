<?php

require_once(DIR_SYSTEM.'/library/csv.php');



class ControllerFeedGetFeed extends Controller

{

    public $feed_arr;

    public function index() {

        $this->load->model('catalog/product');

        $this->load->model('catalog/category');

        $this->load->model('tool/image');



        $this->feed_arr[0] = array('ID','ID2','Item title','Final URL','Image URL','Item subtitle','Item description','Item category','Price','Sale price','Contextual keywords','Item address');



        $products = $this->model_catalog_product->getProducts();
        

        $i = 1;



        foreach($products as $key => $product){

            $product_category = $this->model_catalog_product->getCategories($product['product_id']);

            if($product_category) {
                $category = $this->model_catalog_category->getCategory($product_category[0]['category_id']);
            } else {
                $category = ['name' => ''];
            }

            if ((float)$product['special']) {

                $special = $this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax'));

            } else {

                $special = false;

            }

            $name = explode(',',$product['name']);

            $name = implode(' ',$name);

            $meta_title = explode(',',$product['meta_title']);

            $meta_title = implode(' ',$meta_title);

            $meta_description = explode(',',$product['meta_description']);

            $meta_description = implode(' ',$meta_description);

            $category_name = explode(',',$category['name']);

            $category_name = implode(' ',$category_name);

            if($product['image']) {

                if(VERSION >= '2.2.0.0') {

                    $image = HTTPS_SERVER.trim($this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')));
                } else {

                    $image = trim($this->model_tool_image->resize($product['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')));

                }

                $image = str_replace(' ', '%20', $image);

            } else {

                $image = '';

            }



            if(VERSION >= '2.0.0.0') {

                $currency_code = $this->session->data['currency'];

            } else {

                $currency_code = '';

            }

            $this->feed_arr[$i] = array(

                'id' => $product['product_id'],

                'id2' => trim(($product['sku'])?html_entity_decode($product['sku']):html_entity_decode($product['model'])),

                'item_title' => trim(html_entity_decode($name)),

                'final_url' => str_replace(' ', '%20', trim($this->url->link('product/product', 'product_id=' . $product['product_id']))),

                'img_url' => $image,

                'item_subtitle' => trim(html_entity_decode($meta_title)),

                'item_desc' => trim(html_entity_decode(str_replace("\r", " ", str_replace("\n", " ", $meta_description)))),

                'item_category' => trim(html_entity_decode($category_name)),

                'price' => round($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), 2) . ' ' . (($currency_code)?$currency_code:$this->currency->getCode()),
                'sale_price' => ($special) ? round($special, 2) . ' ' . (($currency_code)?$currency_code:$this->currency->getCode()) : '',

                'context_keywords' => '',

                'item_address' => ''

            );

            

            $i++;

        }

        

        if(VERSION >= '2.3.0.0') {

            $feed = new CsvWriter(DIR_DOWNLOAD.'opencart_mod_feed.csv',$this->feed_arr,',');

        } else {

            $feed = new CsvWriter(DIR_DOWNLOAD.'opencart_mod_feed.csv',$this->feed_arr,',');

        }

        $feed->GetCsv();

        

        if(VERSION < '2.1.0.0' && VERSION >= '2.0.0.0') {

            echo 'File was created. <a href="download.php?file=opencart_mod_feed.csv&path=system/download/">Download</a> file from '.date("d.m.Y  H:i");

        } 

        if(VERSION >= '2.1.0.0' && VERSION < '2.3.0.0') {

            echo 'File was created. <a href="download.php?file=opencart_mod_feed.csv&path=system/storage/download/">Download</a> file from '.date("d.m.Y  H:i");

        } 

        if(VERSION >= '2.3.0.0') {

            echo 'File was created. <a href="download.php?file=opencart_mod_feed.csv&path=system/storage/upload/">Download</a> file from '.date("d.m.Y  H:i");

        } 

        if(VERSION < '2.0.0.0') {

            echo 'File was created. <a href="download.php?file=opencart_mod_feed.csv&path=download/">Download</a> file from '.date("d.m.Y  H:i");

        }

    }

}