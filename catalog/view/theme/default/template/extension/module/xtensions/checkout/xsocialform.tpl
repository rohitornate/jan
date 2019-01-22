<?php if (isset($redirect)) { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } else{ ?>
<div id="socialpanel" class="login-section socialpanel">
<div id="modalEditLoader" class="loader"></div>
<button type="button" class="close" onclick="$('#xlogin2').remove();$('#loginPage').show();"><span aria-hidden="true">x</span></button>
<div class="profile-card <?php echo $platform; ?>">
  <div class="profile-card-block">
      <span class="img-block"><img src="<?php echo $pictureUrl; ?>"></span>
    <div class="socialusername"><?php echo $name;?></div>
  </div>
</div>
<div id="socialloginField" class="row socialloginField">
<div class="col-md-12">
<div class="alert alert-social-info "><i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;<?php echo $text_social_additional; ?></div>
</div>
              <div class="col-md-12" >
          	  <form role="form" id="sociallogin" autocomplete="off"  action="#" novalidate method="post" enctype="multipart/form-data">                            
              <?php foreach ($fields['checkout'] as $html){ ?>
          		<?php echo $html; ?>
          	  <?php } ?>
          	  <?php if($display_newsletter){ ?>
                  <div class="form-group">
                      <div class="checkbox is_checkbox">
					  	<label for="socialnewsletter"><input type="checkbox" class="input-checkbox" name="newsletter" value="1" id="socialnewsletter" checked="checked"><?php echo $entry_newsletter; ?></label>
					  </div>
                  </div>
               <?php } ?>   
               <?php if($text_agree){ ?>
                  <div id="agreesocialouter" class="form-group">
                      <div class="checkbox is_checkbox">
					  	<label for="agreesocial"><input type="checkbox" class="input-checkbox" name="socialagree" value="1" id="agreesocial"><?php echo $text_agree; ?></label>
					  </div>
                  </div>
			  <?php } ?>                  
              <div class="buttons">
         		<input type="submit" value="<?php echo $button_continue; ?>" id="button-social-register" data-loading-text="Loading..." class="btn btn-success width100" />
       		  </div>
          </form>
          </div>
        </div>
</div>        
<?php if($mask){ ?>
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
jQuery(function($){
<?php foreach ($mask as $key=>$value){ ?>	      
$("#sociallogin #<?php echo $key; ?>").mask("<?php echo $value; ?>");	      
<?php }?>
});
</script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/xcustom.js"></script>
<script type="text/javascript">
$('#sociallogin input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=<?php echo $xtensions_controller_path; ?>checkout/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('#socialloginField .custom-field').hide();
			$('#socialloginField .custom-field label span.fieldlabel').removeClass('required');			
			for (i = 0; i < json.length; i++) {
				custom_field = json[i];
				$('#socialloginField  #custom-field' + custom_field['custom_field_id']).show();
				if (custom_field['required']) {					
					$('#socialloginField #custom-field' + custom_field['custom_field_id'] + ' label > span.fieldlabel').addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('#socialloginField input[name=\'customer_group_id\']:checked').trigger('change');
</script>
<script type="text/javascript">
$('[data-toggle="tooltip"]').tooltip();
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
