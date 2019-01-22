<?php echo $header; ?>

<!--<script type="text/javascript" src="https://cdn.rawgit.com/leafo/sticky-kit/v1.1.2/jquery.sticky-kit.js
"></script>-->

<script type="text/javascript" src="https://ornate-bc57.kxcdn.com/dist/xzoom.min.js" defer></script>
<!--<link rel="stylesheet" type="text/css" href="https://ornate-bc57.kxcdn.com/css/xzoom.css" media="all" />-->
<script type="text/javascript" src="https://ornate-bc57.kxcdn.com/hammer.js/1.0.5/jquery.hammer.min.js" defer></script>
<script type="text/javascript" src="https://ornate-bc57.kxcdn.com/fancybox/source/jquery.fancybox.js" defer></script>
<script type="text/javascript" src="https://ornate-bc57.kxcdn.com/magnific-popup/js/magnific-popup.js" defer></script> 

<style>

.pin-check {
    background: #670067;
    font-size: 1.125rem;
    color: #fff;
    padding: 5px;
    /* display: block; */
    border: none;
    cursor: pointer;
    /* width: 100%; */
    text-transform: uppercase;
}

.check {
    background: #670067;
    font-size: 1.125rem;
    color: #fff;
    padding: 5px;
    /* display: block; */
    border: none;
    cursor: pointer;
    /* width: 100%; */
    text-transform: uppercase;
}
.icon-bar a img{
				width:50px;
			}

