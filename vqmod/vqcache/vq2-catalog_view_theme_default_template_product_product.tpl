   <?php echo $header; ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="https://ornate-bc57.kxcdn.com/css/product.css?v=1.26" type="text/css" rel="stylesheet" media="screen" />
<link href="https://ornate-bc57.kxcdn.com/css/style1.css" type="text/css" rel="stylesheet" media="screen" />
<link href="https://ornate-bc57.kxcdn.com/catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen" />
<script src="https://ornate-bc57.kxcdn.com/catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="https://ornate-bc57.kxcdn.com/js/magiczoomplus.min.js?v=2.3" type="text/javascript"></script>
<script src="https://ornate-bc57.kxcdn.com/js/postcodepro.js" type="text/javascript"></script>
<style>
.zoom-gallery{text-align:center}.zoom-gallery-slide{display:none}.zoom-gallery-slide.active{display:block}.zoom-gallery .video-slide{position:relative;padding-bottom:90%;padding-top:30px;height:0;overflow:hidden}.zoom-gallery .video-slide embed,.zoom-gallery .video-slide iframe,.zoom-gallery .video-slide object{position:absolute;top:0;left:0;width:100%;height:100%}.zoom-gallery .selectors{text-align:center;margin:10px 0}.zoom-gallery .selectors a{margin:5px;border:1px solid transparent;display:inline-block}.zoom-gallery .selectors a.active,.zoom-gallery .selectors a:hover{border-color:#ccc}.zoom-gallery .selectors img{box-shadow:none!important;filter:none!important;-webkit-filter:none!important;height:75px}.zoom-gallery .selectors a[data-slide-id=video-1],.zoom-gallery .selectors a[data-slide-id=video-2]{position:relative}.zoom-gallery .selectors a[data-slide-id=video-1] img,.zoom-gallery .selectors a[data-slide-id=video-2] img{opacity:.8}.zoom-gallery .selectors a span{position:absolute;color:#fff;text-shadow:0 1px 10px #000;top:50%;left:50%;display:inline-block;transform:translateY(-50%) translateX(-50%);-webkit-transform:translateY(-50%) translateX(-50%);font-size:30px;z-index:100}.popupfixed .pincode input{padding:0 5px;margin:3px;width:99%;height:32px;line-height:28px;font-size:14px}.pincode{display:block;float:left;width:100%;height:40px;line-height:normal;margin:10px 0}.search-postcode{position:relative;line-height:23px;height:23px;padding-top:1px;background:url(https://ornate-bc57.kxcdn.com/images/web_icon.png) -402px -24px;padding-left:5px;padding-right:5px;border-radius:3px;color:#fff;font-size:12px;cursor:pointer;float:right;top:-28px;left:-10px;width:56px}.accordion,button.accordion:after{color:#670067}.pincode .dropdown-menu{z-index:1!important;position:absolute;top:100%;right:0;display:none;float:left;min-width:200px;padding:5px 0;margin:2px 0 0;font-size:14px;text-align:left;list-style:none;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,.15);border-radius:4px;-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175);box-shadow:0 6px 12px rgba(0,0,0,.175)}.pmessage{font-size:14px;margin-left:.5em;text-align:left;z-index:10;padding:4px 2px;width:96%;line-height:16px}.accordion{font-size:16px;padding:10px 10px 0 0;font-weight:700}ul{list-style-type:disc}select{-webkit-appearance:menulist-button;border-radius:3px}.more{position:absolute;right:35px;bottom:0}.rating>label{color:#9d9d9d;margin:0}.panel p{padding:0}.panels p{padding:10px 0;line-height:20px}input{float:left;margin:0!important}.glyphicon{right:25px!important}.panel ul{list-style:disc;padding-left:0}.accordions:after{content:'\002B';color:#777;font-weight:700;float:right;margin-right:10px}
.panel ul li{
				list-style: disc;
				padding-left: 0px;
			}
		.panel-body{
		padding:0px;
		}
 .panel-group .panel-heading {
            border-bottom: none;
            border-left: none;
            border-top: none;
            background: none;
            padding:0px;
        }
        .panel-title {
        text-align: left;
        background:none;
      
    }
	@media (max-width: 767px){
.ptitle {padding:0px 10px;}
}
.description ul li{
	margin:0 17px;
	color:#5a5959;
}



.fa-twitter:before {
    content: "\f099";
}

.fa-whatsapp:before {
    content: "\f232";
}

.fa-truck:before {
    content: "\f0d1";
}
.fa-google-plus:before {
    content: "\f0d5";
}
.fa-facebook-f:before, .fa-facebook:before {
    content: "\f09a";
}






</style>   
      


<div class="container">
    <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
<div class="row">
        
                <div class="col-md-6 col-sm-6 col-xs-12 product-img">
				   <div class="col-md-12 col-sm-12 col-xs-12 col-lg-12">
                   
					<div class="zoom-gallery">
						<div data-slide-id="zoom" class="zoom-gallery-slide active">
							<a href="<?php echo $image1; ?>" class="MagicZoom" id="zoom-v">
								<img src="<?php echo $image1; ?>" alt="<?php echo $alt; ?>" />
							</a>
						</div>
					
						<?php if($model=='YPE53700537EM') { ?>
							<div data-slide-id="video-1" class="zoom-gallery-slide video-slide">
							<iframe width="560" height="560" src="https://www.youtube.com/embed/VypqfeKPLUM?rel=0&amp;showinfo=0" ></iframe>
							
								<!--<iframe width="560" height="315" src="https://www.youtube.com/embed/J91IcJE6Clg" frameborder="0" allowfullscreen></iframe>-->
							</div>
							
							
						<?php } else { ?>
						
						<?php if(isset($video_url ) && !empty ($video_url)){   ?>
						
						<div data-slide-id="video-1" class="zoom-gallery-slide video-slide">
						
					
							<iframe class="embed" src="<?php echo $video_url; ?>"  scrolling="no" frameborder="1" style="width: 100%; border-width: 0px; border-style: solid; border-color: initial; border-image: initial; "></iframe>
							
						
							
						</div>
						<?php } ?>
						
						<?php } ?>
						
						<div class="selectors">
							<a data-slide-id="zoom" class="active" href="<?php echo $image1; ?>" data-image="<?php echo $image1; ?>" data-zoom-id="zoom-v">
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $thumb1; ?>" alt="<?php echo $alt; ?>"/>
							</a>
							
							<?php foreach ($images as $image) { ?>
							
							<a data-slide-id="zoom" href="<?php echo $image['thumb']; ?>" data-image="<?php echo $image['thumb']; ?>" data-zoom-id="zoom-v">
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $image['thumb1']; ?>" alt="<?php echo $image['image_alt']; ?>"/>
							</a>
						
							
							<?php } ?>
							<?php if(isset($video_url ) && !empty ($video_url)){   ?>
							<a data-slide-id="video-1" href="#">
								<span class=""></span>
								<img src="https://ornate-bc57.kxcdn.com/images/360.jpg" alt="360 view"/>
							</a>
							<?php } ?>
							
						</div>
					</div>
					

					<script>
						
					</script>

					
					</div>
					<script src="//s7.addthis.com/js/250/addthis_widget.js" async="async"></script>
					<div class="row">
				    <div class="col-xs-12">
				
					<div class="supports-fontface">
						<span class="social-title">Share this</span>
						<div class="social-sharing is-clean" data-permalink="">
							<a class="addthis_button_facebook at300b" href="javascript:void(0)" title="Facebook">
								<span class="fa fa-facebook"></span>
							</a>
							<a class="addthis_button_whatsapp at300b" href="javascript:void(0)" title="Facebook">
								<span class="fa fa-whatsapp"></span>
							</a>
							<a class="addthis_button_twitter at300b" href="javascript:void(0)">
								<span class="fa fa-twitter"></span>
							</a>
							
						
							
							<!--<a target="_blank" href=" class="share-pinterest">
								<span class="fa fa-pinterest"></span>
							</a>-->
							<a class="addthis_button_google_plusone_share at300b" href="javascript:void(0)">
								<span class="fa fa-google-plus"></span>
							</a>
						</div>

					</div>
					
					</div>
					<div class="col-xs-12">
				
					<div class="supports-fontface">
						<span class="social-title">Get More Info</span>
						<a href="//api.whatsapp.com/send?phone=918600718666"><span style="float:left;"><img src="https://ornate-bc57.kxcdn.com/images/whatsapp-icon-square.svg" width="25" height="25"></span></a>

					</div>
					
					</div>
				 </div>
                </div>
    <div class="col-md-6 col-sm-6 col-xs-12" id="product">
				<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" /> 
				<input type="hidden" name="quantity" value="1" /> 
					
					   
		<div class="row card mdl-card">
						<div class="col-md-12 col-sm-12 col-xs-12">
							
						<div class="row" style="display:block">
                             <div class="col-md-12 col-sm-12 col-xs-12">
								<h3 class="rts__wrap__h3">Ready to Ship</h3>
	                            
                            </div>
                        </div>

							<div class="row">
							<div class="col-xs-12 col-md-12 col-sm-12 productname">


<?php 
if (isset($richsnippets['breadcrumbs'])) { ?>
<span xmlns:v="http://rdf.data-vocabulary.org/#">
<?php foreach ($mbreadcrumbs as $mbreadcrumb) { if (strip_tags($mbreadcrumb['text'])) { ?>
<span typeof="v:Breadcrumb"><a rel="v:url" property="v:title" href="<?php echo $mbreadcrumb['href']; ?>" alt="<?php echo strip_tags($mbreadcrumb['text']); ?>"></a></span>
<?php } } ?>				
</span>
<?php }
if (isset($richsnippets['product'])) {
?>
<span itemscope itemtype="http://schema.org/Product">
<meta itemprop="url" content="<?php $mlink = end($breadcrumbs); echo $mlink['href']; ?>" >
<meta itemprop="name" content="<?php echo $heading_title; ?>" >
<meta itemprop="model" content="<?php echo $model; ?>" >
<meta itemprop="manufacturer" content="Ornate Jewels" >

<?php if ($thumb) { ?>
<meta itemprop="image" content="<?php echo $thumb; ?>" >
<?php } ?>

<?php if ($images) { foreach ($images as $image) {?>
<meta itemprop="image" content="<?php echo $image['thumb']; ?>" >
<?php } } ?>

<?php if (isset($richsnippets['offer'])) { ?>
<span itemprop="offers" itemscope itemtype="http://schema.org/Offer">
<meta itemprop="priceCurrency" content="INR">

<meta itemprop="price" content="<?php echo preg_replace( '/[^.,0-9]/', '',($special ? $special : $price)); ?>" />


<link itemprop="availability" href="http://schema.org/<?php echo (($quantity > 0) ? "InStock" : "OutOfStock") ?>" />
</span>
<?php } ?>

<?php if (isset($richsnippets['rating']) && $review_no) { ?>
<span itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
<meta itemprop="reviewCount" content="<?php echo $review_no; ?>">
<meta itemprop="ratingValue" content="<?php echo $rating; ?>">
<meta itemprop="bestRating" content="5">
<meta itemprop="worstRating" content="1">
</span>
<?php } ?>

</span>
<?php } ?>


								<h1 class="proheading"><?php echo $heading_title; ?></h1>
							</div>	
							</div>
							<div class="row">
							
							<div class="col-md-4 col-sm-4 col-xs-6">
								<span class="prohead">SKU No:</span>
							</div>
							<div class="col-md-8 col-sm-8 col-xs-6">								
								<span class="view__more__pd__article__label"><?php echo $model; ?></span>
							</div>
							</div>
							<div class="row">
							<div class="col-md-4 col-sm-4 col-xs-6">
								<span class="prohead">Metal Name:</span>
							</div>
							<div class="col-md-8 col-sm-8 col-xs-6">
								<span class="view__more__pd__article__label">925 Sterling Silver</span>
							</div>
						</div>	
						
						<div class="row">
							<div class="col-md-4 col-sm-4 col-xs-6">
								<span class="prohead">Price:</span>
							</div>
							<div class="col-md-8 col-sm-8 col-xs-6">
							<?php if(!$special){ ?>	
								
								<span class="product__details__wrap__price__panel__price">
									
										<?php echo  $price; ?>
								</span>
								
							<?php } else { ?>
							
							<span class="product__details__wrap__price__panel__price">
								
								<?php echo  $special; ?>
							</span>
							
								<span class="product__details__wrap__price__panel__strike">
								
								<?php echo  $price; ?>
								</span>
								 <span class="product__offer">FLAT <?php echo $discount_percent; ?>% Off</span> 
							<?php } ?>	
							</div>
							</div>	
							
						<div class="row">
							<div class="col-xs-12 col-md-12 col-sm-12 ptitle1">GET THIS FOR LESS</div>
						</div>	
					<!--	<div class="row">	
							<div class="col-md-4 col-sm-4 col-xs-4">
								<span class="prohead">Coupon Code:</span>
							</div>
							<div class="col-xs-8 col-md-8 col-sm-8">
								<span class="view__more__pd__article__label code" alt="copy text">Navratri</span>
							</div>
						</div>-->	
						<div class="row">
							<div class="col-md-4 col-sm-5 col-xs-6">
								<span class="prohead">Pay Online Price:</span>
							</div>
							<div class="col-xs-6 col-md-8 col-sm-8">							
								<span class="view__more__pd__article__label">
								<?php if(!$special){ ?>	
								
								<?php echo $final_price; ?>
								
								<?php } else { ?>
								<?php echo $final_special; ?>
								
								<?php } ?>
								
								
								Extra 10% 0ff</span>
							</div>
						</div>	
						
						<div class="row">
							<div class="col-md-4 col-sm-5 col-xs-6">
								<span class="prohead">COD Price:</span>
							</div>
							<div class="col-xs-6 col-md-8 col-sm-8">							
								<span class="view__more__pd__article__label">
								<?php if(!$special){ ?>	
								
								<?php echo $cod_price; ?>
								
								<?php } else { ?>
								<?php echo $cod_special; ?>
								
								<?php } ?>
								
								
								COD Charges 50 Rs.</span>
							</div>
						</div>	
						
						
							<div class="row">	
								<div class="col-md-4 col-sm-4 col-xs-6">
									<span class="prohead">Free Shipping:</span>
								</div>
								<div class="col-xs-6 col-md-8 col-sm-8">
									<span class="view__more__pd__article__label">
										You Save Rs. 100</span>
								</div>
							</div>	
						
						
							<?php if ($options) { ?>
							  <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'select') { ?>
							
							<div class="row">
							<div class="col-xs-6 col-md-4 col-sm-4">
								<span class="prohead"><?php echo $option['name']; ?>:</span>
							</div>	
							<div class="col-xs-6 col-md-8 col-sm-8" id="size_1060584303">
								<span class="view__more__pd__article__label" for="input-option3427">
								<select id="ringselect" name="option[<?php echo $option['product_option_id']; ?>]  class="required <?php echo ($option['required'] ? ' required' : ''); ?>" tabindex="-1">
								<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<option class="" style="background: #E5E5E5; padding: 1px 12px 0px 12px;cursor: pointer; font-size: 15px; border-radius: 2px; margin-right: 0px; vertical-align: -webkit-baseline-middle; vertical-align: -moz-middle-with-baseline; -webkit-vertical-align: -webkit-baseline-middle; font-weight: normal !important;" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>
									(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>
								</option>
							<?php } ?>
									</select>
								</span>
							</div>
							</div>
							<?php if($category_name=='Rings'){ ?>
							<div class="row taxon_size_chart1">
							<div class="col-xs-6 col-md-4 col-sm-4">
								<span class="prohead">Ring Guide:</span>
							</div>
							
							<div class="col-xs-6 col-md-8 col-sm-8">
								<span class="prohead">
									<a target="_blank" href="https://www.ornatejewels.com/pdf/ring-size-new-2018-7.pdf">Ring Size Chart </a>
								</span>
							</div>
							<div class="col-xs-6 col-md-4 col-sm-4">
								<span class="prohead">Ring Guide Video:</span>
							</div>
						
							<div class="col-xs-6 col-md-8 col-sm-8">							
								<span class="prohead">
									
									<a class="youtube cboxElement" href="https://www.youtube.com/embed/lrUIL7rrTUw?rel=0&amp;showinfo=0">Ring Size Video</a>
									
								</span>
							</div>
							</div>
							<?php } ?>
							<?php if($model=='OJB0118'){ ?>
							<div class="row taxon_size_chart1">
							<div class="col-xs-6 col-md-4 col-sm-4">
								<span class="prohead">Bangle Guide:</span>
							</div>
							
							<div class="col-xs-6 col-md-8 col-sm-8">
								<span class="prohead">
									<a target="_blank" href="https://www.ornatejewels.com/pdf/Bangle-size-chart.pdf">Bangle Size Chart </a>
								</span>
							</div>
							
							</div>
							<?php } ?>
							
							
							
							<?php } ?>
							<?php } ?>
							<?php } ?>
							
							<?php if($soldout==1){ ?>
							
							<div class="row cart-btn">
								<div class="col-xs-6 col-md-6 text-center">
									<div class="add-to-cart-container">
										
										
										<button type="button"  data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-lg btn-block" style="background: #000;    font-weight: 700;background: #000;height: 40px;border-radius: 0;color: #fff;white-space: nowrap;margin: 10px 0;text-align: center;">Sold Out</button>
										
										
									</div>
								</div>
							</div>
							<div class="row cart-btn" style="margin-top:10px;">	
								<div class="col-xs-12 col-md-12 text-center">
								<div class="notify disflex-spbetween NotifyWhenAvailableForm"><input type="hidden" name="NWAProductID" value="<?php echo $product_id; ?>"><input type="text" class="form-control" name="NWAYourName" id="NWAYourName" placeholder="Your Name" value=""><input type="text" class="form-control" name="NWAYourEmail" id="NWAYourEmail" placeholder="Enter Email Id" value="" style="margin-left: 10px !important;margin-right: 10px !important;"><button id="NotifyWhenAvailableSubmit" class="btn btn-default">Notify Me</button>	
								</div>
									
									
								</div>
							</div>
							
							
							
							<?php } else {?>
							
							<div class="row cart-btn">
								<div class="col-xs-6 col-md-5 text-center">
									<div class="add-to-cart-container">
										<button class="mdl-button flat-btn grey-text-lighten-2" onclick="addTOcart()" data-loading-text="Loading..."id="add-to-cart-btn1">ADD TO CART<!--<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span>--></button>
										
									</div>
								</div>
								<div class="col-xs-6 col-md-5 text-center">
									<div class="buy-now-container">
										<button class="mdl-button  flat-btn white-text" id="buy-now-btn1"   data-loading-text="Loading...">BUY NOW</button>
									</div>
								</div>
							</div>
							
							
							<?php } ?>
							
						</div>
						</div>	
		<div class="row mdl-card">
			<div class="col-md-12 col-sm-12 col-xs-12 card">
	
							<div class="col-md-12 col-sm-12 col-xs-12 checkdelivery">
								<p>Check Delivery Time </p>
							</div>
		
							<div class="col-xs-12">
									<div class=" mdl-js-textfield mdl-textfield--floating-label width-100-percent is-upgraded" >
										<div class="popupfixed" style="overflow:visible;">
											<div class="pincode">
													<input class="form-control" type="text" name="pincode" value="" placeholder="" autocomplete="off">
														<div class="search-postcode"></div>
														<label class="error "></label>
											</div>
														<div class="pmessage"></div>
										</div>
									</div>
							</div>
							<div class="col-xs-12 policy-tips">
							<p><i class="fa fa-truck"></i> Estimated Delivery: 4-7 Days</p>
								<p>Money Back Guarantee. Product Can Be Returned Within 7 Days From The Date The Item Is Delivered To You.
									All Our Products Are Guaranteed For Lifetime.</p>
							</div>	
			</div>
		</div>
		</div>
