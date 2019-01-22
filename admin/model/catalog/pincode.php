<?php
//==============================================================================
// pincode extention
// Author: Onjection Solutions
// E-mail: tomas@onjection.com
// Website: http://www.onjection.com
//==============================================================================

	class ModelCatalogpincode extends Model {
		
		public function putmypin($pincode,$service,$delivery) {
			if($pincode != ''){
				$query = $this->db->query("INSERT INTO " . DB_PREFIX . "pincheck (`id`, `pincode`, `service_available`,delivery_option) VALUES (NULL, '".$pincode."', '".$service."', '".$delivery."')") ;
			}
		}
		public function uploadfile($col1,$upload_service,$upload_delivery) {
			if($col1 != ''){
				$query = $this->db->query("INSERT INTO " . DB_PREFIX . "pincheck (`id`, `pincode`, `service_available`, delivery_option) VALUES (NULL, '".$col1."', '".$upload_service."', '".$upload_delivery."')");
			}
		}
		public function updateuploadpin($col1,$upload_service,$upload_delivery){
			$query = $this->db->query("UPDATE " . DB_PREFIX . "pincheck SET service_available = '".$upload_service."', delivery_option = '".$upload_delivery."' WHERE pincode = '".$col1."'");
		}
		public function checkmypin($pincode) {
			$query = $this->db->query("SELECT count(*) FROM " . DB_PREFIX . "pincheck WHERE pincode = '".$pincode."'");
			return $query->row;
		}
		public function getmypin($data,$select) {
			$query = $this->db->query("SELECT p.id,p.pincode,p.service_available,p.delivery_option,pd.delivery_time FROM " . DB_PREFIX . "pincheck p LEFT JOIN " . DB_PREFIX . "pincode_delivery pd ON (p.delivery_option = pd.id)  ".$select." LIMIT " . (int)$data['start'] . "," . (int)$data['limit']."");
			return $query->rows;
		}
		public function pincount($select) {
			$query = $this->db->query("SELECT count(*) FROM " . DB_PREFIX . "pincheck p LEFT JOIN " . DB_PREFIX . "pincode_delivery pd ON (p.delivery_option = pd.id) ".$select);
			return $query->row;
		}
		public function editmypin($pinid) {
			$query = $this->db->query("SELECT * FROM pincheck WHERE id = '".$pinid."'");
			return $query->row;
		}
		public function updatemypin($e_pincode,$e_service,$edelivery,$pin_id) {
			$this->db->query("UPDATE " . DB_PREFIX . "pincheck SET pincode = '".$e_pincode."', service_available = '".$e_service."',delivery_option = '".$edelivery."' WHERE id = '".$pin_id."'");
		}
		public function deletemypin($pincode_id) {
			$query = $this->db->query("DELETE FROM " . DB_PREFIX . "pincheck WHERE `pincheck`.`id` = '".$pincode_id."'");
		}
			
		public function download_csv($select){
			$result = $this->db->query("select pincode from " . DB_PREFIX . "pincheck ".$select);
			return $result->rows;
		}
		public function createTable(){
			$this->db->query("CREATE TABLE IF NOT EXISTS `oc_pincheck` (`id` int(255) NOT NULL AUTO_INCREMENT, `pincode` varchar(255) NOT NULL, `service_available` int(255) NOT NULL, `delivery_option` int(255) NOT NULL, PRIMARY KEY (`id`))");
			$this->db->query("CREATE TABLE IF NOT EXISTS `oc_pincode_delivery` (`id` int(255) NOT NULL AUTO_INCREMENT,`delivery_time` varchar(255) NOT NULL,PRIMARY KEY (`id`))");
		}
		
		public function install_status(){
			$pincode_install_status = $this->db->query("SELECT COUNT(*) as total FROM " . DB_PREFIX . "extension WHERE type = 'module' AND code = 'pincode'")->row;
			return $pincode_install_status;
		}
		public function checkmydelivery($delivery) {
			$query = $this->db->query("SELECT count(*) as total FROM " . DB_PREFIX . "pincode_delivery WHERE delivery_time = '".$delivery."'");
			return $query->row;
		}
		public function putmydelivery($delivery) {
			if($delivery != ''){
				$query = $this->db->query("INSERT INTO " . DB_PREFIX . "pincode_delivery SET delivery_time = '".$delivery."'") ;
			}
		}
		public function getmydelivery() {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "pincode_delivery");
			return $query->rows;
		}
		public function editmydelivery($deliveryid) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "pincode_delivery WHERE id = '".$deliveryid."'");
			return $query->row;
		}
		public function updatemydelivery($data) {
			$this->db->query("UPDATE " . DB_PREFIX . "pincode_delivery SET delivery_time = '".$data['delivery_time']."' WHERE id = '".$data['id']."'");
		}
		
		public function deletemydelivery($data) {
			$id = '';
			foreach($data['selected'] as $delete){
				$id .= $delete.",";
			}
			$this->db->query("DELETE FROM " . DB_PREFIX . "pincode_delivery WHERE id in (".substr($id,0,-1).")");
		}
	}
?>