<?php echo $header; ?>


<?php 
$pro_id_array=array();
$pro_value_array=array();
foreach ($products as $product) {
	//print_r($product);
        $pro_id_array[]=$product['product_id'];
		$product_total=$product['total1'];
		}
		$pro_id_array= implode(",",$pro_id_array);
		$pro_value_array= implode(",",$pro_value_array);
		
		?>


<style type="text/css">
.modal-open {
  overflow: hidden;
}

.modal-content {
   max-height: 500px;
}
.modal-body  {
    overflow-y: scroll;
}

.modal {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1050;
  display: none;
  overflow: hidden;
  outline: 0;
  background-color: #3f3f3fcc;
}

.modal-open .modal {
  overflow-x: hidden;
  overflow-y: auto;
}

.modal-dialog {
  position: relative;
  width: auto;
  margin: 0.5rem;
  pointer-events: none;
}

.modal.fade .modal-dialog {
  transition: -webkit-transform 0.3s ease-out;
  transition: transform 0.3s ease-out;
  transition: transform 0.3s ease-out, -webkit-transform 0.3s ease-out;
  -webkit-transform: translate(0, -9%);
  transform: translate(0, -9%);
}

.modal.show .modal-dialog {
  -webkit-transform: translate(0, 0);
  transform: translate(0, 0);
}

.modal-dialog-centered {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  min-height: calc(100% - (0.5rem * 2));
}

.modal-content {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  width: 100%;
  pointer-events: auto;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 0.3rem;
  outline: 0;
  margin-top:50%;
}
.form-group {
    margin-bottom: 0;
    padding: 15px 20px;
}
.modal-backdrop {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1040;
  background-color: #000;
}

.modal-backdrop.fade {
  opacity: 0;
}
.item{
	float:left;
}

.modal-backdrop.show {
  opacity: 0.5;
}

.modal-header {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: start;
  -ms-flex-align: start;
  align-items: flex-start;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  padding: 1rem;
  border-bottom: 1px solid #e9ecef;
  border-top-left-radius: 0.3rem;
  border-top-right-radius: 0.3rem;
}

.modal-header .close {
  padding: 1rem;
  margin: -1rem -1rem -1rem auto;
}

.modal-title {
  margin-bottom: 0;
  line-height: 1.5;
}

.modal-body {
  position: relative;
  -webkit-box-flex: 1;
  -ms-flex: 1 1 auto;
  flex: 1 1 auto;
  padding: 1rem;
}

.modal-footer {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: end;
  -ms-flex-pack: end;
  justify-content: flex-end;
  padding: 1rem;
  border-top: 1px solid #e9ecef;
}

.modal-footer > :not(:first-child) {
  margin-left: .25rem;
}

.modal-footer > :not(:last-child) {
  margin-right: .25rem;
}

.modal-scrollbar-measure {
  position: absolute;
  top: -9999px;
  width: 50px;
  height: 50px;
  overflow: scroll;
}

.coupon-desc
{
    padding: 21px 0 17px 52px;
    border-bottom: 1px solid #d4d5d9;
    margin-bottom: 24px;
    font-size: 15px;
    
}
.input-box {
    /* position: relative; */
    width: 50%;
    padding: 24px 0px 21px 0px;
}


.breadcrumb {
  /*  margin: 110px auto 20px;*/
}


footer .social-list {
    border-top: none !important;
    padding-top: 15px;
    padding-bottom: 6px;
}

.form-control1 {
    outline: 0;
    width: 83%;
    height: 36px;
    padding: 0 10px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    /* border: 1px solid #4a4a4a; */
    font-size: .8125rem;
    color: #000;
    background-color: #ededed;
    border: 0;
}

footer .f-menu {
    border-top: 1px solid #dadada;
    padding-top: 21px !important;
    background-color: #ffffff;
}


