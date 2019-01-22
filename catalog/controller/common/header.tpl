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
				<meta name="author" content="https://www.ornatejewels.com" />
<meta name="Language" content="English"/>
<meta property="og:site" content="https://www.ornatejewels.com"/>
<meta property="og:title" content="<?php echo $title; ?>"/>
<meta property="og:url" content="https://www.ornatejewels.com">
<meta property="og:image" content="<?php echo $logo1; ?>">
<meta property="og:type" content="website"/>
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="https://www.ornatejewels.com" />
<meta name="twitter:title" content="<?php echo $title; ?>" />
<meta name="twitter:description" content="Silver Jewellery Online in India. Buy Gold Plated and Sterling Silver Jewellery available Online for shopping in India at low price with guarantee." />
<meta name="twitter:image" content="image/catalog/logo.png" />
<meta name="msvalidate.01" content="910FCC18B5A1AA1331071B125BCC856C" />
<?php if ($description) { ?>
<meta property="og:description" content="<?php echo $description; ?>"/>
<?php } ?>
<META NAME="ROBOTS" CONTENT="<?php echo $follow?>">
 <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"  defer></script>
   <script src="catalog/view/javascript/all.js" type="text/javascript" defer="defer" ></script>
<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false): ?>
	     
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js"   defer></script>
<?php endif; ?>
<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false){ ?>
<link href="stylesheets/main.css" rel="stylesheet">
<!--<link href="stylesheets/custom.css" rel="stylesheet">-->
<link href="stylesheets/responsive.css" rel="stylesheet">

<!-- 
<link rel="stylesheet" href="stylesheets/w3.css">
 -->
<!-- <style>
@import url('https://fonts.googleapis.com/css?family=Lato');
</style> -->


<?php }else{ ?>

<?php }?>
<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false): ?>
 <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript" ></script>
 <?php endif; ?>
 <link rel="alternate" href="https://www.ornatejewels.com" hreflang="en-in" />

<!--<link href="stylesheets/main.css" rel="stylesheet">-->
        <?php foreach ($styles as $style) {?>
            <!--<link href="<?php //echo $style['href'];  ?>" type="text/css" rel="<?php //echo $style['rel'];  ?>" media="<?php //echo $style['media'];  ?>" />-->
        <?php } ?>
        <?php foreach ($links as $link) { ?>
            <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
      <!--  <?php foreach ($scripts as $script) { ?>
            <script src="<?php echo $script; ?>" type="text/javascript" ></script>
        <?php } ?>-->
	<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false): ?>

      <!--  <?php foreach ($analytics as $analytic) { ?>
            <?php echo $analytic; ?>
        <?php } ?>-->
        <?php endif; ?>
		
		<script defer>
function loadjscssfile(e,t){if("js"==t){var s=document.createElement("script");s.setAttribute("type","text/javascript"),s.setAttribute("src",e)}else if("css"==t){var s=document.createElement("link");s.setAttribute("rel","stylesheet"),s.setAttribute("type","text/css"),s.setAttribute("href",e)}"undefined"!=typeof s&&document.getElementsByTagName("head")[0].appendChild(s)}
</script>
<script type='application/ld+json'>
{
"@context": "http://www.schema.org",
"@type": "Organization",
"name": "Designer Silver Jewelry | Ornate Jewels",
"url": "https://www.ornatejewels.com",
"logo": "https://www.ornatejewels.com/image/catalog/logo.png",
"image": "https://www.ornatejewels.com/images/dscn0002-11.webp",
"description": "Silver jewellery online. Buy Sterling Silver Jewellery, Rings, Earrings, Bracelets, Necklaces, Pendants at Best Prices.",
"aggregateRating": {
"@type": "AggregateRating",
"ratingValue": "9.5",
"bestRating": "10",
"worstRating": "1",
"ratingCount": "4257"
},
"sameAs" : [ " https://www.facebook.com/ornatejewelscom",
"https://twitter.com/ornatejewelscom",
"https://plus.google.com/102333590500856537008",
"https://www.instagram.com/ornatejewels",
"https://in.pinterest.com/ornatejewels/"
],
"contactPoint": {
"@type": "ContactPoint",
"telephone": "+91 860 0718666",
"contactType": "customer support"
}
}
</script>
    <link rel="dns-prefetch" href="https://www.google-analytics.com"/>
	 <link rel="dns-prefetch" href="https://www.ornatejewels.com"/>
	<link rel="dns-prefetch" href="https://cdn.onesignal.com"/>
	<link rel="dns-prefetch" href="https://www.facebook.com"/>
	<link rel="dns-prefetch" href="www.googleadservices.com/pagead/conversion.js"/>
	
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
</style>