</div>
	<div class="row mdl-card card">
			<div class="col-xs-12 col-md-6 col-sm-6 prdetails">
				<div class="row">
						<div class="col-md-12 col-sm-12 col-sx-12 ptitles ">PRODUCT DETAILS</div>
				</div><?php if ($options) { ?>
							  <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'text') { ?>				
						<div class="row">		
							<div class="col-md-5 col-sm-5 col-xs-6">
								<span class=" prohead1"><?php echo $option['name']; ?>:</span>
							</div>
							<div class="col-md-7 col-sm-7 col-xs-6">
								<span class="view__more__pd__article__label"><?php echo $option['value']; ?></span>
							</div>
						</div><?php } ?>
						<?php } ?>
					<?php } ?>
			</div>	
			<div class="col-xs-12 col-md-6 col-sm-6 prdescription">
				
<div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                <h4 class="panel-title ptitle">
                    <a>	PRODUCT DESCRIPTION
                        <span class="glyphicon glyphicon-plus"></span>
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                   <div class="description">
				        <p><?php echo $description; ?></p> 
		           </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading"data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                <h4 class="panel-title ptitle">
                    <a> PRODUCT CARE
                     <span class="glyphicon glyphicon-plus"></span>
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse in">
                <div class="panel-body">
                    <div class="description">
									<ul>
										<li >Keep your jewels safe in our box.</li>
										<li>When storing jewelry make sure it doesn’t rub against other jewelry</li>
										<li>Though our jewelry doesn't turn black it is recommended to keep it away from water chemicals, soap etc.</li>
										<li>925 Guaranteed Silver Won't Turn Black.</li>
									</ul> 
					</div>
                </div>
            </div>
        </div>
        
    </div>
				
				
			    
	
			</div>	
	</div>
		<style>
		
		</style>
		

	
	
