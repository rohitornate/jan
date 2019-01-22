<?php echo $header; ?>

  <style>
  
  .btn-default {
    background: #670067 !important;
	}
  
  
  .my-account-header {
    margin-bottom: .781rem;
    font-size: 28px;
    font-size: 1.75rem;
    line-height: 2.125;
    padding-bottom: .500rem;
    letter-spacing: .1em;
    border-bottom: .1rem solid #ccc;
    text-transform: uppercase;
    font-weight: 700;
    
	}
	
	.my-account-welcome__hello {
    font-weight: 700;
    padding: 0px;
    font-size: 1.25rem;
    padding-bottom:1.25em;
    }
	ul.my-account-welcome__links {
    margin-left: 0px;
	list-style:none;
	font-size:1.1rem;
	}
	ul.my-account-nav-list {
    margin-left: 0px;
    
	}
	
	.my-account-nav-list>li {
    list-style: none;
    position: relative;
    padding:15px 0px;
	}
	.my-account-nav-list>li>a {
      font-size:large;
	  text-decoration:none;
	}
	.fa{
	color: #360736;
    padding-right:10px;
	}
	.fa:hover{
	color: black;
    
	}
    .my-account__header {
    margin-bottom: 36px;
    border-bottom: 5px solid #ccc;
	}
	.my-account__header.addr h1 {
    font-weight: 600;
    color: #474747;
    line-height: 1;
    font-size: 24px;
    font-size: 1.375rem;
    text-transform: uppercase;
    margin-top: 0;
	}
	.my-account__header h2 {
    font-size: 1rem;
    font-weight: 600;
    color: #474747;
    padding: 0;
    margin-top: 24px;
    margin-bottom: 15px;
	}
	.myaccount .form-group {
    
    margin: 0 0 20px;
	}
	
	
	.form-group .form-control {
    outline: 0;
    width: 100%;
    height: 36px;
    padding: 0 10px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: 1px solid #4a4a4a;
    font-size: .8125rem;
    color: #000;
    background-color: #ededed;
    border: 0;
}
	
	.btn--primary {
    border: 0;
    background-color: #670067;
    color: #fff;
}
.btn-default {
    background: #670067;
    color:#fff;
}
.btn-primary{
    background: #670067;
    color:#fff;
}


