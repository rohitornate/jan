<?php
class ControllerProductNotifyme extends Controller {
	public function send() {
	//	echo "hii";
		$this->load->language('product/notifyme');
//print_r($_POST);exit;
		$this->load->model('catalog/notifyme');
		if (isset($this->request->post['emailnotify'])) {
                    $email = $this->request->post['emailnotify'];
           //     print_r($email); 
			//	 $this->model_catalog_notifyme->send($email); 
                                
								$text = 'You will be notified when the product is available';
                                $subject = $this->language->get('text_subject');
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
	
				$mail->setTo($email);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode($email, ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
				$mail->setText($text);
				$mail->send();
				
				echo "1";
		}

		

			//$data['column_left'] = $this->load->controller('common/column_left');
			//$data['column_right'] = $this->load->controller('common/column_right');
			//$data['content_top'] = $this->load->controller('common/content_top');
		//	$data['content_bottom'] = $this->load->controller('common/content_bottom');
		//	$data['footer'] = $this->load->controller('common/footer');
		//	$data['header'] = $this->load->controller('common/header');
			
			//$this->response->redirect($this->url->link('product/category', '', true));
			//$this->response->setOutput($this->load->view('product/category', $data));
	}
}