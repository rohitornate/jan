<?php
class ModelCatalogProduct extends Model {
	public function addProduct($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW(), no_follow='".$data['no_follow']."', alt='".$data['alt']."'");

		$product_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}
		
		if (isset($data['video_url'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET video_url = '" . $this->db->escape($data['video_url']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}

		foreach ($data['product_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$product_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', custom_alt = '" . ((isset($value['custom_alt']))?($this->db->escape($value['custom_alt'])):'') . "', custom_h1 = '" . ((isset($value['custom_h1']))?($this->db->escape($value['custom_h1'])):'') . "', custom_h2 = '" . ((isset($value['custom_h2']))?($this->db->escape($value['custom_h2'])):'') . "', custom_imgtitle = '" . ((isset($value['custom_imgtitle']))?($this->db->escape($value['custom_imgtitle'])):'') . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['product_store'])) {
			foreach ($data['product_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['product_attribute'])) {
			foreach ($data['product_attribute'] as $product_attribute) {
				if ($product_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$product_attribute['attribute_id'] . "'");

					foreach ($product_attribute['product_attribute_description'] as $language_id => $product_attribute_description) {
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$product_attribute['attribute_id'] . "' AND language_id = '" . (int)$language_id . "'");

						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$product_id . "', attribute_id = '" . (int)$product_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($product_attribute_description['text']) . "'");
					}
				}
			}
		}

		if (isset($data['product_option'])) {
			foreach ($data['product_option'] as $product_option) {
				if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
					if (isset($product_option['product_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', required = '" . (int)$product_option['required'] . "'");

						$product_option_id = $this->db->getLastId();

						foreach ($product_option['product_option_value'] as $product_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$product_option_id . "', product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', option_value_id = '" . (int)$product_option_value['option_value_id'] . "', quantity = '" . (int)$product_option_value['quantity'] . "', subtract = '" . (int)$product_option_value['subtract'] . "', price = '" . (float)$product_option_value['price'] . "', price_prefix = '" . $this->db->escape($product_option_value['price_prefix']) . "', points = '" . (int)$product_option_value['points'] . "', points_prefix = '" . $this->db->escape($product_option_value['points_prefix']) . "', weight = '" . (float)$product_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($product_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', value = '" . $this->db->escape($product_option['value']) . "', required = '" . (int)$product_option['required'] . "'");
				}
			}
		}

		if (isset($data['product_discount'])) {
			foreach ($data['product_discount'] as $product_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$product_discount['customer_group_id'] . "', quantity = '" . (int)$product_discount['quantity'] . "', priority = '" . (int)$product_discount['priority'] . "', price = '" . (float)$product_discount['price'] . "', date_start = '" . $this->db->escape($product_discount['date_start']) . "', date_end = '" . $this->db->escape($product_discount['date_end']) . "'");
			}
		}

		if (isset($data['product_special'])) {
			foreach ($data['product_special'] as $product_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$product_special['customer_group_id'] . "', priority = '" . (int)$product_special['priority'] . "', price = '" . (float)$product_special['price'] . "', date_start = '" . $this->db->escape($product_special['date_start']) . "', date_end = '" . $this->db->escape($product_special['date_end']) . "'");
			}
		}

		if (isset($data['product_image'])) {
			foreach ($data['product_image'] as $product_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . $this->db->escape($product_image['image']) . "',image_alt = '" . $this->db->escape($product_image['image_alt']) . "', sort_order = '" . (int)$product_image['sort_order'] . "'");
			}
		}

		if (isset($data['product_download'])) {
			foreach ($data['product_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$product_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		if (isset($data['product_category'])) {
			foreach ($data['product_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['product_filter'])) {
			foreach ($data['product_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$product_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		if (isset($data['product_related'])) {
			foreach ($data['product_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$product_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$product_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$product_id . "'");
			}
		}

		if (isset($data['product_reward'])) {
			foreach ($data['product_reward'] as $customer_group_id => $product_reward) {
				if ((int)$product_reward['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$product_reward['points'] . "'");
				}
			}
		}

		if (isset($data['product_layout'])) {
			foreach ($data['product_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		if (isset($data['product_recurring'])) {
			foreach ($data['product_recurring'] as $recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$product_id . ", customer_group_id = " . (int)$recurring['customer_group_id'] . ", `recurring_id` = " . (int)$recurring['recurring_id']);
			}
		}


				
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` like 'seopack%'");
			
				foreach ($query->rows as $result) {
						if (!$result['serialized']) {
							$data[$result['key']] = $result['value'];
						} else {
							if ($result['value'][0] == '{') {$data[$result['key']] = json_decode($result['value'], true);} else {$data[$result['key']] = unserialize($result['value']);}
						}
					}
					
				if (isset($data)) {$seopack_parameters = $data['seopack_parameters'];}
					else {
						$seopack_parameters['keywords'] = '%c%p';
						$seopack_parameters['tags'] = '%c%p';
						$seopack_parameters['metas'] = '%p - %f';
						}
				
				
				if (isset($seopack_parameters['ext'])) { $ext = $seopack_parameters['ext'];}
					else {$ext = '';}
					
				if ((isset($seopack_parameters['autokeywords'])) && ($seopack_parameters['autokeywords']))
					{	
						$query = $this->db->query("select pd.name as pname, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id, p.sku as sku, p.model as model, p.upc as upc, m.name as brand  from " . DB_PREFIX . "product_description pd
								left join " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
								inner join " . DB_PREFIX . "product p on pd.product_id = p.product_id
								left join " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id and cd.language_id = pd.language_id
								left join " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id
								where p.product_id = '" . (int)$product_id . "';");
					
								
								//die('z');
						foreach ($query->rows as $product) {
														
							$bef = array("%", "_","\"","'","\\");
							$aft = array("", " ", " ", " ", "");
							
							$included = explode('%', str_replace(array(' ',','), '', $seopack_parameters['keywords']));
							
							$tags = array();
							
							if (in_array("p", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['pname']))))));}
							if (in_array("c", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['cname']))))));}
							if (in_array("s", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['sku']))))));}
							if (in_array("m", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['model']))))));}
							if (in_array("u", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['upc']))))));}
							if (in_array("b", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['brand']))))));}
							
							$keywords = '';
							
							foreach ($tags as $tag)
								{
								if (strlen($tag) > 2) 
									{
									
									$keywords = $keywords.' '.strtolower($tag);
									
									}
								}
								
							
							$exists = $this->db->query("select count(*) as times from " . DB_PREFIX . "product_description where product_id = ".$product['product_id']." and language_id = ".$product['language_id']." and meta_keyword like '%".$keywords."%';");
							
									foreach ($exists->rows as $exist)
										{
										$count = $exist['times'];
										}
							$exists = $this->db->query("select length(meta_keyword) as leng from " . DB_PREFIX . "product_description where product_id = ".$product['product_id']." and language_id = ".$product['language_id'].";");
							
									foreach ($exists->rows as $exist)
										{
										$leng = $exist['leng'];
										}

							if (($count == 0) && ($leng < 255)) {$this->db->query("update " . DB_PREFIX . "product_description set meta_keyword = concat(meta_keyword, '". htmlspecialchars($keywords) ."') where product_id = ".$product['product_id']." and language_id = ".$product['language_id'].";");}	
								
														
							}
					}
				if ((isset($seopack_parameters['autometa'])) && ($seopack_parameters['autometa']))
					{
						$query = $this->db->query("select pd.name as pname, p.price as price, cd.name as cname, pd.description as pdescription, pd.language_id as language_id, pd.product_id as product_id, p.model as model, p.sku as sku, p.upc as upc, m.name as brand from " . DB_PREFIX . "product_description pd
								left join " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
								inner join " . DB_PREFIX . "product p on pd.product_id = p.product_id
								left join " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id and cd.language_id = pd.language_id
								left join " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id
								where p.product_id = '" . (int)$product_id . "';");

						foreach ($query->rows as $product) {
														
							$bef = array("%", "_","\"","'","\\", "\r", "\n");
							$aft = array("", " ", " ", " ", "", "", "");
							
							$ncategory = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['cname']))));
							$nproduct = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['pname']))));
							$model = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['model']))));
							$sku = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['sku']))));
							$upc = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['upc']))));
							$content = strip_tags(html_entity_decode($product['pdescription']));
							$pos = strpos($content, '.');							   
							if($pos === false) {}
								else { $content =  substr($content, 0, $pos+1);	}
							$sentence = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft, $content))));
							$brand = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['brand']))));
							$price = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft, number_format($product['price'], 2)))));
							
							$bef = array("%c", "%p", "%m", "%s", "%u", "%f", "%b", "%$");
							$aft = array($ncategory, $nproduct, $model, $sku, $upc, $sentence, $brand, $price);
							
							$meta_description = str_replace($bef, $aft,  $seopack_parameters['metas']);
							
							$exists = $this->db->query("select count(*) as times from " . DB_PREFIX . "product_description where product_id = ".$product['product_id']." and language_id = ".$product['language_id']." and meta_description not like '%".htmlspecialchars($meta_description)."%';");
							
									foreach ($exists->rows as $exist)
										{
										$count = $exist['times'];
										}
							
							if ($count) {$this->db->query("update " . DB_PREFIX . "product_description set meta_description = concat(meta_description, '". htmlspecialchars($meta_description) ."') where product_id = ".$product['product_id']." and language_id = ".$product['language_id'].";");}			
														
							}
					}
				if ((isset($seopack_parameters['autotags'])) && ($seopack_parameters['autotags']))
					{
					$query = $this->db->query("select pd.name as pname, pd.tag, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id, p.sku as sku, p.model as model, p.upc as upc, m.name as brand from " . DB_PREFIX . "product_description pd
							inner join " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
							inner join " . DB_PREFIX . "product p on pd.product_id = p.product_id
							inner join " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id and cd.language_id = pd.language_id
							left join " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id
							where p.product_id = '" . (int)$product_id . "';");
					
					foreach ($query->rows as $product) {
						
						$newtags ='';
						
						$included = explode('%', str_replace(array(' ',','), '', $seopack_parameters['tags']));
						
						$tags = array();
						
						
						$bef = array("%", "_","\"","'","\\");
						$aft = array("", " ", " ", " ", "");
						
							if (in_array("p", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['pname']))))));}
							if (in_array("c", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['cname']))))));}
							if (in_array("s", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['sku']))))));}
							if (in_array("m", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['model']))))));}
							if (in_array("u", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['upc']))))));}
							if (in_array("b", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['brand']))))));}
							
							foreach ($tags as $tag)
								{
								if (strlen($tag) > 2) 
									{
									if ((strpos($product['tag'], strtolower($tag)) === false) && (strpos($newtags, strtolower($tag)) === false))
										{
											$newtags .= ' '.strtolower($tag).',';											
										}			
									}
								}
							
														
							if ($product['tag']) {
								$newtags = trim($this->db->escape($product['tag']) . $newtags,' ,');
								$this->db->query("update " . DB_PREFIX . "product_description set tag = '$newtags' where product_id = '". $product['product_id'] ."' and language_id = '". $product['language_id'] ."';");
								}
								else {
								$newtags = trim($newtags,' ,');
								$this->db->query("update " . DB_PREFIX . "product_description set tag = '$newtags' where product_id = '". $product['product_id'] ."' and language_id = '". $product['language_id'] ."';");
								}
																				
						}
						
					}
				if ((isset($seopack_parameters['autourls'])) && ($seopack_parameters['autourls']))
					{
						require_once(DIR_APPLICATION . 'controller/catalog/seopack.php');
						$seo = new ControllerCatalogSeoPack($this->registry);
						
						$query = $this->db->query("SELECT pd.product_id, pd.name, pd.language_id ,l.code FROM ".DB_PREFIX."product p 
								inner join ".DB_PREFIX."product_description pd ON p.product_id = pd.product_id 
								inner join ".DB_PREFIX."language l on l.language_id = pd.language_id 
								where p.product_id = '" . (int)$product_id . "';");

						
						foreach ($query->rows as $product_row ){	

							
							if( strlen($product_row['name']) > 1 ){
							
								$slug = $seo->generateSlug($product_row['name']).$ext;
								$exist_query = $this->db->query("SELECT query FROM " . DB_PREFIX . "url_alias WHERE " . DB_PREFIX . "url_alias.query = 'product_id=" . $product_row['product_id'] . "' and language_id=".$product_row['language_id']);
								
								if(!$exist_query->num_rows){
									
									$exist_keyword = $this->db->query("SELECT query FROM " . DB_PREFIX . "url_alias WHERE " . DB_PREFIX . "url_alias.keyword = '" . $slug . "'");
									if($exist_keyword->num_rows){ 
										$exist_keyword_lang = $this->db->query("SELECT query FROM " . DB_PREFIX . "url_alias WHERE " . DB_PREFIX . "url_alias.keyword = '" . $slug . "' AND " . DB_PREFIX . "url_alias.query <> 'product_id=" . $product_row['product_id'] . "'");
										if($exist_keyword_lang->num_rows){
												$slug = $seo->generateSlug($product_row['name']).'-'.rand().$ext;
											}
											else
											{
												$slug = $seo->generateSlug($product_row['name']).'-'.$product_row['code'].$ext;
											}
										}
										
									
									$add_query = "INSERT INTO " . DB_PREFIX . "url_alias (query, keyword, language_id) VALUES ('product_id=" . $product_row['product_id'] . "', '" . $slug . "', " . $product_row['language_id'] . ")";
									$this->db->query($add_query);
									
								}
							}
						}
					}
				
			
		$this->cache->delete('product');

		return $product_id;
	}

	public function editProduct($product_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() ,no_follow='".$data['no_follow']."',alt='".$data['alt']."'WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}
		
		if (isset($data['video_url'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET video_url = '" . $this->db->escape($data['video_url']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$product_id . "'");

		foreach ($data['product_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$product_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', custom_alt = '" . ((isset($value['custom_alt']))?($this->db->escape($value['custom_alt'])):'') . "', custom_h1 = '" . ((isset($value['custom_h1']))?($this->db->escape($value['custom_h1'])):'') . "', custom_h2 = '" . ((isset($value['custom_h2']))?($this->db->escape($value['custom_h2'])):'') . "', custom_imgtitle = '" . ((isset($value['custom_imgtitle']))?($this->db->escape($value['custom_imgtitle'])):'') . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_store'])) {
			foreach ($data['product_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "'");

		if (!empty($data['product_attribute'])) {
			foreach ($data['product_attribute'] as $product_attribute) {
				if ($product_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$product_attribute['attribute_id'] . "'");

					foreach ($product_attribute['product_attribute_description'] as $language_id => $product_attribute_description) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$product_id . "', attribute_id = '" . (int)$product_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($product_attribute_description['text']) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_option'])) {
			foreach ($data['product_option'] as $product_option) {
				if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
					if (isset($product_option['product_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$product_option['product_option_id'] . "', product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', required = '" . (int)$product_option['required'] . "'");

						$product_option_id = $this->db->getLastId();

						foreach ($product_option['product_option_value'] as $product_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_value_id = '" . (int)$product_option_value['product_option_value_id'] . "', product_option_id = '" . (int)$product_option_id . "', product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', option_value_id = '" . (int)$product_option_value['option_value_id'] . "', quantity = '" . (int)$product_option_value['quantity'] . "', subtract = '" . (int)$product_option_value['subtract'] . "', price = '" . (float)$product_option_value['price'] . "', price_prefix = '" . $this->db->escape($product_option_value['price_prefix']) . "', points = '" . (int)$product_option_value['points'] . "', points_prefix = '" . $this->db->escape($product_option_value['points_prefix']) . "', weight = '" . (float)$product_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($product_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$product_option['product_option_id'] . "', product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', value = '" . $this->db->escape($product_option['value']) . "', required = '" . (int)$product_option['required'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_discount'])) {
			foreach ($data['product_discount'] as $product_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$product_discount['customer_group_id'] . "', quantity = '" . (int)$product_discount['quantity'] . "', priority = '" . (int)$product_discount['priority'] . "', price = '" . (float)$product_discount['price'] . "', date_start = '" . $this->db->escape($product_discount['date_start']) . "', date_end = '" . $this->db->escape($product_discount['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_special'])) {
			foreach ($data['product_special'] as $product_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$product_special['customer_group_id'] . "', priority = '" . (int)$product_special['priority'] . "', price = '" . (float)$product_special['price'] . "', date_start = '" . $this->db->escape($product_special['date_start']) . "', date_end = '" . $this->db->escape($product_special['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_image'])) {
			foreach ($data['product_image'] as $product_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . $this->db->escape($product_image['image']) . "',image_alt = '" . $this->db->escape($product_image['image_alt']) . "', sort_order = '" . (int)$product_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_download'])) {
			foreach ($data['product_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$product_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_category'])) {
			foreach ($data['product_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_filter'])) {
			foreach ($data['product_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$product_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$product_id . "'");

		if (isset($data['product_related'])) {
			foreach ($data['product_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$product_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$product_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$product_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_reward'])) {
			foreach ($data['product_reward'] as $customer_group_id => $value) {
				if ((int)$value['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_layout'])) {
			foreach ($data['product_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = " . (int)$product_id);

		if (isset($data['product_recurring'])) {
			foreach ($data['product_recurring'] as $product_recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$product_id . ", customer_group_id = " . (int)$product_recurring['customer_group_id'] . ", `recurring_id` = " . (int)$product_recurring['recurring_id']);
			}
		}


				
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` like 'seopack%'");
			
				foreach ($query->rows as $result) {
						if (!$result['serialized']) {
							$data[$result['key']] = $result['value'];
						} else {
							if ($result['value'][0] == '{') {$data[$result['key']] = json_decode($result['value'], true);} else {$data[$result['key']] = unserialize($result['value']);}
						}
					}
					
				if (isset($data)) {$seopack_parameters = $data['seopack_parameters'];}
					else {
						$seopack_parameters['keywords'] = '%c%p';
						$seopack_parameters['tags'] = '%c%p';
						$seopack_parameters['metas'] = '%p - %f';
						}
				
				
				if (isset($seopack_parameters['ext'])) { $ext = $seopack_parameters['ext'];}
					else {$ext = '';}
					
				if ((isset($seopack_parameters['autokeywords'])) && ($seopack_parameters['autokeywords']))
					{	
						$query = $this->db->query("select pd.name as pname, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id, p.sku as sku, p.model as model, p.upc as upc, m.name as brand  from " . DB_PREFIX . "product_description pd
								left join " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
								inner join " . DB_PREFIX . "product p on pd.product_id = p.product_id
								left join " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id and cd.language_id = pd.language_id
								left join " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id
								where p.product_id = '" . (int)$product_id . "';");
					
								
								//die('z');
						foreach ($query->rows as $product) {
														
							$bef = array("%", "_","\"","'","\\");
							$aft = array("", " ", " ", " ", "");
							
							$included = explode('%', str_replace(array(' ',','), '', $seopack_parameters['keywords']));
							
							$tags = array();
							
							if (in_array("p", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['pname']))))));}
							if (in_array("c", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['cname']))))));}
							if (in_array("s", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['sku']))))));}
							if (in_array("m", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['model']))))));}
							if (in_array("u", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['upc']))))));}
							if (in_array("b", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['brand']))))));}
							
							$keywords = '';
							
							foreach ($tags as $tag)
								{
								if (strlen($tag) > 2) 
									{
									
									$keywords = $keywords.' '.strtolower($tag);
									
									}
								}
								
							
							$exists = $this->db->query("select count(*) as times from " . DB_PREFIX . "product_description where product_id = ".$product['product_id']." and language_id = ".$product['language_id']." and meta_keyword like '%".$keywords."%';");
							
									foreach ($exists->rows as $exist)
										{
										$count = $exist['times'];
										}
							$exists = $this->db->query("select length(meta_keyword) as leng from " . DB_PREFIX . "product_description where product_id = ".$product['product_id']." and language_id = ".$product['language_id'].";");
							
									foreach ($exists->rows as $exist)
										{
										$leng = $exist['leng'];
										}

							if (($count == 0) && ($leng < 255)) {$this->db->query("update " . DB_PREFIX . "product_description set meta_keyword = concat(meta_keyword, '". htmlspecialchars($keywords) ."') where product_id = ".$product['product_id']." and language_id = ".$product['language_id'].";");}	
								
														
							}
					}
				if ((isset($seopack_parameters['autometa'])) && ($seopack_parameters['autometa']))
					{
						$query = $this->db->query("select pd.name as pname, p.price as price, cd.name as cname, pd.description as pdescription, pd.language_id as language_id, pd.product_id as product_id, p.model as model, p.sku as sku, p.upc as upc, m.name as brand from " . DB_PREFIX . "product_description pd
								left join " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
								inner join " . DB_PREFIX . "product p on pd.product_id = p.product_id
								left join " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id and cd.language_id = pd.language_id
								left join " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id
								where p.product_id = '" . (int)$product_id . "';");

						foreach ($query->rows as $product) {
														
							$bef = array("%", "_","\"","'","\\", "\r", "\n");
							$aft = array("", " ", " ", " ", "", "", "");
							
							$ncategory = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['cname']))));
							$nproduct = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['pname']))));
							$model = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['model']))));
							$sku = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['sku']))));
							$upc = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['upc']))));
							$content = strip_tags(html_entity_decode($product['pdescription']));
							$pos = strpos($content, '.');							   
							if($pos === false) {}
								else { $content =  substr($content, 0, $pos+1);	}
							$sentence = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft, $content))));
							$brand = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['brand']))));
							$price = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft, number_format($product['price'], 2)))));
							
							$bef = array("%c", "%p", "%m", "%s", "%u", "%f", "%b", "%$");
							$aft = array($ncategory, $nproduct, $model, $sku, $upc, $sentence, $brand, $price);
							
							$meta_description = str_replace($bef, $aft,  $seopack_parameters['metas']);
							
							$exists = $this->db->query("select count(*) as times from " . DB_PREFIX . "product_description where product_id = ".$product['product_id']." and language_id = ".$product['language_id']." and meta_description not like '%".htmlspecialchars($meta_description)."%';");
							
									foreach ($exists->rows as $exist)
										{
										$count = $exist['times'];
										}
							
							if ($count) {$this->db->query("update " . DB_PREFIX . "product_description set meta_description = concat(meta_description, '". htmlspecialchars($meta_description) ."') where product_id = ".$product['product_id']." and language_id = ".$product['language_id'].";");}			
														
							}
					}
				if ((isset($seopack_parameters['autotags'])) && ($seopack_parameters['autotags']))
					{
					$query = $this->db->query("select pd.name as pname, pd.tag, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id, p.sku as sku, p.model as model, p.upc as upc, m.name as brand from " . DB_PREFIX . "product_description pd
							inner join " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
							inner join " . DB_PREFIX . "product p on pd.product_id = p.product_id
							inner join " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id and cd.language_id = pd.language_id
							left join " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id
							where p.product_id = '" . (int)$product_id . "';");
					
					foreach ($query->rows as $product) {
						
						$newtags ='';
						
						$included = explode('%', str_replace(array(' ',','), '', $seopack_parameters['tags']));
						
						$tags = array();
						
						
						$bef = array("%", "_","\"","'","\\");
						$aft = array("", " ", " ", " ", "");
						
							if (in_array("p", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['pname']))))));}
							if (in_array("c", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['cname']))))));}
							if (in_array("s", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['sku']))))));}
							if (in_array("m", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['model']))))));}
							if (in_array("u", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['upc']))))));}
							if (in_array("b", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['brand']))))));}
							
							foreach ($tags as $tag)
								{
								if (strlen($tag) > 2) 
									{
									if ((strpos($product['tag'], strtolower($tag)) === false) && (strpos($newtags, strtolower($tag)) === false))
										{
											$newtags .= ' '.strtolower($tag).',';											
										}			
									}
								}
							
														
							if ($product['tag']) {
								$newtags = trim($this->db->escape($product['tag']) . $newtags,' ,');
								$this->db->query("update " . DB_PREFIX . "product_description set tag = '$newtags' where product_id = '". $product['product_id'] ."' and language_id = '". $product['language_id'] ."';");
								}
								else {
								$newtags = trim($newtags,' ,');
								$this->db->query("update " . DB_PREFIX . "product_description set tag = '$newtags' where product_id = '". $product['product_id'] ."' and language_id = '". $product['language_id'] ."';");
								}
																				
						}
						
					}
				if ((isset($seopack_parameters['autourls'])) && ($seopack_parameters['autourls']))
					{
						require_once(DIR_APPLICATION . 'controller/catalog/seopack.php');
						$seo = new ControllerCatalogSeoPack($this->registry);
						
						$query = $this->db->query("SELECT pd.product_id, pd.name, pd.language_id ,l.code FROM ".DB_PREFIX."product p 
								inner join ".DB_PREFIX."product_description pd ON p.product_id = pd.product_id 
								inner join ".DB_PREFIX."language l on l.language_id = pd.language_id 
								where p.product_id = '" . (int)$product_id . "';");

						
						foreach ($query->rows as $product_row ){	

							
							if( strlen($product_row['name']) > 1 ){
							
								$slug = $seo->generateSlug($product_row['name']).$ext;
								$exist_query = $this->db->query("SELECT query FROM " . DB_PREFIX . "url_alias WHERE " . DB_PREFIX . "url_alias.query = 'product_id=" . $product_row['product_id'] . "' and language_id=".$product_row['language_id']);
								
								if(!$exist_query->num_rows){
									
									$exist_keyword = $this->db->query("SELECT query FROM " . DB_PREFIX . "url_alias WHERE " . DB_PREFIX . "url_alias.keyword = '" . $slug . "'");
									if($exist_keyword->num_rows){ 
										$exist_keyword_lang = $this->db->query("SELECT query FROM " . DB_PREFIX . "url_alias WHERE " . DB_PREFIX . "url_alias.keyword = '" . $slug . "' AND " . DB_PREFIX . "url_alias.query <> 'product_id=" . $product_row['product_id'] . "'");
										if($exist_keyword_lang->num_rows){
												$slug = $seo->generateSlug($product_row['name']).'-'.rand().$ext;
											}
											else
											{
												$slug = $seo->generateSlug($product_row['name']).'-'.$product_row['code'].$ext;
											}
										}
										
									
									$add_query = "INSERT INTO " . DB_PREFIX . "url_alias (query, keyword, language_id) VALUES ('product_id=" . $product_row['product_id'] . "', '" . $slug . "', " . $product_row['language_id'] . ")";
									$this->db->query($add_query);
									
								}
							}
						}
					}
				
			
		$this->cache->delete('product');
	}

	public function copyProduct($product_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$product_id . "'");

		if ($query->num_rows) {
			$data = $query->row;

			$data['sku'] = '';
			$data['upc'] = '';
			$data['viewed'] = '0';
			$data['keyword'] = '';
			$data['status'] = '0';

			$data['product_attribute'] = $this->getProductAttributes($product_id);
			$data['product_description'] = $this->getProductDescriptions($product_id);
			$data['product_discount'] = $this->getProductDiscounts($product_id);
			$data['product_filter'] = $this->getProductFilters($product_id);
			$data['product_image'] = $this->getProductImages($product_id);
			$data['product_option'] = $this->getProductOptions($product_id);
			$data['product_related'] = $this->getProductRelated($product_id);
			$data['product_reward'] = $this->getProductRewards($product_id);
			$data['product_special'] = $this->getProductSpecials($product_id);
			$data['product_category'] = $this->getProductCategories($product_id);
			$data['product_download'] = $this->getProductDownloads($product_id);
			$data['product_layout'] = $this->getProductLayouts($product_id);
			$data['product_store'] = $this->getProductStores($product_id);
			$data['product_recurrings'] = $this->getRecurrings($product_id);

			$this->addProduct($data);
		}
	}

	public function deleteProduct($product_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_recurring WHERE product_id = " . (int)$product_id);
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE product_id = '" . (int)$product_id . "'");


				
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` like 'seopack%'");
			
				foreach ($query->rows as $result) {
						if (!$result['serialized']) {
							$data[$result['key']] = $result['value'];
						} else {
							if ($result['value'][0] == '{') {$data[$result['key']] = json_decode($result['value'], true);} else {$data[$result['key']] = unserialize($result['value']);}
						}
					}
					
				if (isset($data)) {$seopack_parameters = $data['seopack_parameters'];}
					else {
						$seopack_parameters['keywords'] = '%c%p';
						$seopack_parameters['tags'] = '%c%p';
						$seopack_parameters['metas'] = '%p - %f';
						}
				
				
				if (isset($seopack_parameters['ext'])) { $ext = $seopack_parameters['ext'];}
					else {$ext = '';}
					
				if ((isset($seopack_parameters['autokeywords'])) && ($seopack_parameters['autokeywords']))
					{	
						$query = $this->db->query("select pd.name as pname, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id, p.sku as sku, p.model as model, p.upc as upc, m.name as brand  from " . DB_PREFIX . "product_description pd
								left join " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
								inner join " . DB_PREFIX . "product p on pd.product_id = p.product_id
								left join " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id and cd.language_id = pd.language_id
								left join " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id
								where p.product_id = '" . (int)$product_id . "';");
					
								
								//die('z');
						foreach ($query->rows as $product) {
														
							$bef = array("%", "_","\"","'","\\");
							$aft = array("", " ", " ", " ", "");
							
							$included = explode('%', str_replace(array(' ',','), '', $seopack_parameters['keywords']));
							
							$tags = array();
							
							if (in_array("p", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['pname']))))));}
							if (in_array("c", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['cname']))))));}
							if (in_array("s", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['sku']))))));}
							if (in_array("m", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['model']))))));}
							if (in_array("u", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['upc']))))));}
							if (in_array("b", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['brand']))))));}
							
							$keywords = '';
							
							foreach ($tags as $tag)
								{
								if (strlen($tag) > 2) 
									{
									
									$keywords = $keywords.' '.strtolower($tag);
									
									}
								}
								
							
							$exists = $this->db->query("select count(*) as times from " . DB_PREFIX . "product_description where product_id = ".$product['product_id']." and language_id = ".$product['language_id']." and meta_keyword like '%".$keywords."%';");
							
									foreach ($exists->rows as $exist)
										{
										$count = $exist['times'];
										}
							$exists = $this->db->query("select length(meta_keyword) as leng from " . DB_PREFIX . "product_description where product_id = ".$product['product_id']." and language_id = ".$product['language_id'].";");
							
									foreach ($exists->rows as $exist)
										{
										$leng = $exist['leng'];
										}

							if (($count == 0) && ($leng < 255)) {$this->db->query("update " . DB_PREFIX . "product_description set meta_keyword = concat(meta_keyword, '". htmlspecialchars($keywords) ."') where product_id = ".$product['product_id']." and language_id = ".$product['language_id'].";");}	
								
														
							}
					}
				if ((isset($seopack_parameters['autometa'])) && ($seopack_parameters['autometa']))
					{
						$query = $this->db->query("select pd.name as pname, p.price as price, cd.name as cname, pd.description as pdescription, pd.language_id as language_id, pd.product_id as product_id, p.model as model, p.sku as sku, p.upc as upc, m.name as brand from " . DB_PREFIX . "product_description pd
								left join " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
								inner join " . DB_PREFIX . "product p on pd.product_id = p.product_id
								left join " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id and cd.language_id = pd.language_id
								left join " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id
								where p.product_id = '" . (int)$product_id . "';");

						foreach ($query->rows as $product) {
														
							$bef = array("%", "_","\"","'","\\", "\r", "\n");
							$aft = array("", " ", " ", " ", "", "", "");
							
							$ncategory = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['cname']))));
							$nproduct = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['pname']))));
							$model = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['model']))));
							$sku = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['sku']))));
							$upc = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['upc']))));
							$content = strip_tags(html_entity_decode($product['pdescription']));
							$pos = strpos($content, '.');							   
							if($pos === false) {}
								else { $content =  substr($content, 0, $pos+1);	}
							$sentence = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft, $content))));
							$brand = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['brand']))));
							$price = trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft, number_format($product['price'], 2)))));
							
							$bef = array("%c", "%p", "%m", "%s", "%u", "%f", "%b", "%$");
							$aft = array($ncategory, $nproduct, $model, $sku, $upc, $sentence, $brand, $price);
							
							$meta_description = str_replace($bef, $aft,  $seopack_parameters['metas']);
							
							$exists = $this->db->query("select count(*) as times from " . DB_PREFIX . "product_description where product_id = ".$product['product_id']." and language_id = ".$product['language_id']." and meta_description not like '%".htmlspecialchars($meta_description)."%';");
							
									foreach ($exists->rows as $exist)
										{
										$count = $exist['times'];
										}
							
							if ($count) {$this->db->query("update " . DB_PREFIX . "product_description set meta_description = concat(meta_description, '". htmlspecialchars($meta_description) ."') where product_id = ".$product['product_id']." and language_id = ".$product['language_id'].";");}			
														
							}
					}
				if ((isset($seopack_parameters['autotags'])) && ($seopack_parameters['autotags']))
					{
					$query = $this->db->query("select pd.name as pname, pd.tag, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id, p.sku as sku, p.model as model, p.upc as upc, m.name as brand from " . DB_PREFIX . "product_description pd
							inner join " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
							inner join " . DB_PREFIX . "product p on pd.product_id = p.product_id
							inner join " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id and cd.language_id = pd.language_id
							left join " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id
							where p.product_id = '" . (int)$product_id . "';");
					
					foreach ($query->rows as $product) {
						
						$newtags ='';
						
						$included = explode('%', str_replace(array(' ',','), '', $seopack_parameters['tags']));
						
						$tags = array();
						
						
						$bef = array("%", "_","\"","'","\\");
						$aft = array("", " ", " ", " ", "");
						
							if (in_array("p", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['pname']))))));}
							if (in_array("c", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['cname']))))));}
							if (in_array("s", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['sku']))))));}
							if (in_array("m", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['model']))))));}
							if (in_array("u", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['upc']))))));}
							if (in_array("b", $included)) {$tags = array_merge($tags, explode(' ',trim($this->db->escape(htmlspecialchars_decode(str_replace($bef, $aft,$product['brand']))))));}
							
							foreach ($tags as $tag)
								{
								if (strlen($tag) > 2) 
									{
									if ((strpos($product['tag'], strtolower($tag)) === false) && (strpos($newtags, strtolower($tag)) === false))
										{
											$newtags .= ' '.strtolower($tag).',';											
										}			
									}
								}
							
														
							if ($product['tag']) {
								$newtags = trim($this->db->escape($product['tag']) . $newtags,' ,');
								$this->db->query("update " . DB_PREFIX . "product_description set tag = '$newtags' where product_id = '". $product['product_id'] ."' and language_id = '". $product['language_id'] ."';");
								}
								else {
								$newtags = trim($newtags,' ,');
								$this->db->query("update " . DB_PREFIX . "product_description set tag = '$newtags' where product_id = '". $product['product_id'] ."' and language_id = '". $product['language_id'] ."';");
								}
																				
						}
						
					}
				if ((isset($seopack_parameters['autourls'])) && ($seopack_parameters['autourls']))
					{
						require_once(DIR_APPLICATION . 'controller/catalog/seopack.php');
						$seo = new ControllerCatalogSeoPack($this->registry);
						
						$query = $this->db->query("SELECT pd.product_id, pd.name, pd.language_id ,l.code FROM ".DB_PREFIX."product p 
								inner join ".DB_PREFIX."product_description pd ON p.product_id = pd.product_id 
								inner join ".DB_PREFIX."language l on l.language_id = pd.language_id 
								where p.product_id = '" . (int)$product_id . "';");

						
						foreach ($query->rows as $product_row ){	

							
							if( strlen($product_row['name']) > 1 ){
							
								$slug = $seo->generateSlug($product_row['name']).$ext;
								$exist_query = $this->db->query("SELECT query FROM " . DB_PREFIX . "url_alias WHERE " . DB_PREFIX . "url_alias.query = 'product_id=" . $product_row['product_id'] . "' and language_id=".$product_row['language_id']);
								
								if(!$exist_query->num_rows){
									
									$exist_keyword = $this->db->query("SELECT query FROM " . DB_PREFIX . "url_alias WHERE " . DB_PREFIX . "url_alias.keyword = '" . $slug . "'");
									if($exist_keyword->num_rows){ 
										$exist_keyword_lang = $this->db->query("SELECT query FROM " . DB_PREFIX . "url_alias WHERE " . DB_PREFIX . "url_alias.keyword = '" . $slug . "' AND " . DB_PREFIX . "url_alias.query <> 'product_id=" . $product_row['product_id'] . "'");
										if($exist_keyword_lang->num_rows){
												$slug = $seo->generateSlug($product_row['name']).'-'.rand().$ext;
											}
											else
											{
												$slug = $seo->generateSlug($product_row['name']).'-'.$product_row['code'].$ext;
											}
										}
										
									
									$add_query = "INSERT INTO " . DB_PREFIX . "url_alias (query, keyword, language_id) VALUES ('product_id=" . $product_row['product_id'] . "', '" . $slug . "', " . $product_row['language_id'] . ")";
									$this->db->query($add_query);
									
								}
							}
						}
					}
				
			
		$this->cache->delete('product');
	}

	public function getProduct($product_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getProducts($data = array()) {
            //echo '<pre>'; print_r($data); die();
	//	$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		
		//Start change
		//$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		$sql = "SELECT p.*, pd.*, p2c.category_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		// End change
		
		
		if (!empty($data['filter_name'])) {
			//$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
			$sql .= " AND pd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		}

		if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}

		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
			$sql .= " AND p.quantity = '" . (int)$data['filter_quantity'] . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}
		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(p.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}
		
		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(p.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}
		if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
			if ($data['filter_image'] == 1) {
				$sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
			} else {
				$sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
			}
		}
		
	//	if (!empty($data['filter_category'])) {
			
			
			if (!empty($data['filter_category'])) {
				if (!empty($data['filter_sub_category'])) {
					$implode_data = array();
						
					$implode_data[] = "category_id = '" . (int)$data['filter_category'] . "'";
						
					$this->load->model('catalog/category');
						
					$categories = $this->model_catalog_category->getCategories($data['filter_category']);
						
					foreach ($categories as $category) {
						$implode_data[] = "p2c.category_id = '" . (int)$category['category_id'] . "'";
					}
						
					$sql .= " AND (" . implode(' OR ', $implode_data) . ")";
				} else {
					$sql .= " AND p2c.category_id = '" . (int)$data['filter_category'] . "'";
				}
			}
			
			
		
		

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
				
			'pd.name',
			'p.model',
			'p.price',
			'p.quantity',
			'p2c.category_id',
			'p.date_added',
			'p.date_modified',
			'p.status',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			//$sql .= " ORDER BY pd.name";
			$sql .= " ORDER BY p.product_id";
		}

		if (isset($data['order']) && ($data['order'] == 'ASC')) {
			$sql .= " ASC";
		} else {
			$sql .= " Desc";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		///print_r($sql);exit;
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getProductsByCategoryId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2c.category_id = '" . (int)$category_id . "' ORDER BY pd.name ASC");

		return $query->rows;
	}

	public function getProductDescriptions($product_id) {
		$product_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'custom_alt' => $result['custom_alt'], 'custom_h1' => $result['custom_h1'], 'custom_h2' => $result['custom_h2'], 'custom_imgtitle' => $result['custom_imgtitle'], 'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'tag'              => $result['tag']
			);
		}

		return $product_description_data;
	}

	public function getProductCategories($product_id) {
		$product_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_category_data[] = $result['category_id'];
		}

		return $product_category_data;
	}

	public function getProductFilters($product_id) {
		$product_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_filter_data[] = $result['filter_id'];
		}

		return $product_filter_data;
	}

	public function getProductAttributes($product_id) {
		$product_attribute_data = array();

		$product_attribute_query = $this->db->query("SELECT attribute_id FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' GROUP BY attribute_id");

		foreach ($product_attribute_query->rows as $product_attribute) {
			$product_attribute_description_data = array();

			$product_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$product_attribute['attribute_id'] . "'");

			foreach ($product_attribute_description_query->rows as $product_attribute_description) {
				$product_attribute_description_data[$product_attribute_description['language_id']] = array('text' => $product_attribute_description['text']);
			}

			$product_attribute_data[] = array(
				'attribute_id'                  => $product_attribute['attribute_id'],
				'product_attribute_description' => $product_attribute_description_data
			);
		}

		return $product_attribute_data;
	}

	public function getProductOptions($product_id) {
		$product_option_data = array();

		$product_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($product_option_query->rows as $product_option) {
			$product_option_value_data = array();

			$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

			foreach ($product_option_value_query->rows as $product_option_value) {
				$product_option_value_data[] = array(
					'product_option_value_id' => $product_option_value['product_option_value_id'],
					'option_value_id'         => $product_option_value['option_value_id'],
					'quantity'                => $product_option_value['quantity'],
					'subtract'                => $product_option_value['subtract'],
					'price'                   => $product_option_value['price'],
					'price_prefix'            => $product_option_value['price_prefix'],
					'points'                  => $product_option_value['points'],
					'points_prefix'           => $product_option_value['points_prefix'],
					'weight'                  => $product_option_value['weight'],
					'weight_prefix'           => $product_option_value['weight_prefix']
				);
			}

			$product_option_data[] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],
				'value'                => $product_option['value'],
				'required'             => $product_option['required']
			);
		}

		return $product_option_data;
	}

	public function getProductOptionValue($product_id, $product_option_value_id) {
		$query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$product_id . "' AND pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getProductImages($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductDiscounts($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' ORDER BY quantity, priority, price");

		return $query->rows;
	}

	public function getProductSpecials($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' ORDER BY priority, price");

		return $query->rows;
	}

	public function getProductRewards($product_id) {
		$product_reward_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
		}

		return $product_reward_data;
	}

	public function getProductDownloads($product_id) {
		$product_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_download_data[] = $result['download_id'];
		}

		return $product_download_data;
	}

	public function getProductStores($product_id) {
		$product_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_store_data[] = $result['store_id'];
		}

		return $product_store_data;
	}

	public function getProductLayouts($product_id) {
		$product_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $product_layout_data;
	}

	public function getProductRelated($product_id) {
		$product_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_related_data[] = $result['related_id'];
		}

		return $product_related_data;
	}

	public function getRecurrings($product_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = '" . (int)$product_id . "'");

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
		//$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";

		// replace start
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";
		//replace end
		
		
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			//$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
			$sql .= " AND pd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		}

		if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}

		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
			$sql .= " AND p.quantity = '" . (int)$data['filter_quantity'] . "'";
		}
		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(p.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}
		
		if (isset($data['filter_category']) && !is_null($data['filter_category'])) {
			$sql .= " AND p2c.category_id = '" . (int)$data['filter_category'] . "'";
		}
		
		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(p.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
			if ($data['filter_image'] == 1) {
				$sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
			} else {
				$sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
			}
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalProductsByTaxClassId($tax_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE tax_class_id = '" . (int)$tax_class_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByStockStatusId($stock_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE stock_status_id = '" . (int)$stock_status_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByWeightClassId($weight_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE weight_class_id = '" . (int)$weight_class_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByLengthClassId($length_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE length_class_id = '" . (int)$length_class_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByDownloadId($download_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_to_download WHERE download_id = '" . (int)$download_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByManufacturerId($manufacturer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE manufacturer_id = '" . (int)$manufacturer_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByAttributeId($attribute_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_attribute WHERE attribute_id = '" . (int)$attribute_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByOptionId($option_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_option WHERE option_id = '" . (int)$option_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByProfileId($recurring_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_recurring WHERE recurring_id = '" . (int)$recurring_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
public function isProductWithNameExists($productName) {
		$query = $this->db->query("SELECT 1 FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.name = '" . $productName . "'");
		if ($query->num_rows) {
			return true;
		}
		return false;
	}
	public function isProductWithModelExists($model) {
		$query = $this->db->query("SELECT 1 FROM " . DB_PREFIX . "product   WHERE model = '" . $model . "'");
		if ($query->num_rows) {
			return true;
		}
		return false;
	}
	public function isProductWithSkuExists($sku) {
		$query = $this->db->query("SELECT 1 FROM " . DB_PREFIX . "product  WHERE sku = '" . $sku . "'");
		if ($query->num_rows) {
			return true;
		}
		return false;
	}
}
