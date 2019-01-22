<?php
	class ModelCatalogpincode extends Model {
		public function getPin($pincode) {
			return $this->db->query("SELECT p.id,p.pincode,p.service_available,p.delivery_option,pd.delivery_time FROM oc_pincheck p LEFT JOIN oc_pincode_delivery pd ON (p.delivery_option = pd.id) where pincode = '".$pincode."'")->row;
		}
		public function is_install() {
			return $this->db->query("select COUNT(*) as total from " . DB_PREFIX . "extension where type = 'module' AND code = 'pincode'")->row;
		}
	}
?>