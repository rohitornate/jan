<?php echo $header; ?>
<style>
div.upper , .payments, .shipping, .store{

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

<link type="text/css" href="view/stylesheet/pcode.css" rel="stylesheet" />

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

        <button type="submit" form="form" title="<?php echo $button_save; ?>" class="btn postcode-alt-btn"><i class="fa fa-save"></i></button>

        <a href="<?php echo $cancel; ?>" title="<?php echo $button_cancel; ?>" class="btn postcode-alt-btn"><i class="fa fa-reply"></i></a>

      </div>

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

     <div class="panel panel-default postcode-panel">

      <div class="panel-heading">

        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>

      </div>

      <div class="panel-body">

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">

           <div class="form-group">

                <label class="col-sm-2 control-label" for="input-zip_code"><?php echo $zip_code; ?></label>



             <div class="col-sm-10"><input class="form-control" type="text" name="pin_code" value="<?php echo $pin_code; ?>" /></div>

          </div>
          <div class="form-group">

                <label class="col-sm-2 control-label" for="input-message"><?php echo $message; ?></label>

                <div class="col-sm-10">

          <textarea name="message_id" placeholder="Enter Message" id="input-message" class="form-control summernote"><?php echo $message_id; ?></textarea>

        </div>

          </div>
          <div class="form-group">

                <label class="col-sm-2 control-label" for="input-status"><?php echo $status; ?></label>

                 <div class="col-sm-10"><select class="form-control"  name="status_value">

                    <?php if ($status_value) { ?>

                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>

                    <option value="0"><?php echo $text_disabled; ?></option>

                    <?php } else { ?>

                    <option value="1"><?php echo $text_enabled; ?></option>

                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>

                    <?php } ?>

                  </select></div>

          </div>
   
          <div class="upper">
          	<a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><div class="transbox">
    			<p>Click here to Enable all feature</p>
  			</div></a>
           <a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><img src="view/image/postcode/upperpart.png" /></a>
		  </div>
           

            
          <div class="payments">
          	<a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><div class="transbox">
    			<p>Click here to Enable all feature</p>
  			</div></a>
           <a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><img src="view/image/postcode/payment.png" /></a>
		  </div>
            <div class="shipping">
            <a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><div class="transbox">
    			<p>Click here to Enable all feature</p>
  			</div></a>
           <a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><img src="view/image/postcode/shipping.png" /></a>
		  </div>
           <div class="store">
           <a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><img src="view/image/postcode/store.png" /></a>
		  </div>  

      </form>

    </div>

  </div>

</div>

</div>

<script type="text/javascript">

$('.navigation th:nth-child(1)').addClass('active'); 

</script>

<?php if($version < 2200) { ?>

  <script type="text/javascript"><!--

$('#input-message').summernote({height: 300});

//--></script> 

<?php } ?>

<?php if($version >= 2300) { ?>

  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>

  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />

  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>

<?php } ?>

<?php echo $footer; ?>

