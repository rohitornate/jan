<?php
class ModelTotalDiscountPaymentMaxCap extends Model {
	
    public function getTotal(&$total_data, &$total, &$taxes) {

        $code = $this->config->get('discount_payment_max_cap_code');

        if ( isset($this->session->data['payment_method']['code']) && !empty($code) && $this->session->data['payment_method']['code'] == $code ) {

            $min = $this->config->get('discount_payment_max_cap_min');
            if ( is_numeric($min) && $total < $min ) return;
            $max = $this->config->get('discount_payment_max_cap_max');
            if ( is_numeric($max) && $total > $max ) return;

            $this->language->load('total/discount_payment_max_cap');
            
    
            $cats = $this->config->get('discount_payment_max_cap_categories');
            if ( in_array(0,$cats) ) $cats = array();
            $discount = $this->config->get('discount_payment_max_cap_amount');
            $percent = $this->config->get('discount_payment_max_cap_percent');
			
			$mmax = $this->config->get('discount_payment_max_cap_mmax');

            if ( empty($cats) ) {
                if ( $percent ) $discount = ( $total * $discount ) / 100;
            } else { # discount on selected categories only
                $this->load->model('catalog/product');
                $products = $this->cart->getProducts();

                $discount_p = 0;
                
                foreach ($products as $product) {
                    $categories = $this->model_catalog_product->getCategories($product['product_id']);
                    foreach ($categories as $category) { 
                        if ( in_array($category['category_id'],$cats) ) {
                            if ( $percent ) { 
                                $discount_p += ( $product['total'] * $discount ) / 100;
                                break;
                            } else {
                                break 2;
                            }
                        }
                    }
                }
                if ( $percent ) $discount = $discount_p;
            }
            $msgs = $this->config->get('discount_payment_max_cap_msg');
            if ( !is_array($msgs) || empty($msgs[$this->config->get('config_language_id')]) ) {
                $msg = $this->language->get('text_discount_payment_max_cap');
            } else {
                $msg = $msgs[$this->config->get('config_language_id')];
            }
			
			if($discount < 0 && $mmax < 0)
			{			
            if($discount >= $mmax )	$capvalue = $discount;
			else $capvalue = $mmax;
			}
			else
			{
				if($discount <= $mmax )
					$capvalue=$discount;
				else
					$capvalue = $mmax;
			}

            $total_data[] = array( 
                'code'       => 'discount_payment_max_cap',
                'title'      => $msg,
                'text'       => $this->currency->format($capvalue), 
                'value'      => $capvalue,
                'sort_order' => $this->config->get('discount_payment_max_cap_sort_order')
            );

            $total += $capvalue;
        }
    }
}
?>
