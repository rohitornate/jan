<?php



require_once("system/library/hybrid/auth.php"); 
require_once("system/library/hybrid/endpoint.php");
if (isset($_REQUEST['hauth_start']) || isset($_REQUEST['hauth_done']))
{
	
//	echo "hiiijj"; die;
    Hybrid_Endpoint::process();
}

?>