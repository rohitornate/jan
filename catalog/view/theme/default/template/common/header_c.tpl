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
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" /> -->
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<script src="catalog/view/javascript/brainyfilter.js" type="text/javascript"></script>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>


 <script src="catalog/view/javascript/all.js" type="text/javascript" defer="defer" ></script>
 <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"  defer></script>
 <script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js"   defer></script>
 <link href="stylesheets/main.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/header_c.css">




<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>


<?php }?>
<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false): ?>
 <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript" ></script>
 <?php endif; ?>
<script type="text/javascript">
  document.addEventListener("touchstart", function(){}, true);
</script>
<style>
.box h2
{
  color:#000;
  font-size:15px;
  text-decoration:underline;
  padding-bottom:5px;
}
#topsearch{
  display:none;
}
</style>
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
<script>
//alert(<?php echo $time; ?>);

var countDownDate = new Date("July 31, 2018 00:00:00").getTime();
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
   var distance = countDownDate - now;
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
   
     document.getElementById("time_h_59593").innerHTML = hours  ;
      document.getElementById("time_s_59593").innerHTML = minutes  ;
       document.getElementById("time_m_59593").innerHTML = seconds  ;
     document.getElementById("time_h").innerHTML = hours  ;
      document.getElementById("time_s").innerHTML = minutes  ;
       document.getElementById("time_m").innerHTML = seconds  ;
      
    if (distance < 0) {
        clearInterval(x);
       var x = document.getElementById("divcountdowntime_59593");
            var y = document.getElementById("divcountdowntime_m");
       x.style.display = "none";
       y.style.display = "none";
    }
}, 1000);
</script>
<script type="text/javascript">
  
$(document).ready(function(){
    $("#formButton").click(function(){
        $("#topsearch").toggle();
    });
});
</script>


   


</head>
<body>
<?php if($end == 'cart' || $end == 'checkout'){ ?>
        <header class="cart-header"> 
            <div class="clearfix container">
                <div class="logo">
                    <a href="<?php echo $base; ?>"><img src="https://ornate-bc57.kxcdn.com/image/logo.png"></a>
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
            <div class="top-bar">    
                <a href="all-under-999" ><div class="container">
                  <div class="toptext" style="letter-spacing:2px;">999 Deals You Can't Miss</div>
<div id="divcountdowntime_59593" class="header-time">
                
              <span class="j-hour" id="time_h_59593" style="color:#000000;"></span>
              <strong class="timerspecification">H</strong>
              <span class="j-sec" id="time_s_59593" style="color:#000000;"></span>
              <strong class="timerspecification ">M</strong>
              <span class="j-min" id="time_m_59593" style="color:#000000;"></span>
              <strong class="timerspecification">S</strong></div>   
    </div>  </a>
            </div>  
 <div class="m-top-bar" >    
               <a href="all-under-999" > <div class="container">
                  <div class="toptext"> 999 Store</div>
                  

              <div id="divcountdowntime_m" class="header-time">
                
              <span class="timerspecification" id="time_h" style="color:#000000;"></span>
              <strong class="timerspecification">H</strong>
              <span class="timerspecification" id="time_s" style="color:#000000;"></span>
              <strong class="timerspecification ">M</strong>
              <span class="timerspecification" id="time_m" style="color:#000000;"></span>
              <strong class="timerspecification">S</strong></div>     
    
                  
                </div>  </a>
            </div>  
<div class="menu-overlay"></div>
<div class="bottom-header" id="myHeader"> <!-- bottom start here -->  
<div class="clearfix container">
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
 


 
<div class="logo">
<a href="<?php echo $base; ?>"><img src="https://ornate-bc57.kxcdn.com/image/logo.png" alt="Silver Jewellery"></a>
</div>
<div class="right-links">
  <ul class="m-sign">
        
        <li>
         <?php if ($logged) { ?>
            
              <a href="<?php echo $account; ?>">My Account </a>
            
            <?php } else { ?>
            
            <a href="<?php echo $login; ?>">Sign in/Register</a>
            <?php } ?>
           
        </li>
      
      </ul>
      <ul>
      <li class="account">
          <a href="wishlist"><img src="https://ornate-bc57.kxcdn.com/images/account.png" alt="" id="account-image"></a>
      </li>
          <li>
          <a  id="formButton"><img src="https://ornate-bc57.kxcdn.com/images/search-icon-2.png" alt=""></a>
          
   <input id="topsearch" type="text" name="search" placeholder="What would you like to see?">
      </li>

      <li>
        <?php echo $cart; ?>
  </li>
    </ul>
</div>
</div> <!-- header search end here --> 
<div class="menu" id="header"> 
<ul class="container smartmenu sm-js-0 sm-full-width sm-response-margin sm-response-switch">
  
  <?php foreach ($categories as $category) {  //print_r($category);?>
  
  <?php if ($category['children']) { ?>
    <li class=""><a href="<?php echo $category['href']; ?>" class="dropdown-title"><?php echo $category['name']; ?></a><div class="dropdown boostKeyframe" style="animation: none;">
    
    <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
      <ul class="disflex-spbetween">
        <li class="box">
        
          <ul>
              <?php foreach ($children as $child) { ?>
            <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
           
            <?php } ?>
          </ul>
        </li>
      <?php } ?>
      <div class="box">
        <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image'];?>" alt="collection"></a>
      </div>
</ul><a href="<?php echo $category['href']; ?>" class="see-all">Show All <?php echo $category['name']; ?></a></div>
    </li>
  <?php } else { ?><li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
<?php } ?> 
<?php } ?>
</ul>
</div> </div>  </header>
<?php } ?>

