<?php echo $header; ?>

  <link rel="stylesheet" href="css/bootstrap-custom.css">


<div class="container <?php if($information_id=='4'){ echo 'aboutus'; }?>">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    
    <?php if($information_id=='4'){ ?>
   
            
			    <style>
  /*.breadcrumb li {
    display: inline-block;
    text-transform: uppercase;
	}
	.breadcrumb li a {
    color: #000;
    font-size: 14px;
    padding: 0 2px;
}*/
	.abusceo {
    padding: 45px 0;
    border-bottom: 2px solid #bbb;
    margin-bottom: 45px;
}
	.abusceo .title {
		font-size: 2.1875rem;
		margin-top:40px;
	
		color:black;
	}
	.abusceo span {
    font-size: 1.5625rem;
    display: block;
    padding: 8px 0 12px;
	
    font-weight:400;
	color:black;
	}
	.aboutus p {
    font-size: .9375rem;
    line-height: 28px;
    padding: 10px 0;
	
    font-weight: 400;
	text-align:justify;
	}
	.abus-look {
    align-items: center;
    margin-bottom: 62px;
}
.disflex {
    display: flex;
}
	.abus-look strong {
    font-size: 1.5625rem;
    line-height: normal;
    padding-bottom: 8px;
    display: block;

    font-weight: 400;
	}
	.abus-look p {
    background: #fff;
	}
	.abus-look .article {
    
    z-index: 1;
    text-align: center;
    padding-left: 32px;
   }
   .folllow-us1 {
    text-align: center;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    padding: 5px;
    margin-bottom: 25px;
	}
	.page-head {
    text-align: center;
    padding: 45px 0;
    width: 100%;
	}
	.page-head h2 {
   
    line-height: 0;
    font-size: 1.875rem;
    color: #322f2f;
   
    margin-bottom: -15px;
	}
	.page-head h2 span {
    background: #fff;
    padding: 0 15px;
	}
	
	.folllow-us1 .social-col .title {
    font-size: 20px;
    color: #000;
    display: block;
    padding-bottom: 2px;
	}
	.social-col  .my-icons-instgrame i {
    background-position: 0 -583px;
	}
	.folllow-us1 .social-col figure {
    background-color: #fff;
    -moz-box-shadow: 0 0 5px rgba(0,0,0,0.12);
    -webkit-box-shadow: 0 0 5px rgba(0,0,0,0.12);
    box-shadow: 0 0 5px rgba(0,0,0,0.12);
    padding: 5px;
	}
	@media (max-width: 767px){
   .abus-look .article {
    margin-right: 0px;
}
}
  .my-icons-facebook {
    background-position: 0 -320px;
}

.folllow-us .social-col .title .facebook {
    width: 20px;
    height: 32px;
}
.folllow-us .social-col .title .instagram {
    width: 20px;
    height: 32px;
}

.social-col  .my-icons-instgrame , .social-col .title .my-icons-facebook {
	
	 background-image: url('images/my-icons-sb9dc963115.png');
    background-repeat: no-repeat;
}

  </style>
			  <div class="row">
		<div class="col-md-12 col-sm-12 abusceo">
			<div class="col-md-6 col-sm-6">
				<div>
					<img src="images/about-us/ceo.jpg" alt="ceo">
				</div>
			</div>
			<div class="col-md-6 col-sm-6">
				<h1 class="title">About Us</h1>
				<span>Designer, CEO and a Mother </span>
				<p>Shelly started her company with only $1000 . 
				She started her journey with jewelry back in 2002 and then took a break when her daughter was born. 
				Having lived in USA, London, China and Hong Kong she experienced various cultures.
				</p>
				<p>Women are the soul of this whole universe. They create life; they are confident, independent and go-getters.
				They know what they want and nothing is impossible for them. Shelly’s designs are guided by this positive life force. 
				She expresses herself through these unique designs. 
				She believes in the need and want of wearing new and different jewelry on different occasions without breaking the bank. 
				That’s the core philosophy of her company to bring the Best Quality in Best Prices.
				</p>
				<p>The foundation of Shelly’s success has been her innate ability to realize that today’s women want unique but wearable jewelry. 
				This was common to all the women she interacted with in her journey. 
				She started creating finely crafted jewelry at outstanding value, which looks gorgeous and at the same time is wearable and timeless.
				</p>
			</div>
		</div>
	</div>
	
		<div class="col-md-12 col-sm-12">
		    <div class="col-md-6 col-sm-6">
				<div class="abus-look disflex">
					<div class="article">
						<strong>At ornatejewels each piece is <br> crafted with utmost precision.</strong>
						<p>We conceptualize, design and manufacture each piece in our state of the art facility using latest 
						technology and skilled artisans assuring high quality. Our silver is hallmarked for 925 purity and is anti tarnish .
						</p>
					</div>
					
				</div>
			</div>
			<div class="col-md-6 col-sm-6">
				<div class="abus-look disflex">
					<img src="images/about-us/look.jpg" alt="ceo">
				</div>
			</div>
		</div>
	
	
	
	<div class="folllow-us">
		<div class="page-head"><div class="home-heading">	
			<span>Connect With Us</span>
		</div>
	</div>
	<div class="social-col">
		<a rel="nofollow" href="https://www.instagram.com/ornatejewels" target="_blank" class="title"> 
			<i class="my-icons-instgrame"></i> Instagram
			<figure><img src="https://ornate-bc57.kxcdn.com/images/eidinsta-min.jpg" alt="affordable sterling silver jewellery"></figure>
		</a>
	</div>


	<div class="social-col">
		<a rel="nofollow" href="https://www.facebook.com/ornatejewelscom" target="_blank" class="title">
		<i class="my-icons-facebook facebook"></i> Facebook
		<figure><img src="https://ornate-bc57.kxcdn.com/images/homenew/facebook.jpg" alt="sterling silver jewellery wholesale india"> </a>
		</figure>
	</div>
	
	
	<!--<div class="row">
		<div class="col-md-12 col-sm-12">
			<div class="folllow-us1">
				<div class="page-head"><h2><span>Follow Us <strong>On</strong></span></h2></div>
				<div class="col-md-6 col-sm-6">
					<div class="social-col"><a href="https://www.instagram.com/ornatejewels/" target="_blank" class="title"> 
						<i class="my-icons-instgrame"></i> Instagram</a>
						<figure><img src="https://ornate-bc57.kxcdn.com/images/eidinsta-min.jpg"></figure>
					</div>
				</div>
				<div class="col-md-6 col-sm-6">
					<div class="social-col"><a href="https://www.facebook.com/ornatejewelscom" target="_blank" class="title">
						<i class="my-icons-facebook facebook"></i>  Facebook</a><figure>
						<img src="https://ornate-bc57.kxcdn.com/images/homenew/facebook.jpg"></figure>
					</div> 
				</div>				
			</div>
		</div>
	</div>-->
			  
    
    <?php }else{ ?>
	
	 
	 <?php if($information_id=='12'){ ?>
	 <div class="commontext1 disflex-spbetween">
	 <section>
            <h1 class="heading"><?php echo $heading_title; ?></h1>
            <?php echo $description; ?>
        </section>
        <?php echo $content_bottom; ?>
        <?php echo $column_right; ?>
	 
	 </div>
	 <style>
	 
	 .commontext1 section .heading {
    font-size: 2.1875rem;
    border-bottom: 0;
    margin: 0;
}

.commontext1 .heading {
    font-size: 1.25rem;
    border-bottom: 1px solid #e5e5e5;
    text-transform: uppercase;
    display: block;
    padding-bottom: 12px;
    margin-bottom: 12px;
}
	 
	 .commontext1 section{
		 
		 width:100%;
	 }
	 .commontext1 p {
    font-size: .9375rem;
    color: #2d2d2d;
    line-height: 28px;
    padding: 10px 0;
	 }
	 .commontext1 section li {
    padding-left: 35px;
    font-size: 18px;
    list-style: inside;
    line-height: 28px;
}
	 
	 </style>
	 <?php }else{ ?>    
	
	
    <!--<div class="commontext disflex-spbetween">
   


	   <aside>
            <strong class="heading">Information</strong>
            <ul>
                <li><a href="about-us.html">About Us</a></li>
                <li><a href="why-choose-us.html">Why choose us</a></li>
                <!--<li><a href="after-care">After Care</a></li>
                <li><a href="privacy-policy.html">Privacy Policy</a></li>
                <li><a href="shipping-and-delivery-information.html">Shipping Policies</a></li>
                <li><a href="terms-and-conditions.html">Terms & Conditions</a></li>
                <li><a href="return-cancellation-exchange-policies.html">Return And Exchange Policies</a></li>
            </ul>
        </aside>
		
	 
        <section>
            <h1 class="heading"><?php echo $heading_title; ?></h1>
            <?php echo $description; ?>
        </section>
        <?php echo $content_bottom; ?>
        <?php echo $column_right; ?>
    </div>-->
	
	<style>
  
	.commontext {
    border-top: 1px solid #e5e5e5;
    padding: 35px 0;
	}
	.commontext .heading {
    font-size: 1.25rem;
    border-bottom: 1px solid #e5e5e5;
    text-transform: uppercase;
    display: block;
    padding-bottom: 12px;
    margin-bottom: 12px;
	font-family: "AvenirNextLTW01-Regular";
    font-weight: 400;
	color:#000;
	}
	.commontext li {
    font-size: .9375rem;
    padding: 12px 0;
	list-style:none;    
	font-size: .9375rem;
    padding: 12px 0;
    
	
	}
	.commontext li a {
    text-decoration: none;
    color: #000;
	font-family: "AvenirNextLTW01-Regular";
	}
	.section .heading {
     font-size: 1.25rem;
	 border-bottom: 0;
     margin: 0;
	 color:#414141;
	font-family: "AvenirNextLTW01-Regular";
	padding-bottom:0px;
	font-weight:600;
	}
	.commontext p {
    font-size: .9375rem;
    color: #2d2d2d;
    line-height: 28px;
    padding-bottom: 10px;
	font-family: "AvenirNextLTW01-Regular";
	text-align:justify;
	}
	.coupon-partner{
	
	padding: 20px 10px;
	box-sizing: border-box;
	
	}
	body{
	background-color:#f4f4f4;
	}
	/*ul{
     margin: 0 0 10px 0px !important;
	 }*/
  </style>
	
	
	
	
	
	
	<div class="row">
		<div class="col-md-12">
			<div class="commontext disflex-spbetween">
				<div class="col-md-3 col-sm-3  hidden-xs">
					<strong class="heading">Information</strong>
					<ul>
						<li><a href="about-us.html">About Us</a></li>
						<li><a href="why-buy-from-us.html">Why Buy From Us</a></li>
						<li><a href="privacy-policy.html">Privacy Policy</a></li>
						<li><a href="shipping-and-delivery-information.html">Shipping Policies</a></li>
						<li><a href="terms-and-conditions.html">Terms &amp; Conditions</a></li>
						<li><a href="return-cancellation-exchange-policies.html">Return And Exchange Policies</a></li>
					</ul>
				</div>
				<div class="col-md-9">
					<div class="section">
						
						 <h1 class="heading"><?php echo $heading_title; ?></h1>
						<?php echo $description; ?>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
    <?php } ?>
    <?php } ?>
    
</div></div>
<?php echo $footer; ?>