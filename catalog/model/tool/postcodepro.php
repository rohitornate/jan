<?php

class ModelToolPostCodepro extends Model {


	public function getDynamic($id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "postcodesetting WHERE lang_id = '".(int)$id."'");

		return $query->row;

	}



	public function checkpin($data) {

		$ogpincode = $data['pincode'];

		if($this->config->get('imdev_config_wildcardpostcode')) {

			$pinentered = explode(" ", $data['pincode']);

			$data['pincode'] = $pinentered[0];

		}	

		//$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "post_code WHERE zip_code = '".$this->db->escape($data['pincode'])."' LIMIT 1");
	$query =	$this->db->query("SELECT p.id,p.pincode,p.service_available,p.delivery_option,pd.delivery_time FROM oc_pincheck p LEFT JOIN oc_pincode_delivery pd ON (p.delivery_option = pd.id) where pincode = '".$data['pincode']."'");
		

		if(!$query->num_rows) {

			
			$query->row['html'] = "<table><tr><td><img src='image/pincode/x.png' /> </td><td>oh snap! We can't deliver to this pincode. Can we send your order to a different address?</td></tr>";

			

			$query->row['html'] .= "</table>";

			$query->row['failed'] = 1;

			setcookie("mdevpc","",time() - 3600);

			setcookie("mdevpcm","",time() -3600);

			return $query->row;

		} else {

		
		//print_r($query->num_rows);exit;
		
			$version = str_replace(".","",VERSION);

			if($version < 2300) {

				$this->language->load('module/postcodecheck');

			} else {

				$this->language->load('extension/module/postcodecheck');

			}

				setcookie("mdevpc",$ogpincode,time() + (86400 * 30));

				setcookie("mdevpcm",$query->row['message'],time() + (86400 * 30));
			//$query->row['html'] = "<table>";
			//	$query->row['html'] .= "<tr><td><img src='catalog/view/theme/default/image/tick.png' /></td><td>".//html_entity_decode($query->row['message'])."</td></tr>";
		//	$query->row['html'] .= "</table>";
			
				$query->row['html'] = '<table>
									<tbody>
									<tr><td>
									<img src="image/pincode/check.png"></td>
									<td style="color:#b64f81">Delivery option for:"'.$data['pincode'].'" </td></tr>
									<tr>
									<td><img src="image/pincode/l.png" width="25px;"></td><td style="color:#b64f81">WE DELIVER TO YOUR LOCATION</td></tr>
									</tbody></table>';
			
			

			$query->row['failed'] = 0;

			return $query->row;

		}

	}

}

?>