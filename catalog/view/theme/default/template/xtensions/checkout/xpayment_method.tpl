<div class="container">
<div class="row equal">
<div class="col-md-9">
<div class="row equal">
<div class="col-md-3 pside-bar"><!--Tabs Start-->
<nav class="nav-sidebar">
<ul id="myTab" class="nav nav-tabs tabs-left" style="margin-bottom: 15px;">
<?php if ($payment_methods) { ?>
<li ><a><span style="text-transform: uppercase;"><?php echo $text_payment_method; ?></span></a></li>
<?php } else {?>
<li ><a><span style="text-transform: uppercase;"><?php echo $text_nopayments;?></span></a></li>
<?php } ?>
<?php foreach ($payment_methods as $payment_method) { ?>
	<?php if ($payment_method['code'] == $code || !$code) { ?>
      <?php $code = $payment_method['code']; ?>
      <input type="hidden" name="payment_method" id="payment_method" value="<?php echo $payment_method['code']; ?>" />
    	  <li id="t<?php echo $payment_method['code']; ?>" class="active pointer">
    <?php } else { ?>
    	<li class="pointer" id="t<?php echo $payment_method['code']; ?>">
    <?php } ?>	  
			<a payment_method="<?php echo $payment_method['code']; ?>" data-toggle="tab"><?php echo $payment_method['title']; ?></a></li>
<?php } ?>
</ul>
</nav>   
</div><!--col-md-3 ends-->
<div class="col-md-9"><!--col-md-9 starts-->
<div id="myTabContent" class="tab-content" >
<div class="panel panel-default"><div class="panel-body">
<div id="pLoader" class="loader"></div>
<div class="tab-pane fade in active" id="payment-method-content">
<div id="spayment-method-content" class="center text-center"></div>
</div>
</div></div>      
</div>
</div><!--col-md-9 outer ends-->
</div>
</div>
<div class="col-md-3 lborder">
<div class="clearfix" style="padding-bottom: 10px;"></div>
<div class="panel panel-default" >
<div class="panel-heading">
<div class="panel-title center text-center shippingS">
<span><i class="fa fa-home"></i></span><span><?php echo $shipping_address_title;?></span>
</div>
</div>                                      
<div class="panel-body text-center" style="color: #858e8f;padding-top: 20px;">
<p class="text-justified"><?php echo $shipaddress;?></p>                
</div>   
<div class="panel-footer text-right" style="color: #858e8f;">
<div class="pchange"><a href="#address"><i class="fa fa-arrow-left"></i><?php echo $text_change_address;?></a></div>
</div>                        
</div>
<?php if(isset($shipping_method)){?>
<div class="panel panel-default" >
<div class="panel-heading">
<div class="panel-title center text-center shippingS">
<span><i class="fa fa-truck"></i></span><span><?php echo $shipping_method_title;?></span>
</div>
</div>
<div class="panel-body text-center" style="color: #858e8f;padding-top: 10px;min-height: 40px;">
<p class="text-justified"><?php echo $shipping_method;?></p>                
</div>                                       
<div class="panel-footer text-right" style="color: #858e8f;">
<div class="pchange"><a href="#address"><i class="fa fa-arrow-left"></i><?php echo $text_change_shipping;?></a></div>
</div>                                     
</div>
<?php }?>
</div>
</div>
</div>
<script type="text/javascript">
$('#step2 a, .pchange a').click(function(event){
    event.preventDefault();        	    	
	click2();
});
$("#click2").click(function() {
	click2();
});
function click2(){
	$('#step3').removeClass('active');
	$('#step3').addClass('disabled');
	$('#step2').removeClass('complete');
    $('#step2').addClass('active');    			
	$('#step2 a').removeAttr('href');
	$('#click2').removeClass('clickable');
	$('#undo2').hide();
	$('#step3').removeClass('active');
	$('#payment').html('');
	$('#payment').hide();
	$('#address').show();
};
var value= '<?php echo (isset($code)?$code:""); ?>';
$(document).on("click", "[data-toggle='tab']", function(event) {
	if(value!=$(this).attr('payment_method')){
	 value=$(this).attr('payment_method');     
     $('#payment_method').val(value);
     $.ajax({
			url: 'index.php?route=xcheckout/xpayment_method/validate', 
			type: 'post',
			data: $('input[type=\'hidden\']'),
			dataType: 'json',
			beforeSend: function() {
				showBar();
				$('#pLoader').css({
	        	    height: $('#pLoader').parent().height(), 
	        	    width: $('#pLoader').parent().width()
	        	});
				$('#pLoader').show();				
				<?php if ($payment_methods) { ?>
				<?php foreach ($payment_methods as $payment_method) { ?>				
				$('#t<?php echo $payment_method['code'];?>').addClass('disabled');
				<?php  }?>
				<?php  }?>
				
							
			},	
			complete: function() {				
			},			
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				} else if (json['error']) {
					if (json['error']['warning_shipping']) {
						$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning_shipping'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');						
						$('.warning').fadeIn('slow');
					}
					if (json['error']['warning_payment']) {
						$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning_payment'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');						
						$('.warning').fadeIn('slow');
					}					
					
					
					<?php if ($payment_methods) { ?>
					<?php foreach ($payment_methods as $payment_method) { ?>					
					$('#t<?php echo $payment_method['code'];?>').removeClass('disabled');
					<?php  }?>
					<?php  }?>
					hideBar();
					$('#pLoader').hide();			
				} else {
					$.ajax({
						url: 'index.php?route=checkout/confirm',
						dataType: 'html',
						success: function(html) {
							
							$('#spayment-method-content').html(html);	
						
							<?php if ($payment_methods) { ?>
							<?php foreach ($payment_methods as $payment_method) { ?>					
							$('#t<?php echo $payment_method['code'];?>').removeClass('disabled');
							<?php  }?>
							<?php  }?>
							hideBar();
							$('#pLoader').hide();													
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});	
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}	        
});

$(document).ready(function(){
	
		$.ajax({
			url: 'index.php?route=xcheckout/xpayment_method/validate', 
			type: 'post',
			data: $('input[type=\'hidden\']'),
			dataType: 'json',
			beforeSend: function() {						
			},	
			complete: function() {				
			},			
			success: function(json) {				
				if (json['redirect']) {
					location = json['redirect'];
				} else if (json['error']) {
					if (json['error']['warning_shipping']) {
						$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning_shipping'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');						
						$('.warning').fadeIn('slow');
					}
					if (json['error']['warning_payment']) {
						$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning_payment'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');						
						$('.warning').fadeIn('slow');
					}	
																	
				} else {
					$.ajax({
						url: 'index.php?route=checkout/confirm',
						dataType: 'html',
						success: function(html) {							
							
							$('#spayment-method-content').html(html);
							
																	
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});	
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});			
	});
</script>