<div class="row">
	<div class="col-md-12 col-md-12 hidden-xs">
		<div class="mdl-card review-area width-100-percent">
			<div class="row">
			<div class="col-md-12 col-sm-12">
			<div class="col-md-12 col-sm-12">
			<span class="card-title">PRODUCT RATING</span>
			</div>
			</div>
			<div class="col-md-12 col-sm-12">
			<div class="col-md-12 col-sm-12">
			
			<?php if ($reviews) { //print_r($reviews);?>
			
			<div class="flex-center-row width-100-percent margin-0 review-count-area">
				<div class="rating">
					<div class="box"><div class="flex-center-row">
						<i class="fa fa-star" style="color:#69a6d8;padding:8px 2px 0 0;"></i><span><?php echo $reviews[0]['rating']; ?></span></div><div><p>Out of 5</p></div></div>
					<p class="margin-0">Based on <?php echo $total_review; ?> Reviews</p>
				</div>
				<div class="detailed-rating">
					<div class="each-rating">
						<span class="each-rating-title">Excellent</span>
						<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
						
						
						
							<div class="progressbar bar bar1" style="width: <?php echo $rating_per_5;?>%;"></div>
							<div class="bufferbar bar bar2" style="width: <?php echo 100-$rating_per_5;?>%;"></div>
							<div class="auxbar bar bar3" style="width: 0%;"></div>
						</div>
						<span class="each-rating-number"><?php echo $rating_5; ?></span>
					</div>
					<div class="each-rating">
						<span class="each-rating-title">Very Good</span>
							<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
								<div class="progressbar bar bar1" style="width: <?php echo $rating_per_4;?>%;"></div>
								<div class="bufferbar bar bar2" style="width: <?php echo 100-$rating_per_4;?>%;"></div>
								<div class="auxbar bar bar3" style="width: 0%;"></div>
							</div>
							<span class="each-rating-number"><?php echo $rating_4; ?></span>
					</div>
					<div class="each-rating">
						<span class="each-rating-title">Average</span>
						<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
							<div class="progressbar bar bar1" style="width: <?php echo $rating_per_3;?>%;"></div>
							<div class="bufferbar bar bar2" style="width: <?php echo 100-$rating_per_3;?>%;"></div>
							<div class="auxbar bar bar3" style="width: 0%;"></div>
						</div>
						<span class="each-rating-number"><?php echo $rating_3; ?></span>
					</div>
					<div class="each-rating">
						<span class="each-rating-title">Bad</span>
						<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
							<div class="progressbar bar bar1" style="width: <?php echo $rating_per_2;?>%;"></div>
							<div class="bufferbar bar bar2" style="width: <?php echo 100-$rating_per_2;?>%;"></div>
							<div class="auxbar bar bar3" style="width: 0%;"></div>
						</div>
						<span class="each-rating-number"><?php echo $rating_2; ?></span>
					</div>
					<div class="each-rating">
						<span class="each-rating-title">Terrible</span>
							<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
								<div class="progressbar bar bar1" style="width: <?php echo $rating_per_1;?>%;"></div>
								<div class="bufferbar bar bar2" style="width: <?php echo 100-$rating_per_1;?>%;"></div>
								<div class="auxbar bar bar3" style="width: 0%;"></div>
							</div>
							<span class="each-rating-number"><?php echo $rating_1; ?></span>
					</div>
				</div>
				<div class="write-review">
					<div class="text-center">Tell Us How Do You Like This Product</div>
					<div class="review-button cursor-pointer" id="write-review-btn"><span>Write a Review</span></div>
				</div>
			</div>
			<?php }else{ ?>
			
			<div class="flex-center-row width-100-percent margin-0 review-count-area">
				<div class="rating">
					<div class="box"><div class="flex-center-row">
						<i class="fa fa-star" style="color:#69a6d8;padding:8px 2px 0 0;"></i><span>0</span></div><div><p>Out of 0</p></div></div>
					<p class="margin-0">Based on 0 Reviews</p>
				</div>
				<div class="detailed-rating">
					<div class="each-rating">
						<span class="each-rating-title">Excellent</span>
						<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
							<div class="progressbar bar bar1" style="width: 00%;"></div>
							<div class="bufferbar bar bar2" style="width: 100%;"></div>
							<div class="auxbar bar bar3" style="width: 0%;"></div>
						</div>
						<span class="each-rating-number">0</span>
					</div>
					<div class="each-rating">
						<span class="each-rating-title">Very Good</span>
							<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
								<div class="progressbar bar bar1" style="width: 00%;"></div>
								<div class="bufferbar bar bar2" style="width: 100%;"></div>
								<div class="auxbar bar bar3" style="width: 0%;"></div>
							</div>
							<span class="each-rating-number"><?php echo $rating_4; ?></span>
					</div>
					<div class="each-rating">
						<span class="each-rating-title">Average</span>
						<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
							<div class="progressbar bar bar1" style="width: 0%;"></div>
							<div class="bufferbar bar bar2" style="width: 100%;"></div>
							<div class="auxbar bar bar3" style="width: 0%;"></div>
						</div>
						<span class="each-rating-number"><?php echo $rating_3; ?></span>
					</div>
					<div class="each-rating">
						<span class="each-rating-title">Bad</span>
						<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
							<div class="progressbar bar bar1" style="width: 0%;"></div>
							<div class="bufferbar bar bar2" style="width: 100%;"></div>
							<div class="auxbar bar bar3" style="width: 0%;"></div>
						</div>
						<span class="each-rating-number">0</span>
					</div>
					<div class="each-rating">
						<span class="each-rating-title">Terrible</span>
							<div  class="mdl-progress-green mdl-progress mdl-js-progress is-upgraded" data-upgraded=",MaterialProgress">
								<div class="progressbar bar bar1" style="width: 0%;"></div>
								<div class="bufferbar bar bar2" style="width: 100%;"></div>
								<div class="auxbar bar bar3" style="width: 0%;"></div>
							</div>
							<span class="each-rating-number">0</span>
					</div>
				</div>
				<div class="write-review">
					<div class="text-center">Tell Us How Do You Like This Product</div>
					<div class="review-button cursor-pointer" id="write-review-btn1"><span>Write a Review</span></div>
				</div>
			</div>
			
			
			
			
			
			<?php } ?>
			
			
			</div>
			</div>
			</div>
			<hr class="review-separator hidden" id="form-separator">
			
			<div class="flex-center-row mdl-cell mdl-cell--7-col" id="write-review-form-container1" style="display:none;">
			
				<form id="form-review">
				 <span class="title" style=""></span>
					<div class="flex-row flex-valign rate-jewellery-container">
						<label class="grey-text-lighten-3 rate-jewellery">Rate This Jewelery:</label>
						<div class="review-stars-container flex-row flex-center">
							<fieldset class="rating required">
								<input type="radio" id="star5" class="appearance" name="rating" value="5">
								<label class="" for="star5"></label>
								<input type="radio" id="star4" class="appearance" name="rating" value="4">
								<label class="" for="star4"></label>
								<input type="radio" id="star3" class="appearance" name="rating" value="3">
								<label class="" for="star3"></label>
								<input type="radio" id="star2" class="appearance" name="rating" value="2">
								<label class="" for="star2"></label>
								<input type="radio" id="star1" class="appearance" name="rating" value="1">
								<label class="" for="star1"></label>
							</fieldset>
						</div>
					</div>
					
					
					
					<div  class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label width-100-percent is-upgraded" >
						<input type="text" class="mdl-textfield__input write-review-input" placeholder="Name*" value="<?php echo $customer_name; ?>" name="name" id="input-name">
					
						
					</div>
					
					<div  class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label width-100-percent is-upgraded" >
						<input type="email" class="mdl-textfield__input write-review-input" placeholder="Email*" value="<?php echo $customer_email; ?>"  name="email" id="input-email">
					
						
					</div>
					
					
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label width-100-percent is-upgraded" >
						<textarea class="mdl-textfield__input write-review-input" id="input-review"  rows="3" placeholder="Please Give Your Review Here" id="review-comment" name="text"></textarea>
					
					</div>
					
					
					
					
					<div class="flex-row flex-center">
					<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btncom">Submit</button><button type="button" id="close-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btncom">Close</button>
						<!--<button class="mdl-button my-btn-new my-btn-primary-new" id="" >Submit</button>-->
					</div>
				</form>
			
			</div>
			<div class="customer-reviews" >
				<ul class="collection">
					<?php foreach ($reviews as $review) { ?>
					
					<li class="collection-item review-block">
						<div class="review">
							<div class="review-stars">
							<?php if ($review['rating']) { ?>
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($review['rating'] < $i) { ?>
								<img src="https://ornate-bc57.kxcdn.com/images/star-on.png"/>
								<?php } else { ?>
								<img src="https://ornate-bc57.kxcdn.com/images/star-on.png"/>
								<?php } ?>
								<?php } ?>
								  <?php } ?>
							
							
								
							</div>
							<span class="review-comment"><?php echo $review['text']; ?></span>
							
							
							<p class="review-comment-author">by <span class="author"><?php echo $review['author']; ?></span></p>
						</div>
					</li>
					
					<?php } ?>
					
				
				</ul>
				
			</div>
		</div>
	</div>
	
