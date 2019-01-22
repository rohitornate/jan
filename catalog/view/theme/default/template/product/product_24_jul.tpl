<?php echo $header; ?>

<div class="product-detail-main"> <!--main start here -->
            <div class="container">  <!--container start here -->    
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul> <!--breadcrumb end  here -->
                <div class="clearfix product-detail-box">   <!--product-detail-box start here -->  
                    <div class="product-slider-box">
                        <div class="product-slider clearfix">
                           
                            <ul class="slides">
                                <?php  if ($thumb) { ?>
                                    <li data-thumb="<?php echo $thumb; ?>">
                                        <img src="<?php echo $thumb; ?>" />
                                    </li>
                                <?php } ?>
                                <?php if ($images) { ?>
                                    <?php foreach ($images as $image) { ?>
                                        <li data-thumb="<?php echo $image['thumb']; ?>">
                                            <img src="<?php echo $image['popup']; ?>" />
                                        </li>
                                    <?php } ?>
                                <?php } ?>

                            </ul>
                        </div>
                        
<!--                          AddThis Button BEGIN 
            <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
             AddThis Button END -->
<!--             <ul>
                    <li><a class="addthis_button_facebook at300b" href="javascript:void(0);" title="Facebook"><i class="share-fb"></i></a></li>
                    <li> <a class="addthis_button_twitter at300b" href="javascript:void(0);" title="Tweet"><i class="share-twitter"></i></a></li>
                    <li> <a class="addthis_button_pinterest at300b" href="javascript:void(0);" title="pinterest"><i class="share-pinterest"></i></a></li>
                    <li> <a class="addthis_button_google_plusone_share at300b" href="javascript:void(0);" title="gplus"><i class="share-gplus"></i></a></li>
                </ul>-->

                <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
               
                        <ul class="share-list">
                            <li class="title">Share it</li>
                            <li><a class="addthis_button_facebook at300b" href="javascript:void(0);" title="Facebook"><i class="fa fa-facebook addthis_button_facebook" aria-hidden="true"></i></a></li>
                            <li><a class="addthis_button_twitter at300b" href="javascript:void(0);"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <!--<li><a class="addthis_button_pinterest at300b" href="javascript:void(0);"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>-->
                            <li><a class="addthis_button_instagram at300b" href="javascript:void(0);"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                    <div class="product-detail">
                        <h1 class="heading" title="<?php echo $heading_title; ?>"><?php echo $heading_title; ?></h1>
                        <span class="subhead">SKU: <?php echo $sku; ?></span>
                        <span class="rating inline"href="#inline_content"><i class="my-icons-rating"></i>(Write a review)</span>
                        <span class="product-detail-price">
                            <?php if(!$special){ ?>
                             <p> Offer Price <span><?php echo $price;?></span></p>
                            <?php }else{ ?>
                             <p> Retail Price <strike><?php echo $price; ?></strike></p>
                            <p> Offer Price <span><?php echo $special; ?></span></p>
                            <?php } ?>                            
                            <p><?php echo $text_stock; ?><small><?php echo $stock; ?></small></p>
                        </span>
                        <span class="product-detail-offer">
                            <?php echo $discount_percent; ?>% Off<small>You Save <?php echo $discount_price; ?></small>
                        </span>
                      
          <div id="product">
                        <?php if ($options) { ?>
            <!--<h3><?php // echo $text_option; ?></h3>-->
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
              <a id="sizeGuide" href="pdf/rings-size-new.pdf" target="_blank">
                            <span class="size-file">Size Guide</span>
              </a>
            </div>
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
<!--                            <div class="form-group">
                                <label>Select Size</label>
                                <select class="form-control">
                                    <option>Select any one</option>
                                </select>
                                <span class="size-file">Size Guide</span>

                            </div>-->
                            <div class="form-group">
                                <label>Select Quantity</label>
                                <select class="form-control quantity-select" id="input-quantity">
                                    <option value="1" <?php if($minimum=='1'){ echo 'selected'; } ?>>1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
              
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                            <?php if($soldout==1){ ?>
                            <button class="btn-default">sold out</button>
                        <div class="notify disflex-spbetween">
                            <input type="email" name="email" class="form-control" placeholder="Email Address" id="notifyEmail">
                            <input type="submit" value="notify me" class="btn" id="notifyMe">
                        </div>
                            <?php }else{ ?>
                            <button class="btn-default" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"> <i class="my-icons-add-cart"></i>Add to Cart</button>
                            <?php } ?>
                            <span class="p-number">Question? Please Call Us At <strong><?php echo $config_telephone; ?></strong>  </span>
                            <span class="delievrt-text"> <i class="my-icons-truck"></i> Estimated Delivery: 4-7 Days</span>
                        </div>
                    </div>
                </div>   <!--product-detail-box end here -->  
            </div>  <!--container end here -->    
            <div class="service">  <!-- service start here -->
                <ul class="container clearfix">
                    <li>Certificate of Authenticity</li>
                    <li>30 Day <br>Money Back</li>
                    <li>Free Shipping<br> &amp; Transit Insurance</li>
                    <li>Transparent<br> Pricing</li>
                </ul>
            </div>   <!-- service end here -->
         
            <section>  <!--section start here -->    
                <div class="container">  <!--container start here -->    
                     <?php if ($products) { ?>
                    <div class="related-main"> <!-- related-main start here -->
                        <div class="page-head">
                            <h2><span>Related <strong>Products </strong></span></h2>
                        </div>
                        <div class="flexslider-car">
                            <ul class="slides">
                                    <?php foreach ($products as $product) { ?>
                                        <li>
                                            <a class="related-coloum">
                                                <img src="<?php echo $product['thumb']; ?>">
                                                <p><?php echo $product['name']; ?></p>
                                                <span class="price-discount">
                                                    <?php if(!$product['special']){ echo $product['price']; }else{ echo $product['special']; } ?><small>(<?php echo $product['discount_persent']; ?>% Off)</small>
                                                </span>
                                            </a>
                                        </li>
                                    <?php } ?>
                                </ul>
                        </div>
                    </div>  <!-- related-main end here -->        
                    <?php } ?>
                    <div class="product-info clearfix"> <!-- product-info start here -->
                        <?php if ($options) { ?>
                            <aside>
                                <h5 class="title">Additional Information</h5>
                                <div class="proinset">
                                <ul>
                                    <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <li> <?php echo $option['name']; ?>:<span><?php echo $option['value']; ?></span></li>
                                        <?php } ?>
                                    <?php } ?>
                                </ul>
                                    </div>
                            </aside>
                        <?php } ?>
                        <article>
                            <h5 class="title">Product Description</h5>
                            <div class="proinset"><?php echo $description; ?></div>
                        </article>
                    </div>  <!-- product-info end here -->
                    <div class="contact-main">  <!-- contact-main end here -->
                        <div class="contact-form have-a-qstn">
                            <h5 class="title">Have a Question?</h5>
                            <div class="proinset">
                            <div class="left">
                                <textarea name="detail" class="form-control havedetail" placeholder="Enter Query"></textarea>
                            </div>
                            <div class="right">
                                <input type="text" name="name" value="" placeholder="Name" class="form-control havename">
                                <input type="email" name="email" value="" placeholder="Email"class="form-control haveemail">
                                <input type="text" name="mobile" value="" placeholder="Mobile"class="form-control havemobile">
                                <button class="btn-yellow"  onclick="return haveQuestion();">Submit</button>
                            </div>
                        </div>
                            </div>
                        <div class="contact-box">
                            <small>Question?</small>
                            <strong>+91-8600718666 </strong>
                            <span>Please Call us</span>
                            <img src="images/contact.jpg">
                        </div>
                    </div>  <!-- contact-main start  here -->
                    
                    <!-- Faq question answer -->
                    <div class="faq-question">
							<?php if(isset($haveaquestion)&& !empty($haveaquestion)){ ?>
                             <h5>Customers' Questions & Answers</h5>
                             <?php foreach($haveaquestion as $questions){ ?>
                               <div class="answer">
                                 <span>Q.<?php echo $questions['question']; ?></span>
                                 <p><?php echo $questions['answer']; ?></p>
                                 <small>Answered on <?php echo $questions['month']; ?></small>
                             </div>
                             <?php } ?>
							<?php }?>
                         </div>
                    
                    <?php echo $content_bottom; ?>
                    <div class="review-main">  <!-- review-main start  here -->    
                        <div class="page-head">
                            <h2><span>Products <strong> Reviews</strong></span></h2>
                        </div>
                        
                        <div id="review"></div>
                    </div>   <!-- review-main end  here -->
                </div> <!--container end here -->    
            </section> <!--section end here -->    
        </div> <!--main end here -->
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
                                    <input type="radio" id="star5" class="appearance" name="rating" value="5" /><label class = "full" for="star5"></label>
                                    <input type="radio" id="star4" class="appearance" name="rating" value="4" /><label class = "full" for="star4" ></label>
                                    <input type="radio" id="star3" class="appearance" name="rating" value="3" /><label class = "full" for="star3" ></label>
                                    <input type="radio" id="star2" class="appearance" name="rating" value="2" /><label class = "full" for="star2" ></label>
                                    <input type="radio" id="star1" class="appearance" name="rating" value="1"  /><label class = "full" for="star1" ></label>
                                </fieldset>
                            </div>

                            <div class="clearfix"><span>Quality:*</span>
                                <fieldset class="rating">
                                    <input type="radio" id="qua-star5" class="quality" name="qua-rating" value="5" /><label class = "full" for="qua-star5"></label>
                                    <input type="radio" id="qua-star4" class="quality" name="qua-rating" value="4" /><label class = "full" for="qua-star4" ></label>
                                    <input type="radio" id="qua-star3" class="quality" name="qua-rating" value="3" /><label class = "full" for="qua-star3" ></label>
                                    <input type="radio" id="qua-star2" class="quality" name="qua-rating" value="2" /><label class = "full" for="qua-star2" ></label>
                                    <input type="radio" id="qua-star1" class="quality" name="qua-rating" value="1"  /><label class = "full" for="qua-star1" ></label>
                                </fieldset>
                            </div>

                            <div class="clearfix"><span>Price:* </span>         
                                <fieldset class="rating">
                                    <input type="radio" id="price-star5" class="price" name="price-rating" value="5" /><label class = "full" for="price-star5"></label>
                                    <input type="radio" id="price-star4" class="price" name="price-rating" value="4" /><label class = "full" for="price-star4" ></label>
                                    <input type="radio" id="price-star3" class="price" name="price-rating" value="3" /><label class = "full" for="price-star3" ></label>
                                    <input type="radio" id="price-star2" class="price" name="price-rating" value="2" /><label class = "full" for="price-star2" ></label>
                                    <input type="radio" id="price-star1" class="price" name="price-rating" value="1"  /><label class = "full" for="price-star1" ></label>
                                </fieldset>
                            </div>


                        </div>      
                    </div>
                    <div class="one-full">
                        <label>Message*</label>
                        <textarea name="text" class="form-control" id="input-review" placeholder="Your Reviews"></textarea>
                    </div>
                    <div class="clearfix">
					<div class="captcha one-half">
                                <?php echo $captcha; ?>
                        </div>
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
<button class="btncom">Cancle</button>

                        </div>
                    </div>            
                </form>  
            </div>
        </div> <!-- popup end here -->
    <?php echo $column_right; ?>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							$('#sizeGuide').after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > span').load('index.php?route=common/cart/info span a');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
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

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
function haveQuestion(){
if($('.havename').val()==''){
    $('.havename').css('border','1px solid red');
 return false;   
}else if($('.haveemail').val()==''){
    $('.havename').css('border','1px solid #dadada');
    $('.haveemail').css('border','1px solid red');
 return false;   
}else if($('.havemobile').val()==''){
    $('.haveemail').css('border','1px solid #dadada');
    $('.havemobile').css('border','1px solid red');
 return false;   
}else if($('.havedetail').val()==''){
    $('.havemobile').css('border','1px solid #dadada');
    $('.havedetail').css('border','1px solid red');
 return false;   
}else{
$.ajax({
    url:'index.php?route=product/product/havaquestion',
    type:'POST',
    data:$('.have-a-qstn input, textarea')
      }).done(function(result){
     if(result=='1'){
         $('.have-a-qstn input, textarea').val('');
      $('.have-question-success').html('Thank you for showing interest!');
     }else{
      $('.have-question-error').html('Something went wrong! Please check carefully.');
     }
      })
}
}
$('#notifyMe').click(function(){
var email = $(this).parent().find('#notifyEmail');
$.ajax({
    type:'POST',
    url:'index.php?route=product/notifyme/send',
    data:$('#notifyEmail').val()
    }).done(function(result){
    if(result=='1'){
        $('.breadcrumb').after('<div class="alert alert-success">Success: You will be notified when product will available.<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
    })
})
//--></script>
<?php echo $footer; ?>