@media (min-width: 576px) {
  .modal-dialog {
    max-width: 500px;
    margin: 1.75rem auto;
  }
  .modal-dialog-centered {
    min-height: calc(100% - (1.75rem * 2));
  }
  .modal-sm {
    max-width: 300px;
  }
}
.item {
    width: 55%;
}

@media (min-width: 992px) {
  .modal-lg {
    max-width: 800px;
  }
}

.tooltip {
  position: absolute;
  z-index: 1070;
  display: block;
  margin: 0;
 
  font-style: normal;
  font-weight: 400;
  line-height: 1.5;
  text-align: left;
  text-align: start;
  text-decoration: none;
  text-shadow: none;
  text-transform: none;
  letter-spacing: normal;
  word-break: normal;
  word-spacing: normal;
  white-space: normal;
  line-break: auto;
  font-size: 0.875rem;
  word-wrap: break-word;
  opacity: 0;
}

.coupon-desc:hover
{
	/*color:yellow;*/
}


 .coupon-code {
    color: #434343;
    font-weight: bold;
    font-size: 12px;
    padding: 7px 45px;
    border: 1px dashed #434343;
    margin-left: 20px;
}


/*.apply-coupon-block .select-voucher {
    border-bottom: 1px solid #E5E5E5;
    padding: 15px 0;
}

.clearfix:before, .clearfix:after, .dl-horizontal dd:before, .dl-horizontal dd:after, .container:before, .container:after, .container-fluid:before, .container-fluid:after, .row:before, .row:after, .form-horizontal .form-group:before, .form-horizontal .form-group:after, .nav:before, .nav:after, .navbar:before, .navbar:after, .navbar-header:before, .navbar-header:after, .navbar-collapse:before, .navbar-collapse:after, .panel-body:before, .panel-body:after, .modal-footer:before, .modal-footer:after {
    content: " ";
    display: table;
}

.modal-body label {
    text-transform: uppercase;
    font-weight: 400;
}

.apply-coupon-block .custom-radio {
    margin-bottom: -7px;
}

div.custom-checkbox, div.custom-radio {
    position: relative;
    width: 22px;
    height: 22px;
    display: inline-block !important;
    margin-bottom: 14px;
    margin-right: 10px;
    overflow: hidden;
}

.coupon-code {
    color: #434343;
    font-weight: bold;
    font-size: 12px;
    padding: 7px 45px;
    border: 1px dashed #434343;
}

.extra-off {
    color: #434343;
    padding: 0 7px 0 0;
}

*/

@media screen only and (max-width: 767px ){
	
	.modal-content {
   max-height: 300px;
}
	
}


@media screen and (max-width: 640px){
.product-image {
    width: 40%;
}
.product-details {
    width: 60%;
}
.price, .subtotal {
    width: 33%;
}

.item {
    margin-bottom: 1rem;
}
aside, .basket, .summary, .item, .remove {
    width: 100%;
}
.remove {
    bottom: 0;
    text-align: left;
    margin-top: 0.75rem;
    position: relative;
}
.price, .subtotal {
    width: 33%;
}



}

@media only screen and (max-device-width: 375px) and (max-device-width: 667px){
.cartsec aside {
    float: right;
    position: relative;
    width: 100%;
    /*padding: 33px 9px 10px 32px;*/
}



}
.fa-trash-o:before{content:"\f014"}
.wide button {
    padding: 11px;
    border-radius: 3px;
    background-color: #670067;
    color: #fff;
    text-transform: uppercase;
    margin-bottom: 16px;
}
.save{
	font-size:16px;
}
</style>

<section class="cart-main">
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class=""><?php echo $column_left; ?>
    <div id="content" class=""><?php echo $content_top; ?>
      <h1 style="display: none;"><?php echo $heading_title; ?></h1>
       <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="MyForm">