</div>
<div class="row">
	<div class="col-md-12 col-md-sm hidden-xs">
		<div class="mdl-card pd__container__other__products">
			
			<ul class="nav pd__container__other__pro__tabs text-center">
				<li class="active"> <a href="#tab_default_1" data-toggle="tab"> Best Sellers </a> </li>
				<li> <a href="#tab_default_2" data-toggle="tab"> New Arrival</a> </li>
				<li> <a href="#tab_default_3" data-toggle="tab">Offers </a> </li>
				
			</ul>
			<div class="tab-content" id="other_products_container">
				
				<div class="tab-pane active fade in" id="tab_default_1">
					
					<div id="carousel12" class="owl-carousel">
					 
					  <?php foreach($bestseller as $best){ ?>
						<div class="item text-center">
								   <a href="<?php echo $best['href']; ?>">
									<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $best['thumb']; ?>"  alt="<?php echo $best['thumb']; ?>" title="<?php echo $best['thumb']; ?>"/>
									<p> <?php echo $best['price']; ?></p>
									</a>
						</div>
						
					  <?php } ?>
						
					  </div>
				</div>
				
				<div class="tab-pane fade" id="tab_default_2">
					
					<div id="carousel2" class="owl-carousel">
					 
					  
						<?php foreach($newproducts as $newproduct) { ?>
						<div class="item text-center">
								   <a href="<?php echo $newproduct['href']; ?>">
									<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $newproduct['thumb']; ?>"  alt="<?php echo $newproduct['thumb']; ?>" title="<?php echo $newproduct['thumb']; ?>"/>
									<p> <?php echo $newproduct['price']; ?></p>
									</a>
						</div>
						
					  <?php } ?>
						
					  </div>
					  
					
					<script type="text/javascript">
					
					</script>
				</div>
				
				 <div class="tab-pane fade" id="tab_default_3">
					
					<div id="carousel3" class="owl-carousel">
					 
					  
						<?php foreach($offerproducts as $offer) { ?>
						<div class="item text-center">
								   <a href="<?php echo $offer['href']; ?>">
									<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $offer['thumb']; ?>"  alt="<?php echo $offer['thumb']; ?>" title="<?php echo $offer['thumb']; ?>"/>
									<!--<p> <?php echo $offer['price']; ?></p>-->
									<p class="left" style="color: #a0a0a0;text-decoration: line-through;"> <?php echo $offer['price']; ?></p>
						<p class=""><?php echo $offer['special']; ?></p>
									</a>
						</div>
						
					  <?php } ?>
						
					  </div>
					  
					
					<script type="text/javascript">
					
					</script>
				</div>
			</div>	
		</div>
		
	</div>
	</div>
	 
	 
	
   
	