</style>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
 <?php echo $column_left; ?>
    
    <div id="content row" ><?php echo $content_top; ?>
     
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="col-sm-6 col-md-6">
			
			<div class="product-slider-box">
				<div class="product-slider clearfix">
					<ul class="slides ">
					
					
					<li data-thumb="<?php echo $thumb; ?>" >
					<img class="xzoom" id="xzoom-default" src="<?php echo $thumb; ?>" xoriginal="<?php echo $image1; ?>" alt="<?php echo $alt; ?>" style=""/>
					</li>
					
					<?php foreach ($images as $image) { ?>
				
					<li data-thumb="<?php echo $image['thumb']; ?>">
					 <img class="" src="<?php echo $image['thumb']; ?>" alt="<?php echo $image['image_alt']; ?>"  />
					</li>
					
						
						
					<?php } ?>
					
					<?php if(isset($video_url ) && !empty ($video_url)){   ?>
<li data-thumb="https://ornate-bc57.kxcdn.com/images/360.jpg">


	
	
<div id="v360-box" style="max-width: 800px; display: block;">
            <iframe class="embed" src="<?php echo $video_url; ?>" height="400" width="400" scrolling="no" frameborder="1" style="width: 100%; border-width: 0px; border-style: solid; border-color: initial; border-image: initial; "></iframe>
        </div>
	

</li>
<?php } ?>
		<li data-thumb="https://ornate-bc57.kxcdn.com/image/cache/catalog/2-400x400.jpg">
						<img src="https://ornate-bc57.kxcdn.com/image/cache/catalog/2-400x400.jpg" alt="box"/>
						</li>
						<li data-thumb="https://ornate-bc57.kxcdn.com/image/cache/catalog/certificate-400x400.jpg">
						<img src="https://ornate-bc57.kxcdn.com/image/cache/catalog/certificate-400x400.jpg" alt="certificate"/>
						</li>
					</ul>
				</div>
				 <div class=" col-md-3"></div>
				 
				 <div class=" col-md-9">
				 <script src="//s7.addthis.com/js/250/addthis_widget.js" async="async"></script>
				
				<ul class="share-list">
					<li class="title">Share it</li>
					<li><a class="addthis_button_whatsapp at300b" href="javascript:void(0)"><i class="fa fa-whatsapp" aria-hidden="true"></i></a></li>
					<li><a class="addthis_button_facebook at300b" href="javascript:void(0)" title="Facebook"><i class="fa fa-facebook addthis_button_facebook" aria-hidden="true"></i></a></li>
					<li><a class="addthis_button_twitter at300b" href="javascript:void(0)"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
					<li><a class="addthis_button_google-plus at300b" href="javascript:void(0)"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
				</ul>
				</div>
			</div>
			</div></div>
       
        <div class="col-sm-6 col-md-6">
         
         
          
		    <div class="product-detail">
			  <p class="heading"><?php echo $heading_title; ?></p>
			  <span class="subhead">Product Code: <?php echo $model; ?></span>
			 
			  <a class="rating inline" href="#inline_content"><span class="subhead" style="margin-left:85px;"><?php if ($rating) { ?> <?php for ($i = 1; $i <= 5; $i++) { ?><?php if ($rating < $i) { ?> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack"></i></span> <?php } else { ?><span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span><?php } ?> <?php } ?> <?php } ?></i>(Write a review)</span></a>
			  
			  
			    <div >
				 
				  <table style="width:100%">
					  <tbody>
						  <tr>
							  <td class="golden_color tabtitle" style="">Price:</td>
							  <td width="70%">
								
								<?php if($new_arrival==1){ ?>
								<div class="price-box">
								<p class="special-price" style="padding-left:0px;">
										<span class="price-label" >Price</span>
										<span class="" id="product-price-60393" style="color:#414141;font-weight:600;"><?php echo $special; ?> </span>
									</p>
								</div>
								<?php } else { ?>
								
								
								<div class="price-box">
									<p class="old-price">
										<span class="price-label">Regular Price:</span>
										<span class="" style="color: #a0a0a0;text-decoration: line-through;" id="old-price-60393"> <?php echo $price; ?> </span>
									</p>
									<p class="special-price">
										<span class="price-label">Discount</span>
										<span class="" id="product-price-60393" style="color:#ec524f;font-weight:600;"><?php echo $special; ?> </span>
									</p>
								</div>
								<?php } ?>
								<?php if($parent_category==1) { ?>
								
								<?php if($new_arrival_category!=1){ ?>
								
								<span style="color:#505050; /*font-size: 16px;*/text-align: center;"> 70% Off </span>
								
								<?php }else { ?>
								
								
								
								
								<span style="color:#505050; /*font-size: 16px;*/text-align: center;">You Saved Rs <?php echo $discount_price; ?></span>
								
								<?php } ?>
								<?php } ?>
								<meta itemprop="priceCurrency" content="INR">
								<meta itemprop="availability" content="http://schema.org/InStock">
								</td>
							</tr>
						</tbody>
					</table>
					<table style="width:100%;margin-top:15px">
						<tbody>
							<tr>
								<td class="golden_color title" style="float:left">Metal:</td>
								<td class="golden_color title" style="width:70%;text-align:left">925 Sterling Silver</td>
							</tr>
						</tbody>
					</table>
					<div id="product">
					<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" /> 
					
						<table style="margin-top: 10px;width: 100%;">
	<tbody>
	   <?php if ($options) { ?>
            <!--<h3><?php // echo $text_option; ?></h3>-->
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
	<tr id="size_1060584303">
        <td style="width: 30%;text-align:left;" class="golden_color title"><label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label></td>
		<td style="width: 35%;float: left;">
		<span class="935339138">
			
			<select class="form-control <?php echo ($option['required'] ? ' required' : ''); ?> radio_gds_size gds_variation navrang_outlne navrang_border_color" name="option[<?php echo $option['product_option_id']; ?>]"  style="width:auto;text-transform: capitalize;" id="size_select2_1060584303">
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
         </td>
    </tr>
	<tr style="width: 100%;">
                              <td style="width:30%;"></td>
                            <td class="right_column">
                                            <div class="taxon_size_chart1 golden_color clickable" style="padding-top:10px;text-decoration: underline; display: inline-block;"> <a href="https://www.ornatejewels.com/pdf/ring-size-new-2018.pdf" target="_blank">Know Your Ring's Size</a>
                                             </div>
                              </td>
							  
                            </tr>
							
							<?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>                    
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>

    </tbody>
</table>
						<table class="quantity_variant" style="width:100%;margin-top:18px;margin-bottom:20px">
							<tbody>
								<tr class="quantity_variant_qty golden_color">
									<td class="tabtitle" style="width:30%">Quantity:</td>
									<td class="right_column" style="width:70%;display:inline-flex">
										<div id="sel2" style="position:relative;width:31%;height:20px">
											<select class="form-control cart_qauntity" name="quantity">
												<option value="1" selected="">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</div>
											<?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
						
                        <div class="pdp-qty-left golden_color" id="prod_left_txt"><a class="youtube" href="https://www.youtube.com/embed/lrUIL7rrTUw?rel=0&amp;showinfo=0" >Ring Size Video</a></div>
						<?php } } ?>
										
										
										
										
										<input type="number" name="quantity" id="quantity" value="1" class="title" style="display:none" min="1" max="1">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<table class="cart_table" style="width:100%;margin-top:35px">
						
						<?php if($soldout==1){ ?>
						
						<tbody>
							<tr>
								<td style="width:50%">
									<button name="button" id="button-cart"  class="my-btn-new my-btn-primary-new" data-loading-text="Loading..." >
										<span class="text" style="color:#fff;">Sold Out</span>
									</button>
								
									<div id="shop_more_button" style="display:none">
										<button type="button" onclick="continue_shop(event)" class="my-btn-new add_cart_new add_cart_new_studio my-btn-primary-new" style="padding-left:27px;height:40px;width:98%">Continue Shopping
										</button>
									</div>
								</td>
								<td style="width:50%">
									<span class="request-back">
									   <a href="#request" class="inline my-btn-new cboxElement">CALL ME</a>
									</span>
								</td>
							</tr>
						</tbody>
						
						<?php } else { ?>
						
						<tbody>
							<tr>
								<td colspan="2" style="padding-bottom:8px">
									<button name="button" type="submit" class="my-btn-new my-btn-primary-new" onclick="buynow()" data-loading-text="Loading..." id="button-buy" style="width:100%;height:40px;position:relative">
										<span class="buy_image_new buy_image_new_studio buy_image_space"></span>
										<span class="text" style="color:#fff;">Buy Now</span>
									</button>
								</td>
							</tr>
							<tr>
								<td style="width:50%">
									<button name="button" id="button-cart" onclick="addTOcart()" class="my-btn-new my-btn-primary-new" data-loading-text="Loading..." >
										<span class="text" style="color:#fff;">Add To Cart</span>
									</button>
								
									<div id="shop_more_button" style="display:none">
										<button type="button" onclick="continue_shop(event)" class="my-btn-new add_cart_new add_cart_new_studio my-btn-primary-new" style="padding-left:27px;height:40px;width:98%">Continue Shopping
										</button>
									</div>
								</td>
								<td style="width:50%">
									<span class="request-back">
									   <a href="#request" class="inline my-btn-new cboxElement">CALL ME</a>
									</span>
								</td>
							</tr>
						</tbody>
						
						
						
						
						<?php } ?>
					</table>
					
						
					
					 <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="panel-title expand">
        <!--<h4 data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="panel-title expand">-->
           <div class="right-arrow pull-right">+</div>
          <a href="#">Delivery &amp; Returns</a>
        <!--</h4>-->
      </div>
      <div id="collapse1" class="panel-collapse collapse">
        <div class="panel-body">
			<span class="delievrt-text"> <i class="fa fa-truck"></i></i> <b>Delivery Within 4-7 Working Days.</b></span>
			<p><b>Ships within 24 hours </b></p>
			<p>Product can be returned within 7 days from the date the item is delivered to you. For more information, please check our return policy.</p>
			<table style="width:100%">
				<tbody>
				
					<tr>
						<form method="POST" id="pincheck1" <?php if(isset($_SESSION['pincode'])){ echo "style='display:none;'";}?>>
						<td style="padding-left:0;margin-right:-15px;padding-top:5px"></td>
						<td class="pincodecheck"><input class="form-control navrang_outlne navrang_border_color" id="pin1" placeholder="Enter Your Pincode" is="null" <?php if(isset($_SESSION['pincode'])){ echo "style='display:none;'";}?> type="text" maxlength="6" onkeypress="return isNumberKey(event)" style="border:0;border-bottom:1px solid #969696;border-radius:0"></td>
						<td class="pincodecheck" id="checkbtn" <?php if(isset($_SESSION['pincode'])){ echo "style='display:none;'";}?>><input type="button" onclick="getdata1()" value="Check" class="check" style="border:1px solid #969696r;" ></td>
						</form>
						<div id="msg1" >
							<?php
							if(isset($_SESSION['pincode'])){
									echo "<div id='msg' class=''><label><img src='image/pincode/l.png' width='15' height='15' alt='pincode'>Delivery option for: ".$_SESSION['pincode']."  </label><form style='display: inline;'><input type = 'button'  onclick = 'showform1()' value='Change' class='pin-check form-control' /></form><br/>";
								

									
									echo $_SESSION['pin_check_result']."<br />";
									
									echo "</font></font><br /></div>";
							 }
							?>
						</div>
						
						
						
					</tr>
					
				</tbody>
			</table>
		</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="panel-title expand">
	  <div class="right-arrow pull-right">+</div>
          <a href="#">Product Details</a>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
			
			<p><?php echo $description; ?></p>
			
			<ul>
				 <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <li> <?php echo $option['name']; ?>:<span style="padding: 10px;"><?php echo $option['value']; ?></span></li>
                                        <?php } ?>
                                    <?php } ?>
			    
			</ul>
		</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="panel-title expand">
        <!--<h4 data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="panel-title expand">-->
            <div class="right-arrow pull-right">+</div>
          <a href="#">Product Care</a>
       <!-- </h4>-->
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">
			<ul>
				<li>Keep your jewels safe in our box </li>
				<li>When storing jewelry make sure it doesn’t rub against other jewelry </li>
				<li>Though our jewelry doesn't turn black it is recommended to keep it away from water chemicals, soap etc.</li>
				<li>925 Guaranteed Silver Won't Turn Black</li>
			</ul>
		</div>
      </div>
    </div>
	<div class="panel panel-default">
      <div data-toggle="collapse" data-parent="#accordion" href="" class="panel-title expand">
			
          <a href="#">925 Guaranteed Silver Won't Turn Black </a>
        <!--</h4>-->
      </div>
      
    </div>
