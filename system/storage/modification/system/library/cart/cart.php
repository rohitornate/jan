<?php
namespace Cart;
class Cart {

public function getGiftsSettings($code, $store_id) {
$data = array(); 
$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `code` = '" . $this->db->escape($code) . "'");
foreach ($query->rows as $result) {
if (!$result['serialized']) {
$data[$result['key']] = $result['value'];
} else {
$data[$result['key']] = json_decode($result['value'], true);
}
}
return $data;
}
public function updateGifts() {
$eligible_gifts = $this->getEligibleGifts();
$option_key = 'gift_teaser';
foreach ($eligible_gifts as $eligible_gift) {
$product_options = $this->db->query("SELECT po.product_id, po.option_value_id as option_index, ovp.name FROM `". DB_PREFIX . "product_option_value` po LEFT JOIN `" . DB_PREFIX . "option_value_description` ovp ON (po.option_value_id = ovp.option_value_id) WHERE po.product_id=".(int)$eligible_gift)->rows;
if(!empty($product_options)) {
continue;
}
$gift_teaser_set = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$eligible_gift . "' AND gift_teaser = true")->num_rows;
if ($gift_teaser_set == 0) {
$this->db->query("INSERT " . DB_PREFIX . "cart SET api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "', customer_id = '" . (int)$this->customer->getId() . "', session_id = '" . $this->db->escape($this->session->getId()) . "', product_id = '" . (int)$eligible_gift . "', recurring_id = '0', `option` = '[]', quantity = '1',gift_teaser = true, date_added = NOW()");
}
}
}
public function removeGifts() {
foreach ($this->getProducts() as $key => $val) {
if (!empty($val['gift_teaser']) && $val['gift_teaser'] == true) { 
if(empty($val['option'])) {
if($this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$val['product_id'] . "' AND gift_teaser = true")->num_rows > 0);
$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id= '". (int)$val['product_id'] . "' AND gift_teaser = true");
$this->data = array();
}
}
}
}

	private $data = array();

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');
		$this->tax = $registry->get('tax');
		$this->weight = $registry->get('weight');

		// Remove all the expired carts with no customer ID
		//$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE (api_id > '0' OR customer_id = '0') AND date_added < DATE_SUB(NOW(), INTERVAL 1 HOUR)");

		if ($this->customer->getId()) {
			// We want to change the session ID on all the old items in the customers cart
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET session_id = '" . $this->db->escape($this->session->getId()) . "' WHERE api_id = '0' AND customer_id = '" . (int)$this->customer->getId() . "'");

			// Once the customer is logged in we want to update the customers cart
			$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '0' AND customer_id = '0' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

			foreach ($cart_query->rows as $cart) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart['cart_id'] . "'");

				// The advantage of using $this->add is that it will check if the products already exist and increaser the quantity if necessary.
				if (!empty($cart['gift_teaser']) && ($cart['gift_teaser'] == true || $cart['gift_teaser'] == "true")) {
$this->prepareGiftTeaserArg($gift = true);
} 
$this->add($cart['product_id'], $cart['quantity'], json_decode($cart['option']), $cart['recurring_id']);
			}
		}
	}