<div class="row">		
		<div class="col-xs-12 col-md-6 col-sm-6">
		<div class="mdl-card">
			<div class="card">
			<h2 class="p-testimonial text-center">CUSTOMER TESTIMONIAL</h2>
			
			<div class="swiper-viewport">
					<div id="carousel1" class="swiper-container">
						<div class="swiper-wrapper"> 
						
						<?php foreach($testimonials as $testi) { ?>
							<div class="swiper-slide text-center">
								<div class="col-md-12 ">
									<div class="col-md-12 ">
										<div class="image text-center">
											<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $testi['image']; ?>" width="120px;" height="120px;" alt="<?php echo $testi['author']; ?>">
										</div>
									</div>
									<div class="col-md-12 ">
										<div class="paratext">
											<div class="rating text-center">
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="vname"> Verified Purchase</span>
											</div>
											<p class="comment1"><?php echo $testi['text']; ?></p>
										</div>
										<div class="paratext">
											<?php echo $testi['author']; ?> - <?php echo $testi['city']; ?>		
										</div>
										<div class="datetext text-right"><span><?php echo $testi['date_added']; ?></span></div>
									</div>
								</div>
							</div>
						<?php } ?>
							
							
							
							
						</div>
					</div>
					<div class="swiper-pagination carousel1"></div>
					<div class="swiper-pager">
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
					<script type="text/javascript">
					
					</script>
		
	    

        </div>
	    </div>
		</div> 
	
		<div class="hidden-xs col-md-6 col-sm-6 ">
		<div class=" mdl-card">	
			
			<h2 class="p-testimonial text-center"></h2>
			<div  class="advantage">
				<a>
					
						
						<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/d-adv.jpg" class="img-responsive" alt="sliver necklaces">
					
				</a>
			</div>
		</div>	
		</div>
