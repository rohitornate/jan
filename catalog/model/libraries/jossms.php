<?php 
class ModelLibrariesJossms extends Model {
	public function send_message($destination, $message, $gateway) {
		$this->language->load('module/jossms');
		
		if($gateway == "zenziva"){
				mb_internal_encoding("UTF-8");
		    mb_http_output("UTF-8");
				$userkey = $this->config->get('userkey');
				$passkey = $this->config->get('passkey');
				$url = $this->config->get('httpapi');
				$text = urlencode($message);
			
				$content =  'userkey='.$userkey.
					          '&passkey='.$passkey.
					          '&nohp='.$destination.
					          '&pesan='.htmlentities($text);
					
				$ch = curl_init();
			  curl_setopt($ch, CURLOPT_URL, $url);
			  curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$getresponse = curl_exec($ch);
				curl_close($ch);
				$xmldata = new SimpleXMLElement($getresponse);
				$status = $xmldata->message[0]->text;
			
		}
		elseif($gateway == "nexmo"){
				mb_internal_encoding("UTF-8");
		    mb_http_output("UTF-8");
		    
				$userkey = $this->config->get('userkey_nexmo');
				$passkey = $this->config->get('passkey_nexmo');
				$from = $this->config->get('senderid_nexmo');
				$url = $this->config->get('httpapi_nexmo');
				//$text = urlencode($message);
			
				$content =  'username='.$userkey.
					          '&password='.$passkey.
					          '&from='.$from.
					          '&to='.$destination;
					          
				if ($this->config->get('config_unicode_nexmo')) {
					$content.="&type=unicode";
					$text = urlencode($message);
				}else{
					$text = urlencode($message);
				}
				$content.="&text=".$text;
							
				$ch = curl_init();
			  curl_setopt($ch, CURLOPT_URL, $url);
			  curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
				
				$json_array = json_decode($output,true);
				if(!empty($json_array))
			 	{
			    if($json_array['messages'][0]['status'] == 0){
						$status= "Success";
					}else{
						$status= $json_array['messages'][0]['error-text'];
					}
			 	}else{
			 		$status= "";
			 	}
		}
		elseif($gateway == "amd"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_amd');
				$passkey = $this->config->get('passkey_amd');
				$from = $this->config->get('senderid_amd');
				$url = $this->config->get('httpapi_amd');
				$text = urlencode($message);
			
				$content =  'username='.$userkey.
				            '&password='.$passkey.
				            '&from='.$from.
				            '&to='.$destination.
				            '&text='.$text;
				
				$ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url);
		    curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
			
				$pos = strpos(strtoupper($output),"SUCCESS");
				if($pos !== false){
					$status = "Success";
				} else {
					$status = $output;
				}
		}
		elseif($gateway == "smsglobal"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_smsglobal');
				$passkey = $this->config->get('passkey_smsglobal');
				$from = $this->config->get('senderid_smsglobal');
				$url = $this->config->get('httpapi_smsglobal');
				$text = urlencode($message);
			
				$content =  'user='.urlencode($userkey).
				            '&password='.urlencode($passkey).
				            '&sender='.urlencode($from).
				            '&mobiles='.urlencode($destination).
				            '&message='.$text;
				
				$ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url);
		    curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
			