<div class="cartsec">
		<div class="basket">
     
      <div class="basket-labels">
        <ul>
          <li class="item item-heading">Item</li>
          <li class="price">Price</li>
          <li class="quantity">Quantity</li>
          <li class="subtotal">Subtotal</li>
        </ul>
      </div>
	  <?php //print_r($products); ?>
	  <?php foreach($products as $product) { ?>
      <div class="basket-product">
        <div class="item">
          <div class="product-image">
            <a href="<?php echo $product['href']; ?>" > <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="product-frame"></a>
          </div>
          <div class="product-details">
            <h1><span class="item-quantity"></span><a href="<?php echo $product['href']; ?>"> <?php echo $product['name']; ?></a></h1>
            <p>Product Code - <?php echo $product['model']; ?></p>
			 <?php if (!$product['stock']) { ?>
                                    <span class="text-danger">***</span>
                                <?php } ?>
          </div>
        </div>
        <div class="price">
		<?php if(!$product['custom_price']) { ?>
		
		<!--<span class="disc" style="color: #a0a0a0;font-weight:600;"><?php echo $product['price']; ?></span><br><br>-->
		<span class="netprice" style="color:#ec524f;font-weight:600;"><?php echo $product['price']; ?></span>
		<br>
	<!--	<br><span class="save">You Save <?php echo $product['custom_discount']; ?></span>-->
		
		<?php } else { ?>
		
		<span class="disc" style="color: #a0a0a0;font-weight:600;"><?php echo $product['custom_price']; ?></span><br><br>
		<span class="netprice" style="color:#ec524f;font-weight:600;"><?php echo $product['price']; ?></span>
		<br>
		<?php if( $product['price']!='Rs 0') { ?>
		
		<br><span class="save">You Save <?php echo $product['custom_discount']; ?></span>
		<?php }else{ ?>
		
		<br><span class="save">Free Gift </span>
		<?php } ?>
		<?php } ?>
		
		</div>
        <div class="quantity">
          <select name="quantity[<?php echo $product['cart_id']; ?>]" class="form-control cart_qauntity" onchange="$('form#MyForm').submit();" style="background-color:#f0f6fc">
                                <option value="1" <?php if($product['quantity']=='1'){ echo 'selected'; } ?>>1</option>
                                <option value="2" <?php if($product['quantity']=='2'){ echo 'selected'; } ?>>2</option>
                                <option value="3" <?php if($product['quantity']=='3'){ echo 'selected'; } ?>>3</option>
                                <option value="4" <?php if($product['quantity']=='4'){ echo 'selected'; } ?>>4</option>
                                <option value="5" <?php if($product['quantity']=='5'){ echo 'selected'; } ?>>5</option>
                            </select>
        </div>
        <div class="subtotal"><?php echo $product['total']; ?></div>
        <div class="remove">
          <button><span class="remove-btn"><i onclick="cart.remove('<?php echo $product['cart_id']; ?>');" class="fa fa-trash-o" aria-hidden="true"></i></span></button>
        </div>
      </div>
	  <?php } ?>
     
		
		
    <div class="gift_msg" style="display:none;">
       <input type="checkbox" style="position: relative; right: 7px; top: -3px;" id="trigger" name="question"><p>Want To Add Gift Message?</p>
    </div>
    <div id="hidden_fields" style="display: none; margin-top: 10px;">
      <form name="giftmessageForm" id="giftmessageForm">
                        <input type="hidden" name="giftmessage[253766][type]" value="quote">
                    <ul class="">
                        <li class="fields">
                            <div class="field">
                                <!-- <label for="gift-message-whole-from">From</label> -->
                                <div class="input-box">
                                    <input type="text" placeholder="Enter your name" name="message_name_from" id="gift-message-whole-from" title="From" class="input-text form-control1 width-gift-message">
                                </div>
                            </div>
                            <div class="field">
                                <!-- <label for="gift-message-whole-to">To</label> -->
                                <div class="input-box">
                                    <input type="text" name="giftmessage[253766][to]" id="message_name-to" title="To" placeholder="Enter recipient's name" class="input-text form-control1 width-gift-message">
                                </div>
                            </div>
                        </li>
                        <li class="wide">
                            <!-- <label for="gift-message-whole-message">Message</label> -->
                            <div class="input-box">
                                <textarea id="gift-message-whole-message" class="input-text required-entry giftmessage-area " name="message" title="Message" rows="10" cols="45" placeholder="Enter your message(Maximum characters:200)" maxlength="200" ></textarea>
                            </div>
                        </li>
                        <br>
                        <li class="wide">
                            <button type="button" class="btn-cart btn-gift-message" name="" onclick="">Add Gift Message</button>
                        </li>
                    </ul>
                    </form>
    </div>

		

		</div>
		   <!--<?php foreach ($totals as $total) { //print_r($total);?>
                         <p class="clearfix"> <?php echo $total['title']; ?>:<span><?php echo $total['text']; ?></span></p>
                        <?php } ?>-->
		
	<!--<div class="coupon-button"><button type="button" data-toggle="modal" data-target="#exampleModalCenter"> Use COUPON</button></div>-->
    <aside>
      <div class="summary">
        <div class="summary-total-items"><span class="total-items"></span> Items In Your Bag</div>
        <?php foreach ($totals as $total) { //print_r($total);?>
		<div class="summary-subtotal">
          <div class="subtotal-title"><?php echo $total['title']; ?></div>
          <div class="subtotal-value final-value" id="basket-subtotal"><?php echo $total['text']; ?></div>
		 
		
		  
          <!--<div class="summary-promo ">
            <div class="promo-title">Promotion</div>
            <div class="promo-value final-value" id="basket-promo">Coupon </div>
          </div>-->
        </div>
		<?php } ?>
        <!--<div class="summary-delivery">
          18% GST 
        </div>
		<div class="summary-total">
          <div class="total-title">Total</div>
          <div class="total-value final-value" id="basket-total">130.00</div>
        </div>-->

		<div class="summary-checkout">
          <a href="checkout" class="checkout-cta">Go to Secure Checkout</a>
        </div>
		
		<br>
        <div class="summary-checkout">
          <a href="<?php echo $continue; ?>" class="contishop">continue shopping</a>
        </div>
       
        
      </div>
		  
 </aside>
 
	
	 </div> 
	   </form>	   
       
     
      <div class="buttons clearfix">
        
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
	
	

