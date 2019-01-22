<?php

class ModelToolPostCode extends Model {

	public function addpin($data) {

			$this->db->query("INSERT INTO " . DB_PREFIX . "post_code SET zip_code='".$data['pin_code']."', message = '".$this->db->escape($data['message_id'])."', status = '".(int)$data['status_value']."', date_added = NOW()");



			$zip_code_id = $this->db->getLastId();

	}



	public function checkpin($zip_code,$zip_code_id) {

		$sql = "SELECT COUNT(zip_code_id) as count FROM " . DB_PREFIX . "post_code WHERE  zip_code ='".$zip_code."' AND zip_code_id != '".(int)$zip_code_id."'";	

		$query = $this->db->query($sql);

		return $query->row['count'];

	}



	public function checkepin($zip_code) {

		$sql = "SELECT COUNT(zip_code_id) as count FROM " . DB_PREFIX . "post_code WHERE  zip_code ='".$zip_code."'";	

		$query = $this->db->query($sql);

		return $query->row['count'];

	}

	

	public function editpin($id, $data) {

		$this->db->query("UPDATE " . DB_PREFIX . "post_code SET zip_code='".$data['pin_code']."', message = '".$this->db->escape($data['message_id'])."', status = '".(int)$data['status_value']."', date_added = NOW() WHERE zip_code_id = '" . (int)$id . "'");
	}

	

	public function delete($zip_code_id) {

		$this->db->query("DELETE FROM " . DB_PREFIX . "post_code WHERE zip_code_id = '" . (int)$zip_code_id . "'");

	}



	public function getZones() {

		$returnarray = array();

		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "zip_zone");

		foreach ($query->rows as $key => $value) {

			$returnarray[$value['id']] = $value['name'];

		}

		return $returnarray;

	}



	public function getAvailability() {

		$returnarray = array();

		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "zip_message");

		foreach ($query->rows as $key => $value) {

			$returnarray[$value['id']] = $value['name'];

		}

		return $returnarray;

	}





	public function getpin($id) {

		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "post_code WHERE zip_code_id = '" . (int)$id . "'");



		return $query->row;

	}

	

	public function getpins($data) {

		

		$sql = "SELECT * FROM " . DB_PREFIX . "post_code z  ";



		$sql .= " WHERE 1 "; 


		if (!empty($data['filter_message'])) {

			$sql .= " AND z.message = '" . $this->db->escape($data['filter_message']) . "'";

		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {

			$sql .= " AND z.status = '" . (int)$data['filter_status'] . "'";

		}



		$sql .= " GROUP BY z.zip_code_id ";

		$sort_data = array(

			'zip_code_id',

			'message',

			'zip_code',

			'status',

			'date_added'

		);	

		

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {

			$sql .= " ORDER BY z." . $data['sort'];	

		} else {

			$sql .= " ORDER BY z.zip_code_id";	

		}

		

		if (isset($data['order']) && ($data['order'] == 'DESC')) {

			$sql .= " DESC";

		} else {

			$sql .= " ASC";

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

		

		$query = $this->db->query($sql);

		

		return $query->rows;

	}

	

	public function getTotalpins($data) {

		

		$sql = "SELECT * FROM " . DB_PREFIX . "post_code z  ";



		if (!empty($data['filter_payment'])) {

			$sql .= " LEFT JOIN " . DB_PREFIX . "postcode_payment zp ON (z.zip_code = zp.zip_code)";			

		}



		$sql .= " WHERE 1 "; 

		if (!empty($data['filter_zipcode'])) {

			$sql .= " AND z.zip_code LIKE '%" . $this->db->escape($data['filter_zipcode']) . "%'";

		}


		if (!empty($data['filter_message'])) {

			$sql .= " AND z.message = '" . $this->db->escape($data['filter_message']) . "'";

		}

		

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {

			$sql .= " AND z.status = '" . (int)$data['filter_status'] . "'";

		}

		

		$query = $this->db->query($sql);

		

		return $query->num_rows;

	}



	public function createTable() {


		if ($this->db->query("SHOW TABLES LIKE '". DB_PREFIX ."post_code'")->num_rows == 0) {

            $sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "post_code` (

				  `zip_code_id` int(11) NOT NULL AUTO_INCREMENT,

				  `message` text NOT NULL,

				  `zip_code` varchar(255) NOT NULL,

				  `status` tinyint(1) NOT NULL DEFAULT '1',

				  `date_added` datetime NOT NULL,

				  PRIMARY KEY (`zip_code_id`)

				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1";

            $this->db->query($sql);
			
			
           @mail('support@mdtecho.com','Free Postcode 2.x Installed',HTTP_CATALOG .'  -  '.$this->config->get('config_name')."\r\n mail: ".$this->config->get('config_email')."\r\n".'version-'.VERSION."\r\n".'WebIP - '.$_SERVER['SERVER_ADDR']."\r\n IP: ".$this->request->server['REMOTE_ADDR'],'MIME-Version:1.0'."\r\n".'Content-type:text/plain;charset=UTF-8'."\r\n".'From:'.$this->config->get('config_owner').'<'.$this->config->get('config_email').'>'."\r\n");

        }

	    if ($this->db->query("SHOW TABLES LIKE '". DB_PREFIX ."postcodesetting'")->num_rows == 0) {

            $sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "postcodesetting` (

                       `lang_id` int(11) NOT NULL,

                       `status` int(11) NOT NULL,

					  `message` varchar(256) NOT NULL,

					  `header` varchar(256) NOT NULL

					) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";

            $this->db->query($sql);

        }

	}

}

?>