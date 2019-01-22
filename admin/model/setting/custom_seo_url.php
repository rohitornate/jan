<?php 
    class ModelSettingCustomSeoUrl extends Model {
        
        public function getCustomSeourls() {
            
			$sql = "SELECT * FROM oc_custom_seo_url  ORDER BY query ASC";
			$query = $this->db->query($sql);
            
			return $query->rows;
        }
    }