</div>
</section>


<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Use coupons</h5>
       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<i class="fa fa-times" aria-hidden="true"></i>
          
       
      </div>
	  
	  
	  <div class="form-group">
    <input type="text" class="form-control coupon1" style="" placeholder="Enter Coupon" name="coupon" value="<?php echo $coupon_value;?>">
  	</div>
   
       
	   <div class="modal-body">
  	
	
	<!--<a href="#" style="hover{background-color:red}">-->

      <!-- <section class="select-voucher clearfix"><div class="col-md-8 col-sm-8 col-xs-8 col-xxs-8"><label class="coupon-input"><div class="custom-radio  disabled"><span></span><input type="radio" name="" id="NA" value="FRAGRANCE15" disabled="disabled"></div><span class="coupon-code">FRAGRANCE15</span><small></small></label></div><div class="coupon-desc show"><span class="extra-off">15% off on no minimum purchase value. Valid till 05 Jun 2018 8AM. This product is on discount for limited period only </span>  <div class="coupon-msg">To avail this voucher please add products  that are  <a href="/all-products/?promotion=junsalerun9" class="text-lowercase">listed here.</a></div></div></section> -->








<ul>
	
	<!--<li>
            		<input type="radio" class="radioBtnClass" name="radio" value="SAVE25" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">SAVE25</span>
            	<div class="coupon-desc" > <span class="text"> Flash Sale - Flat 25% OFF When You Buy 999 & above </span>
              
			  <span class="coupon-valid"> </span>
            </div></li>
	
	<li>
        <input type="radio" class="radioBtnClass" value="GET10" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">GET10</span>
	<div class="coupon-desc" > <span class="text"> 10% Off on Minimum Purchase of Rs. 999 on First Time Signup</span>
             
			  <span class="coupon-valid"> </span>
            </div></li>

			
			
			
			
			
			 <li>
            		<input type="radio" class="radioBtnClass" value="ORNATE100" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE100</span>
	<div class="coupon-desc" > <span class="text"> Buy 999 Get 100 Off Valid Till 31st October, 2018</span>
              
			  <span class="coupon-valid"> </span>
            </div></li>
			<li>
            		<input type="radio" class="radioBtnClass" value="ORNATE200" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE200</span>
	<div class="coupon-desc" > <span class="text"> Buy for 1999 Get 200 Off Valid Till 31st October, 2018</span>
               
			  <span class="coupon-valid"> </span>
            </div></li>
			<li>
            		<input type="radio" class="radioBtnClass" value="ORNATE300" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE300</span>
	<div class="coupon-desc" > <span class="text"> Buy for 2499 Get 300 Off Valid Till 31st October, 2018</span>
              
			  <span class="coupon-valid"> </span>
            </div></li>
			<!--<li>
            		<input type="radio" class="radioBtnClass" value="ORNATE5000" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE5000</span>
	<div class="coupon-desc" > <span class="text"> Buy for 5000 Get 700 Off Valid Till 31st October, 2018</span>
              
			  <span class="coupon-valid"> </span>
            </div></li>-->
			
			
