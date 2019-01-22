<?php echo $header; ?><link type="text/css" href="view/stylesheet/pcode.css" rel="stylesheet" />
<style>
div.setting{

    background-color: #000;
    opacity: 0.4;

}
div.transbox {

    margin: 30px;
    background-color: #000;
    border: 1px solid black;
    opacity: 0.6;
    filter: alpha(opacity=60);
    margin-top: 9% !important;
    overflow: hidden;
    position: absolute;
    width: 77.5%;
    text-align: center;
    padding-top: 1%;
    margin: 0px auto;
    margin-top: 0px;

}

div.transbox p {
     font-size: 20px;
    text-transform: uppercase;
	color:#fff;
}
</style>

<?php echo $column_left; ?>

<div id="content">

      <div class="page-header">

         <div class="container-fluid">

         <div class="pull-right">

          <a data-toggle="tooltip" title="Documentation" class="btn postcode-btn" target="_blank" href="http://mdtecho.com/postcode-extension-for-opencart/"><i class="fa fa-book"></i></a>

           <a data-toggle="tooltip" title="Support / HelpDesk" class="btn postcode-btn" target="_blank" href="http://mdtecho.com/support-ticket/"><i class="fa fa-life-ring"></i></a>

		   <?php foreach($links as $link) { ?>

                <a data-toggle="tooltip" class="btn postcode-btn" title="<?php echo $link['text']; ?>" href="<?php echo $link['href']; ?>"><i class="fa fa-<?php echo $link['font']; ?>"></i></a>

           <?php } ?>

          </div>

        </div>

      </div>

    <div class="page-header">

      <div class="container-fluid">

        <div class="pull-right">

         <button type="submit" data-toggle="tooltip" form="form" title="<?php echo $button_save; ?>" class="btn postcode-alt-btn"><i class="fa fa-save"></i></button>

        </div>

        <h1><i class="fa fa-cogs"></i> <?php echo $heading_title; ?></h1>

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

      <?php if ($success) { ?>

      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>

        <button type="button" class="close" data-dismiss="alert">&times;</button>

      </div>

      <?php } ?>

      <div class="panel panel-default postcode-panel">

      <div class="panel-heading">

        <h3 class="panel-title"><i class="fa fa-cogs"></i> <?php echo $text_list; ?></h3>

      </div>

      <div class="panel-body">

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">

           <div class="tab-content">

                <ul class="nav nav-tabs" id="language">

                <?php foreach ($languages as $language) { ?>

                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab">

                <?php if($version < 2200) { ?>

                <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />

                <?php } else { ?>

                <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />

                <?php } ?>

                 <?php echo $language['name']; ?></a></li>

                <?php } ?>

                </ul>

                <?php foreach ($languages as $language) {  ?>

                  <div class="tab-pane"  id="language<?php echo $language['language_id']; ?>">

                  <fieldset>

                      <legend>Enter Text</legend>

                      <div class="form-group">

                        <label class="col-sm-2 control-label" for="input-sort-order"><span data-toggle="tooltip" title="<?php echo $help_header; ?>"><?php echo $text_header; ?></span></label>

                        <div class="col-sm-10">

                         <textarea name="dynamic[<?php echo $language['language_id']; ?>][header]" placeholder="Ex: Check Shipping availability at your location" class="form-control"><?php echo $dynamic[$language['language_id']]['header']; ?></textarea>

                        </div>

                      </div>

                      <div class="form-group">

                        <label class="col-sm-2 control-label" for="input-sort-order"><span data-toggle="tooltip" title="<?php echo $help_message; ?>"><?php echo $text_message; ?></span></label>

                        <div class="col-sm-10">

                         <textarea name="dynamic[<?php echo $language['language_id']; ?>][message]" placeholder="Ex: Check Shipping availability at your location" class="form-control"><?php echo $dynamic[$language['language_id']]['message']; ?></textarea>

                        </div>

                      </div>
                      <div class="form-group">

                  <label class="col-sm-2 control-label" for="postcode-product"><span data-toggle="tooltip" title="<?php echo $help_product_status; ?>"><?php echo $text_product_status; ?></span></label>

                  <div class="col-sm-10">

                     <select name="imdev_config_postcodeproduct" id="postcode-product" class="form-control">

                      <?php if ($imdev_config_postcodeproduct) { ?>

                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>

                      <option value="0"><?php echo $text_disabled; ?></option>

                      <?php } else { ?>

                      <option value="1"><?php echo $text_enabled; ?></option>

                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>

                      <?php } ?>

                    </select>

                  </div>

                </div>

                    </fieldset>
                    <div class="setting">
          	<a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><div class="transbox">
    			<p>Click here to Enable all feature</p>
  			</div></a>
           <a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><img src="view/image/postcode/setting.png" /></a>
		  </div>

                 </div>

                <?php } ?>

       </div>

      </form>

    </div>

  </div>

  </div>

</div>

</div>

<script type="text/javascript"><!--

$('#language a:first').tab('show');

$('.navigation th:nth-child(2)').addClass('active'); 

//--></script> 

<?php echo $footer; ?>