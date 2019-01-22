<?php

class ModelModuleKdtrackerOrder extends Model {

    public function getOrderTracking($order_id) {
        $sql = "SELECT o.id_kdtracker,o.order_id,o.ship_company,o.tracking_number,o.tracking_info,o.tracking_status,o.update_time FROM `" . DB_PREFIX . "kdtracker` o";
        $order_query = $this->db->query("$sql WHERE o.order_id = '" . (int) $order_id . "'");
        if($order_query->row){
            return array(
                'id_kdtracker' => $order_query->row['id_kdtracker'],
                'order_id' => $order_query->row['order_id'],
                'ship_company' => $order_query->row['ship_company'],
                'tracking_number' => $order_query->row['tracking_number'],
                'tracking_info' => $order_query->row['tracking_info'],
                'tracking_status' => $order_query->row['tracking_status'],
                'update_time' => $order_query->row['update_time']
            );
        }
        return null;
    }

    public function getOrders($data = array()) {
        $sql = "SELECT o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int) $this->config->get('config_language_id') . "') AS status, o.shipping_code, o.total, o.email,o.telephone,o.currency_code, o.currency_value, o.date_added, o.date_modified,o.order_id,c.id_kdtracker,c.tracking_number,c.tracking_status FROM `" . DB_PREFIX . "order` o LEFT JOIN `" . DB_PREFIX . "kdtracker` c ON c.order_id=o.order_id";
        if (isset($data['filter_order_status'])) {
            $implode = array();

            $order_statuses = explode(',', $data['filter_order_status']);

            foreach ($order_statuses as $order_status_id) {
                $implode[] = "o.order_status_id = '" . (int) $order_status_id . "'";
            }

            if ($implode) {
                $sql .= " WHERE (" . implode(" OR ", $implode) . ")";
            }
        } else {
            $sql .= " WHERE o.order_status_id > '0'";
        }

        if (!empty($data['filter_order_id'])) {
            $sql .= " AND o.order_id = '" . (int) $data['filter_order_id'] . "'";
        }
        if (!empty($data['filter_tracking_number'])) {
            $sql .= " AND c.tracking_number = '" . $data['filter_tracking_number'] . "'";
        }

        if (!empty($data['filter_customer'])) {
            $sql .= " AND CONCAT(o.firstname, ' ', o.lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
        }

        if (!empty($data['filter_date_added'])) {
            $sql .= " AND DATE(o.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
        }

        if (!empty($data['filter_date_modified'])) {
            $sql .= " AND DATE(o.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
        }

        if (!empty($data['filter_total'])) {
            $sql .= " AND o.total = '" . (float) $data['filter_total'] . "'";
        }

        $sort_data = array(
            'o.order_id',
            'customer',
            'status',
            'o.date_added',
            'o.date_modified',
            'o.total'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY o.order_id";
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

    public function getOrderTotals($order_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int) $order_id . "' ORDER BY sort_order");

        return $query->rows;
    }

    public function getTotalOrders($data = array()) {
        $sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order`";

        if (isset($data['filter_order_status'])) {
            $implode = array();

            $order_statuses = explode(',', $data['filter_order_status']);

            foreach ($order_statuses as $order_status_id) {
                $implode[] = "order_status_id = '" . (int) $order_status_id . "'";
            }

            if ($implode) {
                $sql .= " WHERE (" . implode(" OR ", $implode) . ")";
            }
        } else {
            $sql .= " WHERE order_status_id > '0'";
        }

        if (!empty($data['filter_order_id'])) {
            $sql .= " AND order_id = '" . (int) $data['filter_order_id'] . "'";
        }

        if (!empty($data['filter_customer'])) {
            $sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
        }

        if (!empty($data['filter_date_added'])) {
            $sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
        }

        if (!empty($data['filter_date_modified'])) {
            $sql .= " AND DATE(date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
        }

        if (!empty($data['filter_total'])) {
            $sql .= " AND total = '" . (float) $data['filter_total'] . "'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function editTrackingNumber($order_id, $tracking_number) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "kdtracker WHERE order_id = '" . (int) $order_id . "'");
        if (count($query->rows) > 0) {
            $this->db->query("UPDATE " . DB_PREFIX . "kdtracker SET `tracking_number` = '" . $tracking_number . "'  WHERE `order_id` = '" . $order_id . "'");
        } else {
            $this->db->query("INSERT INTO " . DB_PREFIX . "kdtracker SET order_id = '" . (int) $order_id . "', `tracking_number` = '" . $tracking_number . "'");
        }
    }

    public function saveTracking($id_kdtracker,$data) {
        $ship_company=$data['exname'].'['.$data['company'].']';
        $sql="UPDATE ".DB_PREFIX."kdtracker SET tracking_status='".(int) $data['status'] ."',ship_company='".$ship_company."',update_time='".date('Y-m-d H:i:s',time())."',tracking_info='".  serialize($data)."' WHERE id_kdtracker=$id_kdtracker";
       
        $this->db->query($sql);
    }
    public function getTrackings_Status_6($start=0,$end=20){
        $sql = "SELECT o.id_kdtracker,o.order_id,c.email,o.ship_company,o.tracking_number,o.tracking_info,o.tracking_status,o.update_time FROM `" . DB_PREFIX . "kdtracker` o LEFT JOIN `" . DB_PREFIX . "order` c ON c.order_id=o.order_id";
        $query = $this->db->query("$sql WHERE o.tracking_status <> 6 limit $start,$end");
        return $query->rows;
    }
     public function getTrackingTotals_status_6() {
        $query = $this->db->query("select count(*) as total from oc_kdtracker WHERE tracking_status<>6");
        return $query->row;
    }

}