</ul>


    
			
	
	
	
   	</div>  
		
		
		

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" style="background-color:#670067;color:#fff; border-radius:5px;" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-secondary button-coupon1" style="background-color:#670067;color:#fff;  border-radius:5px;">Use Coupon</button>
      </div>
    </div>
  </div>
</div>





<script type="text/javascript">
    $(document).ready(function(){
   $('input[name=radio]').change(function(){
           $('.coupon1').val($("input[name='radio']:checked").val());

   });
    });
</script>
<script type="text/javascript">
$('.button-coupon1').on('click', function() {
	
	$.ajax({
		url: 'index.php?route=extension/total/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('.coupon1').val()),
		dataType: 'json',
		beforeSend: function() {
			$('.button-coupon').button('loading');
		},
		complete: function() {
			$('.button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				$('.coupon1').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}else{
                        $('.coupon1').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> Success: Your coupon discount has been applied!<button type="button" class="close" data-dismiss="alert">×</button></div>');
                        window.location='cart';

					  $('html, body').animate({ scrollTop: 0 }, 'slow');
                       $('html, body').load('index.php?route=checkout/cart');
					 
                    }
			//if (json['redirect']) {
		//	location = json['redirect'];
		//	}
		}
	});
});
function removeCoupon(){
    $.ajax({
		url: 'index.php?route=extension/total/coupon/removeCoupon',
		type: 'post',
		//data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
                    if(json==1){
						$('.alert').remove();
                      //  $('.breadcrumb').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> Success: Coupon removed successfully!<button type="button" class="close" data-dismiss="alert">×</button></div>');
						window.location='cart';                       
					   //$('html, body').load('index.php?route=checkout/cart');
//                        $('.breadcrumb').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> Success: Your coupon discount has been applied!<button type="button" class="close" data-dismiss="alert">×</button></div>');
                        $('html, body').animate({ scrollTop: 0 }, 'slow');
						//$(".cart-main").load('index.php?route=checkout/cart');
                    }else{
                        $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Success: Your coupon discount has been applied!<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

						$('html, body').animate({ scrollTop: 0 }, 'slow');
						//$(".cart-main").load('index.php?route=checkout/cart');
                    }
                        }
	});
    }
</script>








<?php echo $footer; ?>