</div> 

<!--<div class="col-md-12">-->
						<div class="icon-bar">
							<a onclick="wishlist.add('<?php echo $product_id; ?>')"><img src="https://ornate-bc57.kxcdn.com/images/icon/icon1.png" alt="Wishlist"><p> Add to Wishlist</p></a>
							<a><img src="https://ornate-bc57.kxcdn.com/images/icon/icon2.png" alt="Gift Wrap"><p>Gift Wrap Available</p></a>
							<a><img src="https://ornate-bc57.kxcdn.com/images/icon/icon.png" alt="Delivery"><p>4-7 Days Delivery</p></a>
							<a><img src="https://ornate-bc57.kxcdn.com/images/icon/icon4.png" alt="Easy Returns"><p>Easy Returns </p></a>
							<a><img src="https://ornate-bc57.kxcdn.com/images/icon/icon5.png" alt="pure silver"><p>100% Pure Silver</p></a>
						</div>
					<!--</div>-->
		       </div>
            </div>
		  </div>
     </div>
<?php if($products){ ?>
	<div class="container">
	<div class="related-main" style="">      
    <div class="page-head">
        <h2><span>Related <strong>Products</strong></span></h2>
    </div>
    <div class="flexslider-car">
        <ul class="slides clearfix" >
						
						<?php foreach ($products as $product) { ?>
                                        <li>
                                            <a href="<?php echo $product['href']; ?>" class="related-coloum">
                                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                                                <p><?php echo $product['name']; ?></p>
                                                <span class="price-discount">
                                                    <?php if(!$product['special']){ echo $product['price']; }else{ echo $product['special']; } ?>
													<?php if($product['category_id_new_arrical_related']!=true){ ?>
													
													<small>(<?php echo $product['discount_persent']; ?>% Off)</small>
													
													<?php } ?>
                                                </span>
                                            </a>
                                        </li>
                                    <?php } ?></ul>
    </div>
</div>
	</div>
<?php } ?>
      
	  
	  <div style='display:none'> <!-- popup start here -->
            <div id='inline_content'>
                <form class="popup" id="form-review">
                    <span class="title">Write a Review</span>  
                    <div class="clearfix">
                        <div class="one-half">
                            <label>Name*</label>
                            <input type="text" name="name" placeholder="Your Full Name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                            <label>Email*</label>
                            <input type="email" name="email" placeholder="Your Email Address" value="<?php echo $customer_email; ?>" id="input-email" class="form-control">
                        </div>
                        <div class="rating-box">
                            <div class="clearfix"><span>Appearance:* </span>         
                                <fieldset class="rating">
                                    <input type="radio" id="star5" class="appearance" name="rating" value="5" /><label class = "" for="star5"></label>
                                    <input type="radio" id="star4" class="appearance" name="rating" value="4" /><label class = "" for="star4" ></label>
                                    <input type="radio" id="star3" class="appearance" name="rating" value="3" /><label class = "" for="star3" ></label>
                                    <input type="radio" id="star2" class="appearance" name="rating" value="2" /><label class = "" for="star2" ></label>
                                    <input type="radio" id="star1" class="appearance" name="rating" value="1"  /><label class = "" for="star1" ></label>
                                </fieldset>
                            </div>

                            <div class="clearfix"><span>Quality:*</span>
                                <fieldset class="rating">
                                    <input type="radio" id="qua-star5" class="quality" name="qua-rating" value="5" /><label class = "" for="qua-star5"></label>
                                    <input type="radio" id="qua-star4" class="quality" name="qua-rating" value="4" /><label class = "" for="qua-star4" ></label>
                                    <input type="radio" id="qua-star3" class="quality" name="qua-rating" value="3" /><label class = "" for="qua-star3" ></label>
                                    <input type="radio" id="qua-star2" class="quality" name="qua-rating" value="2" /><label class = "" for="qua-star2" ></label>
                                    <input type="radio" id="qua-star1" class="quality" name="qua-rating" value="1"  /><label class = "" for="qua-star1" ></label>
                                </fieldset>
                            </div>

                            <div class="clearfix"><span>Price:* </span>         
                                <fieldset class="rating">
                                    <input type="radio" id="price-star5" class="price" name="price-rating" value="5" /><label class = "" for="price-star5"></label>
                                    <input type="radio" id="price-star4" class="price" name="price-rating" value="4" /><label class = "" for="price-star4" ></label>
                                    <input type="radio" id="price-star3" class="price" name="price-rating" value="3" /><label class = "" for="price-star3" ></label>
                                    <input type="radio" id="price-star2" class="price" name="price-rating" value="2" /><label class = "" for="price-star2" ></label>
                                    <input type="radio" id="price-star1" class="price" name="price-rating" value="1"  /><label class = "" for="price-star1" ></label>
                                </fieldset>
                            </div>


                        </div>      
                    </div>
                    <div class="one-full">
                        <label>Message*</label>
                        <textarea name="text" class="form-control" id="input-review" placeholder="Your Reviews"></textarea>
                    </div>
                    <div class="clearfix">
					<!--<div class="captcha one-half">
                               
                        </div>-->
                        <!--<div class="one-half">
                            <label>Enter Code*</label>
                            <input type="text" name="code" placeholder="Your Full Name" class="form-control pr">
                            <div class="code">
                                6931 
                            </div>
                        </div>-->
                        <div class="rating-box bg-none">
                            <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btncom"><?php echo $button_continue; ?></button>
