<?php

class ModelCatalogHavequestion extends Model {

    public function addQuestion($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "havequestion SET name = '" . $this->db->escape($data['name']) . "', `email` = '" . $this->db->escape($data['email']) . "', `mobile` = '" . $this->db->escape($data['mobile']) . "', detail = '" . $this->db->escape($data['detail']) . "', answer = '" . $this->db->escape($data['answer']) . "',status='".(int)$data['status']."',product_id='".(int)$data['product_id']."', date_added = NOW()");
    }

    public function editQuestion($question_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "havequestion SET name = '" . $this->db->escape($data['name']) . "', `email` = '" . $this->db->escape($data['email']) . "', `mobile` = '" . $this->db->escape($data['mobile']) . "', detail = '" . $this->db->escape($data['detail']) . "', answer = '" . $this->db->escape($data['answer']) . "',status='".(int)$data['status']."',product_id='".(int)$data['product_id']."' where id='" . (int) $question_id . "'");
    }

    public function deleteQuestion($question_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "havequestion WHERE id = '" . (int) $question_id . "'");
    }

    public function getQuestion($question_id) {
        $query = $this->db->query("SELECT * FROM oc_havequestion where id='" . $question_id . "'");

        return $query->row;
    }

    public function getQuestions($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "havequestion";

        $sort_data = array(
            'name',
            'id'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY id";
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

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    public function getTotalQuestions() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "havequestion");

		return $query->row['total'];
	}
}
