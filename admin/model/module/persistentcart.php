<?php 
class ModelModulePersistentCart extends Model {

  	public function install() {
	   // Install Code
	   $this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=1 WHERE `name` LIKE'%PersistentCart by iSenseLabs%'");
		$modifications = $this->load->controller('extension/modification/refresh');
  	} 
  
  	public function uninstall() {
		// Uninstall Code
		$this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=0 WHERE `name` LIKE'%PersistentCart by iSenseLabs%'");
		$modifications = $this->load->controller('extension/modification/refresh');
  	}
	
  }
?>