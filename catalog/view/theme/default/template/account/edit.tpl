<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  
  
  
  <div class="row">
			
				<div class="my-account-header">My Account</div>
			
		</div>
  
  <div class="row">
     
	 
	 <?php echo $column_left; ?>

	 
	 

	 
	 
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
   <?php echo $content_top; ?>
      <div  class="col-md-9 col-sm-9">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
						<div class="col-sm-12 col-md-12">
							
							   <div class="my-account__header addr">
								<h1 class="title">Your Personal Details</h1>
								</div>
								    <div class="col-md-12">
									<div class="col-sm-4 col-md-4">
										<div class="form-group required">
											<label class="col-sm-12 col-md-12 control-label" for="input-firstname">First Name </label>
												<div class="col-sm-12 col-md-12">
													<!--<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="First Name" id="input-firstname" class="form-control">-->
												<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
              <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
												
												
												</div>
										</div>
									</div>
									<div class="col-sm-4 col-md-4">
										<div class="form-group required">
											<label class="col-sm-12 col-md-12 control-label" for="input-lastname">Last Name</label>
												<div class="col-sm-12 col-md-12">
													<!--<input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="Last Name" id="input-lastname" class="form-control">-->
													
													<input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
              <?php if ($error_lastname) { ?>
              <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
													
												</div>
										</div>
									</div>
									<div class=" col-md-4">
									</div>
									</div>
									 <div class="col-md-12">
									<div class=" col-md-4">
										<div class="form-group required">
											<label class="col-sm-12 col-md-12 control-label" for="input-email">E-Mail</label>
											<div class="col-sm-12 col-md-12">
												<input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
											</div>
										</div>
									</div>
									<div class="col-sm-4 col-md-4">
										<div class="form-group required">
										<label class="col-sm-12 col-md-12 control-label" for="input-telephone">Telephone</label>
											<div class="col-sm-12 col-md-12">
												<input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
              <?php if ($error_telephone) { ?>
              <div class="text-danger"><?php echo $error_telephone; ?></div>
              <?php } ?>
											</div>
										</div>
									</div>
									
									<div class="col-md-4">
									</div>
									</div>
									<style>
										#accordion .panel-heading { padding: 0;}
										#accordion .panel-title > a {
											display: block;
											padding: 0.4em 0.6em;
											outline: none;
											font-weight:bold;
											text-decoration: none;
											color:red;
										}

										#accordion .panel-title > a.accordion-toggle::before, #accordion a[data-toggle="collapse"]::before  {
											content:"\e113";
											float: left;
											font-family: 'Glyphicons Halflings';
											margin-right :1em;
										}
										#accordion .panel-title > a.accordion-toggle.collapsed::before, #accordion a.collapsed[data-toggle="collapse"]::before  {
											content:"\e114";
										}
										.panel-default{
										 border:0;
										}

									</style>
										
                                       
										<div class="col-md-12 col-sm-12">
										<!--<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
										  <div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingOne">
											  <h4 class="panel-title">
												<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
												  Create a new password
												</a>
											  </h4>
											</div>
											<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
												
													
														<div class="accordion-content">
															   <div class="col-md-12">
																<div class="col-md-4 col-sm-4">
																	<label for="current-password"> Current password:</label>
																	<input type="password" tabindex="5" name="old_password" id="RQD_password" class="form-control" value="<?php echo $old_password; ?>">
																	<?php if ($error_old_password) { ?>
																		<div class="text-danger"><?php echo $error_old_password; ?></div>
																	<?php } ?>
																</div>
															
															
																<div class="col-md-4 col-sm-4">
																	<label for="new-password"> New password:</label>
																	<input type="password" name="password" value="<?php echo $password; ?>" tabindex="6" id="RQD_logonPassword" class="form-control">
																	<?php if ($error_password) { ?>
																		<div class="text-danger"><?php echo $error_password; ?></div>
																	<?php } ?>
																</div>
																<div class="col-md-4">
															     </div>
																 </div>
																<div class="col-md-12">
																<div class="col-md-4 col-sm-4">
																	<label for="confirm-password"> Confirm new password:</label>
																	<input type="password" value="<?php echo $confirm; ?>" tabindex="7" name="confirm" id="RQD_logonPasswordVerify" class="form-control">
																	<?php if ($error_confirm) { ?>
																		<div class="text-danger"><?php echo $error_confirm; ?></div>
																	<?php } ?>
																</div>
																</div>
														</div>
														
												
											</div>
										  </div>
										</div>-->
										</div>
										
										<div class="col-md-8 col-sm-12">
							<div class="buttons clearfix">
								<div class="pull-right">
								
								
								<!--<button type="submit" class="btn btn-yellow">Continue</button>-->
								<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-yellow" />
								
								</div>
							</div>
						</div>
							
						</div>
						
					</form>
				</div>
      <?php echo $content_bottom; ?>
    <?php echo $column_right; ?></div>
</div>

 <script>
  $( function() {
    $( "#accordion" ).accordion({
      collapsible: false;
    });
  } );
  </script>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
		$('.form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length) {
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
<?php echo $footer; ?>
