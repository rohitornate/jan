<?php

//live database
$live = mysql_connect("localhost", "root", "");
mysql_select_db("ornatelive", $live);
//local database
$local = mysql_connect("localhost", "root", "", true);
mysql_select_db("opencartlatest", $local);
$dbnamelive = "ornatelive";
$dbnamelocal = "opencartlatest";
$alltac = mysql_query("SHOW TABLES FROM $dbnamelive");
$alllat = mysql_query("SHOW TABLES FROM $dbnamelocal");
$ttlive = array();

//while ($rlocal = mysql_fetch_assoc($alllat)) {
//    $ttlocal[] = $rlocal['Tables_in_opencartlatest'];
//}
//while ($rlive = mysql_fetch_assoc($alltac)) {
//
//
//    if (in_array($rlive['Tables_in_ornatelive'], $ttlocal)) {
//        $final_table[] = $rlive['Tables_in_ornatelive'];
//    }
//}
//
//foreach ($final_table as $table) {
//if($table!='oc_product' || $table!='oc_product_option' || $table!='oc_product_option_value' || $table!='oc_option'
//         || $table!='oc_option_value' || $table!='oc_option_value_description' || $table!='oc_option_description'){
$table = "oc_customer_online";
    $sql = mysql_query("SHOW COLUMNS from $table", $live);
    $sql_lo = mysql_query("SHOW COLUMNS from $table", $local);
    $sql2 = mysql_query("select * from $table", $live);
    while ($rlo = mysql_fetch_assoc($sql_lo)) {

        $arrlo[] = $rlo['Field'];
    }
$final=array();
    while ($r = mysql_fetch_assoc($sql)) {

        $arr[] = $r['Field'];
        if (in_array($r['Field'], $arrlo)) {
            $final[] = $r['Field'];
        }
    }


    $ttt = '';
    $i = 0;
    while ($r2 = mysql_fetch_assoc($sql2)) {
        $tt = '';

        foreach ($final as $a) {
          
            if ($a == 'cart' || $a == 'wishlist') {
                $tt[] = $a . ' = ""';
            } else {
                $tt[] = $a . ' ="' . $r2[$a] . '"';
            } 
        } 
        $ttt = implode(",", $tt);
        //echo $ttt; 
//echo $i; echo '<br>'; echo "insert into $table set $ttt "; 
  mysql_query("insert into $table set $ttt ", $local);
        $i++;
    }

//}
//}
?>
