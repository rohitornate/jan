<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">

  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>

  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-html" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
  
  <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>

      <div class="panel-body">
        
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-betaout" class="form-horizontal">
          
      <div class="form-group">            
      <label class="col-sm-2 control-label" for="entry_api_key"><?php echo $entry_api_key; ?></label>
            <div class="col-sm-10">
              <input type="text" name="betaout_api_key" value="<?php echo $betaout_api_key; ?>" placeholder="<?php echo $help_api_key; ?>" id="entry-api_key" class="form-control" />
      </div>
          </div>

      <div class="form-group">
      <label class="col-sm-2 control-label" for="entry_site_id"><?php echo $entry_site_id; ?></label>
       <div class="col-sm-10">
              <input type="text" name="betaout_site_id" value="<?php echo $betaout_site_id; ?>" placeholder="<?php echo $help_site_id2; ?>" id="entry-site_id" class="form-control" />
      </div>
      </div>
                    
          </div>

      
  </div>
  </div>
</div>
<?php echo $footer; ?>