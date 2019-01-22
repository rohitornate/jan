<?php


$_REQUEST['hauth_done'] = 'Live';

require_once("system/library/hybrid/auth.php");
require_once("system/library/hybrid/endpoint.php");
Hybrid_Endpoint::process();
