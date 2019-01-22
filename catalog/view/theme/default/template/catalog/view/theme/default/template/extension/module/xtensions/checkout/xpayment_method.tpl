<div class="container">
<div class="row equal">
<div id="paymentPage" class="col-md-9">
<ul class="hidden nav nav-pills nav-wizard hidden-xs">
  <li class="<?php echo $isLogged?'locked"':'unlocked'?>"><a <?php echo $isLogged?'':'onclick="click1();"'?>><?php echo $text_checkout_step_1; ?><?php echo $isLogged?'<i class="fa fa-lock"></i>':''?></a><div class="nav-arrow"></div></li>
  <li class="unlocked"><div class="nav-wedge"></div><a onclick="click2();"><?php echo $text_checkout_step_2; ?></a><div class="nav-arrow"></div></li>
  <li class="active"><div class="nav-wedge"></div><a><?php echo $text_checkout_step_3; ?></a></li>
</ul>
<div class="row youpaytext">
<div class="col-xs-6"><?php echo $text_payment_method; ?></div>
<div class="col-xs-6 text-right"><?php echo $text_you_pay;?><span class="youpay"><?php echo $total; ?></span></div>
</div>
<?php if (!$payment_methods) { ?>
<div class="alert alert-danger margintopbottom20"><?php echo $error_payment_warning; ?></div>
<?php } else { ?>
<?php if($accordion_view){ ?>
<div class="panel-group" id="payment-accordion" role="tablist" aria-multiselectable="false">
<?php foreach ($payment_methods as $payment_method) { ?>
<?php if ($payment_method['code'] == $code || !$code) { ?>
      <?php $code = $payment_method['code']; ?>
      <?php $in ='in';?>            
    <?php } else{}?>
  
  <div class="panel">
    <div class="panel-heading" role="tab" id="heading<?php echo $payment_method['code']; ?>">
    	 <h4 class="panel-title">     
          <a aria-expanded="<?php echo ($code == $payment_method['code'])?'true':'false'; ?>" id="anchor<?php echo $payment_method['code']; ?>" class="heading-panel<?php echo ($code == $payment_method['code'])?'':' collapsed'; ?>" payment_method="<?php echo $payment_method['code']; ?>" role="button" data-toggle="collapse" data-parent="#payment-accordion" data-target="#collapse<?php echo $payment_method['code']; ?>" aria-controls="collapse<?php echo $payment_method['code']; ?>">          
          <label><?php echo $payment_method['title']; ?></label>
          </a>
        </h4>
        <?php if(isset($payment_images[$payment_method['code']]) && $payment_images[$payment_method['code']]){ ?>
        <div class="payment_images"><img class="payment_method_img" src="image/<?php echo $payment_images[$payment_method['code']]; ?>"/></div>
        <?php } ?>        
    </div>      
      <div id="collapse<?php echo $payment_method['code']; ?>" class="panel-collapse collapse <?php echo ($code == $payment_method['code'])?'in':''; ?>" role="tabpanel" aria-labelledby="heading<?php echo $payment_method['code']; ?>">
      <div id="panel-body<?php echo $payment_method['code']; ?>" class="panel-body">        
      </div>
    </div>
  </div> 
<?php } ?>
</div>
<?php } else { ?>
<div class="row equal bordertop">
<div class="col-md-3 nopadding">
<div class="pside-bar">
<nav class="nav-sidebar">
<ul id="paymentMethodTab" class="nav nav-tabs tabs-left">
<?php foreach ($payment_methods as $payment_method) { ?>
	<?php if ($payment_method['code'] == $code || !$code) { ?>
      <?php $code = $payment_method['code']; ?>      	
    	  <li id="t<?php echo $payment_method['code']; ?>" class="active pointer payment_method_list">
    <?php } else { ?>
    	<li class="pointer" id="t<?php echo $payment_method['code']; ?>">
    <?php } ?>	  
			<a payment_method="<?php echo $payment_method['code']; ?>" data-toggle="tab"><?php echo $payment_method['title']; ?>
			<?php if(isset($payment_images[$payment_method['code']]) && $payment_images[$payment_method['code']]){ ?>
        		<span class="payment_images is_list"><img class="payment_method_img" src="image/<?php echo $payment_images[$payment_method['code']]; ?>"/></span>
        	<?php } ?></a></li>
<?php } ?>
</ul>
</nav>   
</div>
</div>
<!--col-md-3 ends-->
<div class="col-md-9"><!--col-md-9 starts-->
<div id="paymentMethodTabContent" class="tab-content" >
<div class="panel panel-default"><div class="panel-body">
<div id="pLoader" class="loader"></div>
<div class="tab-pane fade in active" id="payment-method-content">
<div id="spayment-method-content" class="center text-center">
</div>
</div>
</div></div>      
</div>
</div>
</div>
<?php } ?>
<?php } ?>
</div>
<div class="col-md-3 lborder">
<div class="clearfix"></div>

<div class="panel-default" >
<div >
<div id="xcart" class="animated1 zoomIn1"><?php echo $xcart; ?></div>
<div id="totals" class="animated1 zoomIn1"><?php echo $xtotals; ?></div>
</div>
</div>
<div class="panel panel-default sidepanel" >
<div class="panel-heading sidepanel">
<div class="panel-title shippingS">
<span><i class="fa fa-home"></i></span>&nbsp;<span><?php echo $shipping_address_title;?></span>
</div>
</div>                                      
<div class="panel-body sidepanel text-muted">
<span><?php echo $shipaddress;?></span>
<?php if(isset($shipping_method)){?>  
<div><span class="bold"><?php echo $shipping_method;?></span><span class="scost bold"><?php echo $shipping_method_cost; ?></span></div>  
<?php } ?>              
</div>   
<div class="panel-footer sidepanel">
<div class="pchange"><a class="pointer underline"><?php echo $text_change_address;?></a></div>
</div>                        
</div>
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
	$('#step_payment_panel').html('');
	$('#step_payment_panel').hide();
	$('#step_address_panel').show();
};
</script>
<?php if($payment_methods){ ?>
<script type="text/javascript">
$('.panel-heading a').on('click',function(e){
    if($(this).parents('.panel').children('.panel-collapse').hasClass('in')){
        e.stopPropagation();
        e.preventDefault();
    }
});
var payment_method_code = '<?php echo (isset($code)?$code:""); ?>';

$(document).ready(function(){
<?php if($accordion_view){ ?>
	loadPaymentMethodAccordion(payment_method_code);	
<?php } else { ?>	
	loadPaymentMethodTab(payment_method_code);		
<?php } ?>
});
</script>
<?php } ?>
