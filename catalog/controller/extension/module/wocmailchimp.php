<?php

use \DrewM\MailChimp\MailChimp;

class ControllerExtensionModuleWocmailchimp extends Controller {
    
public function index() {
        $data = array();
		$data['wocmailchimp_api_key'] = $this->config->get('wocmailchimp_api_key');
        $data['wocmailchimp_list_id'] = $this->config->get('wocmailchimp_list_id');
        
        return $this->load->view('extension/module/wocmailchimp', $data);
}

public function subscribe($data) {

        $apiKey = $this->config->get('wocmailchimp_api_key');
        $listId = $this->config->get('wocmailchimp_list_id');

         $response = array();
         // Skip for localhost testing
         if($this->whitelist()){
          $response['status'] = 'error';
          $response['message'] = 'Running localhost';
          return $response;
        }

        $MailChimp = new MailChimp($apiKey);
        $mailchimp = $MailChimp->post("lists/$listId/members", [
        'email_address' => $data['email'],
        'status'        => 'subscribed',
        'merge_fields' => ['FNAME'=>$data['firstname'], 'LNAME'=>$data['lastname']]
        ]);

        // var_dump($MailChimp->getLastResponse());

        if ($MailChimp->success()) {
         $response['status'] = 'success';
         $response['message'] = $mailchimp['message'];
         return true;
        } else {
         $response['status'] = 'error';
         $response['message'] = $MailChimp->getLastError();
         return false;
        }
    }

    public function unSubscribe($data) {
        $response = array();
         if($this->whitelist()){
          $response['status'] = 'error';
          $response['message'] = 'Running localhost';
          return $response;
        }

        $apiKey = $this->config->get('wocmailchimp_api_key');
        $listId = $this->config->get('wocmailchimp_list_id');

        $MailChimp = new MailChimp($apiKey);
        $subscriber_hash = $MailChimp->subscriberHash($data['email']);
        $result = $MailChimp->patch("lists/$listId/members/$subscriber_hash", [
                'status'    => 'unsubscribed'
			]);
        if ($MailChimp->success()) {
         $response['status'] = 'success';
         $response['message'] = $result['message'];
        } else {
         $response['status'] = 'error';
         $response['message'] = $MailChimp->getLastError();
        }
        return $response;
    }

    public function update($data) {

        $apiKey = $this->config->get('wocmailchimp_api_key');
        $listId = $this->config->get('wocmailchimp_list_id');

        $MailChimp = new MailChimp($apiKey);
        $subscriber_hash = $MailChimp->subscriberHash($data['email']);
        $result = $MailChimp->patch("lists/$listId/members/$subscriber_hash", [
				'merge_fields' => ['FNAME'=>$data['firstname'], 'LNAME'=>$data['lastname']
                ]]);
        return $result;
    }

    public function delete($data) {
         if($this->whitelist()){
          $response['status'] = 'error';
          $response['message'] = 'Running localhost';
          return $response;
        }

        $apiKey = $this->config->get('wocmailchimp_api_key');
        $listId = $this->config->get('wocmailchimp_list_id');

        $MailChimp = new MailChimp($apiKey);
        $subscriber_hash = $MailChimp->subscriberHash($data['email']);
        $result = $MailChimp->delete("lists/$listId/members/$subscriber_hash");
        return $result;
    }

     public function whitelist() {
         $whitelist = array('127.0.0.1', '::1', 'localhost');
         // Skip for localhost testing
         if(in_array($_SERVER['REMOTE_ADDR'], $whitelist)) {
             return true;
         } else {
             return false;
         }
    }



}