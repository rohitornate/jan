<?php  
define('NWA_CLI', 'working');
$_GET['route'] = 'extension/module/notifywhenavailable/sendMails';
if (isset($argv[1])) {
	$_POST['store_id'] =  $argv[1];
} else {
	$_POST['store_id'] =  0;
}
$folder = dirname(dirname(dirname(__FILE__)));
chdir($folder);
require_once('index.php');
