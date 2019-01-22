<?php echo $header; ?>
<style>
div.title , .field{

    background-color: #000;
    opacity: 0.4;

}
div.transbox {

    margin: 30px;
    background-color: #000;
    border: 1px solid black;
    opacity: 0.6;
    filter: alpha(opacity=60);
    margin-top: 3% !important;
    overflow: hidden;
    position: absolute;
    width: 46%;
    text-align: center;
    padding-top: 1%;
	margin-left:-0.5%;

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

        <a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_insert; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>

        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form').submit() : false;"><i class="fa fa-trash-o"></i></button>

      </div>

      <h1><i class="fa fa-list"></i> <?php echo $heading_title; ?></h1>

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

        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>

      </div>

      <div class="panel-body">

    <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">

      <table class="table table-bordered table-hover">

         <thead>

            <tr>

              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>

              <td class="left"><?php if ($sort == 'message') { ?>

                <a href="<?php echo $sort_message; ?>" class="<?php echo strtolower($order); ?>"><?php echo $message; ?></a>

                <?php } else { ?>

                <a href="<?php echo $sort_message; ?>"><?php echo $message; ?></a>

                <?php } ?></td>

              <td class="center"><?php if ($sort == 'zip_code') { ?>

                <a href="<?php echo $sort_zip_code; ?>" class="<?php echo strtolower($order); ?>"><?php echo $zip_code; ?></a>

                <?php } else { ?>

                <a href="<?php echo $sort_zip_code; ?>"><?php echo $zip_code; ?></a>

                <?php } ?></td>

             <td>  <div class="title"><a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><div class="transbox">
    			<p>Click here to Enable all feature</p>
  			</div></a><a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><img src="view/image/postcode/filter_title.png" /></a></div></td>

              <td class="center"><?php if ($sort == 'status') { ?>

                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $status; ?></a>

                <?php } else { ?>

                <a href="<?php echo $sort_status; ?>"><?php echo $status; ?></a>

                <?php } ?></td>

              <td class="right"><?php echo $column_action; ?></td>

            </tr>

          </thead>

        <tbody>

          <tr class="filter">

              <td></td>

              <td><input type="text" name="filter_message" value="<?php echo $filter_message; ?>" class="form-control" /> </td>

              <td><input type="text" size="15" name="filter_zipcode" value="<?php echo $filter_zipcode; ?>" class="form-control" /></td>

              <div class="field"><td><img src="view/image/postcode/filter_field.png" /></td></div>

              <td><select name="filter_status" class="form-control">

                  <option value="*"></option>

                  <?php if ($filter_status) { ?>

                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>

                  <?php } else { ?>

                  <option value="1"><?php echo $text_enabled; ?></option>

                  <?php } ?>

                  <?php if (!is_null($filter_status) && !$filter_status) { ?>

                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>

                  <?php } else { ?>

                  <option value="0"><?php echo $text_disabled; ?></option>

                  <?php } ?>

                </select></td>

              <td><button data-toggle="tooltip" title="<?php echo $button_filter; ?>" type="button" onclick="filter();" class="btn postcode-btn"><i class="fa fa-search"></i> </button></td>

            </tr>

          <?php if ($pins) { ?>

          <?php foreach ($pins as $pin) { ?>

          <tr>

            <td style="text-align: center;">

              <input type="checkbox" name="selected[]" value="<?php echo $pin['zip_code_id']; ?>"/>

             </td>

            <td class="left"><?php echo $pin['message']; ?></td>

            <td class="center"><?php echo $pin['zip_code']; ?></td>

             <td class="center"></td>
           
            <td class="center"><?php echo $pin['status']; ?></td>

            <td class="center"><?php foreach ($pin['action'] as $action) { ?>

              <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $action['text']; ?>" class="btn postcode-btn"><i class="fa fa-pencil"></i></a>

              <?php } ?></td>

          </tr>

          <?php } ?>

          <?php } else { ?>

          <tr>

            <td class="text-center"  colspan="10"><?php echo $text_no_results; ?></td>

          </tr>

          <?php } ?>

        </tbody>

      </table>

    </form>

        <div class="row">

          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>

          <div class="col-sm-6 text-right"><?php echo $results; ?></div>

        </div>

      </div>

    </div>

  </div>

</div>

<?php echo $footer; ?>

<script language="javascript">

function ajax_upload(){ 

  $('#excel_codpins').trigger('click');

}

</script>

<script type="text/javascript"><!--

function filter() {



  url = 'index.php?route=tool/postcode&token=<?php echo $token; ?>';

  

  var filter_zipcode = $('input[name=\'filter_zipcode\']').val();



  if (filter_zipcode) {

    url += '&filter_zipcode=' + encodeURIComponent(filter_zipcode);

  }

  

  var filter_message = $('input[name=\'filter_message\']').val();

  

  if (filter_message) {

    url += '&filter_message=' + encodeURIComponent(filter_message);

  }

  

  var filter_cityname = $('input[name=\'filter_cityname\']').val();

  

  if (filter_cityname) {

    url += '&filter_cityname=' + encodeURIComponent(filter_cityname);

  }

  

  var filter_courier = $('input[name=\'filter_courier\']').val();

  

  if (filter_courier) {

    url += '&filter_courier=' + encodeURIComponent(filter_courier);

  }

  

  var filter_statename = $('input[name=\'filter_statename\']').val();

  

  if (filter_statename) {

    url += '&filter_statename=' + encodeURIComponent(filter_statename);

  }



  var filter_zonename = $('input[name=\'filter_zonename\']').val();

  

  if (filter_zonename) {

    url += '&filter_zonename=' + encodeURIComponent(filter_zonename);

  }



  var filter_shippingcharge = $('input[name=\'filter_shippingcharge\']').val();

  

  if (filter_shippingcharge) {

    url += '&filter_shippingcharge=' + encodeURIComponent(filter_shippingcharge);

  }

  

  var filter_status = $('select[name=\'filter_status\']').val();

  

  if (filter_status != '*') {

    url += '&filter_status=' + encodeURIComponent(filter_status);

  } 

<?php if($paymentactive) { ?>

  var filter_payment = $('select[name=\'filter_payment\']').val();

  

  if (filter_payment != '*') {

    url += '&filter_payment=' + encodeURIComponent(filter_payment);

  } 

<?php } ?>

  location = url;

}

</script> 

<script type="text/javascript"><!--

$('.navigation th:nth-child(1)').addClass('active'); 

$('#form input').keydown(function(e) {

  if (e.keyCode == 13) {

    filter();

  }

});</script> 