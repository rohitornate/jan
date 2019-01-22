<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
            <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
            <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <!--<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />-->
        <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!--<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />-->
        <!--<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />-->
        <!--<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">-->
        <link href="stylesheets/main.css" rel="stylesheet">
        <?php foreach ($styles as $style) { ?>
            <!--<link href="<?php //echo $style['href'];  ?>" type="text/css" rel="<?php //echo $style['rel'];  ?>" media="<?php //echo $style['media'];  ?>" />-->
        <?php } ?>
        <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
        <?php foreach ($links as $link) { ?>
            <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <?php foreach ($scripts as $script) { ?>
            <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>
        <?php foreach ($analytics as $analytic) { ?>
            <?php echo $analytic; ?>
        <?php } ?>
    </head>
    <body>
        <?php if($end == 'cart' || $end == 'checkout'){ ?>
        <header class="cart-header"> <!-- header start here -->  
            <div class="clearfix container"> <!-- container  start here --> 
                <div class="logo">
                    <a href="#"><img src="images/header/logo.png"></a>
                </div>
                <div class="cart-logo">
                    <i class="my-icons-cart-shoping"></i>SHOPPING Cart
                </div>
                <div class="contact-us">
                    <small>Call us</small>
                    <?php echo $telephone; ?>
                </div>
            </div> <!-- container end here -->               
        </header> <!-- header end here --> 
        <?php }else{ ?>
        <header> <!-- header start here -->  
            <div class="top-bar"> <!--top-bar start here -->   
                <div class="container">  
                    <span class="contact-number"><a href="<?php echo $contact; ?>" class="hecall"> <i class="call my-icons-call-icon"></i> <?php echo $telephone; ?></a></span> 
                    <span class="divider"></span>
                    <span class="request-back"><a href="#request" class="inline">Request A Call Back</a></span>
                </div>  
            </div>   <!--top-bar end here -->   
            
            <div class="menu-overlay"></div>
            
            <div class="bottom-header"> <!-- bottom start here -->  
                <div class="clearfix container">

                    <!-- Start mobile menu icon -->
                    <div class="m-menu">
                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             width="25px" height="21px" viewBox="0 0 344.339 344.339" style="enable-background:new 0 0 344.339 344.339;" xml:space="preserve">
                        <g>
                        <g>
                        <rect y="46.06" width="344.339" height="29.52"/>
                        </g>
                        <g>
                        <rect y="156.506" width="344.339" height="29.52"/>
                        </g>
                        <g>
                        <rect y="268.748" width="344.339" height="29.531"/>
                        </g>
                        </g>
                        </svg>
                    </div>



                    <!-- header search start here --> 
                    <div class="logo">
                        <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>"></a>
                    </div>
                    <?php echo $search; ?>

                    <div class="login">
                        <span class="login-account"><a title="<?php echo $text_account; ?>" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></span>

                        <?php echo $cart; ?>
                    </div>
                </div> <!-- header search end here --> 
                <div class="menu" id="header"> <!-- menu start here -->  
                    <ul class="container smartmenu">
                        <?php foreach ($categories as $category) { ?>
                            <?php if ($category['children']) { ?>
                                <li>
                                    <a href="<?php echo $category['href']; ?>" class="dropdown-title"><?php echo $category['name']; ?></a>

                                    <div class="dropdown">
                                        <ul class="disflex-spbetween">
                                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>

                                                <li class="box">
                                                    <ul>
                                                        <?php foreach ($children as $child) { ?>
                                                            <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>

                                                        <?php } ?>
                                                    </ul>
                                                </li>
                                            <?php } ?>
                                            <div class="box imgbox">
                                                <a href="#"><img src="images/mega-collection.jpg" alt="collection"></a>
                                            </div>
                                        </ul>
                                        <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
                                    </div>
                                </li>
                            <?php } else { ?>
                                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                            <?php } ?>
                        <?php } ?>
                    </ul>
                </div> <!-- menu end here --> 
            </div>  <!-- bottom end here -->  
        </header> <!-- header end here --> 
        <?php } ?>