<!--                            <button class="submit">Submit</button>-->
<button class="btncom" onclick="$.colorbox.close(); return false;">Cancel</button>

                        </div>
                    </div>            
                </form>  
            </div>
        </div>
	  
	  
      <?php echo $content_bottom; ?>
	  
	  
	
    <?php echo $column_right; ?>
</div>

<?php if($rating!=0) { ?>
	<script type="application/ld+json">
			{
			  "@context": "http://schema.org",
			  "@type": "Product",
			  "aggregateRating": {
				"@type": "AggregateRating",
				"ratingValue": "<?php echo $rating;?>",
				"reviewCount": "<?php echo preg_replace('/\D/', '', $reviews);?>"
			  },
			  "description": "<?php echo $product['description']; ?>",
			  "name": "<?php echo $product['name']; ?>",
			  "image": "<?php echo $thumb; ?>",	
				<?php if(!empty($reviewss)){ ?>
			  "review":       
				<?php foreach($reviewss as $review) { ?>
				{
				  "@type": "Review",
				  "author": "<?php echo $review['author'];?>",
				  "datePublished": "<?php echo $review['date_added'];?>",
				  "description": "<?php echo $review['text'];?>",
				  "name": "<?php echo $review['author'];?>",
				  "reviewRating": {
					"@type": "Rating",
					"bestRating": "5",
					"ratingValue": "<?php echo $review['rating'];?>",
					"worstRating": "1"
				  }
				}	     
				<?php }} ?>
			}
			  
			
		</script>
	<?php } ?>