</head>
<body>
        <?php if($end == 'cart' || $end == 'checkout'){ ?>
        <header class="cart-header"> 
            <div class="clearfix container">
                <div class="logo">
                    <a href="<?php echo $base; ?>"><img src="images/header/logo.png"></a>
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
                <div class="container"><span class="toptext">Pay Online Get Extra 5% Off + Free Shipping</span>   <!--<marquee style="color:red;">We wiil not able to Ship on 25th December on Account of Merry Christmas</marquee>-->
                    <span class="contact-number">
						<div id="divcountdowntime_59593" class="header-time">
							<span class="j-hour" id="time_h_59593" style="color:#000000;background-color:#undefined">05</span>
							<strong style="color:#ffffff; margin-right: 15px; vertical-align: middle; font-size: 30px;">H</strong>
							<span class="j-sec" id="time_s_59593" style="color:#000000;background-color:#undefined">59</span>
							<strong style="color:#ffffff; margin-right: 15px; vertical-align: middle; font-size: 30px;">M</strong>
							<span class="j-min" id="time_m_59593" style="color:#000000;background-color:#undefined">13</span>
							<strong style="color:#ffffff; margin-right: 15px; vertical-align: middle; font-size: 30px;">S</strong></div>				
					</span> 
                  
                </div>  
            </div>   <!--top-bar end here -->   
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
<a href="<?php echo $base; ?>"><img src="<?php echo $logo; ?>" alt="Silver Jewellery"></a>
</div>
<div class="right-links">
	<ul class="m-sign">
        
        <li>
            <a href="#">Sign in/Register &#9662;</a>
            <ul class="dropdown">
                <li><a href="#">Laptops</a></li>
                <li><a href="#">Monitors</a></li>
                <li><a href="#">Printers</a></li>
            </ul>
        </li>
       <li>
            <a href="#">Online Help &#9662;</a>
            <ul class="dropdown">
                <li><a href="#">Laptops</a></li>
                <li><a href="#">Monitors</a></li>
                <li><a href="#">Printers</a></li>
            </ul>
        </li>
      </ul>
      <ul>
        <li>
         	<a href="#"><img src="images/search-icon-2.png" alt=""></a>
  		</li>
  		<li>
         	<a href="#"><img src="images/hearts.png" alt=""></a>
  		</li>
  		<li>
		<?php if($ct!=0) { ?>
          
		  <span class="p1 fa-stack fa-2x has-badge" data-count="<?php echo $ct; ?>">  <?php } ?>
         	<a href="cart"><img src="images/shopping-bags.png" alt=""></a>
  		</li>
    </ul>
</div>

<!-- <div class="login">
 <span class="login-account"><a title="<?php echo $text_account; ?>" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></span>
<?php //echo $cart; ?>
 </div> -->
</div> <!-- header search end here --> 
<div class="menu" id="header"> <!-- menu start here -->  
<!--<ul class="container smartmenu">
<?php foreach ($categories as $category) {  //print_r($category);?>

<?php if ($category['children']) { ?>
<li><a href="<?php echo $category['href']; ?>" class="dropdown-title"><?php echo $category['name']; ?></a>
<div class="dropdown"><ul class="disflex-spbetween"><?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
<li class="box"><ul>
<?php foreach ($children as $child) { ?>
<?php  if($child['category_id'] == "114") continue; ?>
<?php  if($child['category_id'] == "115") continue; ?>
<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
<?php } ?></ul></li><?php } ?><div class="box">
<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image'];?>" alt="collection" ></a>
</div></ul><a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
</div></li><?php } else { ?><li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
<?php } ?>
<?php } ?>
</ul>-->


	<ul class="container smartmenu sm-js-0 sm-full-width sm-response-margin sm-response-switch">
		<li class=""><a href="http://localhost/new/rings" class="dropdown-title">Rings</a><div class="dropdown boostKeyframe" style="animation: none;">
			<ul class="disflex-spbetween">
				<li class="box">
				
					<ul>
						<li><a href="https://www.ornatejewels.com/american-diamond-rings">American Diamond Rings</a></li>
            <li><a href="https://www.ornatejewels.com/pearl-rings">Pure Pearl Rings</a></li>
            <li><a href="https://www.ornatejewels.com/solitaire-rings">Solitaire Rings </a></li>
            <li><a href="https://www.ornatejewels.com/color-gemstone-rings">Color Gemstone Rings</a></li>
            <li><a href="https://www.ornatejewels.com/couple-bands">Couple Bands</a></li>
            <li><a href="https://www.ornatejewels.com/crown-rings">Crown Rings</a></li>
            <li><a href="https://www.ornatejewels.com/emerald-rings">Emerald Rings</a></li>
            <li><a href="https://www.ornatejewels.com/engagement-rings">Engagement Rings</a></li>
            <li><a href="https://www.ornatejewels.com/gold-plated-rings">Gold Plated Rings</a></li>
            <li><a href="https://www.ornatejewels.com/heart-rings">Heart Rings</a></li>
            <li><a href="https://www.ornatejewels.com/office-wear-rings">Office Wear Rings    </a></li>
            <li><a href="https://www.ornatejewels.com/past-present-future-rings">Past Present Future Rings</a></li>
            <li><a href="https://www.ornatejewels.com/promise-rings">Promise Rings</a></li>
            <li><a href="https://www.ornatejewels.com/ruby-rings">Ruby Rings</a></li>
            <li><a href="https://www.ornatejewels.com/sapphire-rings">Sapphire Rings</a></li>
            <li><a href="https://www.ornatejewels.com/cocktail-rings">Cocktail Nights</a></li>
            <li><a href="https://www.ornatejewels.com/band-rings">Band Rings</a></li>
					</ul>
				</li>
			
			<div class="box">
				<a href="http://localhost/new/rings"><img src="http://localhost/new/image/cache/catalog/category-banner/rings-banner-391x269.webp" alt="collection"></a>
			</div>
			
			</ul><a href="http://localhost/new/rings" class="see-all">Show All Rings</a></div></li>
			
			<li class=""><a href="http://localhost/new/earrings" class="dropdown-title">Earrings</a>
				<div class="dropdown boostKeyframe" style="animation: sm-hide 300ms ease 0ms 1 normal forwards;">
				
			<ul class="disflex-spbetween">
				<li class="box">
				<ul>
					<li><a href="http://localhost/new/american-diamond-earrings">American Diamond Earrings (118)</a></li>
					<li><a href="http://localhost/new/hoops-earrings">Hoops (16)</a></li>
					<li><a href="http://localhost/new/pearl-earrings">Pearl Earrings (33)</a></li>
					<li><a href="http://localhost/new/climbers-earrings">Ear Climbers (13)</a></li>
					<li><a href="http://localhost/new/chandliers-earrings">Chandliers (9)</a></li>
					<li><a href="http://localhost/new/studs-earrings">Studs Earrings (135)</a></li>
					<li><a href="http://localhost/new/omega-back-earrings">Omega Back Earrings (29)</a></li>
					<li><a href="http://localhost/new/danglers">Danglers Earrings (80)</a></li>
					<li><a href="http://localhost/new/men-studs-earrings">Men's Studs (12)</a></li>
			</ul>
				</li>
					<div class="box"><a href="http://localhost/new/earrings"><img src="http://localhost/new/image/cache/catalog/category-banner/earrings-banner-391x269.webp" alt="collection"></a></div>
					
					</ul><a href="http://localhost/new/earrings" class="see-all">Show All Earrings</a></div>
			</li>
					
			<li><a href="http://localhost/new/necklaces" class="dropdown-title">Necklaces</a>
			<div class="dropdown boostKeyframe" style="animation: sm-hide 300ms ease 0ms 1 normal forwards;">
			<ul class="disflex-spbetween">
				<li class="box">
					<ul>
						<li><a href="http://localhost/new/american-diamond-necklace">American Diamond Necklace  (97)</a></li>
						<li><a href="http://localhost/new/pearl-necklaces">Pearl Necklace (18)</a></li>
						<li><a href="http://localhost/new/solitaire-pendants">Solitaire Pendants  (34)</a></li>
					</ul>
				</li>
				<div class="box"><a href="http://localhost/new/necklaces"><img src="http://localhost/new/image/cache/catalog/category-banner/necklaces-391x269.webp" alt="collection"></a></div>
			</ul><a href="http://localhost/new/necklaces" class="see-all">Show All Necklaces</a>
			</div>
			</li>
			<li><a href="http://localhost/new/bracelets">Bracelets</a></li>
			<li><a href="http://localhost/new/collections" class="dropdown-title">COLLECTIONS</a><div class="dropdown boostKeyframe" style="animation: sm-hide 300ms ease 0ms 1 normal forwards;"><ul class="disflex-spbetween">
			<li class="box">
				<ul>
				<li><a href="http://localhost/new/18k-yellow-gold-plated-jewelry">18k Yellow Gold Plated Jewelry  (91)</a></li>
				<li><a href="http://localhost/new/alphabet-jewelry">Alphabet Jewelry  (26)</a></li>
				<li><a href="http://localhost/new/american-diamonds">American Diamonds (413)</a></li>
				<li><a href="http://localhost/new/birthstone-color-jewelry">Birthstone Color Jewelry (24)</a></li>
				<li><a href="http://localhost/new/blue-hues">Blue Hues (83)</a></li>
				<li><a href="http://localhost/new/canary-yellow-safari">Canary Yellow safari (10)</a></li>
				<li><a href="http://localhost/new/colorazzi">Colorazzi (276)</a></li>
				<li><a href="http://localhost/new/diamond-alternate">Diamond Alternate (7)</a></li>
				<li><a href="http://localhost/new/emerald-hues">Emerald Hues (59)</a></li>
				<li><a href="http://localhost/new/hearts-jewelry">Hearts Jewelry (46)</a></li>
				<li><a href="http://localhost/new/infinity-jewelry">Infinity Jewelry (19)</a></li>
				<li><a href="http://localhost/new/love-of-lustre">Love Of Lustre (18)</a></li>
				<li><a href="http://localhost/new/pearls">Pearls  (88)</a></li>
				<li><a href="http://localhost/new/ruby-hues">Ruby Hues (69)</a></li>
				<li><a href="http://localhost/new/sim-stone-in-motion">SIM Stone In Motion (31)</a></li>
				<li><a href="http://localhost/new/tree-of-life-jewelry">Tree Of Life Jewelry (15)</a></li>
				<li><a href="http://localhost/new/solitaire-jewelry">Solitaire Stories (224)</a></li>
				
				</ul>
				</li>
				<div class="box"><a href="http://localhost/new/collections"><img src="http://localhost/new/image/cache/catalog/category-banner/collections-banner-391x269.webp" alt="collection"></a></div>
				
				</ul><a href="http://localhost/new/collections" class="see-all">Show All COLLECTIONS</a></div></li><li><a href="http://localhost/new/hot-deals">Hot Deals</a></li><li><a href="http://localhost/new/kids-jewels">Kids Jewels</a></li></ul>

</div> </div>  </header> <?php } ?>
