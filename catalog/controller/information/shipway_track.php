<?php
class ControllerInformationShipwayTrack extends Controller
{
    public function index()
    {
        $data['heading_title'] = 'Tracking';
        $data['action']        = $this->url->link('information/shipway_track');
        
        $shipway_login = $this->config->get('shipway_login');

        if ($shipway_login) {
            $username                 = $shipway_login['loginid'];
            $password                 = $shipway_login['licencekey'];
            $data['hasAccount'] = true;
        } else {
            $username                 = '';
            $password                 = '';
            $data['hasAccount'] = false;
			echo "<p style='color:#BA1A1A;font-size:14px;'>Something went wrong.Please inform the website administrator.</p>";die;
        }
		
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            $status_result = '';
            if (isset($this->request->post['order_id'])) {
                $courier_detail = $this->getAWBByOrderId($this->request->post['order_id']); 			
            } else {
                $data['status_result'] = 'No tracking number associated with this order';
            }
            
            if (!empty($courier_detail)) {
                $awbno                      = $courier_detail['awbno'];
                $data['awbno']        = $awbno;
                $data['carrier_name'] = $courier_detail['name'];                
                
                $courier_id = $courier_detail['courier_id'];
                $order_id = $courier_detail['order_id'];
				
                $status_result = $this->getAWBResults($username, $password, $courier_id, $awbno,$order_id);
				
				$isJson = json_decode($status_result);
				if(!empty($isJson) && strtolower($isJson->status) == 'failed'){
					$status_result = "<p style='color:#BA1A1A;font-size:14px;'>Something went wrong.Please inform the website administrator.</p>";
				}
            } else {                
                $data['status_result'] = 'No tracking number associated with this order';
            }
                    
            if ($status_result != '') {
                $data['status_result'] = $status_result;
            }
			
            $data['order_id'] = $this->request->post['order_id'];
            if (isset($this->request->post['carrier'])) {
                $data['carrier_id'] = $this->request->post['carrier'];
            } else {
                $data['carrier_id'] = "";                
            }
        }        
        
        $data['breadcrumbs'] = array();
        
        $data['breadcrumbs'][] = array(
            'text' => 'Home',
            'href' => $this->url->link('common/home')
            
        );
        
        $data['breadcrumbs'][] = array(
            'text' => 'Tracking',
            'href' => $this->url->link('information/shipway_track')
           
        );
		$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
		$this->response->setOutput($this->load->view('information/shipway_track', $data));
    }
    private function getAWBByOrderId($order_id)
    {
        $sql   = "SELECT o.awbno,o.courier_id,c.name,o.order_id FROM `" . DB_PREFIX . "order` o INNER JOIN `" . DB_PREFIX . "sw_couriers` c ON(o.courier_id = c.courier_id) where o.order_id ='" . addslashes($order_id)."' AND o.awbno != '0' AND o.awbno != '' ";
       
		$query = $this->db->query($sql);
        return $query->row;        
    }
    
    public function getAWBResults($username, $password, $carrier_id, $awbno, $order_id)
    {
        $url         = "https://shipway.in/api/getawbresult";
        $data_string = array(
            "username" 		=> $username,
            "password" 		=> $password,
            "carrier_id" 	=> $carrier_id,
            "awb" 			=> $awbno,
			"order_id"		=> $order_id
        );
		
        $data_string = json_encode($data_string);
        $curl        = curl_init();
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type:application/json'
        ));
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        $output = curl_exec($curl);
        curl_close($curl);
        return $output;        
    }
}
?>