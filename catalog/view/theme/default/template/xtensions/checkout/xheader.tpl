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
<link rel="stylesheet" href="catalog/view/xtensions/stylesheet/bs/css/bootstrap.min.css">
<link href="catalog/view/xtensions/stylesheet/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="catalog/view/xtensions/stylesheet/bs/js/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="screen" />
<?php } ?>
<?php if($custom_css){ ?>
<style type="text/css">
<?php echo $custom_css; ?>
</style>
<?php } ?>
<script src="catalog/view/xtensions/stylesheet/bs/js/jquery-1.11.1.min.js"></script>
<script src="//code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="catalog/view/xtensions/stylesheet/bs/js/bootstrap.min.js"></script>
<script src="catalog/view/xtensions/stylesheet/bs/js/nprogress.js"></script>
<script src="catalog/view/xtensions/stylesheet/bs/js/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/xtensions/stylesheet/bs/js/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
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
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body>
<nav class="navbar">
<nav id="top" class="info-back">
<div class="container">
<?php if (count($currencies) > 1) { ?>
<div class="pull-left">
<!--<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
  <div class="btn-group">
    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['symbol_left'] && $currency['code'] == $currency_code) { ?>
    <strong><?php echo $currency['symbol_left']; ?></strong>
    <?php } elseif ($currency['symbol_right'] && $currency['code'] == $currency_code) { ?>
    <strong><?php echo $currency['symbol_right']; ?></strong>
    <?php } ?>
    <?php } ?>
    <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_currency; ?></span> <i class="fa fa-caret-down"></i></button>
    <ul class="dropdown-menu">
      <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['symbol_left']) { ?>
      <li><button class="currency-select btn btn-link btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></button></li>
      <?php } else { ?>
      <li><button class="currency-select btn btn-link btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></button></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="currency_code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>-->
</div>
<?php } ?>
<?php if (count($languages) > 1) { ?>
<div class="pull-left">
<!--<form action="<?php echo $action_lang; ?>" method="post" enctype="multipart/form-data" id="language">
  <div class="btn-group">
    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $language_code) { ?>
    <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
    <?php } ?>
    <?php } ?>
    <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_language; ?></span> <i class="fa fa-caret-down"></i></button>
    <ul class="dropdown-menu">
      <?php foreach ($languages as $language) { ?>
      <li><a href="<?php echo $language['code']; ?>"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="language_code" value="" />
  <input type="hidden" name="redirect_language" value="<?php echo $redirect; ?>" />
</form>-->
</div>
<?php } ?>
<div id="top-links" class="nav pull-right">
      <ul class="list-inline">        
        <li><?php echo $text_logged; ?></li>        
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm"><?php echo $text_shopping_cart; ?></span></a></li>        
      </ul>
    </div>
</div>
</nav>
<div class="container">
<div class="row">
<div class="col-md-3">
<div id="logo" class="text-center">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive xlogo" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
</div>
</div>
<div class="col-md-6">
<div class="row bs-wizard" style="border-bottom:0;">                
<div id="step1" class="col-xs-4 bs-wizard-step disabled"> 
<div class="text-center bs-wizard-stepnum text-muted"><span id="click1"><?php echo $text_checkout_option;?><i id="undo1" style="padding-left:5px;<?php echo ($logged?'':'display:none;'); ?>" class="fa <?php echo ($logged?'fa-lock':'fa-edit clickable2'); ?>"></i></span></div>
<div class="progress"><div class="progress-bar"></div></div>
<a class="bs-wizard-dot"></a>
</div>               
<div id="step2" class="col-xs-4 bs-wizard-step disabled"><!-- complete -->
<div class="text-center bs-wizard-stepnum text-muted"><span id="click2"><?php echo $text_checkout_account;?><i id="undo2" style="padding-left:5px;display:none;" class="fa fa-edit clickable2"></i></span></div>  
<div class="progress"><div class="progress-bar"></div></div>				  
<a class="bs-wizard-dot"></a>
</div>                
<div id="step3" class="col-xs-4 bs-wizard-step disabled"><!-- active -->  
<div class="text-center bs-wizard-stepnum text-muted"><span id="click3"><?php echo $text_checkout_confirm;?></span></div>
<div class="progress"><div class="progress-bar"></div></div>
<a class="bs-wizard-dot"></a>
</div>
</div>
</div>
<div class="col-md-3 hidden-xs hidden-sm hidden-md">
<h3 style="margin-top: 10px;" class="text-center">
<small class="text-muted"><i class="fa fa-lock"></i>&nbsp;<?php echo $text_ssl_msg;?></small>
</h3>
</div>
</div>
</div>
</nav>