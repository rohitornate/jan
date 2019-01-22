<?php if($force_redirect){ ?>
<script type="text/javascript">
location = '<?php echo $force_redirect; ?>';
</script>
<?php } else { ?>
<?php echo $payment_modal_form; ?>
<?php echo $shipping_required?$shipping_modal_form:''; ?>
<div id="guestPage" class="container">
<div class="row equal is_guest_page">
<div id="existingAddress">
 <div class="col-md-9">
<div id="guestPanel" <?php echo (($payment_address || $shipping_address1 || $address_modal))?'':'style="display: none;"'; ?>>
<?php if($shipping_address1 && $shipping_required && !$xshipping_method) { ?>
	<div class="alert alert-danger noshipping margintop20 marginbottom0"><?php echo $shipping_error; ?></div>
<?php } ?>
<div class="clearfix"></div>
              <div class="row" >
                <?php if(!$shipping_required || $same_shipping){ ?>
              		<input type="hidden" name="xshipping_address_check" value="1"  />
            	<?php }else{ ?>
              		<div class="col-md-12">	
              		<div class="checkbox is_checkbox info-back-checkout text-center">
              		<label for="shipping_check">
                	<input onchange="same_guest_shipping(this,'<?php echo $text_psaddress; ?>','<?php echo $text_paddress; ?>',<?php echo $payment_address?'true':'false';?>)" type="checkbox" class="input-checkbox" name="xshipping_address_check" value="1" id="shipping_check" <?php echo ($shipping_same ?'checked="checked"':''); ?> />
        			<?php echo $entry_shipping; ?>
              		</label>
           	   </div>
           	   		</div>
            	<?php }?>           	              
                <div class="payment-address-panel <?php echo (!$shipping_required || ($shipping_required && $shipping_same))?'col-md-12':'col-md-6' ?>">
                  <div class="panel-address">                   
                   <div class="panel-address-heading address-type"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;<span class="padd"><?php echo ($shipping_required && ($shipping_same || $same_shipping)? $text_psaddress:$text_paddress); ?></span>
                   <?php if($payment_address){ ?>
                   <small class="pull-right">
                   <?php if($address_modal){ ?>
                   <a class="pointer" data-toggle="modal" data-target="#addressModalpayment" ><?php echo $text_edit_address; ?></a>
                   <?php } else { ?>
                   <a class="pointer" onclick="toggleElement('#guestPanel, #guest_payment_panel');$('.col-md-3.lborder').addClass('xblur');"><?php echo $text_edit_address; ?></a>
                   <?php } ?>                   
                   </small>
                   <?php } ?>
                   </div>                    
                    <div class="panel-address-body payment-address<?php echo !$payment_address?' no-address':''; ?>" >
                    	<div class="text-justified">
                    	<div class="selected-address">
                    	<?php if($payment_address){ ?>
                   		<?php echo $payment_address; ?>
                   		<?php } else{?>
                   		<h4 class="text-center">
                   		<?php if($address_modal){ ?>
                   		<a data-toggle="modal" data-target="#addressModalpayment"><?php echo $text_address_new; ?></a>
                   		<?php } else { ?>
                   		<a class="pointer" onclick="toggleElement('#guestPanel, #guest_payment_panel');"><span class="glyphicon glyphicon-plus"></span><?php echo $text_address_new; ?></a>
                   		<?php } ?>                   		
                   		</h4>
                   		<?php } ?>
                   		</div>                  	
                    </div>
                  </div>
                </div>
                </div>
                 <?php if($shipping_required && !$same_shipping){?>
                 <div class="col-md-6 shipping-address-panel xshipping" style="<?php if($shipping_same) echo 'display:none;'; ?>">
                  <div class="panel-address">                   
                   <div class="panel-address-heading address-type"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<?php echo $text_saddress; ?>
                   <?php if($payment_address){ ?>                   
                   <small class="pull-right">
                   <?php if($address_modal){ ?>
                   <a class="pointer" data-toggle="modal" data-target="#addressModalshipping" ><?php echo $text_edit_address; ?></a>
                   <?php } else { ?>
                   <a class="pointer" onclick="toggleElement('#guestPanel, #guest_shipping_panel');$('.col-md-3.lborder').addClass('xblur');"><?php echo $shipping_address1?$text_edit_address:$text_address_new; ?></a>
                   <?php } ?>                                      
                   </small>
                   <?php } ?>
                   </div>                    
                    <div class="panel-address-body shipping-address<?php echo !$shipping_address1?' no-address':''; ?>" >
                    	<div class="text-justified">
                    	<div class="selected-address">
                    	<?php if($shipping_address1){ ?>
                   		<?php echo $shipping_address1; ?>
                   		<?php } else{?>
                   		<h4 class="text-center">
                   		<?php if($address_modal){ ?>
                   		<a data-toggle="modal" data-target="#addressModalshipping"><?php echo $text_address_new; ?></a>
                   		<?php } else { ?>
                   		<a class="pointer" onclick="toggleElement('#guestPanel, #guest_shipping_panel');"><span class="glyphicon glyphicon-plus"></span><?php echo $text_add_saddress; ?></a>
                   		<?php } ?>                   		
                   		</h4>
                   		<?php } ?>
                    	</div>                  	
                    </div>
                  </div>
                </div>
                </div>
                 <?php } ?>                          
                <div class="clearfix"></div>                
              </div>    
<?php if(!$address_block){ ?>
			  <div class="row">
			  		<?php if($shipping_required && $shipping_address1){ ?>
                	<div class="<?php echo $display_comments?'col-md-6':'col-md-12'; ?>">
                	<div id="shipping_method" class="container_panel">                	              
        			<div class="heading"><i class="fa fa-truck" aria-hidden="true"></i>&nbsp;<?php echo $text_shipping_method; ?></div>
          			<div class="shipping-table">
          			<?php if($shipping_address1 && $shipping_required && !$xshipping_method) { ?>
					<div class="col-sm-12"><div class="alert alert-danger noshipping margintop20 marginbottom0"><?php echo $shipping_error; ?></div></div>
					<?php } else { ?>
					<?php echo $xshipping_method; ?>
					<?php } ?>
					</div>
          			</div>
                </div>
                <?php } ?>
                <?php if (($payment_address && !$shipping_required) || ($payment_address && $shipping_address1 && $shipping_required) && $display_comments) { ?>
                <div class="<?php echo $shipping_required?'col-md-6':'col-md-12'; ?>">
                	<div id="comment">
                		<div id="order-comment" class="container_panel" >              
        					<div class="heading"><i class="fa fa-comment" aria-hidden="true"></i>&nbsp;<?php echo $comment_text; ?></div>
        					<textarea name="comment" class="form-control" rows="3" placeholder="<?php echo $comment_placeholder_text; ?>"><?php echo $comment; ?></textarea>
        				</div>
        			</div>
                 </div>
                <?php } ?> 
             </div>        
             <div class="clearfix"></div>               
             <div id="checkout-button row">
			<?php if (($payment_address && !$shipping_required) || ($payment_address && $shipping_address1 && $shipping_required)) { ?>
			  <?php if($isMobile){ ?>  
	      	<div id="options"><?php echo $xoptions;?></div>
	      	<div class="clearfix"></div>
      	     <?php } ?>
              <?php if(!isset($error_stock_warning) && !isset($error_minimum_warning)){ ?>
              <div class="row margintop20">
       			<div id="agree-panel" <?php echo ($shipping_address1 && $shipping_required && !$xshipping_method)?'style="display:none;"':''; ?> class="col-md-12 agree-panel">
       			<?php if($text_agree){?>
       				<div id="agreeText" class="col-md-6 agreeText">
          			<label class="pointer checkbox is_checkbox"><input type="checkbox" class="input-checkbox" name="agree" value="1" <?php echo ($agree?'checked="checked"':'');?>><span><?php echo $text_agree;?></span></label>          			
    				</div>
    			<?php }?>
    			<div class="<?php echo $text_agree?'col-md-6 large-pull-right paddingright0':'col-md-12 nopadding';?>">
    				<div class="progress progress-continue-disabled" id="progress-continue-disabled" <?php echo ($text_agree && !$agree?'style="display: block"':'style="display: none"');?> >
                    	<div data-trigger="focus" tabindex="0" data-placement="top" data-toggle="popover" title="<?php echo $info_title;?>" data-content="<?php echo $agree_content;?>" class="progress-bar" role="progressbar" id="button-payment-disabled" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
                      		<span><?php echo $text_payment_continue;?><i class="fa fa-lock"></i></span>
                    	</div>
                	</div>
        			<div class="progress progress-continue" id="progress-continue" <?php echo ($text_agree && !$agree?'style="display: none"':'');?> >
                    	<div class="progress-bar progress-bar-success" role="progressbar" onclick="callPaymentFromGuest();" id="button-payment" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                      		<span><?php echo $text_payment_continue;?></span>
                    	</div>
                 	</div>
                 </div>
        		</div>
        		</div>
        		<?php } else{ ?>
			        <?php if(isset($error_stock_warning)) { ?>
						<div class="alert alert-danger noshipping margintop20 marginbottom0"><?php echo $error_stock_warning; ?></div>
					<?php } ?>
					<?php if(isset($error_minimum_warning)) { ?>
						<div class="alert alert-danger noshipping margintop20 marginbottom0"><?php echo $error_minimum_warning; ?></div>
					<?php } ?>
		       <?php } ?>	
      		   <?php } ?>
</div>   		   
<?php } ?>
</div>
<?php if(!$address_modal){ ?>
<div id="guest_payment_panel" <?php echo ($payment_address || $shipping_address1)?'style="display: none;"':''; ?> class="inlineaddress margintop20  zoomIn"><?php echo $payment_inline_form; ?></div>
<?php } ?> 
<?php if(!$address_modal && $shipping_required){ ?>
<div id="guest_shipping_panel" style="display: none;" class="inlineaddress margintop20  zoomIn"><?php echo $shipping_inline_form; ?></div>
<?php } ?>
</div>
</div>
<div  class="col-md-3 lborder">
<div id="sLoader" class="loader"></div>    
<?php if($address_block && $shipping_required && $shipping_address1){ ?>
<div id="shipping_method" class="panel panel-green1">
<div class="panel-heading"><i class="fa fa-truck" aria-hidden="true"></i>&nbsp;<?php echo $text_shipping_method; ?></div>
<div class="shipping-table">
<?php if($shipping_address1 && $shipping_required && !$xshipping_method) { ?>
<span class="xerror noshipping marginbottom0"><?php echo $shipping_error; ?></span>
<?php } else { ?>
<?php echo $xshipping_method; ?>
<?php } ?>
</div>
</div>
<?php } ?>
<?php if((($payment_address && !$shipping_required) || ($payment_address && $shipping_address1 && $shipping_required)) && $address_block && $isMobile){ ?>  
<div id="options" class="animated1 zoomIn1"><?php echo $xoptions;?></div>
<div class="clearfix"></div>
<?php } ?>
<?php if(!$shipping_required && !$isMobile){ ?>
<div id="xcart" class="animated1 zoomIn1"><?php echo $xcart; ?></div>
<div class="clearfix"></div>
<?php } ?> 
<?php if ((($payment_address && !$shipping_required) || ($payment_address && $shipping_address1 && $shipping_required)) && $address_block) { ?>       
       			<?php if(!isset($error_stock_warning) && !isset($error_minimum_warning)){ ?>
       			<div id="agree-panel" <?php echo ($addresses && $shipping_required && !$xshipping_method)?'style="display:none;"':''; ?> class="agree-panel">
       			<?php if($text_agree){?>
       				<div id="agreeText" class="agreeText agreeTextalternate text-center">
          				<label class="pointer checkbox is_checkbox"><input type="checkbox" class="input-checkbox" name="agree" value="1" <?php echo ($agree?'checked="checked"':'');?>><span><?php echo $text_agree;?></span></label>
    				</div>       				
    			<?php }?>    			
    			<div class="progress progress-continue-disabled" id="progress-continue-disabled" <?php echo ($text_agree && !$agree?'style="display: block"':'style="display: none"');?> >
                    	<div data-trigger="focus" tabindex="0" data-placement="top" data-toggle="popover" title="<?php echo $info_title;?>" data-content="<?php echo $agree_content;?>" class="progress-bar" role="progressbar" id="button-payment-disabled" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
                      		<span><?php echo $text_payment_continue;?><i class="fa fa-lock"></i></span>
                    	</div>
                </div>
        		<div class="progress progress-continue" id="progress-continue" <?php echo ($text_agree && !$agree?'style="display: none"':'');?> >
                  	<div class="progress-bar progress-bar-success" onclick="callPaymentFromGuest();" role="progressbar" id="button-payment" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                  		<span><?php echo $text_payment_continue;?></span>
                   	</div>
                	</div>
                 </div>   
		<?php } else{ ?>
			        <?php if(isset($error_stock_warning)) { ?>
						<div class="alert alert-danger noshipping margintop20 marginbottom0"><?php echo $error_stock_warning; ?></div>
					<?php } ?>
					<?php if(isset($error_minimum_warning)) { ?>
						<div class="alert alert-danger noshipping margintop20 marginbottom0"><?php echo $error_minimum_warning; ?></div>
					<?php } ?>
		       <?php } ?>       		

      <?php } ?> 
<?php if($shipping_required || $isMobile){ ?>
      <div id="xcart" class="animated1 zoomIn1"><?php echo $xcart; ?></div>      
      <div class="clearfix"></div>
<?php } ?>
<?php if(!$isMobile) { ?>  
<div id="options"><?php echo $xoptions;?></div>    
<div class="clearfix"></div>
<?php } ?>
<div id="totals"><?php echo $xtotals; ?></div>  
<div class="clearfix"></div>
</div>
</div></div>
<?php if($mask){ ?>
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
jQuery(function($){
<?php foreach ($mask as $key=>$value){ ?>	      
$("#guestfieldspayment #<?php echo $key; ?>").mask("<?php echo $value; ?>");
<?php if($shipping_required && !$same_shipping){ ?>
$("#guestfieldsshipping #<?php echo $key; ?>").mask("<?php echo $value; ?>");
<?php } ?>
<?php }?>
});
</script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/xcustom.js"></script>
<script type="text/javascript">
<?php if (!$address_modal && !$payment_address && !$shipping_address1) { ?>
$(document).ready(function() {
	$('.col-md-3.lborder').addClass('xblur');
});
<?php } ?>
<?php if ($address_modal && !$payment_address && !$shipping_address1) { ?>
$(document).ready(function() {
    $('#addressModalpayment').modal('show');
});	
<?php } else { ?>
$(document).ready(function() {
	$('body').removeClass('modal-open');
});	
<?php } ?>
$(function () {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();
  }); 
$('#step1 a').click(function(event){
    event.preventDefault();               
  click1();
});
$("#click1").click(function() {
  click1();
});
function click1(){
  $('#step3').removeClass('active');
  $('#step3').addClass('disabled');
  $('#step2').removeClass('active');
  $('#step2').removeClass('complete');
  $('#step2').addClass('disabled');
  $('#click2').removeClass('clickable');
  $('#undo2').hide();
  $('#step1').removeClass('complete');
    $('#step1').addClass('active');
    $('#click1').removeClass('clickable');          
  $('#step1 a').removeAttr('href');
  $('#undo1').hide(); 
  $('#step_payment_panel').hide();
  $('#step_payment_panel').html('');
  $('#step_address_panel').hide();
  $('#step_address_panel').html('');
  $('#step_login_panel').show();
};
$('input[type="checkbox"][name="agree"]').change(function() {
  if(this.checked){
      $('#progress-continue').css('display','block');
      $('#progress-continue-disabled').css('display','none');
    }else{
      $('#progress-continue').css('display','none');
      $('#progress-continue-disabled').css('display','block');        
    }
});
</script>
<script type="text/javascript">
$('.date').datetimepicker({
  pickTime: false
});
$('.time').datetimepicker({
  pickDate: false
});
$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});
</script>
<?php } ?>