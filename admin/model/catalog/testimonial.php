<?php
class ModelCatalogTestimonial extends Model {
	public function addTestimonial($data){
		//print_r($data);exit;
		$this->db->query("INSERT INTO " . DB_PREFIX . "testimonial SET author = '" . $this->db->escape($data['author']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', city = '" . $data['city'] . "',image = '" . $this->db->escape($data['image']) . "',sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_added = '" . $this->db->escape($data['date_added']) . "'");
		
		$testimonial_id = $this->db->getLastId();
		
		return $testimonial_id;
	}
	

	public function editTestimonial($testimonial_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "testimonial SET author = '" . $this->db->escape($data['author']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', city = '" . $data['city'] . "',image = '" . $this->db->escape($data['image']) . "', status = '" . (int)$data['status'] . "',sort_order = '" . (int)$data['sort_order'] . "', date_added = '" . $this->db->escape($data['date_added']) . "', date_modified = NOW() WHERE testimonial_id = '" . (int)$testimonial_id  . "'");
	}

	public function deleteReview($testimonial_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "testimonial WHERE testimonial_id = '" . (int)$testimonial_id . "'");
	}

	public function getReview($testimonial_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "testimonial WHERE testimonial_id = '" . (int)$testimonial_id . "'");

		return $query->row;
	}

	public function getTestimonials($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "testimonial WHERE product_id = 0";


		if (isset($data['filter_city']) && !is_null($data['filter_city'])) {
			$sql .= " AND city LIKE '" . $this->db->escape($data['filter_city'] ). "%'";
		}

		if (!empty($data['filter_text'])) {
			$sql .= " AND text LIKE '" . $this->db->escape($data['filter_text']) . "%'";
		}

		if (!empty($data['filter_author'])) {
			$sql .= " AND author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$sort_data = array(
			'author',
			//'rating',
			'status',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY date_added";
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

	public function getTotalTestimonials($data = array()) {
		
		//print_r($data);exit;
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "testimonial WHERE product_id = 0";

		if (isset($data['filter_city']) && !is_null($data['filter_city'])) {
			$sql .= " AND city LIKE '" . $this->db->escape($data['filter_city']) . "%'";
		}

		if (!empty($data['filter_author'])) {
			$sql .= " AND author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}
//print_r($sql);exit;
		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	

	
}