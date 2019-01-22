<?php
//session_start();

//Include Google client library 
include_once 'src/Google_Client.php';
include_once 'src/contrib/Google_Oauth2Service.php';

/*
 * Configuration and setup Google API
 */
$clientId = '139512480027-qk5vepj8bjb60r8nu2s0qa4mdums8sc4.apps.googleusercontent.com'; //Google client ID
$clientSecret = 'fCdeg8Sc67N1cHq-K0grZLkD'; //Google client secret
$redirectURL = 'https://www.ornatejewels.com/index.php?route=account/login'; //Callback URL

//Call Google API
$gClient = new Google_Client();
$gClient->setApplicationName('Ornate Jewels');
$gClient->setClientId($clientId);
$gClient->setClientSecret($clientSecret);
$gClient->setRedirectUri($redirectURL);

$google_oauthV2 = new Google_Oauth2Service($gClient);
?>
