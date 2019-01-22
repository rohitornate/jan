
<div class="whatsapp-container"></div>
<script type="text/javascript">
$(".whatsapp-container").load("index.php?route=extension/module/whatsapp/getindex&product_id=<?php echo $product_id; ?>");
$( document ).ready(function() {
    var url='whatsapp://send?text='+'<?php echo $moduleData["content"][$language_id] . " ";?>'+encodeURIComponent('<?php echo $_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"]; ?>');
	$("#whatsapp-bth").prop("href",url);
});
</script>
<?php
if (!function_exists('ismobile')) {
       function ismobile() {
        $is_mobile = '0';

        if(preg_match('/(android|up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone)/i', strtolower($_SERVER['HTTP_USER_AGENT']))) {
            $is_mobile=1;
        }

        if(0<(strpos(strtolower($_SERVER['HTTP_ACCEPT']),'application/vnd.wap.xhtml+xml') ) or ((isset($_SERVER['HTTP_X_WAP_PROFILE']) or isset($_SERVER['HTTP_PROFILE'])))) {
            $is_mobile=1;
        }

        $mobile_ua = strtolower(substr($_SERVER['HTTP_USER_AGENT'],0,4));
        $mobile_agents = array('w3c ','acs-','alav','alca','amoi','andr','audi','avan','benq','bird','blac','blaz','brew','cell','cldc','cmd-','dang','doco','eric','hipt','inno','ipaq','java','jigs','kddi','keji','leno','lg-c','lg-d','lg-g','lge-','maui','maxo','midp','mits','mmef','mobi','mot-','moto','mwbp','nec-','newt','noki','oper','palm','pana','pant','phil','play','port','prox','qwap','sage','sams','sany','sch-','sec-','send','seri','sgh-','shar','sie-','siem','smal','smar','sony','sph-','symb','t-mo','teli','tim-','tosh','tsm-','upg1','upsi','vk-v','voda','wap-','wapa','wapi','wapp','wapr','webc','winw','winw','xda','xda-');

        if(in_array($mobile_ua,$mobile_agents)) {
            $is_mobile=1;
        }

        if (isset($_SERVER['ALL_HTTP'])) {
            if (strpos(0<strtolower($_SERVER['ALL_HTTP']),'OperaMini')) {
                $is_mobile=1;
            }
        }

        if (strpos(0<strtolower($_SERVER['HTTP_USER_AGENT']),'windows')) {
            $is_mobile=0;
        }

        return $is_mobile;
}
   
}

if (ismobile()==1){?>
   <a id="whatsapp-bth"><img src="<?php echo HTTP_SERVER.$whatsapp_image; ?>" height="<?php echo $moduleData['ImageHeight']?>" width="<?php echo $moduleData['ImageWidth'] ?>" ></a>
       <?php } ?>