public function getEligibleGifts() {
$setting = $this->getGiftsSettings('giftteaser', $this->config->get('config_store_id'));
$eligible_gifts = array();
if (empty($setting['giftteaser']['Enabled']) || $setting['giftteaser']['Enabled'] == 'no') return $eligible_gifts;
$this->removeGifts();
$gifts = $this->getAllGifts();
$cart_products = array_map(create_function('$a', 'return $a["product_id"];'), $this->getProducts());

if (empty($cart_products)) return $eligible_gifts;

$products = $this->getProducts();
	foreach ($gifts as $gift) {
$properties = unserialize($gift['condition_properties']);
$to_add = null;
if((int)$gift['minimum'] > 0) {
$to_add_quantity = (int)$gift['minimum'];
} else {
$to_add_quantity = 1;
}
if(isset($this->session->data['customer_id'])) {
$query = $this->db->query("SELECT customer_group_id FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "'") ->row;
$customer_group_id = $query['customer_group_id'];
} else {
$customer_group_id = '0';
}
if(isset($properties['customer_group']) && !empty($properties['customer_group']) && in_array($customer_group_id, $properties['customer_group'])) {
if(isset($properties['select_total']) && $properties['select_total'] == 'subtotal') {
$cart_total = $this->getSubTotal();
} else {
$cart_total = $this->getTotal();
}
switch ($gift['condition_type']) {
case '1' : {
if ((int)$properties['total'] < $cart_total && (int)$properties['total_max'] > $cart_total) {
$to_add = $gift['product_id'];
}
} break;
case '2' : {
if(isset($properties['certain'])) {
$eligible_products = array_intersect($properties['certain'], $cart_products);
}
$add_gift= array();
if(isset($eligible_products)) {
foreach($eligible_products as $eligible_product) {
unset($quantity);
$quantity=array();
foreach($products as $key => $value) {
$exp_key = $value['product_id'];
if($exp_key == $eligible_product){
$quantity[] = $value['quantity'];
}
}
if(count($quantity) > 1 ) {
$quantity = array_sum($quantity);
} else {
$quantity = $quantity[0];
}
if($quantity >= $properties['certain_product_quantity'] ) {
$add_gift[] = 'true';
} else {
$add_gift[] = 'false';
}
} 
}
if (in_array("false", $add_gift)) {
$quantity_reached = false;
} else {
$quantity_reached = true;
}
if (
isset($properties['certain']) &&
array_values(array_intersect($properties['certain'], $cart_products)) === array_values($properties['certain']) &&
$quantity_reached
) {
$to_add = $gift['product_id'];
}
} break;
case '3' : {
if(isset($properties['some'])) {
$eligible_products = array_intersect($properties['some'], $cart_products);
}
$add_gift= array();
foreach($eligible_products as $eligible_product) {
unset($quantity);
$quantity=array();
foreach($products as $key => $value) {
$exp_key = $value['product_id'];
if($exp_key == $eligible_product){
$quantity[] = $value['quantity'];
}
}
if(count($quantity) > 1 ) {
$quantity = array_sum($quantity);
} else {
$quantity = $quantity[0];
}
if($quantity >= $properties['some_product_quantity'] ) {
$add_gift[] = 'true';
} else {
$add_gift[] = 'false';
}
} 
if (in_array("true", $add_gift)) {
$quantity_reached = true;
} else {
$quantity_reached = false;
}
if (
isset($properties['some']) &&
count(array_intersect($properties['some'], $cart_products)) &&
$quantity_reached 
) { 
$to_add = $gift['product_id'];
}
} break; 
case '4' : {
if (
isset($properties['categories']) &&
$this->categoriesHaveProducts($properties['categories'], $cart_products)
) {
$to_add = $gift['product_id'];
}
} break;
case '5' : {
if (
isset($properties['manufacturer']) &&
$this->manufacturersHaveProducts($properties['manufacturer'], $cart_products)
) {
$to_add = $gift['product_id'];
}
} break;
}
}
if (
!empty($this->session->data['gift_teaser_exclude']) && 
in_array($to_add, $this->session->data['gift_teaser_exclude'])
) {
continue;
}
if (!empty($to_add)) {
for ($i = 0; $i < $to_add_quantity; $i++) {
$eligible_gifts[] = $to_add;
}
}
}
return $eligible_gifts;
}
public function restartGifts() {
unset($this->session->data['gift_teaser_exclude']);
$this->updateGifts();
}
public function getAllGifts() {
$sql = "SELECT *, gt.description AS description FROM `". DB_PREFIX . "gift_teaser` gt LEFT JOIN `" . DB_PREFIX . "product` p ON (gt.item_id = p.product_id) LEFT JOIN `" . DB_PREFIX . "product_description` pd ON (p.product_id = pd.product_id) WHERE gt.start_date < " . time() . " AND gt.end_date > " . time() ." AND gt.store_id = '" . $this->config->get('config_store_id') . "' AND language_id = '" . $this->config->get('config_language_id') . "' ORDER BY gt.sort_order ASC";
$result = $this->db->query($sql);
return $result->rows;
}
public function categoriesHaveProducts($category_ids, $product_ids) {
$sql = "SELECT COUNT(*) as count FROM `" . DB_PREFIX . "product_to_category` WHERE category_id IN (" . implode(',', $category_ids) . ") AND product_id IN (" . implode(',', $product_ids) . ")";
$result = $this->db->query($sql);
return (int)$result->row['count'] > 0;
}
public function manufacturersHaveProducts($manufacturer_ids, $product_ids) {
$sql = "SELECT COUNT(*) as count FROM `" . DB_PREFIX . "product` WHERE manufacturer_id IN (" . implode(',', $manufacturer_ids) . ") AND product_id IN (" . implode(',', $product_ids) . ")";
$result = $this->db->query($sql);
return (int)$result->row['count'] > 0;
}

	public function getProducts() {
		$product_data = array();

		$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

		foreach ($cart_query->rows as $cart) {
			$stock = true;

			$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store p2s LEFT JOIN " . DB_PREFIX . "product p ON (p2s.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2s.product_id = '" . (int)$cart['product_id'] . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");


// GiftTeaser
if (!empty($cart['gift_teaser']) && ($cart['gift_teaser'] == true || $cart['gift_teaser'] == "true")) {
$gift_teaser = true;
} else {
$gift_teaser = false;
} 

			if ($product_query->num_rows && ($cart['quantity'] > 0)) {
				$option_price = 0;
				$option_points = 0;
				$option_weight = 0;

				$option_data = array();

				foreach (json_decode($cart['option']) as $product_option_id => $value) {
					$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$cart['product_id'] . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

					if ($option_query->num_rows) {
						if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio') {
							$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

							if ($option_value_query->num_rows) {
								if ($option_value_query->row['price_prefix'] == '+') {
									$option_price += $option_value_query->row['price'];
								} elseif ($option_value_query->row['price_prefix'] == '-') {
									$option_price -= $option_value_query->row['price'];
								}

								if ($option_value_query->row['points_prefix'] == '+') {
									$option_points += $option_value_query->row['points'];
								} elseif ($option_value_query->row['points_prefix'] == '-') {
									$option_points -= $option_value_query->row['points'];
								}

								if ($option_value_query->row['weight_prefix'] == '+') {
									$option_weight += $option_value_query->row['weight'];
								} elseif ($option_value_query->row['weight_prefix'] == '-') {
									$option_weight -= $option_value_query->row['weight'];
								}

								if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
									$stock = false;
								}

								$option_data[] = array(
									'product_option_id'       => $product_option_id,
									'product_option_value_id' => $value,
									'option_id'               => $option_query->row['option_id'],
									'option_value_id'         => $option_value_query->row['option_value_id'],
									'name'                    => $option_query->row['name'],
									'value'                   => $option_value_query->row['name'],
									'type'                    => $option_query->row['type'],
									'quantity'                => $option_value_query->row['quantity'],
									'subtract'                => $option_value_query->row['subtract'],
									'price'                   => $option_value_query->row['price'],
									'price_prefix'            => $option_value_query->row['price_prefix'],
									'points'                  => $option_value_query->row['points'],
									'points_prefix'           => $option_value_query->row['points_prefix'],
									'weight'                  => $option_value_query->row['weight'],
									'weight_prefix'           => $option_value_query->row['weight_prefix']
								);
							}
						} elseif ($option_query->row['type'] == 'checkbox' && is_array($value)) {
							foreach ($value as $product_option_value_id) {
								$option_value_query = $this->db->query("SELECT pov.option_value_id, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix, ovd.name FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (pov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

								if ($option_value_query->num_rows) {
									if ($option_value_query->row['price_prefix'] == '+') {
										$option_price += $option_value_query->row['price'];
									} elseif ($option_value_query->row['price_prefix'] == '-') {
										$option_price -= $option_value_query->row['price'];
									}

									if ($option_value_query->row['points_prefix'] == '+') {
										$option_points += $option_value_query->row['points'];
									} elseif ($option_value_query->row['points_prefix'] == '-') {
										$option_points -= $option_value_query->row['points'];
									}

									if ($option_value_query->row['weight_prefix'] == '+') {
										$option_weight += $option_value_query->row['weight'];
									} elseif ($option_value_query->row['weight_prefix'] == '-') {
										$option_weight -= $option_value_query->row['weight'];
									}

									if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
										$stock = false;
									}

									$option_data[] = array(
										'product_option_id'       => $product_option_id,
										'product_option_value_id' => $product_option_value_id,
										'option_id'               => $option_query->row['option_id'],
										'option_value_id'         => $option_value_query->row['option_value_id'],
										'name'                    => $option_query->row['name'],
										'value'                   => $option_value_query->row['name'],
										'type'                    => $option_query->row['type'],
										'quantity'                => $option_value_query->row['quantity'],
										'subtract'                => $option_value_query->row['subtract'],
										'price'                   => $option_value_query->row['price'],
										'price_prefix'            => $option_value_query->row['price_prefix'],
										'points'                  => $option_value_query->row['points'],
										'points_prefix'           => $option_value_query->row['points_prefix'],
										'weight'                  => $option_value_query->row['weight'],
										'weight_prefix'           => $option_value_query->row['weight_prefix']
									);
								}
							}
						} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
							$option_data[] = array(
								'product_option_id'       => $product_option_id,
								'product_option_value_id' => '',
								'option_id'               => $option_query->row['option_id'],
								'option_value_id'         => '',
								'name'                    => $option_query->row['name'],
								'value'                   => $value,
								'type'                    => $option_query->row['type'],
								'quantity'                => '',
								'subtract'                => '',
								'price'                   => '',
								'price_prefix'            => '',
								'points'                  => '',
								'points_prefix'           => '',
								'weight'                  => '',
								'weight_prefix'           => ''
							);
						}
					}
				}

				$price = $product_query->row['price'];

				// Product Discounts
				$discount_quantity = 0;

				foreach ($cart_query->rows as $cart_2) {
					if ($cart_2['product_id'] == $cart['product_id']) {
						$discount_quantity += $cart_2['quantity'];
					}
				}

				$product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND quantity <= '" . (int)$discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");

				if ($product_discount_query->num_rows) {
					$price = $product_discount_query->row['price'];
				}

				// Product Specials
				$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");

				if ($product_special_query->num_rows) {
					$price = $product_special_query->row['price'];
				}

				// Reward Points
				$product_reward_query = $this->db->query("SELECT points FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

				if ($product_reward_query->num_rows) {
					$reward = $product_reward_query->row['points'];
				} else {
					$reward = 0;
				}

				// Downloads
				$download_data = array();

				$download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download p2d LEFT JOIN " . DB_PREFIX . "download d ON (p2d.download_id = d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) WHERE p2d.product_id = '" . (int)$cart['product_id'] . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

				foreach ($download_query->rows as $download) {
					$download_data[] = array(
						'download_id' => $download['download_id'],
						'name'        => $download['name'],
						'filename'    => $download['filename'],
						'mask'        => $download['mask']
					);
				}

				// Stock
				if (!$product_query->row['quantity'] || ($product_query->row['quantity'] < $cart['quantity'])) {
					$stock = false;
				}

				$recurring_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring r LEFT JOIN " . DB_PREFIX . "product_recurring pr ON (r.recurring_id = pr.recurring_id) LEFT JOIN " . DB_PREFIX . "recurring_description rd ON (r.recurring_id = rd.recurring_id) WHERE r.recurring_id = '" . (int)$cart['recurring_id'] . "' AND pr.product_id = '" . (int)$cart['product_id'] . "' AND rd.language_id = " . (int)$this->config->get('config_language_id') . " AND r.status = 1 AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

				if ($recurring_query->num_rows) {
					$recurring = array(
						'recurring_id'    => $cart['recurring_id'],
						'name'            => $recurring_query->row['name'],
						'frequency'       => $recurring_query->row['frequency'],
						'price'           => $recurring_query->row['price'],
						'cycle'           => $recurring_query->row['cycle'],
						'duration'        => $recurring_query->row['duration'],
						'trial'           => $recurring_query->row['trial_status'],
						'trial_frequency' => $recurring_query->row['trial_frequency'],
						'trial_price'     => $recurring_query->row['trial_price'],
						'trial_cycle'     => $recurring_query->row['trial_cycle'],
						'trial_duration'  => $recurring_query->row['trial_duration']
					);
				} else {
					$recurring = false;
				}

				$product_data[] = array(
					'cart_id'         => $cart['cart_id'],
					'product_id'      => $product_query->row['product_id'],

'gift_teaser' => $gift_teaser,

					'name'            => $product_query->row['name'],
					'model'           => $product_query->row['model'],
					'mrp'            => $product_query->row['price'],
					'shipping'        => $product_query->row['shipping'],
					'image'           => $product_query->row['image'],
					'option'          => $option_data,
					'download'        => $download_data,
					'quantity'        => $cart['quantity'],
					'minimum'         => $product_query->row['minimum'],
					'subtract'        => $product_query->row['subtract'],
					'stock'           => $stock,
					
'real_price'                     => ($price + $option_price),
'price'                     => ($gift_teaser==true) ? '0' : ($price + $option_price),

					
'total'                     => ($gift_teaser==true) ? '0' : ($price + $option_price) * $cart['quantity'],

					'price1'           => ($price + $option_price),
					'total1'           => ($price + $option_price) * $cart['quantity'],
					'reward'          => $reward * $cart['quantity'],
					'points'          => ($product_query->row['points'] ? ($product_query->row['points'] + $option_points) * $cart['quantity'] : 0),
					
'real_tax_class_id'              =>  $product_query->row['tax_class_id'],
'tax_class_id'              =>  ($gift_teaser==true) ? '0' : $product_query->row['tax_class_id'],

					'weight'          => ($product_query->row['weight'] + $option_weight) * $cart['quantity'],
					'weight_class_id' => $product_query->row['weight_class_id'],
					'length'          => $product_query->row['length'],
					'width'           => $product_query->row['width'],
					'height'          => $product_query->row['height'],
					'length_class_id' => $product_query->row['length_class_id'],
					'recurring'       => $recurring
				);
			} else {
				$this->remove($cart['cart_id']);
			}
		}


$setting = $this->getGiftsSettings('giftteaser', $this->config->get('config_store_id'));
if (!empty($setting['giftteaser']['FreeGiftLabel'][$this->config->get('config_language_id')])) {
$free_gift = $setting['giftteaser']['FreeGiftLabel'][$this->config->get('config_language_id')];
} else {
$free_gift = '';
}
foreach ($product_data as &$product) {
$product['name'] = !empty($free_gift) && !empty($product['gift_teaser']) && stripos($product['name'], $free_gift) === false ? $product['name'] . ' (' . trim($free_gift) . ')' : $product['name'];
}

		return $product_data;
	}

	public function prepareGiftTeaserArg($data) {
	$this->temp_gt_arg = $data;
}
public function consumeGiftTeaserArg() {
if(isset($this->temp_gt_arg)) {
$temp = $this->temp_gt_arg;
unset($this->temp_gt_arg);
} else {
$temp = 0;
}
return $temp;
}
public function add($product_id, $quantity = 1, $option = array(), $recurring_id = 0) {
$gift = $this->consumeGiftTeaserArg();
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "'");