				$code = strpos(strtoupper($output),"CODE");
				$error = strpos(strtoupper($output),"ERROR");
				if($code === false && $error === false){
					$status = "Success";
				} else {
					$status = $output;
				}
		}
		elseif($gateway == "clickatell"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_clickatell');
				$passkey = $this->config->get('passkey_clickatell');
				$api_id = $this->config->get('apiid_clickatell');
				$from = $this->config->get('senderid_clickatell');
				$url = 'http://'.$this->config->get('httpapi_clickatell');
				
				if(!empty($from)){
					$senderid = '&from='.urlencode(mb_substr($from,0,11));
				}else{
					$senderid = '';
				}					
			
				$content =  'api_id='.$api_id.
				    				'&user='.$userkey.
				            '&password='.$passkey.
				            '&to='.$destination.
				            $senderid;
				
				if ($this->config->get('config_unicode_clickatell')) {
					$text = $this->ToUnicode($message);
					$content .= '&unicode=1&text='.$text;
				}else{
					$text = urlencode($message);
					$content .= '&unicode=0&text='.$text;
				}
				
				$ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url);
		    curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
			
				$pos = @explode(":",$output);
				if($pos[0] == "ID"){
					$status = "Success";
				} else {
					$status = $output;
				}
		}
		elseif($gateway == "liveall"){
			mb_internal_encoding("UTF-8");
			mb_http_output("UTF-8");
			$userkey = urlencode($this->config->get('userkey_liveall'));
			$passkey = urlencode($this->config->get('passkey_liveall'));
			$from = $this->config->get('senderid_liveall');
			$url = $this->config->get('httpapi_liveall');
			$text = urlencode($message);
			$ch = curl_init();
			
			curl_setopt($ch,CURLOPT_URL,  $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, "username=$userkey&password=$passkey&destination=$destination&sender=$from&message=$text");
			$output = curl_exec($ch);
			curl_close($ch);
			
			$pos = @explode(":",$output);
			if(strtoupper($pos[0]) == "OK ID"){
				$status = "Success";				
			} else {
				$status = $output;
			}
		}
		elseif($gateway == "malath"){
				mb_internal_encoding("UTF-8");
		    mb_http_output("UTF-8");
		    
				$userkey = $this->config->get('userkey_malath');
				$passkey = $this->config->get('passkey_malath');
				$from = $this->config->get('senderid_malath');
				$url = "http://".$this->config->get('httpapi_malath');
				
				$content =  'username='.$userkey.
					          '&password='.$passkey.
					          '&mobile='.$destination.
					          '&sender='.$from;
					          
				if ($this->config->get('config_unicode_malath')) {
					$UC = 'U';
					$message = $this->ToUnicode($message);
				}else{
					$UC = 'E';
				}
				
				$text = urlencode($message);
				$content.="&unicode=".$UC."&message=".$text;
							
				$ch = curl_init();
			  curl_setopt($ch, CURLOPT_URL, $url);
			  curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
				
				switch ($output) {
					case 0:
						$status = 'Success';
					break;
					case 101:
						$status = 'Parameter are missing';
					break;
					case 104:
						$status = 'either user name or password are missing or your Account is on hold';
					break;
					case 105:
						$status = 'Credit are not available';
					break;
					case 106:
						$status = 'Wrong Unicode';
					break;
					case 107:
						$status = 'Blocked sender name';
					break;
					case 108:
						$status = 'Missing sender name';
					break;
					
					default:
	  			$status = $output;
				}
		}
		elseif($gateway == "mobily"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_mobily');
				$passkey = $this->config->get('passkey_mobily');
				$from = $this->config->get('senderid_mobily');
				$url = $this->config->get('httpapi_mobily');
				$text = urlencode($message);
				
				$ch = curl_init();
				$senderID=urlencode($from);
				$msgtxt=$this->hex_chars($message);
				curl_setopt($ch, CURLOPT_URL,  $url);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_POST, 1);
				curl_setopt($ch, CURLOPT_POSTFIELDS, "mobile=$userkey&password=$passkey&numbers=$destination&sender=$senderID&msg=$msgtxt&applicationType=24");
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
				
				switch ($output) {
					case -2:
						$status = 'Not connect to server.';
					break;
					case -1:
						$status = 'Not connect to the database.';
					break;
					case 1:
						$status = 'Success';
					break;
					case 2:
						$status = 'Balance = 0.';
					break;
					case 3:
						$status = 'Balance is not enough.';
					break;
					case 4:
						$status = 'Mobile number is not available.';
					break;
					case 5:
						$status = 'wrong password.';
					break;
					case 6:
						$status = 'Web Page is not effective "Not Active", try posting again.';
					break;
					case 13:
						$status = 'The name of the sender is not acceptable.';
					break;
					case 14:
						$status = 'The name of the sender used in sending process is not defined.';
					break;
					case 15:
						$status = 'recipient value is incorrect or empty.';
					break;
					case 16:
						$status = 'The name of the sender is empty.';
					break;
					case 17:
						$status = 'The text of the message is not encrypted properly.';
					break;
					
					default:
	  			$status = $output;
				}
		}
		elseif($gateway == "msegat"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_msegat');
				$passkey = $this->config->get('passkey_msegat');
				$from = $this->config->get('senderid_msegat');
				$url = $this->config->get('httpapi_msegat');
				$text = urlencode($message);
			
				$content =  'userName='.urlencode($userkey).
				            '&userPassword='.urlencode($passkey).
				            '&userSender='.urlencode($from).
				            '&numbers='.urlencode($destination).
				            '&msg='.$text.
				            '&By=Link&msgEncoding=UTF8';
				
				$ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url);
		    curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
			
				switch ($output) {
					case 1:
						$status = 'Success';
					break;
					case 1010:
						$status = 'Variables missing';
					break;
					case 1020:
						$status = 'Invalid login info';
					break;
					case 1050:
						$status = 'MSG body is empty';
					break;
					case 1060:
						$status = 'Balance is not enough';
					break;
					case 1061:
						$status = 'MSG duplicated';
					break;
					case 1110:
						$status = 'Sender name is missing or incorrect';
					break;
					case 1120:
						$status = 'Mobile numbers is not correct';
					break;
					case 1140:
						$status = 'MSG length is too long';
					break;
					
					case "M0000":
						$status = 'Trouble in the message text';
					break;					
					case "M0001":
						$status = 'Variables missing';
					break;					
					case "M0002":
						$status = 'Invalid login info';
					break;					
					case "M0003":
						$status = 'No result found';
					break;
					case "M0004":
						$status = ' - ';
					break;
					case "M0005":
						$status = 'Same username exist';
					break;
					case "M0006":
						$status = 'Same mobile exist';
					break;
					case "M0007":
						$status = 'Failed to create user';
					break;
					case "M0008":
						$status = 'Failed to send SMS to user';
					break;
					case "M0009":
						$status = 'Registration closed';
					break;
					case "M0011":
						$status = 'Invalid mobile number';
					break;
					case "M0022":
						$status = 'Exceed number of senders allowed';
					break;
					case "M0023":
						$status = 'Sender Name is active or under activation or refused';
					break;
					case "M0024":
						$status = 'Sender Name should be in English or number';
					break;
					case "M0025":
						$status = 'Invalid Sender Name Length';
					break;
					case "M0026":
						$status = 'Sender Name is already activated or not found';
					break;
					case "M0027":
						$status = 'Activation Code is not Correct';
					break;
					case "M0028":
						$status = 'You reach maximum number of attempts. Sender name is locked';
					break;
					
					default:
	  			$status = $output;
				}
		}
		elseif($gateway == "msg91"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_msg91');
				$route = $this->config->get('route_msg91');
				$from = $this->config->get('senderid_msg91');
				$url = "https://" . $this->config->get('httpapi_msg91');
				$text = urlencode($message);
				
				$content =  'authkey='.$userkey.
										'&mobiles='.$destination.
										'&message='.$text.
				            '&sender='.urlencode($from).
				            '&route='.$route;
				
				$ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url);
		    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		    curl_setopt($ch, CURLOPT_POST, 1);
		    curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
				
				if(strlen($output)==24){
					$ch = curl_init();
					curl_setopt($ch, CURLOPT_URL, "https://control.msg91.com/api/check_delivery.php?authkey=".$userkey."&requestid=".$output."&response=json");
			    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
					curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
					$result = json_decode(curl_exec($ch), true);
					curl_close($ch);
					
					if($result['msgtype'] == "success"){
						$status = "Success";
					}else{
						$status = $result['msgtype'];
					}
				}else{
					$status = $output;
				}
		}
		elseif($gateway == "mvaayoo"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = 'shelly@ornatejewels.com';
				$passkey = 'Ornate@123';
				$from = 'ORNATE'; 
				$url = 'http://api.mVaayoo.com/mvaayooapi/MessageCompose';
				$text = urlencode($message);
				
				$ch = curl_init();
				$user=$userkey.':'.$passkey;
				$receipientno=$destination;
				$senderID=$from;
				$msgtxt=$text;
				curl_setopt($ch,CURLOPT_URL,  $url);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_POST, 1);
				curl_setopt($ch, CURLOPT_POSTFIELDS, "user=$user&senderID=$senderID&receipientno=$receipientno&msgtxt=$msgtxt");
				$output = curl_exec($ch);
				curl_close($ch);
				
				$pos = strpos(strtoupper($output),"STATUS=0");
				if($pos !== false){
					$status = "Success";
				} else {
					$status = $output;
				}
		}
		elseif($gateway == "mysms"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_mysms');
				$passkey = $this->config->get('passkey_mysms');
				$from = $this->config->get('senderid_mysms');
				$url = $this->config->get('httpapi_mysms');
				$text = rawurlencode($message);
			
				$content =  '?username='.$userkey.
				            '&password='.$passkey.
				            '&from='.$from.
				            '&to='.$destination.
				            '&message='.$text;
				
				$ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url.$content);
			  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			  curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
			
				$pos = @explode(",",$output);
				if($pos[0] == 1){
					$status = "Success";
				} else {
					switch ($pos[1]) {
						case 1:
							$status = 'Wrong username or password';
						break;
						
						case 2:
							$status = 'Trouble in the message text';
						break;
						
						case 3:
							$status = 'Trouble recipient number';
						break;
						
						case 4:
							$status = 'You do not have enough posts to your account to post a message';
						break;
						
						case 5:
							$status = 'Text exceeding 160 characters';
						break;
						
						default:
	  				$status = $output;
					}
				}
		}
		elseif($gateway == "netgsm"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_netgsm');
				$passkey = $this->config->get('passkey_netgsm');
				$from = $this->config->get('senderid_netgsm');
				$url = $this->config->get('httpapi_netgsm');
				$text = $message;
			
				$xml='<?xml version="1.0" encoding="iso-8859-9"?>
				<mainbody>
					<header>
						<company>NETGSM</company>
				    <usercode>'.$userkey.'</usercode>
				    <password>'.$passkey.'</password>
						<startdate></startdate>
						<stopdate></stopdate>
					  <type>n:n</type>
				    <msgheader>'.$from.'</msgheader>
				  </header>
					<body>
						<msg><![CDATA['.$text.']]></msg>
						<no>'.$destination.'</no>
					</body>
				</mainbody>';
				
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL,$url);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,0);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
				curl_setopt($ch, CURLOPT_HTTPHEADER, Array("Content-Type: text/xml"));
				curl_setopt($ch, CURLOPT_TIMEOUT, 30);
				curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
				$result = curl_exec($ch);
				curl_close($ch);
						
				$output = $result." Result";
				$pos = @explode(" ",$output);
				$results = $pos[0];
				
				switch($results){
					case 00:
						$status =  "Success";
					break;
					case 01:
						$status =  "There is an error on my initial message. Changed since it was processed by the system.";
					break;
					case 02:
						$status =  "Send a message terminated on the date the error was replaced with var.siste processing alindi.bitis date entered is less than the start date, end date currently in the system adds 24 hours to the date.";
					break;
					case 20:
						$status =  "Because of the problems in the text message could not be sent.";
					break;
					case 30:
						$status =  "Invalid username or password.";
					break;
					case 40:
						$status =  "Invalid message header";
					break;
					case 70:
						$status =  "Invalid XML format";
					break;
					case 90:
						$status =  "Post was not accepted by the system. Please try again later";
					break;
					case 100:
						$status =  "Call your system administrator System Error has occured.";
					break;
					default:
	  				$status = $output;
				}
		}
		elseif($gateway == "oneway"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_oneway');
				$passkey = $this->config->get('passkey_oneway');
				$from = $this->config->get('senderid_oneway');
				$url = $this->config->get('httpapi_oneway');
				$text = urlencode($message);
			
				$content =  '?apiusername='.$userkey.
				            '&apipassword='.$passkey.
				            '&senderid='.$from.
				            '&mobileno='.$destination.
				            '&message='.$text.
				            '&languagetype=1';
				
				$ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url.$content);
		    //curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
			
				$result = $output;
				if($result > 0){
					$status = "Success";
				} else {
					//$status = $output;
					switch($result){
						case -100:
							$status = "apipassname or apipassword is invalid";
						break;
						case -200:
							$status = "senderid parameter is invalid";
						break;
						case -300:
							$status = "mobileno parameter is invalid";
						break;
						case -400:
							$status = "languagetype is invalid";
						break;
						case -500:
							$status = "Invalid characters in message";
						break;
						case -600:
							$status = "Insufficient credit balance";
						break;
						
						default:
						$status = $output;
					}
				}
		}
		elseif($gateway == "openhouse"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	      
	      $key = $this->config->get('userkey_openhouse');
				$senderAddress = $this->config->get('passkey_openhouse');
				$message = $message;
				$sendername = $this->config->get('senderid_openhouse');
				
				$nonya = "";
				$no = $destination;
				$nohps = explode(',', $no);
				foreach ($nohps as $nohp) {
									if ($nohp) {
										$nonya .= "\"tel:" . $nohp . "\",";
									}
				}
				$dest = str_replace(" ","",substr($nonya, 0, -1));
				
				$url = "http://api-openhouse.imimobile.com/smsmessaging/1/outbound/tel%3A%2B$senderAddress/requests";
				$rawdata="{\"outboundSMSMessageRequest\":{".
				"\"address\":[$dest],".
				"\"senderAddress\":\"tel:$senderAddress\",".
				"\"outboundSMSTextMessage\":{\"message\":\"$message\"},".
				"\"clientCorrelator\":\"\",".
				"\"senderName\":\"$sendername\"}".
				"}";
				$ch = curl_init($url);
				curl_setopt($ch, CURLOPT_POST, 1);
				curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json','key: '.$key));
				curl_setopt($ch, CURLOPT_POSTFIELDS, $rawdata);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				$response = curl_exec($ch);
				curl_close($ch);
				
				$pos = strpos(strtoupper($response),"REQUESTERROR");
				if($pos){
					$json_array = json_decode($response,true);
					$status = $json_array['response']['requestError']['policyException']['text'];
				} else {
					$status = "Success";
				}
		}
		elseif($gateway == "redsms"){
				mb_internal_encoding("UTF-8");
		    mb_http_output("UTF-8");
		    
				$userkey = 'nationkart';
				$passkey = 'yash569';
				$from = 'NATKRT';
				$url = 'http://login.redsms.in/API/SendMessage.ashx';
				$text = urlencode($message);
				
				if (substr($destination, 0, 2) == '91') {
					$destination = substr($destination, 2, strlen($destination));
				}else{
					$destination = $destination;
				}
			
				$content =  '?user='.$userkey.
					          '&password='.$passkey.
					          '&senderid='.$from.
					          '&phone='.$destination.
					          '&text='.$text.
					          '&type=t';
							
				$ch = curl_init();
			  curl_setopt($ch, CURLOPT_URL, $url.$content);
			  //curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
				
				//$pos = explode(".",$output);
				if($output == "Sent"){
					$status = "Success";
				} else {
					$status = $output;
				}
		}
		elseif($gateway == "routesms"){
				mb_internal_encoding("UTF-8");
		    mb_http_output("UTF-8");
		    
				$userkey = $this->config->get('userkey_routesms');
				$passkey = $this->config->get('passkey_routesms');
				$from = $this->config->get('senderid_routesms');
				$url = $this->config->get('httpapi_routesms');
				$text = urlencode($message);
				
				if (substr($destination, 0, 2) == '91') {
					$destination = substr($destination, 2, strlen($destination));
				}else{
					$destination = $destination;
				}
			
				$content =  '?username='.$userkey.
					          '&password='.$passkey.
					          '&source='.$from.
					          '&destination='.$destination.
					          '&message='.$text.
					          '&type=0';
							
				$ch = curl_init();
			  curl_setopt($ch, CURLOPT_URL, $url.$content);
			  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
				
				$data = explode('|',$output);
				$result = $data[0];
				
				if($result == 1701){
					$status = "Success";
				} else {
					switch($result){
						case 1702:
							$status = "Invalid URL error";
						break;
						case 1703:
							$status = "Invalid value in username or password field";
						break;
						case 1704:
							$status = "Invalid value in type field";
						break;
						case 1705:
							$status = "Invalid Message";
						break;
						case 1706:
							$status = "Invalid Destination";
						break;
						case 1707:
							$status = "Invalid Source (Sender ID)";
						break;
						case 1708:
							$status = "Invalid value for dlr field";
						break;
						case 1709:
							$status = "User Validation failed";
						break;
						case 1710:
							$status = "Internal error";
						break;
						case 1025:
							$status = "Insufficient Credit";
						break;
						case 1715:
							$status = "Response timeout";
						break;
						
						default:
						$status = $output;
					}
				}
		}
		elseif($gateway == "smsgatewayhub"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_smsgatewayhub');
				$passkey = $this->config->get('passkey_smsgatewayhub');
				$from = $this->config->get('senderid_smsgatewayhub');
				$url = $this->config->get('httpapi_smsgatewayhub');
				$text = urlencode($message);
			
				$content =  '?user='.$userkey.
				            '&pwd='.$passkey.
				            '&sid='.$from.
				            '&to='.$destination.
				            '&msg='.$text.
				            '&fl=0&gwid=2';
				
				$ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url.$content);
			  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			  curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
			
				$pos = @explode(":",$output);
				if(count($pos) > 1){
					$status = "Success";
				}else{
					$status = $output;
				}
		}
		elseif($gateway == "smslane"){
				mb_internal_encoding("UTF-8");
		    mb_http_output("UTF-8");
		    
				$userkey = $this->config->get('userkey_smslane');
				$passkey = $this->config->get('passkey_smslane');
				$from = $this->config->get('senderid_smslane');
				$url = $this->config->get('httpapi_smslane');				
				
				$content =  'user='.$userkey. '&password='.$passkey. '&msisdn='.$destination. '&sid='.$from. '&fl=0&type=LongSMS';
				
				if ($this->config->get('config_unicode_smslaneg')) {
					$content.="&binary=1";
					$text = $this->hex_chars($message);
				}else{
					$text = urlencode($message);
				}
				$content.="&msg=".$text;
				
				//$text = urlencode($message);
							
				$ch = curl_init();
			  curl_setopt($ch, CURLOPT_URL, $url);
			  curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
				
				// Response: 919898123456-200612295008123
				$failed = strpos(strtoupper($output),"FAILED");
				$error = strpos(strtoupper($output),"ERROR");
				if($failed === false && $error === false){
					$status = "Success";
				} else {
					$status = $output;
				}
		}
		elseif($gateway == "smslaneg"){
				mb_internal_encoding("UTF-8");
		    mb_http_output("UTF-8");
		    
				$userkey = $this->config->get('userkey_smslaneg');
				$passkey = $this->config->get('passkey_smslaneg');
				$from = $this->config->get('senderid_smslaneg');
				$url = $this->config->get('httpapi_smslaneg');				
				
				$content =  'user='.$userkey. '&password='.$passkey. '&msisdn='.$destination. '&sid='.$from. '&fl=0&type=LongSMS';
				
				if ($this->config->get('config_unicode_smslaneg')) {
					$content.="&binary=1";
					$text = $this->hex_chars($message);
				}else{
					$text = urlencode($message);
				}
				$content.="&msg=".$text;
				
				//$text = urlencode($message);
							
				$ch = curl_init();
			  curl_setopt($ch, CURLOPT_URL, $url);
			  curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
				
				// Response: 919898123456-200612295008123
				$failed = strpos(strtoupper($output),"FAILED");
				$error = strpos(strtoupper($output),"ERROR");
				if($failed === false && $error === false){
					$status = "Success";
				} else {
					$status = $output;
				}
		}
		elseif($gateway == "topsms"){
				mb_internal_encoding("UTF-8");
		    mb_http_output("UTF-8");
		    
				$userkey = $this->config->get('userkey_topsms');
				$passkey = $this->config->get('passkey_topsms');
				$from = $this->config->get('senderid_topsms');
				$url = $this->config->get('httpapi_topsms');
				$text = urlencode($message);
				
				if ($this->config->get('config_lang_topsms'))
				$lang = '&lang=ar';
				else
				$lang = '&lang=en';
			
				$content =  '?user='.$userkey.
					          '&password='.$passkey.
					          '&sender='.$from.
					          '&numbers='.$destination.
					          '&message='.$text.$lang;
							
				$ch = curl_init();
			  curl_setopt($ch, CURLOPT_URL, $url.$content);
			  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
				
				$data = explode(':',$output);
				$result = $data[0];
				
				if($result == 1)
					$status = "Success";
				else
					$status = $output;
		}
		elseif($gateway == "velti"){
				mb_internal_encoding("UTF-8");
	      mb_http_output("UTF-8");
	        	
				$userkey = $this->config->get('userkey_velti');
				$passkey = $this->config->get('passkey_velti');
				$url = $this->config->get('httpapi_velti');
				$text = urlencode($message);
			
				$content =  'aid='.$userkey.
				            '&pin='.$passkey.
				            '&mnumber='.$destination.
				            '&message='.$text;
				
				$ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url);
		    curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
				$output = curl_exec($ch);
				curl_close($ch);
			
				$pos = strpos(strtoupper($output),"ACCEPTED");
				if($pos !== false){
					$status = "Success";
				} else {
					$status = $output;
				}
		}else{
				$status = $this->language->get('error_gateway_null');
		}
		
		return $status;
	}
	
	public function getConvertPhonePrefix($phone, $iso_code) {
		$prefix = $this->config->get($iso_code);
		$isprefix = substr($phone,0,strlen($prefix));
		
		if(!empty($prefix)){
			if (substr($phone, 0, 2) == '00') {
				return $prefix.substr($phone, 2, strlen($phone));
			}else
			if (substr($phone, 0, 1) == '0') {
				return $prefix.substr($phone, 1, strlen($phone));
			}else
			if (substr($phone, 0, 1) == '+') {
				return substr($phone, 1, strlen($phone));
			}else{
				if($prefix != $isprefix){
					return $prefix.$phone;
				}else{
					return $phone;
				}
			}
		}else{
			return $phone;
		}
	}
	
	public function hex_chars($data) {
  	$mb_hex = '';
    for ($i = 0; $i < mb_strlen($data, 'UTF-8'); $i++) {
      $c = mb_substr($data, $i, 1, 'UTF-8');
      $o = unpack('N', mb_convert_encoding($c, 'UCS-4BE', 'UTF-8'));
      $mb_hex .= sprintf('%04X', $o[1]);
    }
    return $mb_hex;
  }
  
  public function ToUnicode($Text) {

		$Backslash = "\ ";
		$Backslash = trim($Backslash);

		$UniCode = Array
		(
		    "¡" => "060C",
		    "º" => "061B",
		    "¿" => "061F",
		    "Á" => "0621",
		    "Â" => "0622",
		    "Ã" => "0623",
		    "Ä" => "0624",
		    "Å" => "0625",
		    "Æ" => "0626",
		    "Ç" => "0627",
		    "È" => "0628",
		    "É" => "0629",
		    "Ê" => "062A",
		    "Ë" => "062B",
		    "Ì" => "062C",
		    "Í" => "062D",
		    "Î" => "062E",
		    "Ï" => "062F",
		    "Ð" => "0630",
		    "Ñ" => "0631",
		    "Ò" => "0632",
		    "Ó" => "0633",
		    "Ô" => "0634",
		    "Õ" => "0635",
		    "Ö" => "0636",
		    "Ø" => "0637",
		    "Ù" => "0638",
		    "Ú" => "0639",
		    "Û" => "063A",
		    "Ý" => "0641",
		    "Þ" => "0642",
		    "ß" => "0643",
		    "á" => "0644",
		    "ã" => "0645",
		    "ä" => "0646",
		    "å" => "0647",
		    "æ" => "0648",
		    "ì" => "0649",
		    "í" => "064A",
		    "Ü" => "0640",
		    "ð" => "064B",
		    "ñ" => "064C",
		    "ò" => "064D",
		    "ó" => "064E",
		    "õ" => "064F",
		    "ö" => "0650",
		    "ø" => "0651",
		    "ú" => "0652",
		    "!" => "0021",
		    '"' => "0022",
		    "#" => "0023",
		    "$" => "0024",
		    "%" => "0025",
		    "&" => "0026",
		    "'" => "0027",
		    "(" => "0028",
		    ")" => "0029",
		    "*" => "002A",
		    "+" => "002B",
		    "," => "002C",
		    "-" => "002D",
		    "." => "002E",
		    "/" => "002F",
		    "0" => "0030",
		    "1" => "0031",
		    "2" => "0032",
		    "3" => "0033",
		    "4" => "0034",
		    "5" => "0035",
		    "6" => "0036",
		    "7" => "0037",
		    "8" => "0038",
		    "9" => "0039",
		    ":" => "003A",
		    ";" => "003B",
		    "<" => "003C",
		    "=" => "003D",
		    ">" => "003E",
		    "?" => "003F",
		    "@" => "0040",
		    "A" => "0041",
		    "B" => "0042",
		    "C" => "0043",
		    "D" => "0044",
		    "E" => "0045",
		    "F" => "0046",
		    "G" => "0047",
		    "H" => "0048",
		    "I" => "0049",
		    "J" => "004A",
		    "K" => "004B",
		    "L" => "004C",
		    "M" => "004D",
		    "N" => "004E",
		    "O" => "004F",
		    "P" => "0050",
		    "Q" => "0051",
		    "R" => "0052",
		    "S" => "0053",
		    "T" => "0054",
		    "U" => "0055",
		    "V" => "0056",
		    "W" => "0057",
		    "X" => "0058",
		    "Y" => "0059",
		    "Z" => "005A",
		    "[" => "005B",
		    $Backslash => "005C",
		    "]" => "005D",
		    "^" => "005E",
		    "_" => "005F",
		    "`" => "0060",
		    "a" => "0061",
		    "b" => "0062",
		    "c" => "0063",
		    "d" => "0064",
		    "e" => "0065",
		    "f" => "0066",
		    "g" => "0067",
		    "h" => "0068",
		    "i" => "0069",
		    "j" => "006A",
		    "k" => "006B",
		    "l" => "006C",
		    "m" => "006D",
		    "n" => "006E",
		    "o" => "006F",
		    "p" => "0070",
		    "q" => "0071",
		    "r" => "0072",
		    "s" => "0073",
		    "t" => "0074",
		    "u" => "0075",
		    "v" => "0076",
		    "w" => "0077",
		    "x" => "0078",
		    "y" => "0079",
		    "z" => "007A",
		    "{" => "007B",
		    "|" => "007C",
		    "}" => "007D",
		    "~" => "007E",
		    "©" => "00A9",
		    "®" => "00AE",
		    "÷" => "00F7",
		    "×" => "00F7",
		    "§" => "00A7",
		    " " => "0020",
		    "\n" => "000D",
			"\r" => "000A",
		    "\t" => "0009",
		    "é" => "00E9",
		    "ç" => "00E7",
		    "à" => "00E0",
		    "ù" => "00F9",
		    "µ" => "00B5",
		    "è" => "00E8"
		);

		$Result="";
		$StrLen = strlen($Text);
		for($i=0;$i<$StrLen;$i++){

			$currect_char = substr($Text,$i,1);

			if(array_key_exists($currect_char,$UniCode)){
				$Result .= $UniCode[$currect_char];
			}

		}

	 	return $Result;

	}
	
}
?>