<script type="text/javascript">/*<![CDATA[*/var google_tag_params={ecomm_prodid:<?php echo $product_id; ?>,ecomm_pagetype:"product",ecomm_totalvalue:parseFloat("<?php echo $special1; ?>")};/*]]>*/</script>
<script type="text/javascript">$("select[name='recurring_id'], input[name=\"quantity\"]").change(function(){$.ajax({url:"index.php?route=product/product/getRecurringDescription",type:"post",data:$("input[name='product_id'], input[name='quantity'], select[name='recurring_id']"),dataType:"json",beforeSend:function(){$("#recurring-description").html("")},success:function(a){$(".alert, .text-danger").remove();if(a.success){$("#recurring-description").html(a.success)}}})});</script>
<script type="text/javascript">/*<![CDATA[*/function addTOcart(){
	<?php if($logged){ ?>
	
    
 (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'first_name':'<?php echo  $firstname; ?>','total_items':1, 'product_name':'<?php echo $heading_title; ?>','image':'<?php echo $thumb; ?>'}]);
	
	<?php } else { ?>
	
  
 (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'product_name':'<?php echo $heading_title; ?>','image':'<?php echo $thumb; ?>','total_items':1 }]);
	
	<?php } ?>
	
	
	
	$.ajax({url:"index.php?route=checkout/cart/add",type:"post",data:$("#product input[type='text'], #product input[type='hidden'], #product input[type='radio']:checked, #product input[type='checkbox']:checked, #product select,#size_1060584303 select, #product textarea"),dataType:"json",beforeSend:function(){$("#button-cart").button("loading")},complete:function(){$("#button-cart").button("reset")},success:function(b){$(".alert, .text-danger").remove();$(".form-group").removeClass("has-error");if(b.error){if(b.error["option"]){for(i in b.error["option"]){var a=$("#input-option"+i.replace("_","-"));if(a.parent().hasClass("input-group")){a.parent().after('<div class="alert alert-danger">'+b.error["option"][i]+"</div>")}else{$(".taxon_size_chart1 ").before('<div class="alert alert-danger"><b>'+b.error["option"][i]+"</b></div>")}}}if(b.error["recurring"]){$("select[name='recurring_id']").after('<div class="text-danger">'+b.error["recurring"]+"</div>")}$(".text-danger").parent().addClass("has-error")}if(b.success){$(".breadcrumb").after('<div class="alert alert-success">'+b.success+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');$("#cart > button").html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> '+b.total+"</span>");$("html, body").animate({scrollTop:0},"slow");$("#cart > span").load("index.php?route=common/cart/info span a")}},error:function(c,a,b){alert(b+"\r\n"+c.statusText+"\r\n"+c.responseText)}})}$("#button-buy").on("click",function(){
		<?php if($logged){ ?>
	
    
 (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'first_name':'<?php echo  $firstname; ?>','total_items':1, 'product_name':'<?php echo $heading_title; ?>','image':'<?php echo $thumb; ?>'}]);
	
	<?php } else { ?>
	
   
 (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'product_name':'<?php echo $heading_title; ?>','image':'<?php echo $thumb; ?>' }]);
	
	<?php } ?>
		
		$.ajax({url:"index.php?route=checkout/cart/add",type:"post",data:$("#product input[type='text'], #product input[type='hidden'], #product input[type='radio']:checked,#size_1060584303 select, #product input[type='checkbox']:checked,  #product textarea"),dataType:"json",beforeSend:function(){$("#button-buy").button("loading")},complete:function(){$("#button-buy").button("reset")},success:function(b){$(".alert, .text-danger").remove();$(".form-group").removeClass("has-error");if(b.error){if(b.error["option"]){for(i in b.error["option"]){var a=$("#input-option"+i.replace("_","-"));if(a.parent().hasClass("input-group")){a.parent().after('<div class="alert alert-danger">'+b.error["option"][i]+"</div>")}else{$(".taxon_size_chart1 ").before('<div class="alert alert-danger"><b>'+b.error["option"][i]+"</b></div>")}}}if(b.error["recurring"]){$("select[name='recurring_id']").after('<div class="text-danger">'+b.error["recurring"]+"</div>")}$(".text-danger").parent().addClass("has-error")}if(b.success){window.location="checkout";$(".breadcrumb").after('<div class="alert alert-success">'+b.success+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');$("#cart > button").html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> '+b.total+"</span>");$("html, body").animate({scrollTop:0},"slow");$("#cart > span").load("index.php?route=common/cart/info span a")}},error:function(c,a,b){alert(b+"\r\n"+c.statusText+"\r\n"+c.responseText)}})});/*]]>*/</script>


<script type="text/javascript"><!--

//--></script>
	
	


<script type="text/javascript"><!--
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

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
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

//-->
     
	 
	  
       // $('.xzoom2, .xzoom-gallery2').xzoom({position: '#xzoom2-id', tint: '#ffa200'});
	 </script>
	 <script type="text/javascript">
					function getdata1(){
						var pin = $("#pin1").val();
						if(pin != ''){
							$.ajax({
								type: "POST",
								url: "?route=product/product/pinCheck",
								data: {pincode: pin},
								dataType : "text"
							}).done(function( result ) 
							{
								$("#msg1").show();
								$("#msg1").html( result );
								$("#pincheck1").hide();
								
							});
						}
						else{
							alert('Please enter a valid Pincode');
						}
					}
					function showform1(){
						$("#msg1").hide();
						$("#pincheck1").show();
						$("#pin1").show();
						$("#checkbtn").show();
						
						
						
					}
				</script>
	   <script src="https://ornate-bc57.kxcdn.com/js/foundation.min.js" defer></script>
<script src="https://ornate-bc57.kxcdn.com/js/setup.js" defer></script>
	<!--<script src="https://ornate-bc57.kxcdn.com/catalog/view/javascript/js/common.js" ></script>-->
<?php echo $footer; ?>
