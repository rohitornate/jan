<?php
class ModelShipwayCourierTracking extends Model
{
    
    
    public function getCourierList($status_enable = false)
    {
		$sql   = "SELECT * FROM `" . DB_PREFIX . "sw_couriers`  ORDER BY name";
		if($status_enable){
			 $sql   = "SELECT * FROM `" . DB_PREFIX . "sw_couriers` WHERE `status` = '1' ORDER BY name";
		}       
        $query = $this->db->query($sql);
        return $query->rows;
    }
    public function updateCourier($id,$name){
		$name = ucwords($name);
		if(!isset($_SESSION['sw_courier']) ){
			$_SESSION['sw_courier']  = array();
			$sql   = "SELECT `courier_id` as id FROM `" . DB_PREFIX . "sw_couriers`  ORDER BY name";
			$query = $this->db->query($sql)->rows;
			foreach($query as $courier){
				$_SESSION['sw_courier'][] = $courier['id'];
			}
			$this->disableAllCourier();
		}
		if(in_array($id,$_SESSION['sw_courier'])){
			$sql = "UPDATE `". DB_PREFIX ."sw_couriers` SET `name` = '".$name."',`status` = '1' WHERE `courier_id` = '".$id."'";
		}else{
			$sql = "INSERT INTO `". DB_PREFIX ."sw_couriers` SET `courier_id` = '".$id."',`name` = '".$name."',`status` = '1'";
		}
		$this->db->query($sql);
	}
	public function disableAllCourier(){
		$sql = "UPDATE `". DB_PREFIX ."sw_couriers` SET `status` = '0'";
		$this->db->query($sql);
	}
	public function enableCourier($carriers){
		$sql = "UPDATE `". DB_PREFIX ."sw_couriers` SET `status` = '1' WHERE `courier_id` IN (".implode(',',$carriers).")";
		$this->db->query($sql);
	}

	public function assignAwb($data)
    {
		$response = array();
		
        //shipway API code starts
		$sql = "SELECT o.order_id,o.date_added AS order_date,o.firstname,o.lastname,o.email,o.telephone AS phone, 
				CONCAT( o.shipping_address_1,',',o.shipping_address_2) AS address,o.shipping_city AS city,
				o.shipping_zone AS state,o.shipping_postcode AS zipcode,o.shipping_country AS country,
				GROUP_CONCAT( CONCAT_WS('|',op.product_id,op.`name`,op.price,op.quantity) SEPARATOR '||' ) AS products,
				o.total as amount,o.payment_code,c.iso_code_2
				FROM `" . DB_PREFIX . "order` o INNER JOIN " . DB_PREFIX . "order_product op ON(o.order_id = op.order_id) 
				INNER JOIN " . DB_PREFIX . "country c ON(c.country_id = o.shipping_country_id)
				WHERE o.order_id = '". (int)$data['order_id'] ."'";
				
		$order_details = $this->db->query($sql)->row;		
				
		if(!empty($order_details)){
			
			$payment_type = 'P';
			if( strtolower( trim( $order_details['payment_code'] ) ) == 'cod'){
				$payment_type = 'C';
			}

			$order_details['payment_type'] = $payment_type;
			$order_details['collectable_amount'] = ($payment_type == 'C') ? $order_details['amount'] : 0;
			
			$data['email'] 		= $order_details['email'];
			$data['phone'] 		= $order_details['phone'];
			$data['first_name'] = $order_details['firstname'];
			$data['last_name'] 	= $order_details['lastname'];
			$data['company'] 	= $this->config->get('config_name');
			$data['products'] 	= '';

			
			$product_data = explode( '||' , $order_details['products'] );
			
			$products = array();
			
			foreach($product_data as $key => $product){
				$product = explode( '|' , $product );
				
				$products[$key]['product_id'] 	= $product[0];
				$products[$key]['name'] 		= $product[1];
				$products[$key]['price'] 		= $product[2];
				$products[$key]['quantity'] 	= $product[3];
				
				$products[$key]['url'] 			= HTTP_CATALOG . 'index.php?route=product/product&product_id=' . $product[0];
				
				// checking for seo url
				if($this->config->get('config_seo_url')){
					
					$alias = "SELECT `keyword` FROM " . DB_PREFIX . "url_alias WHERE `query` LIKE 'product_id=" . $product[0] . "' ";
					$alias = $this->db->query( $alias )->row;
					if( !empty($alias) ){
						$keyword = $alias['keyword'];
						$products[$key]['url']	= HTTP_CATALOG . $keyword;
					}				
				}
				
				$data['products'] .= $product[1] . " ";				
			}
			
			$order_details['products'] = $products;
			
			$order_details['return_address'] 	= $this->config->get('config_address');
			
			//echo json_encode($order_details);die;
			
			$data['order']	= $order_details;
			$data['store_code']	= 'opencart';
			$data['country_code']	= $order_details['iso_code_2'];
			// pushing order
			$url = "https://shipway.in/api/pushOrderData";
			
			$data_string = json_encode($data);
			
			$curl = curl_init();
			curl_setopt($curl, CURLOPT_HTTPHEADER, array(
				'Content-Type:application/json'
			));
			curl_setopt($curl, CURLOPT_URL, $url);
			curl_setopt($curl, CURLOPT_POST, true);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
			curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
			
			$output = curl_exec($curl);
			$output = json_decode($output);
			curl_close($curl);
			//echo "<pre>";print_r($output);die;
			$message = (isset($output->message)) ? $output->message : 'Something went wrong.';
			
			if(isset($output->status) && strtolower($output->status) == 'success'){
				$sql   = "UPDATE `" . DB_PREFIX . "order` SET `awbno` = '" . $data['awb'] . "',  `courier_id` = '" . $data['carrier_id'] . "' WHERE `order_id`='" . $data['order_id']."'";
				$query = $this->db->query($sql);
				if($query){
					echo json_encode(array('status'=>'success','message'=>$message));
				}else{
					echo json_encode(array('status'=>'failed','message'=>'Order information not found.'));
				}
			}else{
				echo json_encode(array('status'=>'failed','message'=>$message));
			}			
		}else{
			echo json_encode(array('message'=>'No order found.','message'=>$message));
		}		
    }
	public function getOrderShipwayFields($results = array()) {
		$orders = array();
		$order_index = array();
		
		foreach($results as $key => $order){
			$orders[] = $order['order_id'];
			$order_index[$key] = $order['order_id'];
		}
		
		if(empty($orders)){
			return $results;
		}
		
		$sql = "SELECT o.order_id,o.awbno, o.courier_id FROM `" . DB_PREFIX . "order` o WHERE o.order_id IN(" . implode(',' , $orders ) . ") ";
		$shipway_data = $this->db->query($sql)->rows;
		
		foreach($shipway_data as $data){
			$order_key = array_search($data['order_id'] , $order_index);

			if($order_key !== FALSE){
				$results[$order_key]['awbno'] = $data['awbno'] ;
				$results[$order_key]['courier_id'] = $data['courier_id'] ;
			}
		}
		
		return $results;
		
	}
}
?>