</div>			
<div class="row">		
		<div class="col-md-12 col-sm-12 hidden-xs">
			<div class="mdl-card qa-layout mdl-shadow--2dp mdl-cell mdl-cell--12-col">
				
				
				
				<div class="qa-section">
					<h3>Questions and Answers</h3>
					<div class="mdl-button ask-ques-button ask-ques-button1" >
						<span id="post-qa-button">Post Your Question</span>
					</div>
				</div>
			
				
			<div class="flex-center-row mdl-cell " id="write-qa-form-container1">
					<div class="flex-column flex-valign qa-container  have-a-qstn " style="display:none;">
					
						<form id="qas-form2" >
						<span class="title"></span>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label width-100-percent is-upgraded" >
								<textarea class="mdl-textfield__input write-review-input havedetail" type="text" rows="3" placeholder="Write Your Question Here" id="qa-question1" name="detail"></textarea>
							<!--	<label class="mdl-textfield__label grey-text-lighten-3" for="qa-question"></label>-->
							</div>
							<div  class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label width-100-percent is-upgraded" >
								<input type="text" class="mdl-textfield__input write-review-input havename" placeholder="Name" name="name" id="">
							
								
							</div>
							
							<!--<div  class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label width-100-percent is-upgraded" >
								<input type="email" class="mdl-textfield__input write-review-input haveemail" placeholder="Email" name="email" >
							
								
							</div>-->
							<div  class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label width-100-percent is-upgraded" >
								<input type="text" class="mdl-textfield__input write-review-input havemobile" placeholder="Phone/Whatsapp"  name="mobile">
							
								
							</div>
							<div class="flex-row flex-center space-even">
							<button type="button" id="button-question" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btncom" >Submit</button><button type="button" id="close-question-desktop" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btncom">Close</button>
							</div>
						</form>
					</div>
				</div>
					<?php if(isset($haveaquestion)&& !empty($haveaquestion)){ ?>
				<div id="user-qas-section" class="user-qas-section vertical-scroll">
				<?php foreach($haveaquestion as $questions){ ?>
                              <div class="user-qa-section">
                                 <h3>Q.<?php echo $questions['question']; ?></h3>
                                 <p><?php echo $questions['answer']; ?></p>
                                 <small>Answered on <?php echo $questions['month']; ?></small>
                             </div>
                             <?php } ?>
					<hr>
				</div>
					<?php } ?>
			</div>
		</div>
	</div>	
</div>
<script type="text/javascript">
jQuery('.zoom-gallery .selectors a').on('click touch', function(e) {
var iframe = jQuery('.active iframe[src*="v360"],.active iframe[src*="vimeo"]');
if (iframe.length) {
iframe.attr('src',iframe.attr('src'));
}
jQuery('.zoom-gallery .zoom-gallery-slide').removeClass('active');
jQuery('.zoom-gallery .selectors a').removeClass('active');
jQuery('.zoom-gallery .zoom-gallery-slide[data-slide-id="'+jQuery(this).attr('data-slide-id')+'"]').addClass('active');
jQuery(this).addClass('active');
e.preventDefault();
});

