<?php
class ModelCatalogNotifyme extends Model {
	public function send($email) {
		$query = $this->db->query("INSERT INTO ".DB_PREFIX."notifyme  SET email='".$this->db->escape($email)."'");
	}

}