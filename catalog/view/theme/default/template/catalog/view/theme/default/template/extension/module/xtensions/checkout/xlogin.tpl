<input type="hidden" name="account" id="account" value="<?php echo $account; ?>" />
<?php if($clean_login){ ?>
<div id="xlogin" class="login-panel-bg">
<div id="loginPage" class="login-section">
<div id="login-tabs" class="tabbable">
<ul id="accountTabs" class="nav nav-tabs">
<li class="login-step<?php echo ($account=='login')?' active':''; ?>" data-sort="<?php echo $account_sort['login']; ?>">
	<a data-target="#panel-login" data-toggle="tab" account="login"><?php echo $text_login; ?></a>
</li>
<li class="register-step<?php echo ($account=='register')?' active':''; ?>" data-sort="<?php echo $account_sort['register']; ?>">
	<a data-target="#panel-register" data-toggle="tab" account="register"><?php echo $text_register; ?></a>
</li>
<?php if ($checkout_guest) { ?>
<li class="guest-step<?php echo ($account=='guest')?' active':''; ?>" data-sort="<?php echo $account_sort['guest']; ?>">
	<a data-target="#panel-register" data-toggle="tab" account="guest"><?php echo $text_guest; ?></a>
</li>
<?php }?>
</ul>
</div>
<?php echo $xsocial; ?>
<div class="tab-content">
<div class="tab-pane <?php echo ($account=='login')?'active':''; ?>" id="panel-login"> 
            <div class="row">
              <div class="col-md-12">
              <form role="form" id="form_login" action="#" autocomplete="off" method="post" novalidate enctype="multipart/form-data">              
               <div id="xlogin-panel">
               <?php if(!$xsocial){ ?>
               <div class="section-heading"><?php echo $text_login_heading; ?></div>
               <?php } ?>
               <div class="group is_first">                    
                    <input type="text" name="email" class="inputMaterial">
                    <label for="email"><?php echo $entry_email; ?></label>
                  </div>                 
                    <div class="group">
                      <?php if(false) { ?>
					  <?php /* this was supposed to be a fix to disable autofill in chrome and other browsers that ignore automplete */ ?>
					  <input name="password" style="display: none;" type="password" />
					  <?php } ?>                      
                      <input type="password" name="password" class="inputMaterial">
                      <label><?php echo $entry_password; ?></label>                      
                    </div>
                    <input type="hidden" name="account" id="account_login" class="account_form" value="<?php echo $account; ?>" />                              
                    <div class="buttons">
         				<input type="submit" value="<?php echo $button_continue; ?>" account="login" id="button-login" data-loading-text="Loading..." class="btn btn-success width100" />
       				</div>
       				</div>     				       
       				</form>                     
              </div>
            </div>  
             <div class="footer-separator"><span class="pull-left"> <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a> </span>
				<span class="pull-right"> <a class="pointer" onclick="$('#accountTabs.nav-tabs li.register-step a').click();"><?php echo $text_account_new; ?></a>
			</span>
			</div>  
			<div class="clearfix"></div>
</div>
<div class="tab-pane <?php echo ($account!='login')?'active':''; ?>" id="panel-register">             
<div id="xregister-panel">
            <div class="row" id="tab-register">
              <div class="col-md-12" >  
              <form role="form" id="form_register" autocomplete="off"  action="#" novalidate method="post" enctype="multipart/form-data">
              <div class="section-heading hide_register"><?php echo $text_guest_checkout; ?></div>
              <?php if(!$xsocial){ ?>
              <div class="section-heading hide_guest"><?php echo $text_account_new; ?></div>
              <?php } ?>
              <input type="hidden" name="account" id="account_register" class="account_form" value="<?php echo $account; ?>" />
              <?php foreach ($fields['checkout'] as $html){ ?>
          		<?php echo $html; ?>
          	  <?php } ?>   
          	  <?php if($display_newsletter){ ?>
                  <div class="form-group hide_guest">
                      <div class="checkbox is_checkbox">
					  	<label for="newsletter"><input type="checkbox" class="input-checkbox" name="newsletter" value="1" id="newsletter" checked="checked"><?php echo $entry_newsletter; ?></label>
					  </div>
                  </div>
               <?php } ?>  
               <?php if($text_agree){ ?> 
                  <div id="xagreep" class="form-group hide_guest">
                      <div class="checkbox is_checkbox">
					  	<label id="xagree" for="agree"><input type="checkbox" class="input-checkbox" name="agree" value="1" id="agree"><?php echo $text_agree; ?></label>
					  </div>
                  </div>
                <?php } ?>
                <?php if($captcha){ ?>
               	<div class="group <?php echo $register_captcha?'':'hide_register'; ?> <?php echo $checkout_guest && $guest_captcha?'':'hide_guest'; ?>">
			  		<?php echo $captcha; ?>
			  	</div>
			  	<?php } ?>
                <div class="buttons">
         		   <input type="submit" value="<?php echo $button_continue; ?>" id="button-register" account="register" data-loading-text="Loading..." class="btn btn-success width100" />
       			</div>
              </form>
              </div>
            </div> 
             <div class="separator"></div>
             <div class="text-center">  
             <label class="text-separator"><?php echo $text_account_already_checkout; ?></label>
             <a onclick="$('#accountTabs.nav-tabs li.login-step a').click();" class="btn btn btn-success width100" ><?php echo $text_login; ?></a>                                   
             </div>
             </div>
             </div>
</div>              
			             
</div>
</div>
<?php } else { ?>
<div id="loginPage" class="container animated zoomIn">
  <div class="row equal">
    <div class="col-md-9">
    <ul class="row hidden nav nav-pills nav-wizard hidden-xs">
        	<li class="active"><a><?php echo $text_checkout_step_1; ?></a><div class="nav-arrow"></div></li>
        	<li class="locked"><div class="nav-wedge"></div><a><?php echo $text_checkout_step_2; ?><i class="fa fa-lock"></i></a><div class="nav-arrow"></div></li>
        	<li class="locked"><div class="nav-wedge"></div><a><?php echo $text_checkout_step_3; ?><i class="fa fa-lock"></i></a></li>
    	</ul>
    <div class="row">      
	<div class="col-md-3 nopadding">
	<div class="pside-bar">       
        <nav id="login-tabs" class="nav-sidebar">
          <ul id="accountTabs" class="nav nav-tabs tabs-left">
            <li <?php if($account=='login') echo 'class="active"';?> data-sort="<?php echo $account_sort['login']; ?>">
              <a data-target="#tab-login" data-toggle="tab" account="login">
                <span><?php echo $text_login; ?></span>
              </a>
            </li>
            <li <?php if($account=='register') echo 'class="active"';?> data-sort="<?php echo $account_sort['register']; ?>">
              <a data-target="#tab-register" data-toggle="tab" account="register">
                <span><?php echo $text_register; ?></span>
              </a>
            </li>
            <?php if ($checkout_guest) { ?>             
            <li <?php if($account=='guest') echo 'class="active"';?> data-sort="<?php echo $account_sort['guest']; ?>">
              <a data-target="#tab-register" data-toggle="tab" account="guest">
                <span><?php echo $text_guest; ?></span>
              </a>
            </li>
           <?php } ?>
          </ul>
        </nav>
      </div>
      </div>
      <!--col-md-3 ends-->
      <div class="col-md-9">
      <?php echo $xsocial; ?>
        <div class="tab-content">
          <div class="tab-pane <?php if($account=='login') echo 'active';?>  text-style" id="tab-login">
             
            <div class="row">
              <?php if(!$xsocial){ ?>
              <div class="section-heading"><?php echo $text_login_heading; ?></div>
              <?php } ?>
              <div class="col-md-12">
              <form role="form" id="form_login" action="#" autocomplete="off" method="post" novalidate enctype="multipart/form-data">              
               <div id="xlogin-panel">
               <div class="group is_first">                    
                    <input type="text" name="email" class="inputMaterial">
                    <label for="email"><?php echo $entry_email; ?></label>
                  </div>                 
                    <div class="group">
                      <?php if(false) { ?>
					  <?php /* this was supposed to be a fix to disable autofill in chrome and other browsers that ignore automplete */ ?>
					  <input name="password" style="display: none;" type="password" />
					  <?php } ?>
                      <input type="password" name="password" class="inputMaterial">
                      <label><?php echo $entry_password; ?></label>
                      <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                    </div>
                    <input type="hidden" name="account" id="account_login" class="account_form" value="<?php echo $account; ?>" />                              
                    <div class="buttons">
         				<input type="submit" value="<?php echo $button_continue; ?>" account="login" id="button-login" data-loading-text="Loading..." class="btn btn-success width100" />
       				</div>
       				</div>     				       
       				</form>                     
              </div>
            </div>
          </div>
          <div class="tab-pane <?php echo in_array($account,array('register','guest'))?'active':'' ;?> text-style" id="tab-register">
            <div class="row">
              <div class="col-md-12" >  
              <form role="form" id="form_register" autocomplete="off"  action="#" novalidate method="post" enctype="multipart/form-data">
              <div class="section-heading hide_register"><?php echo $text_guest_checkout; ?></div>
              <?php if(!$xsocial){ ?>
              <div class="section-heading hide_guest"><?php echo $text_account_new; ?></div>
              <?php } ?>
              <input type="hidden" name="account" id="account_register" class="account_form" value="<?php echo $account; ?>" />
              <?php foreach ($fields['checkout'] as $html){ ?>
          		<?php echo $html; ?>
          	  <?php } ?>   
          	  <?php if($display_newsletter){ ?>
                  <div class="form-group hide_guest">
                      <div class="checkbox is_checkbox">
					  	<label for="newsletter"><input type="checkbox" class="input-checkbox" name="newsletter" value="1" id="newsletter" checked="checked"><?php echo $entry_newsletter; ?></label>
					  </div>
                  </div>
               <?php } ?>   
               <?php if($text_agree){ ?>
                  <div id="xagreep" class="form-group hide_guest">
                      <div class="checkbox is_checkbox">
					  	<label id="xagree" for="agree"><input type="checkbox" class="input-checkbox" name="agree" value="1" id="agree"><?php echo $text_agree; ?></label>
					  </div>
                  </div>
			  <?php } ?>
			  <?php if($captcha){ ?>
			  <div class="group <?php echo $register_captcha?'':'hide_register'; ?> <?php echo $checkout_guest && $guest_captcha?'':'hide_guest'; ?>">
			  <?php echo $captcha; ?>
			  </div>                
			  <?php }?> 
              <div class="buttons">
         		<input type="submit" value="<?php echo $button_continue; ?>" id="button-register" account="register" data-loading-text="Loading..." class="btn btn-success width100" />
       		  </div>
              </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  <div class="col-md-3 lborder">
  <div id="xcart" class="animated1 zoomIn1"><?php echo $xcart; ?></div>
  <div id="options" class="animated fadeIn"><?php echo $xoptions; ?><div class="clearfix"></div></div>
  <div id="totals" class="animated fadeIn"><?php echo $xtotals; ?></div>
  </div>
  </div>
</div>
<?php } ?>
<?php if($mask){ ?>
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
jQuery(function($){
<?php foreach ($mask as $key=>$value){ ?>	      
$("#form_register #<?php echo $key; ?>").mask("<?php echo $value; ?>");	      
<?php }?>
});
</script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/xtensions/stylesheet/bs/js/xcustom.js"></script>  
<script type="text/javascript">
$(document).ready(function(){
	$("#accountTabs").append($("#accountTabs li").get().sort(function(a, b) {
    return parseInt($(a).attr("data-sort").match(/\d+/), 10)
         - parseInt($(b).attr("data-sort").match(/\d+/), 10);
	}));
});
$('#tab-register input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=<?php echo $xtensions_controller_path; ?>checkout/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('#tab-register .custom-field').hide();
			$('#tab-register .custom-field label span.fieldlabel').removeClass('required');			
			for (i = 0; i < json.length; i++) {
				custom_field = json[i];
				$('#tab-register  #custom-field' + custom_field['custom_field_id']).show();
				if (custom_field['required']) {					
					$('#tab-register #custom-field' + custom_field['custom_field_id'] + ' label > span.fieldlabel').addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('#tab-register input[name=\'customer_group_id\']:checked').trigger('change');
</script>
<script type="text/javascript">
$('[data-toggle="tooltip"]').tooltip();
$(document).on("click", "#login-tabs [data-toggle='tab']", function(event) {     
     $('.account_form').val($(this).attr('account'));
     $('#account').val($(this).attr('account'));  
     hide_guest();       
});
$(function () {
	  $('[data-toggle="tooltip"]').tooltip();
})
function hide_guest(){
	if($('#account').val() == 'guest'){
		$('.hide_guest').hide();
		$('.hide_register').show();
		$('.hide_guest').each(function( index ) {
			if ($(this).parent().hasClass('group-left') || $(this).parent().hasClass('group-middle') || $(this).parent().hasClass('group-right')) {
				$(this).parent().hide();
			}
		});		
	}else{
		$('.hide_guest').show();
		$('.hide_register').hide();
		$('.hide_guest').each(function( index ) {
			if ($(this).parent().hasClass('group-left') || $(this).parent().hasClass('group-middle') || $(this).parent().hasClass('group-right')) {
				$(this).parent().show();
			}
		});		
	}
}
hide_guest();
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