$('#carousel12').owlCarousel({
		items: 5,
		autoPlay: 3000,
		navigation: true,
		navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
		pagination: true
		});
	$('#carousel8').owlCarousel({
						items: 5,
						autoPlay: 3000,
						navigation: true,
						navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
						pagination: true
					});	
		
		$('#carousel10').owlCarousel({
						items: 5,
						autoPlay: 5000,
						navigation: true,
						navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
						pagination: true
					});
					
		$('#carousel6').owlCarousel({
						items: 5,
						autoPlay: 4000,
						navigation: true,
						navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
						pagination: true
					});	
		$('#carousel1').swiper({
						mode: 'horizontal',
						slidesPerView: 1,
						paginationClickable: true,
						nextButton: '.swiper-button-next',
						prevButton: '.swiper-button-prev',
						autoplay: 2500,
						loop: true
					});
		$('#carousel2').owlCarousel({
						items: 5,
						autoPlay: 4000,
						navigation: true,
						navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
						pagination: true
					});	
		$('#carousel3').owlCarousel({
						items: 4,
						autoPlay: 3000,
						navigation: true,
						navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
						pagination: true
					});
	</script>

<script>
		$('.collapse').on('shown.bs.collapse', function(){
		$(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
		}).on('hidden.bs.collapse', function(){
		$(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
		});
		</script>
<script>
$(document).ready(function(){
$(".collapse.in").each(function(){
        	$(this).siblings(".panel-heading").find(".glyphicon").addClass("glyphicon-minus").removeClass("glyphicon-plus");
        });
        
        // Toggle plus minus icon on show hide of collapse element
        $(".collapse").on('show.bs.collapse', function(){
        	$(this).parent().find(".glyphicon").removeClass("glyphicon-plus").addClass("glyphicon-minus");
        }).on('hide.bs.collapse', function(){
        	$(this).parent().find(".glyphicon").removeClass("glyphicon-minus").addClass("glyphicon-plus");
        });	
	
	
	
$(".blue-text").click(function(){
    $(".mdl-cell").toggle();
});	
	
$(".ask-ques-button1").click(function(){
	$(".have-a-qstn").toggle();
});
$("#close-question-desktop").click(function(){
	$(".have-a-qstn").hide();
});
$("#write-review-btn").click(function(){
    $("#write-review-form-container1").toggle();
});
$("#write-review-btn1").click(function(){
    $("#write-review-form-container1").toggle();
});
$("#close-review").click(function(){
    $("#write-review-form-container1").hide();
});
$("#mclose-review").click(function(){
    $(".mwritereview").hide();
});
$(".ask-ques-button2").click(function(){
$("#write-qa-form-container").toggle();
});
$("#close-question").click(function(){
	$("#write-qa-form-container").hide();
});
	
});
					 
					 
</script>			
					
					
					
			
								
			
                  
                                                                                                  
            
	<script type="text/javascript"><!--
$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#form-review span.title').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#form-review span.title').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('input[name=\'email\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'qua-rating\']:checked').prop('checked', false);
				$('input[name=\'price-rating\']:checked').prop('checked', false);
			}
		}
	});
});

$('#mbutton-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/mwrite&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#write-review-form").serialize(),
		beforeSend: function() {
			$('#mbutton-review').button('loading');
		},
		complete: function() {
			$('#mbutton-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#write-review-form').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#write-review-form').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'mname\']').val('');
				$('input[name=\'memail\']').val('');
				$('textarea[name=\'mtext\']').val('');
				$('input[name=\'mrating\']:checked').prop('checked', false);
				$('input[name=\'name\']').val('');
				$('input[name=\'email\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'qua-rating\']:checked').prop('checked', false);
				$('input[name=\'price-rating\']:checked').prop('checked', false);
				
				//$('input[name=\'qua-rating\']:checked').prop('checked', false);
				//$('input[name=\'price-rating\']:checked').prop('checked', false);
			}
		}
	});
});


$('#button-question').on('click', function() {
$.ajax({
    url:'index.php?route=product/product/havaquestion&product_id=<?php echo $product_id; ?>',
   
    type: 'post',
		dataType: 'json',
		data: $("#qas-form2").serialize(),
		beforeSend: function() {
			$('#button-question').button('loading');
		},
		complete: function() {
			$('#button-question').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#qas-form2 span.title').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#qas-form2 span.title').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'mobile\']').val('');
				$('input[name=\'name\']').val('');
				//$('input[name=\'email\']').val('');
				$('textarea[name=\'detail\']').val('');
				$('#qa-question').val('');
				$('#qa-question1').val('');
				
				
			}
		}
      })
});

$('#mbutton-question').on('click', function() {
$.ajax({
    url:'index.php?route=product/product/mhavaquestion&product_id=<?php echo $product_id; ?>',
   
    type: 'post',
		dataType: 'json',
		data: $("#qas-form1").serialize(),
		beforeSend: function() {
			$('#mbutton-question').button('loading');
		},
		complete: function() {
			$('#mbutton-question').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#qas-form1 span.title').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#qas-form1 span.title').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'mobile\']').val('');
				$('input[name=\'name\']').val('');
			//	$('input[name=\'email\']').val('');
				$('textarea[name=\'text\']').val('');
				$('.havedetail').val('');
				
				$('input[name=\'mobile\']').val('');
				$('input[name=\'name\']').val('');
			//	$('input[name=\'email\']').val('');
				$('.mhavedetail').val('');
				$('.mhavename').val('');
				$('.mhaveemail').val('');
				$('.mhavename').val('');
				$('.mhavemobile').val('');
				
				
				//$('textarea[name=\'text\']').val('');
				
			}
		}
      })
});












</script>
	
	
	
