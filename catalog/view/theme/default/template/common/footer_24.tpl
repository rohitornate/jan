
        <?php if($end == 'cart' || $end == 'checkout'){ ?>
<footer class="cart-footer"> <!-- footer start here -->
            <div class="container">
                <div class="clearfix">
                    <div class="payement-service">
                        <small>payement</small>
                        <img src="images/payatm.png">
                    </div>
                    <div class="payement-col">
                        <i class="my-icons-guranted"></i>
                        <p class="content">Quality Gauranteed<small>We provide highest quality</small></p>
                    </div>
                    <div class="payement-col">
                        <i class=" my-icons-payement"></i>
                        <p class="content">100% Secure payment <small>payments are safe and secure</small></p>
                    </div>
                </div>
                <div class="copyright">2017 ornatejewels.com. All rights reserved</div>  <!--copyright end here --> 
            </div>
        </footer> <!-- footer end here -->  
        <?php }else{ ?>
<footer> <!-- footer start here -->
    <ul class="brand-list container"> <!-- brand-list start here -->
        <li>
            <i class=" my-icons-payement"></i>
            <p class="content">100% Secure payment <small>payments are safe and secure</small></p>
        </li> 
        <li>
            <i class=" my-icons-protection"></i>
            <p class="content">100% payment protection <small>Your purchase is secure</small></p>
        </li> 
        <li>
            <i class=" my-icons-guranted"></i>
            <p class="content">Quality Gauranteed<small>We provide highest quality</small></p>
        </li> 

    </ul> <!--brand-list start here-->
    <div class="f-menu"> <!--f-menu start here -->
        <div class="container">
            <div class="clearfix">
                <nav>
                    <h5 class="title">our company</h5>  
                    <ul>
       <li><a href="about-us">About us</a></li>
       <li><a href="why-choose-us">Why Choose us</a></li>
       <li><a href="after-care">After Care</a></li>
       <li><a href="wholesale-inquiry">Wholesale Inquiry</a></li>
       <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    </ul>

                </nav>
                <nav>
                    <h5 class="title">information</h5>  
                    <ul>
                        
      <li><a href="privacy-policy">Privacy Policy</a></li>
      <li><a href="shipping-policies">Shipping Policies</a></li>
      <li><a href="terms-conditions">Terms & Conditions</a></li>
       <li><a href="return-exchange-policies">Return And Exchange Policies</a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                        <?php /* foreach ($informations as $information) { ?>
                            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                        <?php } */ ?>
                    </ul>
                </nav>
                <nav>
                    <h5 class="title">Top Categories</h5>  
                    <ul>
 <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
 <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
 <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
 <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
 <li><a href="index.php?route=simple_blog/category&simple_blog_category_id=1">Blog</a></li>
                    </ul>

                </nav>
<!--                <form action="" method="post">
		<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname">Email:</label>
            <div class="col-sm-10">
              <input type="email" name="txtemail" id="txtemail" value="" placeholder="" class="form-control input-lg"  /> 
    	       
            </div>
		</div>
		<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname">Email:</label>
            <div class="col-sm-10">
              <button type="submit" class="btn btn-default btn-lg" onclick="return subscribe();">Subscribe</i></button>  
    	       
            </div>
		</div>
		</form>-->
                <article class="newsletter">
                    <h5>Sign up to our newsletter</h5>
                    <form action="" method="post">
                        <div class="form-group">
                            <input type="email" name="txtemail" id="txtemail" value="" placeholder="Your email address" class="form-control">
                            <button type="submit" onclick="return subscribe();"></button>  
                        </div>
                        <span class="lead">Subscribe now to get updates on promotions<br> and coupons</span>
                    </form>
                    <i class="my-icons-guranted-long"></i>
                </article>
            </div>
            <ul class="social-list clearfix">
                <li>
                    <span>Payement</span>
                    <img src="images/payatm-icon.png">

                </li>
                <li class="text-center">
                    <span>It's Trust thing</span>
                    <img src="images/thawte-security.jpg">
                </li>
                <li class="text-right">
                    <span>Follow Us</span>
                    <a href="https://www.facebook.com/ornatejewelscom" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    <a href="https://twitter.com/ornatejewelscom" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                    <a href="https://www.pinterest.com/ornatejewels" target="_blank"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                    <a href="https://www.instagram.com/ornatejewels" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                </li>
            </ul>
        </div>
    </div>  <!--f-menu end here -->
    <div class="copyright">2017 ornatejewels.com. All rights reserved</div>  <!--copyright end here --> 
</footer> <!-- footer end here -->   

        <?php } ?>
        
        <div style='display:none'> <!-- popup requesta-callback start here -->
    <div id='request' class="request-popup">
        <form class="popup"> 
            <span class="title">Request a Callback</span> 
            <span class="call-back"><i class="my-icons-call"></i>+91-8600718666 </span>
            <div class="in">
            <div class="clearfix">
                 <div class="one-half">
                    <label>Name*</label>
                    <input type="text" name="name" placeholder="Your Full Name" class="form-control">
                    <label>Email*</label>
                    <input type="email" name="name" placeholder="Your Email Address" class="form-control">
                     <label>Phone*</label>
                    <input type="text" name="phone" placeholder="Phone Number" class="form-control">  
                </div>
                 <div class="one-half">
                    <label>Preferred Time</label>
                    <select class="form-control">
                        <option>Preferred time</option>
                          <option>Preferred time</option>
                            <option>Preferred time</option>ss
                    </select>
                     <label>Message*</label>
                    <textarea class="form-control" placeholder="Your Reviews"></textarea>
                </div>
                     
            </div>
             </div>
            <button class="submit">Submit</button>
                     
        </form>  
    </div>
