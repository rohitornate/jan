<?php
class ModelAccountCustomer extends Model {
	public function addCustomer($data) {
		if (isset($data['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($data['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $data['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$this->load->model('account/customer_group');
		$this->load->model('tool/image');

		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "', store_id = '" . (int)$this->config->get('config_store_id') . "', language_id = '" . (int)$this->config->get('config_language_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['account']) ? json_encode($data['custom_field']['account']) : '') . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '" . (int)!$customer_group_info['approval'] . "', date_added = NOW()");

		$customer_id = $this->db->getLastId();

		//$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', company = '" . $this->db->escape($data['company']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['address']) ? json_encode($data['custom_field']['address']) : '') . "'");

		//$address_id = $this->db->getLastId();

		//$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");

		$this->load->language('mail/customer');

		$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

		$message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

	//	if (!$customer_group_info['approval']) {
	//		$message .= $this->language->get('text_login') . "\n";
	//	} else {
	//		$message .= $this->language->get('text_approval') . "\n";
	//	}
	
	
	$product_query = $this->getRecomendate();
foreach ($product_query as $product) {
	$thumb1 = $this->model_tool_image->resize($product['image'], 200, 200);
	
		//print_r($product);
					
	
					$data['req_products'][] = array(
						'name'     => $product['name'],
						
					'thumb'     => $thumb1,
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product['product_id']),
//
			
						'price'    => $product['price'],
					);
	
	
	
	
	
}

/*$message='<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">

<table style="font-family: Ubuntu;" align="center" bgcolor="#f9f3f3;" cellpadding="0" width="650px" cellspacing="0" border="0">
	<tbody style="background-color:#f9f3f3">
		<tr>
			<td><table align="center" width="100%" bgcolor="#f9f3f3" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td width="100%" height="10"></td>
						</tr>
						<tr>
						</tr><tr>
								<td align="left" width="100%" height="70"><a href="https://www.ornatejewels.com/" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/&amp;source=gmail&amp;ust=1505545678145000&amp;usg=AFQjCNEAojg8L7Tr2vLWNk10apyEWhLQHQ"><img src="https://ci6.googleusercontent.com/proxy/3LhFCV89397eQxW60HOCeO8YYD-nDiu9XOyVpdpcwnJRlcpQ9G7knk4wgAN9VGHwVjJPEQJCoxzyeggcHOib90ofAZRhDYY8W6yaNQ=s0-d-e1-ft#http://test.ornatejewels.com/images/email/img/logo.png" alt="Welcome to Ornate." style="display:block;border:none;vertical-align:bottom;max-width:257px" class="CToWUd"></a></td>
						
						
		<td><table width="190" style="text-align:right" height="35" border="0" align="right">
	<tbody><tr>
			
		<td><a href="https://www.facebook.com/ornatejewelscom" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.facebook.com/ornatejewelscom&amp;source=gmail&amp;ust=1505545678145000&amp;usg=AFQjCNG13cfGGCnPMGalp7DxtXITCfwpvQ"><img src="https://ci6.googleusercontent.com/proxy/rn1brDVV0xr6DmzVTBAL8BvPW_l0dOvK8qPFH9da7IgsaZjy6mrsNdsgnsN2oi-A1FWqiQ=s0-d-e1-ft#http://i.imgur.com/5YW9Bsk.jpg" width="28" height="28" alt="Facebook" class="CToWUd"></a></td>
		<td>&nbsp;</td>
		<td><a href="https://twitter.com/ornatejewelscom" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://twitter.com/ornatejewelscom&amp;source=gmail&amp;ust=1505545678145000&amp;usg=AFQjCNFLYQ9L_H1W-pmCT0TWHZvAs6LX6w"><img src="https://ci6.googleusercontent.com/proxy/6Ce8BMMA5Fryy3H2pW3UU81sT21Td_pNm4JsM8n1mBQLkVzWzXGeY285jPmmMfFZc6C7QQ=s0-d-e1-ft#http://i.imgur.com/zyTB1Vj.jpg" width="28" height="28" alt="twitter" class="CToWUd"></a></td>
		<td>&nbsp;</td>
		<td><a href="https://plus.google.com/102333590500856537008" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://plus.google.com/102333590500856537008&amp;source=gmail&amp;ust=1505545678145000&amp;usg=AFQjCNHCnphjFioGyRhdfzp3Zwfz1v2Bjg"><img src="https://ci5.googleusercontent.com/proxy/RQhPmZc7Qu3Ezdh6hozuIiUj2KAgl5OHS-9kTHYyzBfwcGK5VorFTfJIS0l6_Y9WpoyHXA=s0-d-e1-ft#http://i.imgur.com/tI5y7wU.jpg" width="28" height="28" alt="google-plus" class="CToWUd"></a></td>
 		<td>&nbsp;</td>
		
		<td><a href="https://in.pinterest.com/ornatejewels/" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://in.pinterest.com/ornatejewels/&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNFK2A4IJvwyn5l_x_loSvHBuKjc6Q"><img src="https://ci4.googleusercontent.com/proxy/rmsCKb_12fewsrEqJChcPoyWVZ8g-lGazTh0lGhAUhNFAxD74-JrlrjuXJgsfV-83tC-lQ=s0-d-e1-ft#http://i.imgur.com/klqZO8p.jpg" width="28" height="28" alt="pinterest" class="CToWUd"></a></td>
		<td>&nbsp;</td>
	</tr>
					</tbody></table></td></tr></tbody>
				</table>
				<table align="center" width="100%" bgcolor="#f9f3f3" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td width="100%" height="10"></td>
						</tr>
						<tr>
							<td width="100%" height="5"><hr size="1" width="100%" color="#b8b8b8"></td>
						</tr>
						<tr>
							<td align="center"><table align="center" width="100%" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
                     
                      <td width="3"></td>
                      <td width="55px" style="height:30px;text-align:center;font-family: Ubuntu;color:#504f4e;font-size:16px;vertical-align:middle">
<a href="https://www.ornatejewels.com/rings" style="color:#504f4e;text-decoration:none" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/rings&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNEyzo5h4qyMTifzQjIbSGV5qFmngA">Rings</a></td>
                      <td width="4"></td>
                      <td width="91px" style="height:30px;text-align:center;font-family: Ubuntu;color:#504f4e;font-size:16px;vertical-align:middle">
<a href="https://www.ornatejewels.com/earrings" style="color:#504f4e;text-decoration:none" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/earrings&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNGKKUN3jPDMYxR-ydg5b2qdXwpYug">Earrings</a></td>
                      <td width="3px"></td>
                      <td width="90px" style="height:30px;text-align:center;font-family: Ubuntu;color:#504f4e;font-size:16px;vertical-align:middle">
<a href="https://www.ornatejewels.com/necklaces" style="color:#504f4e;text-decoration:none" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/necklaces&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNF1sOOozYUUB4TY9yIXJlOxEiGKtQ">Necklaces</a></td>
                      <td width="3px"></td>
                      <td width="100px" align="center" valign="middle" style="height:30px;text-align:center;font-family: Ubuntu;color:#504f4e;font-size:16px;vertical-align:middle">
<a href="https://www.ornatejewels.com/bracelets" style="color:#504f4e;text-decoration:none" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/bracelets&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNFGj_swVLB1M1WjVlsP87SU1QAJ5A">Bracelets</a></td>
		
		
<td width="100px" align="center" style="height:30px;text-align:center;font-family: Ubuntu;color:#504f4e;font-size:16px;vertical-align:middle">
<a href="https://www.ornatejewels.com/collections" style="color:#504f4e;text-decoration:none" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/collections&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNHOtnF1m9wADRSgVc8a2jpDDCDvSg"> Collections </a></td>
<td width="100px" align="center" style="height:30px;text-align:center;font-family: Ubuntu;color:#504f4e;font-size:16px;vertical-align:middle">
<a href="https://www.ornatejewels.com/999-Deals" style="color:#504f4e;text-decoration:none" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/999-Deals&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNGKBFP9vEYzgtY4KRMor4hTm1UoqA">999 Deals</a></td>
                      <td width="7px"></td>
                      <td width="90px" align="center" valign="bottom" style="height:30px;text-align:center;font-family: Ubuntu;color:#504f4e;font-size:16px;vertical-align:middle">
<a href="https://www.ornatejewels.com/kids-jewels" style="color:#504f4e;text-decoration:none" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/kids-jewels&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNESJeu8oBXFlv3C9y6a1Yvog6aSDQ">
                        <div>Kids Jewels</div>
                        </a></td>
       
                    </tr>
									</tbody>
								</table></td>
						</tr>
						<tr>
							<td width="100%" height="5"><hr size="1" width="100%" color="#b8b8b8"></td>
						</tr>
					</tbody>
				</table>
				<table align="center" width="100%" bgcolor="#f9f3f3" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td width="100%" height="20"></td>
						</tr>
						<tr>
							<td width="100%" align="center"><div>
									
									<h1 style="margin:10px 0;padding:0px;margin-bottom:5px;font-size:48px;color:#000; font-family: Ubuntu;"><em>Thank You.</em></h1>
									
								</div></td>
						</tr>
						<tr>
							<td width="100%" height="30"></td>
						</tr>
						<tr>
							<td width="100%"><a href="https://www.ornatejewels.com/" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNG7FdqDIyMYgusZLG3QS2HkGDPz4Q"><img src="https://ci6.googleusercontent.com/proxy/T9SaLwoM95XsRA5UR9l-sM5lQXLjE6Kn1bcmlqvL8B5JKUk8pWCqJRRvaJEvyMnBbtBAWuzzlBuBzyyODvCprf8NZ5qAbVao3ijdqUJ1-BU=s0-d-e1-ft#http://test.ornatejewels.com/images/email/img/envople2.png" style="width:714px;margin:0 auto;MARGIN-LEFT:0px" alt="Thank You! " class="CToWUd"></a></td>
						</tr>
				
						 	<tr>
							
						</tr>
		
						<tr>
							
					                   <td>
                                                <a href="https://www.ornatejewels.com/" style="text-decoration:none;margin-left:280px;color:#264386;font-size:17px;font-family: Ubuntu;border:1px solid #613f6a;padding:10px 24px;background:#613f6a;color:#fff;border-radius:4px" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.ornatejewels.com/&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNG7FdqDIyMYgusZLG3QS2HkGDPz4Q">Shop Now </a>
                                                 
                                     </td>
						</tr>
						
						<tr>
						<td style="padding-top:40px;padding-left:33px;font-size:17px;font-family: Ubuntu;">Recommendations for all Products</td>
						</tr>
						<tr>
							<td width="100%" height="5"><hr size="1" width="90%" color="#b8b8b8"></td>
						</tr>
						<tr>
                                                    <td height="250" align="left" style="display:inline-block;float:left;margin-top:22px;padding-left:33px">
                                                       
													 ';
													 foreach($req_products  as $prod) { 
												$message .=	'<a href="'.$prod["href"].'"><img src="'. $prod["thumb"].'" alt="necklaces" style="width:210px"></a>';
													}
                                                  
												  
													
													$message .='</td>
						</tr>
						   <tr style="display: inline-block;float:left;margin-top: -27px;padding-left: 36px;">
						       <td style="display:inline-block;float:left;width:210px;    text-align: center;font-family: Ubuntu;">
								   Silver Ring <br> Rs. 1,749</td>
						         
						       <td style="display:inline-block;float:left;width:210px;    text-align: center;font-family: Ubuntu;">
								  Silver Ring <br> Rs. 1,749</td>
						       
						         
						         
						       <td style="display:inline-block;float:left; width:210px;    text-align: center;font-family: Ubuntu;">
								   Silver Ring <br> Rs. 1,749</td>
						         </tr>
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
	                         <tbody>
	                         <tr>
							<td width="100%" height="5"><hr size="1" width="90%" color="#b8b8b8"></td>
						</tr>
						<tr>
							<td width="100%" height="6"></td>
						</tr>
	<tr>
		<td><table width="100%" style="text-align:center" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
	
</table>
</td>
	</tr>
	<tr>
	
		<td height="20" align="center" style="font-size:16px;color:#333" valign="middle"><span style="color:#c24a26"><a href="#m_-4767965164802118088_" style="text-decoration:none;color:#c24a26">Contact Us</a> </span> &nbsp;  |&nbsp;  
		<span><a href="#m_-4767965164802118088_" style="text-decoration:none;color:#c24a26;font-family: Ubuntu;">About Us</a></span> &nbsp; | &nbsp;
		
		<span><a href="#m_-4767965164802118088_" style="text-decoration:none;color:#c24a26;font-family: Ubuntu;">Testimonal</a></span></td>
	</tr>
     
	<tr>
		<td height="40" align="center" style="font-size:15px" valign="middle;">© 2017 <a href="http://www.ornatejewels.com" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://www.ornatejewels.com&amp;source=gmail&amp;ust=1505545678146000&amp;usg=AFQjCNHOvr7dWHwGQkYyxZEzfg7hIccHxQ">www.ornatejewels.com</a> All rights reserved.</td>
	</tr>
	
</tbody></table>
		
							</td>
						</tr>
					</tbody>
				</table></td>
		</tr>
	</tbody>
</table>
';
/*$message='<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<body>
		
<table style="font-family: Arial, Helvetica, sans-serif;" align="center" bgcolor="#f9f3f3;" cellpadding="0" width="650px" cellspacing="0" border="0">
	<tbody style="background-color: f9f3f3;">
		<tr>
			<td><table align="center" width="100%" bgcolor="#f9f3f3" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td width="100%" height="10"></td>
						</tr>
						<tr>
						<tr>
								<td align="left" width="100%" height="70"><a href="https://www.ornatejewels.com/"><img src="http://i.imgur.com/yB2UX14.png"  alt="Welcome to Ornate." style="display:block; border:none; vertical-align:bottom ; max-width:257px;"></a></td>
						</tr>
						<tr>
		<td><table width="190" style="text-align:right; margin-top: -52px;" height="35" border="0" align="right" >
	<tr>
			
		<td><a href="https://www.facebook.com/ornatejewelscom" target="_blank"><img src="http://i.imgur.com/5YW9Bsk.jpg" width="28" height="28"  alt="Facebook"/></a></td>
		<td>&nbsp;</td>
		<td><a href="https://twitter.com/ornatejewelscom" target="_blank"><img src="http://i.imgur.com/zyTB1Vj.jpg" width="28" height="28"  alt="twitter"/></a></td>
		<td>&nbsp;</td>
		<td><a href="https://plus.google.com/102333590500856537008" target="_blank"><img src="http://i.imgur.com/tI5y7wU.jpg" width="28" height="28"  alt="google-plus"/></a></td>
 		<td>&nbsp;</td>
		
		<td><a href="https://in.pinterest.com/ornatejewels/" target="_blank"><img src="http://i.imgur.com/klqZO8p.jpg" width="28" height="28"  alt="pinterest"/></a></td>
		<td>&nbsp;</td>
	</tr>
					</tbody>
				</table>
				<table align="center" width="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td width="100%" height="10"></td>
						</tr>
						<tr>
							<td width="100%" height="5"><hr size="1" width="100%" color="#b8b8b8"></td>
						</tr>
						<tr>
							<td align="center"><table align="center" width="100%" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
                      <td  width="55px" style="height:30px;background:#f9f3f3;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/" target="_blank" style="color:#504f4e; text-decoration:none;">Home</a></td>
                      <td width="3"></td>
                      <td width="55px" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/rings" target="_blank" style="color:#504f4e; text-decoration:none;">Rings</a></td>
                      <td width="4"></td>
                      <td width="91px" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/earrings" target="_blank" style="color:#504f4e; text-decoration:none;">Earrings</a></td>
                      <td width="3px"></td>
                      <td width="90px" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/necklaces" target="_blank" style="color:#504f4e; text-decoration:none;">Necklaces</a></td>
                      <td width="3px"></td>
                      <td width="100px" align="center" valign="middle"  style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/bracelets" target="_blank" style="color:#504f4e; text-decoration:none;">Bracelets</a></td>
		
		
<td  width="100px" align="center" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/collections " target="_blank" style="color:#504f4e; text-decoration:none;"> Collections </a></td>
<td  width="100px" align="center" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/999-Deals" target="_blank" style="color:#504f4e; text-decoration:none;">999 Deals</a></td>
                      <td width="7px"></td>
                      <td width="90px" align="center" valign="bottom"  style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/kids-jewels" target="_blank" style="color:#504f4e; text-decoration:none;">
                        <div>Kids Jewels</div>
                        </a></td>
       
                    </tr>
									</tbody>
								</table></td>
						</tr>
						<tr>
							<td width="100%" height="5"><hr size="1" width="100%" color="#b8b8b8"></td>
						</tr>
					</tbody>
				</table>
				<table align="center" width="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td width="100%" height="20"></td>
						</tr>
						<tr>
							<td width="100%" align="center"><div>
									<!--<p style="margin:0px; padding:0px; font-size:14px; color:#494949;"></p>-->
									<h1 style="margin:10px 0; padding:0px; margin-bottom:5px; font-size:36px; color:#000; font-weight:normal"><em>Thank You.</em></h1>
									<!--<p style="margin:0px; padding:0px; font-size:14px; color:#494949;">You have successfully created a new account with ornatejewels.</p>-->
								</div></td>
						</tr>
						<tr>
							<td width="100%" height="30"></td>
						</tr>
						<tr>
							<td width="100%"><a href="https://www.ornatejewels.com/" target="_blank"><img   src="http://test.ornatejewels.com/images/email/img/envople1.png" style="width:714px; margin: 0 auto; MARGIN-LEFT: 0px;" alt="Welcome! "/></a></td>
						</tr>
				
						 	<tr>
							<!--<td width="100%" height="20"></td>-->
						</tr>
		
						<tr>
					        <td style="padding-top:10p;">
                                                <a href="https://www.ornatejewels.com/" target="_blank" style="text-decoration: none; margin-left: 244px; color: #264386; font-size: 18px; font-family: FuturaPTLight; border: 1px solid #613f6a;padding: 10px 24px;background: #613f6a; color: #fff; border-radius: 4px;">Shop Now </a>
                                                 
                                                 </td>
						</tr>
						<tr>
                                                    <td height="350" align="left"  style="display: inline-block; float: left;">
                                                        <a href="https://www.ornatejewels.com/necklaces" target="_blank"><img src="http://i.imgur.com/8aEEFKG.jpg" alt="necklaces"></a>
                                                        <a href="https://www.ornatejewels.com/blue-hues" target="_blank" style="margin-left: 0px"><img src="http://i.imgur.com/sP2QKJ2.jpg" alt="Blue Hues"></a>
                                                    </td>
						</tr>
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
	                                         <tr>
							<td width="100%" height="10"><hr size="1" width="100%" color="#b8b8b8"></td>
						</tr>
						<tr>
							<td width="100%" height="6"></td>
						</tr>
	<tr>
		<td><table width="190" style="text-align:center;" height="35" border="0" align="center" cellpadding="0" cellspacing="0">
	
</table>
</td>
	</tr>
	<tr>
		<td height="40" align="center" style="font-size:18px; color:#333;" valign="middle"><span style="color:#c24a26;">Call :</span> +91-8600718666 &nbsp;&nbsp;  |&nbsp;&nbsp;   <span style="color:#c24a26;">Email :</span> <a href="mailto:sales@ornatejewels.com" target="_blank" style="outline:none; color:#333; text-decoration:none;">sales@ornatejewels.com</a> </td>
	</tr>
     <tr>
		<td height="30" align="center" style="font-size:13px; line-height:19px; color:#626262; height:20px; padding: 10px 0px 0px 0px;" valign="middle">Online  Jewelry Shopping  Website - Delivering across India.</td>
	</tr>
	<tr>
		<td height="40" align="center" style="font-size:13px;" valign="middle">&copy; 2017 www.ornatejewels.com All rights reserved.</td>
	</tr>
	<tr>
		<td height="10" bgcolor="#582d1e" style="font-size:5px;" headers="5">&nbsp;</td>
	</tr>
</table>
		
							</td>
						</tr>
					</tbody>
				</table></td>
		</tr>
	</tbody>
</table>
		
</body>
</html>
';
		*/
		
		
		
		
		
		
		
		
		
		
		
		

		///$message .= $this->url->link('account/login', '', true) . "\n\n";
		//$message .= $this->language->get('text_services') . "\n\n";
		//$message .= $this->language->get('text_thanks') . "\n";
		//$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
/*
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($data['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		//$mail->setSubject($subject);
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
		//$mail->setText($message);
		$mail->send();*/
		
		
		$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
	
					$mail->setTo($data['email']);
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
					$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
					$mail->setHtml($this->load->view('mail/signup', $data));
					//$mail->setText($text);
					$mail->send();
		
		
		
		
		

		// Send to main admin email if new account email is enabled
		if (in_array('account', (array)$this->config->get('config_mail_alert'))) {
			$message  = $this->language->get('text_signup') . "\n\n";
			$message .= $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n";
			$message .= $this->language->get('text_firstname') . ' ' . $data['firstname'] . "\n";
			$message .= $this->language->get('text_lastname') . ' ' . $data['lastname'] . "\n";
			$message .= $this->language->get('text_customer_group') . ' ' . $customer_group_info['name'] . "\n";
			$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
			$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($this->language->get('text_new_customer'), ENT_QUOTES, 'UTF-8'));
			$mail->setText($message);
			$mail->send();


			
			
			
			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_alert_email'));

			foreach ($emails as $email) {
				if (utf8_strlen($email) > 0 && filter_var($email, FILTER_VALIDATE_EMAIL)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}

		return $customer_id;
	}

	public function editCustomer($data) {
		$customer_id = $this->customer->getId();

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "',  custom_field = '" . $this->db->escape(isset($data['custom_field']) ? json_encode($data['custom_field']) : '') . "' WHERE customer_id = '" . (int)$customer_id . "'");
	}

	public function editPassword($email, $password) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "', code = '' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function editCode($email, $code) {
		$this->db->query("UPDATE `" . DB_PREFIX . "customer` SET code = '" . $this->db->escape($code) . "' WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function editNewsletter($newsletter) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter = '" . (int)$newsletter . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}

	public function getCustomerByEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function getCustomerByCode($code) {
		$query = $this->db->query("SELECT customer_id, firstname, lastname, email FROM `" . DB_PREFIX . "customer` WHERE code = '" . $this->db->escape($code) . "' AND code != ''");

		return $query->row;
	}

	public function getCustomerByToken($token) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE token = '" . $this->db->escape($token) . "' AND token != ''");

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = ''");

		return $query->row;
	}

	public function getTotalCustomersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}

	public function getRewardTotal($customer_id) {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getIps($customer_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_ip` WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->rows;
	}

	public function addLoginAttempt($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_login WHERE email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

		if (!$query->num_rows) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_login SET email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', total = 1, date_added = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "customer_login SET total = (total + 1), date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "' WHERE customer_login_id = '" . (int)$query->row['customer_login_id'] . "'");
		}
	}

	public function getLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}
	public function getRecomendate(){
		$query=$this->db->query("SELECT * FROM oc_product p LEFT JOIN oc_product_description pd ON pd.product_id=p.product_id  where p.status=1 ORDER BY RAND() LIMIT 3");
		return $query->rows;
	}
	public function getDeliveredPincode($pincode){
		$query = $this->db->query("SELECT 1 FROM " . DB_PREFIX . "pincheck WHERE pincode = '" . $this->db->escape($pincode) . "'");
		if ($query->num_rows) {
			return true;
		}else{
		return false;
		}
		//return $query->row;
	}
}