<script type="text/javascript">/*<![CDATA[*/var google_tag_params={ecomm_prodid:<?php echo $product_id; ?>,ecomm_pagetype:"product",ecomm_totalvalue:parseFloat("<?php echo $special1; ?>")};/*]]>*/</script>
<script type="text/javascript">$("select[name='recurring_id'], input[name=\"quantity\"]").change(function(){$.ajax({url:"index.php?route=product/product/getRecurringDescription",type:"post",data:$("input[name='product_id'], input[name='quantity'], select[name='recurring_id']"),dataType:"json",beforeSend:function(){$("#recurring-description").html("")},success:function(a){$(".alert, .text-danger").remove();if(a.success){$("#recurring-description").html(a.success)}}})});</script>
<script type="text/javascript">/*<![CDATA[*/function addTOcart(){
	
	<?php if($logged){ ?>
	
    
 (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'first_name':'<?php echo  $firstname; ?>','total_items':1, 'product_name':'<?php echo $heading_title; ?>','image':'<?php echo $thumb; ?>'}]);
	
	<?php } else { ?>
	
  
 (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'product_name':'<?php echo $heading_title; ?>','image':'<?php echo $thumb; ?>','total_items':1 }]);
	
	<?php } ?>

	
	
	

	$.ajax({url:"index.php?route=checkout/cart/add",type:"post",data:$("#product input[type='text'], #product input[type='hidden'], #product input[type='radio']:checked, #product input[type='checkbox']:checked, #product select,#size_1060584303 select, #product textarea"),dataType:"json",beforeSend:function(){$("#button-cart").button("loading")},
	complete:function(){
		$("#button-cart").button("reset");
		},
	success:function(b){
		$(".alert, .text-danger").remove();
	$(".form-group").removeClass("has-error");
	
	
	if(b.error){
		if(b.error["option"]){
			for(i in b.error["option"]){
				var a=$("#input-option"+i.replace("_","-"));
				if(a.parent().hasClass("input-group")){
					a.parent().after('<div class="alert alert-danger">'+b.error["option"][i]+"</div>");
					}else{
		
		$(".taxon_size_chart1 ").before('<div class="alert alert-danger sizeerror"><b>'+b.error["option"][i]+"</b></div>");
		$('html, body').animate({scrollTop:$(".sizeerror").offset().top-220},500);
		}}}
		
		
		if(b.error["recurring"]){$("select[name='recurring_id']").after('<div class="text-danger">'+b.error["recurring"]+"</div>")}$(".text-danger").parent().addClass("has-error")}
		
		
		
		
		if(b.success){$(".breadcrumb").after('<div class="alert alert-success">'+b.success+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');$("#cart > button").html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> '+b.total+"</span>");$("html, body").animate({scrollTop:0},"slow");$("#cart > span").load("index.php?route=common/cart/info span a")}},error:function(c,a,b){alert(b+"\r\n"+c.statusText+"\r\n"+c.responseText)}});
	
	}
	
	
	
	$("#buy-now-btn1").on("click",function(){
	
	<?php if($logged){ ?>
	
    
 (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'first_name':'<?php echo  $firstname; ?>','total_items':1, 'product_name':'<?php echo $heading_title; ?>','image':'<?php echo $thumb; ?>'}]);
	
	<?php } else { ?>
	
   
 (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'product_name':'<?php echo $heading_title; ?>','image':'<?php echo $thumb; ?>' }]);
	
	<?php } ?>
	
	
		
		$.ajax({url:"index.php?route=checkout/cart/add",type:"post",data:$("#product input[type='text'], #product input[type='hidden'], #product input[type='radio']:checked,#size_1060584303 select, #product input[type='checkbox']:checked,  #product textarea"),dataType:"json",beforeSend:function(){$("#buy-now-btn1").button("loading")},complete:function(){$("#buy-now-btn1").button("reset")},success:function(b){$(".alert, .text-danger").remove();$(".form-group").removeClass("has-error");
		
		
			if(b.error){
		if(b.error["option"]){
			for(i in b.error["option"]){
				var a=$("#input-option"+i.replace("_","-"));
				if(a.parent().hasClass("input-group")){
					a.parent().after('<div class="alert alert-danger">'+b.error["option"][i]+"</div>");
					}else{
		
		$(".taxon_size_chart1 ").before('<div class="alert alert-danger sizeerror"><b>'+b.error["option"][i]+"</b></div>");
		$('html, body').animate({scrollTop:$(".sizeerror").offset().top-220},500);
		}}}
		
		
		if(b.error["recurring"]){$("select[name='recurring_id']").after('<div class="text-danger">'+b.error["recurring"]+"</div>")}$(".text-danger").parent().addClass("has-error")}
		
		
		
		if(b.success){window.location="index.php?route=checkout/cart";$(".breadcrumb").after('<div class="alert alert-success">'+b.success+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
		$("#cart > button").html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> '+b.total+"</span>");$("html, body").animate({scrollTop:0},"slow");
		$("#cart > span").load("index.php?route=common/cart/info span a")}},error:function(c,a,b){alert(b+"\r\n"+c.statusText+"\r\n"+c.responseText)}});
	});
	</script>
      <script>

$('#NotifyWhenAvailableSubmit').on('click', function(){ 

	$('input#NWAYourName').removeClass("NWA_popover_field_error");
	$('input#NWAYourEmail').removeClass("NWA_popover_field_error");
	$('div.NWAError').remove();

	var email_validate = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	if ((document.getElementById("NWAYourName").value == 0) )
	{
		  $('input#NWAYourName').addClass("NWA_popover_field_error");
		  $('input#NWAYourName').after('<div class="NWAError">This field is required!</div>');
	} else
		if ((document.getElementById("NWAYourEmail").value.length == 0)) {
		  $('input#NWAYourEmail').addClass("NWA_popover_field_error");
		  $('input#NWAYourEmail').after('<div class="NWAError">This field is required!</div>');
	} else if (!document.getElementById("NWAYourEmail").value.match(email_validate)) {
		  $('input#NWAYourEmail').addClass("NWA_popover_field_error");
		  $('input#NWAYourEmail').after('<div class="NWAError">The email you entered is not valid!</div>');
	} else {
		$.ajax({
			url: 'index.php?route=extension/module/notifywhenavailable/submitform',
			type: 'post',
			data:$("#product input[type='text'], #product input[type='hidden'], #product input[type='radio']:checked,#size_1060584303 select, #product input[type='checkbox']:checked,  #product textarea"),
			beforeSend: function(){
				  $('#NotifyWhenAvailableSubmit').hide();
				  $('.NWA_loader').show();
    		},
			success: function(response) {
				$('.NWA_loader').hide();
			//	$('#NotifyWhenAvailableSubmit').hide();
				$('#NotifyWhenAvailableSuccess').html("<div class='alert alert-success nwa-success' style='display: none;'><i class='fa fa-check-circle'></i>&nbsp;Success! You will be notified as soon as the product is in stock!</div>");
				$('.nwa-success').fadeIn('slow');
				$('#NWAYourName').val('');
				$('#NWAYourEmail').val('');
			}
		});
	}
});
</script>             

<?php echo $footer; ?>