.btn--primary, .btn--secondary, .btn--tertiary {
    font-size: 15px;
    font-size: .9375rem;
    line-height: 1;
    font-weight: 700;
    border-radius: .250rem;
    box-shadow: none;
    letter-spacing: .15em;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    -webkit-transition: background-color .15s ease-in-out;
    transition: background-color .15s ease-in-out;
    display: block;
    margin: 0 0 20px;
   /* width: 100%;*/
    padding: 18px 7.5px;
    height: auto;
    text-transform: uppercase;
    text-align: center;
   }
   .remember{
padding-bottom:20px;
}
   @media (max-width: 767px){
	.my-account__header.addr h1{
	font-size:unset;
	}
	.my-account__header.addr {
	padding-top:10px;
	}
	
	.col-md-9, .col-md-3, .col-sm-9, .col-sm-3, .col-md-12, .col-sm-12, .col-md-4 .col-sm-4{
	padding-right: 0px !important;
    padding-left: 0px !important;
	}
	}
	
  </style>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="my-account-header">My Account</div>
			</div>
	</div>
  
  <div class="row myaccount">
  
 <?php echo $column_left; ?>

  
  
  
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"> <?php echo $content_top; ?>
      <!--<h2 class="title"><?php echo $text_edit_address; ?></h2>-->
	  <div class="my-account__header addr">
										<h1><?php echo $text_edit_address; ?></h1>
										<h2>Add and edit your addresses to save you time during your checkout.</h2>
									</div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <div class="inset">
          
		  <div class="col-md-12 col-sm-12">	
				<div class="col-sm-4 col-md-4">
					<div class="form-group required">
						<label class="col-sm-12 col-md-12 control-label" for="input-firstname">First Name </label>
						<div class="col-sm-12 col-md-12">
							<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="First Name" id="input-firstname" class="form-control">
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4">
					<div class="form-group required">
						<label class="col-sm-12 col-md-12 control-label" for="input-lastname">Last Name</label>
						<div class="col-sm-12 col-md-12">
							<input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="Last Name" id="input-lastname" class="form-control">
						</div>
					</div>
				</div>
			</div>
			<!--<div class="col-md-12 col-sm-12">
				<div class="col-sm-4 col-md-4">
					<div class="form-group required">
						<label class="col-sm-12 col-md-12 control-label" for="input-email">E-Mail</label>
							<div class="col-sm-12 col-md-12">
								<input type="email" name="email" value="<?php echo $email; ?>" placeholder="E-Mail" id="input-email" class="form-control">
							</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4">
					<div class="form-group required">
						<label class="col-sm-12 col-md-12 control-label" for="input-telephone">Telephone</label>
							<div class="col-sm-12 col-md-12">
								<input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="10-digit mobile number without prefixes" id="input-telephone" class="form-control">
							</div>
					</div>
				</div>
			</div>	-->
			<div class="col-md-12 col-sm-12">
											<div class="col-md-8 col-sm-8">
												<div class="form-group required">
												<label class="col-sm-12 col-md-12 for="RQD_address1">Street Address:</label> 
												<div class="col-sm-12 col-md-12">
												<input type="text" placeholder="Flat / House No. / Floor / Building" name="address_1" required="" id="RQD_address1" value="<?php echo $address_1; ?>" class="form-control">
												</div>
												</div>
											</div>
										    </div>
										    <div class="col-md-12 col-sm-12">
											<div class="col-md-8 col-sm-8">
												<div class="form-group required">
												
												<div class="col-sm-12 col-md-12">
												<input type="text" placeholder="Colony / Street / Locality" name="address_2" id="address2" value="<?php echo $address_2; ?>" class="form-control">
												</div>
												</div>
											</div>
										    </div>
										    <div class="col-md-8 col-sm-8">
											<div class="col-md-4 col-sm-4">
												<div class="form-group required">
													<label class="col-sm-12 col-md-12">Pin Code:</label> 
													<div class="col-sm-12 col-md-12">
														<input type="text" placeholder="6 digits [0-9] pincode" name="postcode" required="" id="RQD_zipCode"   value="<?php echo $postcode; ?>" class="form-control">
												   </div>
												</div>
											</div>
											<select name="country_id" id="input-country" class="form-control" style="display:none">
												<option value="99" selected="selected">India</option>
														</select>
											
											
											<div class="col-md-4 col-sm-4">
												<div class="form-group required">
													<label class="col-sm-12 col-md-12" for="txtCity">State</label>
													<div class="col-sm-12 col-md-12">
														
														<select name="zone_id" id="input-zone" class="form-control">
														</select>
															
															
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-4 col-sm-4">
												<div class="form-group required">
													<label class="col-sm-12 col-md-12" for="txtCity">City</label>
													<div class="col-sm-12 col-md-12">
														
														<input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
														
													</div>
												</div>
											</div>
											</div>
											<div class="col-md-12 col-sm-12">
											
											<div class="col-md-4 col-sm-4">
												<div class="remember">
													<input type="checkbox" name="rememberMe" value="true" tabindex="3" checked="checked" style="    position: relative;right: 9px;top: -2px;margin-left: 25px;"> 
													Default Address
												</div>
											</div>
											<div class="col-md-4 col-sm-4">
												
												<button type="submit"  class="btn--primary">Save Address</button>
											</div>
											</div>
											
		  
		  
          <div class="form-group" style="display:none">
            <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
            <div class="col-sm-10">
              <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
            </div>
          </div>
          
          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'address') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $address_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
         
        </div>
       <div class="buttons clearfix">
          <!--<div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default" style=""><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo 'Save Address'; ?>" class="btn btn-default" style="background: #670067 !important;color:#fff;" />
          </div>-->
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length-2) {
		$('.form-group').eq(parseInt($(this).attr('data-sort'))+2).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length-2) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group').length-2) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length-2) {
		$('.form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
			  		}

			  		html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>