$gift_column = $this->db->query("SHOW COLUMNS FROM " .DB_PREFIX . "cart LIKE 'gift_teaser'");
if ($gift_column->num_rows==0) {
$query = $this->db->query("ALTER TABLE " .DB_PREFIX . "cart ADD gift_teaser VARCHAR(5) DEFAULT false AFTER product_id ");
}
$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "'AND gift_teaser = '" . $gift ."' AND `option` = '" . $this->db->escape(json_encode($option)) . "'");
if (strpos($_SERVER['REQUEST_URI'], 'checkout/cart/add') == false) {
if (isset($gift_teaser) && $gift_teaser == true) {
$product_gift = true;
}  else {
$product_gift = false;
}
}
if($gift==true) {
$product_gift = true;
}

		if (!$query->row['total']) {
			$this->db->query("INSERT " . DB_PREFIX . "cart SET api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "', customer_id = '" . (int)$this->customer->getId() . "', session_id = '" . $this->db->escape($this->session->getId()) . "', product_id = '" . (int)$product_id . "', recurring_id = '" . (int)$recurring_id . "', `option` = '" . $this->db->escape(json_encode($option)) . "', quantity = '" . (int)$quantity . "', date_added = NOW()");

if(isset($product_gift) && $product_gift == true) { 
$cart_id = $this->db->getLastId();
$this->db->query("UPDATE " . DB_PREFIX . "cart SET gift_teaser = '" . $product_gift . "' WHERE cart_id = '" . (int)$cart_id  . "'");
}
$this->updateGifts();
$this->restartGifts();

		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = (quantity + " . (int)$quantity . ") WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "'");

$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = 1 WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "' AND gift_teaser=true");
$this->updateGifts();
$this->restartGifts();

		}
	}

	public function update($cart_id, $quantity) {
		$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = '" . (int)$quantity . "' WHERE cart_id = '" . (int)$cart_id . "' AND api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

$this->updateGifts();

	}

	public function remove($cart_id) {

$removed_product = $this->db->query("SELECT * FROM ". DB_PREFIX. "cart WHERE cart_id= '".$cart_id."'")->row;
if (empty($this->session->data['gift_teaser_exclude'])) {
$this->session->data['gift_teaser_exclude'] = array();
}
if (!in_array($removed_product['product_id'], $this->session->data['gift_teaser_exclude']) && !empty($removed_product['gift_teaser']) && $removed_product['gift_teaser'] == 'true') {
$this->session->data['gift_teaser_exclude'][] = $removed_product['product_id'];
}

		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart_id . "' AND api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

$this->updateGifts();

	}

	public function clear() {

$this->updateGifts();

		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
	}

	public function getRecurringProducts() {
		$product_data = array();

		foreach ($this->getProducts() as $value) {
			if ($value['recurring']) {
				$product_data[] = $value;
			}
		}

		return $product_data;
	}

	public function getWeight() {
		$weight = 0;

		foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
				$weight += $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
			}
		}

		return $weight;
	}

	public function getSubTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $product['total'];
		}

		return $total;
	}

	public function getTaxes() {
		$tax_data = array();

		foreach ($this->getProducts() as $product) {
			if ($product['tax_class_id']) {
				$tax_rates = $this->tax->getRates($product['price'], $product['tax_class_id']);

				foreach ($tax_rates as $tax_rate) {
					if (!isset($tax_data[$tax_rate['tax_rate_id']])) {
						$tax_data[$tax_rate['tax_rate_id']] = ($tax_rate['amount'] * $product['quantity']);
					} else {
						$tax_data[$tax_rate['tax_rate_id']] += ($tax_rate['amount'] * $product['quantity']);
					}
				}
			}
		}

		return $tax_data;
	}

	public function getTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
		}

		return $total;
	}

	public function countProducts() {
		$product_total = 0;

		$products = $this->getProducts();

		foreach ($products as $product) {
			$product_total += $product['quantity'];
		}

		return $product_total;
	}

	public function hasProducts() {
		return count($this->getProducts());
	}

	public function hasRecurringProducts() {
		return count($this->getRecurringProducts());
	}

	public function hasStock() {
		foreach ($this->getProducts() as $product) {
			if (!$product['stock']) {
				return false;
			}
		}

		return true;
	}

	public function hasShipping() {
		foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
				return true;
			}
		}

		return false;
	}

	public function hasDownload() {
		foreach ($this->getProducts() as $product) {
			if ($product['download']) {
				return true;
			}
		}

		return false;
	}
}
