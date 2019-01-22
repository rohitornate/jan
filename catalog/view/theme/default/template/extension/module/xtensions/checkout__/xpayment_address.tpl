<style>
.progress-bar-success {
    background-color: #f5da63;
    -webkit-box-shadow: none;
    box-shadow: none;
    border: 1px solid #d7b215;
	color:#000;
}

.progress-bar-success span {
    color: #333;
	font-weight:bold;
}

.input-checkbox:checked {
    border: none;
    box-shadow: 0 0 0 10px #d7b215 inset;
}

.checkbox.is_checkbox input[type=checkbox].input-checkbox {
    margin-left: 0px;
    margin-right: 5px;
    position: relative;
    top: -3px;
    border: 2px solid #d7b215;
	border-radius: 1px;
}

.agreeText label span {
    font-size: 13px;
    text-decoration: none;
    text-transform: none;
    margin-left: 10px;
}

.strip
{
	background-color:#f9f9f9;
	border:1px solid gray;
	margin-top:20px;
}

</style>

<?php if($force_redirect){ ?>
<script type="text/javascript">
location = '<?php echo $force_redirect; ?>';
</script>
<?php } else { ?>
<?php echo $modal_form; ?>
<div id="addressPage" class="container">
<div class="row equal">
<div id="existingAddress" class="col-md-9 animated fadeIn">
<ul class="hidden nav nav-pills nav-wizard hidden-xs">
        	<li class="locked"><a><?php echo $text_checkout_step_1; ?><i class="fa fa-lock"></i></a><div class="nav-arrow"></div></li>
        	<li class="active"><div class="nav-wedge"></div><a><?php echo $text_checkout_step_2; ?></a><div class="nav-arrow"></div></li>
        	<li class="locked"><div class="nav-wedge"></div><a><?php echo $text_checkout_step_3; ?><i class="fa fa-lock"></i></a></li>
    	</ul>
<div id="existingAddressPanel" <?php echo $addresses || ($address_modal && !$addresses)?'':'style="display:none;"'?>>
<?php if($addresses && $shipping_required && !$xshipping_method) { ?>
	<div class="alert alert-danger noshipping margintop20 marginbottom0"><?php echo $shipping_error; ?></div>
<?php } ?>
<?php if($address_block || !$addresses){ ?>
<?php if(!$shipping_required || $same_shipping || !$addresses){ ?>
	<input type="hidden" name="xshipping_address_check" value="1"  />
<?php } else { ?>
	<div class="checkbox is_checkbox info-back-checkout text-center">
		<label for="shipping_check">
		<input type="checkbox" class="input-checkbox" name="xshipping_address_check" value="1" id="shipping_check" <?php echo ($same_address ?'checked="checked"':''); ?> /><?php echo $entry_shipping; ?></label>
	</div>
<?php }?>
<?php if($addresses) { ?>
	<div class="row">
		<div class="col-md-12 ">              
		    <h4 style="cursor: pointer;" class="pull-right">
		    <?php if($address_modal){ ?>
		    	<a data-toggle="modal" data-target="#addressModal"><i class="fa fa-plus"></i>&nbsp;<?php echo $text_address_new;?></a>
			<?php } else { ?>
				<a onclick="toggleElement('#existingAddressPanel, #addressfields');$('.col-md-3.lborder').addClass('xblur');"><i class="fa fa-plus"></i>&nbsp;<?php echo $text_address_new;?></a>
			<?php } ?>
		    </h4>
		</div>
	</div>
<?php } ?>
	<div class="clearfix"></div>
<?php if ($addresses) { ?>
              <div class="row">
                <?php foreach ($addresses as $address) { ?>
                <div class="col-sm-6 col-md-4 text-center">
                  <div class="panel panel-default">                   
                   <div class="panel-heading <?php echo ($address['address_id'] == $address_id)?'selected':''?>">
                    <div class="radio">                        
                        <label for="p-<?php echo $address['address_id']; ?>">
                        <input id="p-<?php echo $address['address_id']; ?>" <?php echo ($address['address_id'] == $address_id)?'checked="checked"':''?> type="radio" name="address_id" value="<?php echo $address['address_id']; ?>" />  
                          <span class="padd"><?php echo (($shipping_required && $same_shipping)? $text_psaddress:$text_paddress); ?></span>                         
                        </label>                        
                    </div>
                    </div>                                       
                    <div class="panel-body highlight">
                    <p class="text-justified"><?php echo $address['address']; ?></p>
                    <?php echo ($address['default']?$entry_default:'<span>'.$address['delete']).'</span>';?>
                    <span><?php echo $address['edit']; ?></span>
                    <div class="clearfix"></div>  
                    </div>
                    <?php if($shipping_required && !$same_shipping){ ?>
                    <div <?php echo ($same_address ?'style="display:none;"':''); ?> class="panel-footer <?php echo ($address['address_id'] == $shipping_address_id)?'selected':''?>"">
                    <div class="radio">                    
                        <label for="s-<?php echo $address['address_id']; ?>">
                      <input id="s-<?php echo $address['address_id']; ?>" <?php echo ($address['address_id'] == $shipping_address_id)?'checked="checked"':''?> type="radio" name="saddress_id" value="<?php echo $address['address_id']; ?>" />      
                          <?php echo $text_saddress;?>                         
                        </label>
                    </div>                  
                    </div>                     
                    <?php } ?>                   
                  </div>
                </div>
                <div class="clearfix visible-xs">
                </div>
                <?php } ?>                
              </div>
            <?php } else{ ?>
              <div class="row">                
                <div class="col-md-12">                                                       
                    <div style="background: transparent;" class="jumbotron">                                   
                    <h3 class="text-center"><a style="cursor: pointer;" data-toggle="modal" data-target="#addressModal"><span style="line-height: 170px;" class="glyphicon glyphicon-plus"></span><?php echo $text_new_address_heading; ?></a></h3>
                  </div>
                </div>
              <div class="clearfix visible-xs">
                </div>
              </div>
            <?php } ?>
            </div>
            <?php } else { ?>
              <?php if ($addresses) { ?>
    			<div class="row">       
    			<?php if(!$shipping_required || $same_shipping || !$addresses){ ?>
              <input type="hidden" name="xshipping_address_check" value="1"  />
            <?php }else{ ?>
              <div class="col-md-12">	
               <div class="checkbox is_checkbox info-back-checkout text-center">
              	<label for="shipping_check">
                <input type="checkbox" class="input-checkbox" name="xshipping_address_check" value="1" id="shipping_check" <?php echo ($same_address ?'checked="checked"':''); ?> />
        		<?php echo $entry_shipping; ?>
              	</label>
           	   </div>
           	   </div>
            <?php }?>        	              
                <div class="payment-address-panel <?php echo (!$shipping_required || ($shipping_required && $same_address))?'col-md-12':'col-md-6' ?>">
                  <div class="panel-address">                   
               <div class="panel-address-heading address-type"><!--<i class="fa fa-money" aria-hidden="true"></i>-->&nbsp;<span class="padd"><?php echo (($shipping_required && $same_address)? $text_psaddress:$text_paddress); ?></span>
                   <?php if(count($addresses)>0){ ?>
                   <small class="pull-right">
                   <?php if($address_modal){ ?>
                   <a data-toggle="modal" data-target="#addressModal"><i class="fa fa-plus"></i>&nbsp;<?php echo $text_address_new; ?></a>
                   <?php } else { ?>
                   <a onclick="toggleElement('#existingAddressPanel, #addressfields');$('.col-md-3.lborder').addClass('xblur');"><i class="fa fa-plus"></i>&nbsp;<?php echo $text_address_new; ?></a>
                   <?php } ?>
                   </small>
                   <?php } ?>
                   </div>                    
                    <div class="panel-address-body payment-address" >
                    	<div class="text-justified">
                    	<div class="address-list">
                    	<?php $count = 1;?>                    	
                    	<?php foreach ($addresses as $address) { ?>
                    	<?php $count++; ?>
                    	<label class="address-label <?php echo($address['address_id'] == $address_id) ? 'selected':''; ?> " sort="<?php echo($address['address_id'] == $address_id) ? 1:$count; ?>">
                    	<input class="input-radio" type="radio" name="address_id" value="<?php echo $address['address_id']; ?>" <?php echo($address['address_id'] == $address_id)?'checked="checked"':''; ?> />
                    	<span class="address-string" title="<?php echo $address['linear_address']; ?>"><?php echo $address['linear_address']; ?></span>
                    	<span class="add_delete">
                    		<span class="pull-left"><?php echo ($address['default']?$entry_default:$address['delete']);?></span>
                    		<span class="pull-right"><?php echo $address['edit']; ?></span>  
                    	</span>
                    	</label>
                    	<?php } ?>
                    	</div>                  	
                    </div>
                  </div>
                </div>
                </div>
                <?php if($shipping_required && !$same_shipping){ ?>
                <div class="col-md-6 shipping-address-panel" <?php echo ($same_address ?'style="display:none;"':''); ?> >
                  <div class="panel-address">                   
                   <div class="panel-address-heading"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<?php echo $text_saddress; ?>                   
                   <small class="pull-right">
                   <?php if($address_modal){ ?>
                   <a data-toggle="modal" data-target="#addressModal"><i class="fa fa-plus"></i>&nbsp;<?php echo $text_address_new; ?></a>
                   <?php } else { ?>
                   <a onclick="toggleElement('#existingAddressPanel, #addressfields');$('.col-md-3.lborder').addClass('xblur');"><i class="fa fa-plus"></i>&nbsp;<?php echo $text_address_new; ?></a>
                   <?php } ?>                   
                   </small>                   
                   </div>                    
                    <div class="panel-address-body shipping-address">
                    	<div class="text-justified" >                    	
                    	<div class="address-list">
                    	<?php $count = 1;?>                    	
                    	<?php foreach ($addresses as $address) { ?>
                    	<?php $count++; ?>
                    	<label class="address-label <?php echo($address['address_id'] == $shipping_address_id)?'selected':''; ?>" sort="<?php echo($address['address_id'] == $shipping_address_id) ? 1:$count; ?>">
                    	<input class="input-radio" data-formatted-address="<?php echo $address['address']; ?>" type="radio" name="saddress_id" value="<?php echo $address['address_id']; ?>" <?php echo($address['address_id'] == $shipping_address_id)?'checked="checked"':''; ?> />
                    	<span class="address-string" title="<?php echo $address['linear_address']; ?>"><?php echo $address['linear_address']; ?></span>
                    	<span class="add_delete">
                    		<span class="pull-left"><?php echo ($address['default']?$entry_default:$address['delete']);?></span>
                    		<span class="pull-right"><?php echo $address['edit']; ?></span>  
                    	</span>
                    	</label>
                    	<?php } ?>
                    	</div>
                    	</div>                    	
                    </div>
                  </div>
                </div>
                <?php } ?>                            
               <div class="clearfix"></div>                
              </div>
            <?php } ?>
			
			
			<?php if($text_agree){?>
       				<div id="agreeText" class="col-md-6 agreeText">
          			<label class="pointer checkbox is_checkbox"><input type="checkbox" class="input-checkbox " id="chkPassport" name="comment" value="0" ><span><?php echo $comment_text;?></span></label>          			
    				</div>
    			<?php }?>
			
			
            <?php if($shipping_required || $display_comments){ ?>
            <div class="row">
            	<?php if($shipping_required){ ?>
                <div class="<?php echo $display_comments?'col-md-6':'col-md-12'; ?>">
                	<div id="shipping_method" class="container_panel">                	              
        			<div class="heading"><i class="fa fa-truck" aria-hidden="true"></i>&nbsp;<?php echo $text_shipping_method; ?></div>
          			<div class="shipping-table">
          			<?php if($addresses && $shipping_required && !$xshipping_method) { ?>
					<span class="xerror noshipping marginbottom0"><?php echo $shipping_error; ?></span>
					<?php } else { ?>
					<?php echo $xshipping_method; ?>
					<?php } ?>
					</div>
          			</div>
                </div>
                <?php } ?>
				
				
				
                <?php if ($addresses && $display_comments) { ?>
                <!--<div class="<?php echo $shipping_required?'col-md-6':'col-md-12'; ?>">-->
				<div class="col-md-12">
                	<div id="comment">
                		<div id="order-comment" class="container_panel" style="display:none;">              
        					<div class="heading"><i class="fa fa-comment"></i>&nbsp;<?php echo $comment_text; ?></div>
        					<textarea name="comment" class="form-control"   maxlength="200"  rows="3" placeholder="Enter your message(Maximum characters:200)" placeholder="<?php echo $comment_placeholder_text; ?>"><?php echo $comment; ?></textarea>
        				</div>
        			</div>
                 </div>
                <?php } ?> 
             </div> 
	     <div class="clearfix"></div>
	     <?php } ?>
	     <?php if ($addresses) { ?>
	     <?php if($isMobile){ ?>  
	      	<div id="options" class="animated1 zoomIn1"><?php echo $xoptions;?></div>
	      	<div class="clearfix"></div>
      	     <?php } ?>
	     <?php if(!isset($error_stock_warning) && !isset($error_minimum_warning)){ ?>   
       		<div class="row margintop20">
       			<div id="agree-panel" <?php echo ($addresses && $shipping_required && !$xshipping_method)?'style="display:none;"':''; ?> class="col-md-12 agree-panel">
       			<?php if($text_agree){?>
       				<div id="agreeText" class="col-md-6 agreeText">
          			<label class="pointer checkbox is_checkbox"><input type="checkbox" class="input-checkbox" name="agree" value="1" <?php echo ($agree?'checked="checked"':'');?>><span><?php echo $text_agree;?></span></label>          			
    				</div>
    			<?php }?>
				
				
				<!--<?php if($text_agree){?>
       				<div id="agreeText" class="col-md-6 agreeText">
          			<label class="pointer checkbox is_checkbox"><input type="checkbox" class="input-checkbox " id="chkPassport" name="comment" value="0" ><span><?php echo $comment_text;?></span></label>          			
    				</div>
    			<?php }?>-->
				
				
    			<div class="<?php echo $text_agree?'col-md-6 large-pull-right paddingright0':'col-md-12 nopadding';?>">
    				<div class="progress progress-continue-disabled" id="progress-continue-disabled" <?php echo ($text_agree && !$agree?'style="display: block"':'style="display: none"');?> >
                    	<div data-trigger="focus" tabindex="0" data-placement="top" data-toggle="popover" title="<?php echo $info_title;?>" data-content="<?php echo $agree_content;?>" class="progress-bar" role="progressbar" id="button-payment-disabled" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
                      		<span><?php echo $text_payment_continue;?><i class="fa fa-lock"></i></span>
                    	</div>
                	</div>
        			<div class="progress progress-continue" id="progress-continue" <?php echo ($text_agree && !$agree?'style="display: none"':'');?> >
                    	<div class="progress-bar progress-bar-success" onclick="callPaymentFromAddress();" role="progressbar" id="button-payment" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
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
            <div id="addressfields" <?php echo !$addresses && !$address_modal?'':'style="display:none;"'?> class="inlineaddress margintop20  zoomIn"><?php echo $inline_form; ?></div> 
      		<div id="editAddressFields" style="display: none;" class="inlineaddress margintop20 animated1 zoomIn1"></div>
            </div>
<div class="col-md-3 lborder<?php echo (!$addresses)?' xblur':''; ?>">  
<div id="sLoader" class="loader"></div>  
      <?php if($address_block && $shipping_required){ ?>
      <?php if($addresses){ ?>
      	<div id="shipping_method" class="panel panel-green1 clearfix animated1 zoomIn1">
		<div class="panel-heading"><i class="fa fa-truck" aria-hidden="true"></i>&nbsp;<?php echo $text_shipping_method; ?></div>
		<div class="shipping-table">
		<?php if($shipping_required && !$xshipping_method) { ?>
		<span class="xerror noshipping marginbottom0"><?php echo $shipping_error; ?></span>
		<?php } else { ?>
		<?php echo $xshipping_method; ?>
		<?php } ?>
		</div>
		</div>
		<div class="clearfix"></div>
		<?php } ?>		
		<?php } ?>
		<?php if($addresses && $address_block && $isMobile){ ?>  
	      	<div id="options" class="animated1 zoomIn1"><?php echo $xoptions;?></div>
	      	<div class="clearfix"></div>
      	<?php } ?>
      	<?php if(!$shipping_required && !$isMobile){ ?>
      	<div id="xcart" class="animated1 zoomIn1"><?php echo $xcart; ?></div>
      	<div class="clearfix"></div>
      	<?php } ?>
       <?php if ($addresses && $address_block) { ?> 
       <?php if(!isset($error_stock_warning) && !isset($error_minimum_warning)){ ?>      
       			<div id="agree-panel" <?php echo ($addresses && $shipping_required && !$xshipping_method)?'style="display:none;"':''; ?> class="agree-panel animated1 zoomIn1">
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
                  	<div class="progress-bar progress-bar-success" onclick="callPaymentFromAddress();" role="progressbar" id="button-payment" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
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
      <div id="options" class="animated1 zoomIn1"><?php echo $xoptions;?></div>
      <div class="clearfix"></div>
      <?php } ?>      
	  <div id="totals" class="animated1 zoomIn1"><?php echo $xtotals; ?></div>
	  <div class="clearfix"></div>
    </div>
  </div>
  
  
  
  
  
<?php if($mask){ ?>
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/jquery.maskedinput.min.js"></script>
 <script type="text/javascript">
 jQuery(function($){
 <?php foreach ($mask as $key=>$value){ ?>	      
 $("#address_fields #<?php echo $key; ?>").mask("<?php echo $value; ?>");	      
 <?php }?>
 });
 </script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/xcustom.js"></script>
<script type="text/javascript">
address_block = <?php echo $address_block?'true':'false'; ?>;
<?php if (!$addresses) { ?>
$(document).ready(function() {
    $('#addressModal').modal('show');
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
 $(function () {
        $("#chkPassport").click(function () {
            if ($(this).is(":checked")) {
                $("#order-comment").show();
            } else {
                $("#order-comment").hide();
            }
        });
    });


</script>
<?php } ?>
