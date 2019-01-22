<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo 'save'; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo 'cancel'; ?>" data-toggle="tooltip" title="<?php echo 'cancel'; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1> Option Insert</h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>

        <?php } ?>
      </ul>
    </div>
  </div>
<?php if (isset($warning)){ ?> <div class="warning"><?php echo $warning; ?></div> <?php } ?>
<?php if (isset($success)) { ?> <div class="success"><?php echo $success; ?></div> <?php } ?>
<?php if (isset($success1)) { ?> <div class="success"><?php echo $success1; ?></div> <?php } ?>
<?php if (isset($warning1)){ ?> <div  class="warning"><?php echo $warning1; ?></div> <?php } ?>
<?php if (isset($warning2)){ ?> <div class="warning"><?php echo $warning2; ?></div> <?php } ?>
			  <div class="container-fluid">
        <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i>Settings</h3>
      </div>
      <div class="panel-body">
		<form action="?route=common/pincode/setting&token=<?php echo $_GET['token']; ?>" method="post" enctype="multipart/form-data" id="form-setting">
			<div class="table-responsive">
				<table class="table table-bordered">
					<tbody>
							<tr align = "center"><td  align = "left"><span data-toggle="tooltip" title="Are you want to stop CHECKOUT for Unserviceable PINCODE." id = "shippingpin" >On checkout Page.</span> </td>
								<td  align = "left">
												<select class="onj_width"  name = "pincode_checkout_status" >
													<option value = "1">Enable</option/>
													<option value = "0">Disable</option/>
												</select>
																			</td>
								</tr>
							<tr align = "center">
								<td  align = "left"><span data-toggle="tooltip" title="Enable it that means COD/other payment method will show when billing and shipping(delivery) post code inout field must be same." id = "shippingpin" >Pincode Must Be Same.</span> </td>
								<td  align = "left">
																					<select  class="onj_width"  name = "pincodesetting_pincodemustbesame" >
													<option value = "1">Enable</option/>
													<option value = "0">Disable</option/>
												</select>
																			</td>
							</tr>
							<tr align = "center">
								<td  align = "left">Show On Product Detail Page</td>
																<td align = "left">
									<select class="onj_width"  name = "pincode_product_page_status">
																					<option value = "1" selected>Yes</option>
											<option value = "0">No</option>
																			</select>
								</td>
							</tr>
							<tr align = "center" ><td  align = "left">No Service Available Message</td>
								<td  align = "left"> 
																	<input type="text"  class="onj_width" name="pincode_msg_unavailable" id="no_service_msg" value="oh snap! We cant deliver to this pincode. Can we send your order to a different address?">
																	</td>
							</tr>
							<tr align = "center" ><td  align = "left">COD Message</td>
								<td  align = "left">
																	<input type="text" class="onj_width" name="pincode_msg_codavailable" id="cod_msg" value="COD &amp; Prepaid Service Are Available" >
																	</td>
							</tr>
							<tr align = "center" ><td  align = "left">Prepaid Message</td>
								<td  align = "left">
																	<input type="text" name="pincode_msg_preavailable" class="onj_width" id="prepaid_msg" value=" Only Prepaid service is available at your location">
																</td>
							</tr>
							<tr align = "center" ><td  align = "left">COD Error Message</td>
								<td  align = "left">
																	 <textarea name="pincode_cod_error_msg" id="cod_error">Error occurred in COD Service</textarea>
								 								</td>
							</tr>
							<tr align = "center"><td  align = "left">Message text Color</td>
								<td  align = "left">
																			<input class="color onj_width" name = "text_color" value = "316E17" size = "50">
																	</td>
							</tr>
						</tbody>
					</table>
			</div>
		</form>
      </div>
    </div>
  </div>
  <style>
  #shippingpin:after {
    font-family: FontAwesome;
    color: #1E91CF;
    content: "\f059";
    margin-left: 4px;
}
.onj_width {width:100%;}
  </style>
  <script type="text/javascript" src="view/javascript/jquery/jscolor/jscolor.js"></script>
	<script type="text/javascript"><!--
		$('#no_service_msg').summernote({
			height: 100
		});
		$('#cod_msg').summernote({
			height: 100
		});
		$('#cod_msg').summernote({
			height: 100
		});
		$('#prepaid_msg').summernote({
			height: 100
		});
		$('#cod_error').summernote({
			height: 100
		});
		//--></script>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer;?>