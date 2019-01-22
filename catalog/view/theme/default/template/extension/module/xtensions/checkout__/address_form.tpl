<?php if($address_modal){ ?>
<div id="addressModal<?php echo $is_edit?'_edit':''; ?>" class="modal fixed xmargin"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><?php echo $is_edit?$text_edit_address_heading:$text_new_address_heading;?></h4>
      </div>
      <div class="modal-body">
<?php } ?>      
    	<div id="<?php echo $is_edit?'editLoader':'addLoader'; ?>" class="loader"></div>    
          <form id="<?php echo $is_edit?'form_edit_address':'form_add_address'; ?>" role="form" action="#" autocomplete="off" method="post" novalidate enctype="multipart/form-data">
          	<?php if(!$address_modal){ ?>
          	<h3 class="address_title"><?php echo $is_edit?$text_edit_address_heading:$text_new_address_heading;?></h3>
          	<?php } ?>          
            <fieldset id="address_fields<?php echo $is_edit?'_edit':''; ?>">
            <?php if($is_edit){ ?>
            <input type="hidden" name="address_id" value="<?php echo $address['address_id']; ?>" />
            <?php } ?>
            <?php foreach ($fields['checkout'] as $html){ ?>
          		<?php echo $html; ?>
          	 <?php } ?>
                 
    	  <?php if(($addresses && !$is_edit) || ($is_edit && !$default)){ ?>
    	  <div class="form-group">
    	  <div class="checkbox_options">
    	  <label for="default_checkbox<?php echo $is_edit?'_edit':''; ?>" class="pointer checkbox is_checkbox">
    	  <input type="checkbox" class="input-checkbox" id="default_checkbox<?php echo $is_edit?'_edit':''; ?>" name="default" value="1" ><span><?php echo $entry_default; ?></span></label>          
          </div>
          </div>
          <?php } else {?>
            <input type="hidden" name="default" value="1" />
          <?php }?>      
          
        	<div class="<?php echo $addresses?'group-half group-left group':'';?>">
        	<div class="buttons">
         			<input type="submit" value="<?php echo $is_edit?$text_save:($addresses?$text_save:$button_continue);?>" id="<?php echo $is_edit?'editAdress':'addAdress';?>" data-loading-text="Loading..." class="btn btn-success width100" />
				</div>     	
			</div> 			
			<?php if($addresses){ ?>
        	<div class="group-half group-right group">
        	<div class="progress progress-continue-disabled">
        		<?php if($address_modal){ ?>
                    <div data-dismiss="modal" class="progress-bar" role="progressbar" id="cancelAddress" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                     <span><?php echo $text_cancel;?></span>
                    </div>
                    <?php } else { ?>
                    <div onclick="toggleElement('#existingAddressPanel, <?php echo $is_edit?'#editAddressFields':'#addressfields';?>');$('.col-md-3.lborder').removeClass('xblur');" class="progress-bar" role="progressbar" id="cancelAddress" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                     <span><?php echo $text_cancel;?></span>
                    </div>                      
                    <?php } ?>                     
                  </div>
			</div> 			
			<?php } ?>
            </fieldset>
          </form>
<?php if($address_modal){ ?>          
      </div>     
    </div>
  </div>
</div>
<?php } ?>
<?php if($is_edit){ ?>  
 <?php if($mask){ ?>  
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
 jQuery(function($){
 <?php foreach ($mask as $key=>$value){ ?>	      
 $("#address_fields_edit #<?php echo $key; ?>").mask("<?php echo $value; ?>");	      
 <?php }?>
 });
 </script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/xcustom.js"></script> 
 <script type="text/javascript">
 $(function () {
     $('[data-toggle="tooltip"]').tooltip();
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
$('#address_fields_edit <?php echo ($display_country?'select':'input');?>[name=\'country_id\']').bind('change', function() {
	loadZone(<?php echo "'address_fields_edit',this.value,'".$zone_id."','".$text_select."','".$text_none ."'";?>);	
});
$('#address_fields_edit <?php echo ($display_country?'select':'input');?>[name=\'country_id\']').trigger('change');	
</script>
<?php } else { ?>
<script type="text/javascript">
$('#address_fields <?php echo ($display_country?'select':'input');?>[name=\'country_id\']').bind('change', function() {
	loadZone(<?php echo "'address_fields',this.value,'".$zone_id."','".$text_select."','".$text_none ."'";?>);	
});
$('#address_fields <?php echo ($display_country?'select':'input');?>[name=\'country_id\']').trigger('change');
</script>
<?php } ?> 	 
