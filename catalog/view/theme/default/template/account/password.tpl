<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
			
				<div class="my-account-header">My Account</div>
			
		</div>
  
  
  <div class="row "><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          
          <div class="my-account__header addr">
								<h1 class="title"><?php echo $text_password; ?></h1>
								</div>
		  
		  
		  
          <!--<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-10">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-10">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>-->
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
		  
		  <div class="row">
</div>																
		  
        
					<div class="col-md-8 col-sm-12">
							<div class="buttons clearfix">
								<div class="pull-right">
								
								
								<!--<button type="submit" class="btn btn-yellow">Continue</button>-->
								<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-yellow" />
								
								</div>
							</div>
						</div>
		
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>