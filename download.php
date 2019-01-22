<?php 
	if((isset($_GET['file']) && isset($_GET['path'])) && ($_GET['file'] == 'opencart_mod_feed.csv')) {
		$file = $_GET['path'].$_GET['file']; 
	    $name = $_GET['file']; 

	    header ("Content-Type: application/octet-stream"); 
	    header ("Accept-Ranges: bytes"); 
	    header ("Content-Length: ".filesize($file)); 
	    header ("Content-Disposition: attachment; filename=".$name); 
	    readfile($file); 
	} else {
		header("Location: /");
	}