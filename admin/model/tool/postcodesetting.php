<?php

class ModelToolpostcodesetting extends Model {

	public function adddata($data) {

		$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "postcodesetting");

		foreach ($data['dynamic'] as $key => $value) {

			$this->db->query("INSERT INTO " . DB_PREFIX . "postcodesetting SET `lang_id` = '" . (int)$key . "',`message` = '" . $this->db->escape($value['message']) . "',`header` = '" . $this->db->escape($value['header']) . "'");

		}

	}



	public function getdatad() {

		$result_data = array();

		$result = $this->db->query("SELECT * FROM " . DB_PREFIX . "postcodesetting");

		

		foreach ($result->rows as $key => $value) {

			$result_data[$value['lang_id']]['message'] = $value['message'];

			$result_data[$value['lang_id']]['header'] = $value['header'];

		}

		

		return $result_data;

	}



	public function getLanguages() {



			$sql = "SELECT * FROM " . DB_PREFIX . "language WHERE status = 1 ";

	

			$sort_data = array(

				'name',

				'code',

				'sort_order'

			);	

			

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {

				$sql .= " ORDER BY " . $data['sort'];	

			} else {

				$sql .= " ORDER BY sort_order, name";	

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

}

?>