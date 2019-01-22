<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-fc" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>

    <?php } ?>
    <div class="panel panel-default">
      
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-fc" class="form-horizontal">
          <div class="form-group required">
            <label class="control-label col-sm-3" for="input-merchant-id"><span data-toggle="tooltip" title="<?php echo $entry_merchant_help; ?>"><?php echo $entry_merchant; ?></span></label>
            <div class="col-sm-9"><input type="text" name="fc_merchant" value="<?php echo $fc_merchant; ?>" class="form-control"/>
              <?php if ($error_merchant) { ?>
              <span class="error"><?php echo $error_merchant; ?></span>
              <?php } ?></div>
          </div>
		  
		  <div class="form-group required">
            <label class="control-label col-sm-3" for="fc_key"><span data-toggle="tooltip" title="<?php echo $entry_merchantkey_help; ?>"><?php echo $entry_merchantkey; ?></span></label>
            <div class="col-sm-9"><input type="text" name="fc_key" value="<?php echo $fc_key; ?>" class="form-control"/>
              <?php if ($error_key) { ?>
              <span class="error"><?php echo $error_key; ?></span>
              <?php } ?></div>
          </div>
	  <div class="form-group required">
		<label class="control-label col-sm-3" for="fc_environment"><span data-toggle="tooltip" title="<?php echo $entry_environment_help; ?>"><?php echo $entry_environment; ?></span></label>
		<div class="col-sm-9"><select name="fc_environment" class="form-control">
		<?php if ($fc_environment == "P") { ?>
                <option value="P" selected="selected"><?php echo $text_env_production; ?></option>
                <option value="T"><?php echo $text_env_sdb; ?></option>
                <?php } else { ?>
                <option value="P"><?php echo $text_env_production; ?></option>
                <option value="T" selected="selected"><?php echo $text_env_sdb; ?></option>
                <?php } ?>
              </select></div>
	  </div>
          
		  <div class="form-group">
            <label class="control-label col-sm-3" for="fc_order_status_id"><?php echo $entry_order_status; ?></label>
            <div class="col-sm-9"><select name="fc_order_status_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $fc_order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></div>
          </div>
		  
		  
          <div class="form-group">
            <label class="control-label col-sm-3" for="fc_status"><?php echo $entry_status; ?></label>
            <div class="col-sm-9"><select name="fc_status" class="form-control">
                <?php if ($fc_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></div>
          </div>

            <div class="form-group">
                <label class="col-sm-3 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
                <div class="col-sm-9">
                  <input type="text" name="fc_total" value="<?php echo $fc_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
                </div>
            </div>
		  </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#tabs a:first').tab('show');
//--></script> </div>
<?php echo $footer; ?>