</div>
        
<!-- Start back to top -->
<a href="javascript:void(0)" class="go-top"></a>
<script src="catalog/view/javascript/js/jquery.flexslider.js"></script>
<script src="catalog/view/javascript/js/jquery.sticky-kit.min.js"></script>
<script src="catalog/view/javascript/js/jquery.easing.min.js"></script>
<script src="catalog/view/javascript/js/jquery.colorbox.js"></script>
<script type="text/javascript" src="catalog/view/javascript/js/jquery.smartmenu.js"></script>
<script src="catalog/view/javascript/js/common.js"></script>
<script src="catalog/view/javascript/js/mobile.js"></script>
 <?php if ($live_search_ajax_status):?>
	            <!--<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/live_search.css" />-->
				<script type="text/javascript"><!--
					var live_search = {
						selector: '#search input[name=\'search\']',
						text_no_matches: '<?php echo $text_empty; ?>',
						height: '50px'
					}

					$(document).ready(function() {
						var html = '';
						html += '<div class="live-search">';
						html += '	<ul>';
						html += '	</ul>';
						html += '<div class="result-text"></div>';
						html += '</div>';

						//$(live_search.selector).parent().closest('div').after(html);
						$(live_search.selector).after(html);

						$(live_search.selector).autocomplete({
							'source': function(request, response) {
								var filter_name = $(live_search.selector).val();
								var live_search_min_length = '<?php echo (int)$live_search_min_length; ?>';
								if (filter_name.length < live_search_min_length) {
									$('.live-search').css('display','none');
								}
								else{
									var html = '';
									html += '<li style="text-align: center;height:10px;">';
									html +=	'<img class="loading" src="catalog/view/theme/default/image/loading.gif" />';
									html +=	'</li>';
									$('.live-search ul').html(html);
									$('.live-search').css('display','block');

									$.ajax({
										url: 'index.php?route=product/live_search&filter_name=' +  encodeURIComponent(filter_name),
										dataType: 'json',
										success: function(result) {
											var products = result.products;
											$('.live-search ul li').remove();
											$('.result-text').html('');
											if (!$.isEmptyObject(products)) {
												var show_image = <?php echo $live_search_show_image;?>;
												var show_price = <?php echo $live_search_show_price;?>;
												var show_description = <?php echo $live_search_show_description;?>;
												$('.result-text').html('<a href="<?php echo $live_search_href;?>'+filter_name+'" class="view-all-results"><?php echo $text_view_all_results;?> ('+result.total+')</a>');

												$.each(products, function(index,product) {
													var html = '';
													
													html += '<li>';
													html += '<a href="' + product.url + '" title="' + product.name + '">';
													if(product.image && show_image){
														html += '	<div class="product-image"><img alt="' + product.name + '" src="' + product.image + '"></div>';
													}
													html += '	<div class="product-name">' + product.name ;
													if(show_description){
														html += '<p>' + product.extra_info + '</p>';
													}
													html += '</div>';
													if(show_price){
														if (product.special) {
															html += '	<div class="product-price"><span class="special">' + product.price + '</span><span class="price">' + product.special + '</span></div>';
														} else {
															html += '	<div class="product-price"><span class="price">' + product.price + '</span></div>';
														}
													}
													html += '<span style="clear:both"></span>';
													html += '</a>';
													html += '</li>';
													$('.live-search ul').append(html);
												});
											} else {
												var html = '';
												html += '<li style="text-align: center;height:10px;">';
												html +=	live_search.text_no_matches;
												html +=	'</li>';

												$('.live-search ul').html(html);
											}
											$('.live-search ul li').css('height',live_search.height);
											$('.live-search').css('display','block');
											return false;
										}
									});
								}
							},
							'select': function(product) {
								$(live_search.selector).val(product.name);
							}
						});

						$(document).bind( "mouseup touchend", function(e){
						  var container = $('.live-search');
						  if (!container.is(e.target) && container.has(e.target).length === 0)
						  {
						    container.hide();
						  }
						});
					});
				//--></script>
                                <script>
		function subscribe()
		{
			var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var email = $('#txtemail').val();
			if(email != "")
			{
				if(!emailpattern.test(email))
				{
					alert("Invalid Email");
                                        $('#txtemail').focus();
					return false;
				}
				else
				{
					$.ajax({
						url: 'index.php?route=extension/module/newsletters/news',
						type: 'post',
						data: 'email=' + $('#txtemail').val(),
						dataType: 'json',
						
									
						success: function(json) {
                                                    $("#txtemail").val('');
                                                    alert(json.message);
                                                }
						
					});
					return false;
				}
			}
			else
			{
				alert("Email Is Require");
				$(email).focus();
				return false;
			}
			

		}
	</script>
			<?php endif;?>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>