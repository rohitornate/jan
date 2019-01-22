<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" href="catalog/view/javascript/xtensions/stylesheet/bs/css/bootstrap.min.css">
<?php if ($direction=='rtl'){ ?>
<link rel="stylesheet" href="catalog/view/javascript/xtensions/stylesheet/bs/css/bootstrap-rtl.min.css">
<?php } ?>
<link href="catalog/view/javascript/xtensions/stylesheet/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="catalog/view/javascript/xtensions/stylesheet/bs/js/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="screen" />
<?php } ?>
<?php if($custom_css){ ?>
<style type="text/css">
<?php echo $custom_css; ?>
</style>
<?php } ?>
<script src="catalog/view/javascript/xtensions/stylesheet/bs/js/jquery-2.1.1.min.js"></script>
<script src="catalog/view/javascript/xtensions/stylesheet/bs/js/jquery-ui.min.js"></script>
<script src="catalog/view/javascript/xtensions/stylesheet/bs/js/bootstrap.min.js"></script>
<script src="catalog/view/javascript/xtensions/stylesheet/bs/js/nprogress.js"></script>
<script src="catalog/view/javascript/xtensions/stylesheet/bs/js/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/xtensions/stylesheet/bs/js/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>

<?php if (($ga_tracking_type == 1) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged))  { ?>
<?php if (($ga_cookie == 1) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged)) { echo '<script type="text/plain" class="cc-onconsent-analytics" defer>';} else{echo '<script type="text/javascript" defer>'; } ?>
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '<?php echo 'UA-91256727-1'; ?>']);
  _gaq.push(['_setDomainName', '<?php echo $ga_domain; ?>']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);
             
  (function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  <?php if ($ga_remarketing == 1) { echo "ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';"; } else { echo "ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';"; } ?> 
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script><?php } else if
(($ga_tracking_type == 0) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged))  { ?>
<?php if (($ga_cookie == 1) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged)) { echo '<script type="text/plain" class="cc-onconsent-analytics" defer>';} else{echo '<script defer>'; } ?>

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', '<?php echo 'UA-91256727-1'; ?>', '<?php echo $ga_domain; ?>');
  <?php if ($ga_remarketing == 1) { echo "ga('require', 'displayfeatures');"; } ?> 
  ga('send', 'pageview');
</script>
<?php } ?>
<img src="image/catalog/ga.png" onload="<?php if ($ga_tracking_type == 0) { echo "ga('send', 'pageview', '/checkout');";} else{echo "_gaq.push(['_trackPageview','/checkout']);"; } ?>" />
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php //echo $analytic; ?>
<?php } ?>
</head>
<body>
<nav class="navbar">
<nav id="top" class="info-back-top">
<div class="container">

<div id="top-links" class="nav pull-right">
      <ul class="list-inline">        
        <li><?php echo $text_logged; ?></li>
      </ul>
    </div>
</div>
</nav>
<div class="container">
<div class="row">
<div class="col-md-3">
<div id="logo" class="text-center">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="https://ornate-bc57.kxcdn.com/images/logo/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive xlogo" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
</div>
</div>
<div class="col-md-6">
<div class="row bs-wizard" style="border-bottom:0;">                
<div id="step1" class="col-xs-4 bs-wizard-step disabled"> 
<div class="text-center bs-wizard-stepnum text-muted"><span id="click1"><?php echo $text_checkout_option;?><i id="undo1" style="padding-left:5px;<?php echo ($logged?'':'display:none;'); ?>" class="fa <?php echo ($logged?'fa-lock':'fa-edit'); ?>"></i></span></div>
<div class="progress"><div class="progress-bar"></div></div>
<a class="bs-wizard-dot"></a>
</div>               
<div id="step2" class="col-xs-4 bs-wizard-step disabled">
<div class="text-center bs-wizard-stepnum text-muted"><span id="click2"><?php echo $text_checkout_account;?><i id="undo2" style="padding-left:5px;display:none;" class="fa fa-edit"></i></span></div>  
<div class="progress"><div class="progress-bar"></div></div>				  
<a class="bs-wizard-dot"></a>
</div>                
<div id="step3" class="col-xs-4 bs-wizard-step disabled">
<div class="text-center bs-wizard-stepnum text-muted"><span id="click3"><?php echo $text_checkout_confirm;?></span></div>
<div class="progress"><div class="progress-bar"></div></div>
<a class="bs-wizard-dot"></a>
</div>
</div>
</div>
<div class="col-md-3 hidden-xs hidden-sm hidden-md">
<h3 style="margin-top: 10px;" class="text-right">
<small class="text-muted"><i class="fa fa-lock"></i>&nbsp;<?php echo $text_ssl_msg;?></small>
</h3>
</div>
</div>
</div>
</nav>

