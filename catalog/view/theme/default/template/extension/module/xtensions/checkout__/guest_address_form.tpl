<?php if($address_modal){ ?>
<div id="addressModal<?php echo $section; ?>" class="modal fixed xmargin"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><?php echo $text_new_address_heading;?></h4>
      </div>
      <div class="modal-body">
<?php } ?>      
    	<div id="guestLoader<?php echo $section; ?>" class="loader"></div>    
          <form id="form_guest_address_<?php echo $section; ?>" role="form" action="#" autocomplete="off" method="post" novalidate enctype="multipart/form-data"> 
          <?php if(!$address_modal){ ?>
          	<h3 class="address_title"><?php echo $text_new_address_heading;?></h3>
          	<?php } ?>         
            <fieldset id="guestfields<?php echo $section; ?>">            
            <input type="hidden" value="<?php echo $section; ?>" name="section" />
            <?php if($same_shipping){ ?>
            <input type="hidden" value="1" name="xshipping_address_check" />
            <?php } ?>
            <?php foreach ($fields[$section] as $html){ ?>
          		<?php echo $html; ?>
          	  <?php } ?> 
        	<div class="<?php echo $addresses?'group-half group-left group':'';?>">
        	<div class="buttons">
         			<input type="submit" section="<?php echo $section; ?>" value="<?php echo $button_continue;?>" id="saveGuestAddress" data-loading-text="Loading..." class="btn btn-success width100" />
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
                    <div onclick="toggleElement('#guestPanel , <?php echo $section=='payment'?'#guest_payment_panel':'#guest_shipping_panel';?>');$('.col-md-3.lborder').removeClass('xblur');" class="progress-bar" role="progressbar" id="cancelAddress" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
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
<script type="text/javascript">
$('#guestfields<?php echo $section; ?> <?php echo ($display_country?'select':'input');?>[name=\'country_id\']').bind('change', function() {
	loadZone(<?php echo "'guestfields".$section."',this.value,'".$zone_id[$section]."','".$text_select."','".$text_none ."'";?>);	
});
$('#guestfields<?php echo $section; ?> <?php echo ($display_country?'select':'input');?>[name=\'country_id\']').trigger('change');
</script>
