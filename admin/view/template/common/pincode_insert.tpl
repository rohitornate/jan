<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1> <h1>Postcode Service Availability Checker</h1></h1>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i>Insert Pincode</h3>
		<div class="pull-right">
		
      </div> </div>
      <div class="panel-body">
		<ul class="nav nav-tabs">
            <li class="active"><a href="#tab-insert" data-toggle="tab">Pincode Insert</a></li>
            <li><a href="#tab-upload" data-toggle="tab">Pincode Upload</a></li>
        </ul>
		<div class="tab-content">
			<div class="tab-pane active in" id = "tab-insert">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-pincode">
				  <div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td class="left">Pincode:</td>
								<td class="left">Services:</td>
								<td class="left">Delivery Options:</td>
								<td class="left"></td>
							</tr>
						</thead>
						<tbody id="module-row">
							<tr id = "row1">
								<td class="left"><input type = "text" name = "data[1][pin]"></td>
								<td class="left">
									<select name = "data[1][service]">
										<option value = "0">Prepaid</option>
										<option value = "1">Cash on Delivery</option>
									</select>
								</td>
								<td class="left">
								<select name = "data[1][delivery]">
										<?php foreach($delivery_time as $delivery){ ?>
											<option value = "<?php echo $delivery['id'] ; ?>"><?php echo $delivery['delivery_time'] ; ?></option>
										<?php } ?>
									</select>
								
								<!--
								
									<select name = "data[1][delivery]">
																				<?php foreach($delivery_time as $delivery){ ?>
									<option value = "<?php echo $delivery['id'] ; ?>"><?php echo $delivery['delivery_time'] ; ?></option><?php } ?>
																			</select>-->
								</td>
								<td class="left">
									<a style = "background: rgba(255, 0, 0, 0) !important;" title = "Remove" onclick="$('#row1').remove();" class="button"><i class="fa fa-minus-circle fa-2x" style="color:red;"></i></a>
									<input type = "hidden" id = "counter" value = "2">
								</td>					  
							</tr>
							<tr id = "last_row">
								<td colspan="3"></td>
								<td class="left"><a  title = "Add Row" class="button" onclick="addrows();" ><i class="fa fa-plus-circle fa-2x" style="color:green;"></i></a>
							</tr> 
						</tbody>
					</table>
				  </div>
				</form>
			</div>
			<div class="tab-pane fade" id = "tab-upload">
				<form action="<?php echo $action_upload; ?>" method="post" enctype="multipart/form-data" id="form_upload">
				  <div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td class="left">Upload CSV File:</td>
								<td class="center">Services:</td>
								<td class="center">Delivery Option:</td>
								<td class="left"></td>
							</tr>
						</thead>
						<tbody id="module-row">
							<tr>
								<td class="left"><input type="file" name="file_up" id="file" style="float:left;">  <span style="float:right"><a  title="Download" data-toggle="tooltip" class="btn btn-primary" href = "sample.csv" style = "margin-top:-8px;">Download Tamplate File</a></span></td>
								<td align = 'left'>
									<select name = "service">
										<option value = "0">Prepaid</option/>
										<option value = "1">Cash on Delivery</option/>
									</select>
								</td>
								<td class="center">
									<select name = "delivery">
									<?php foreach($delivery_time as $delivery){ ?>
									<option value = "<?php echo $delivery['id'] ; ?>"><?php echo $delivery['delivery_time'] ; ?></option><?php } ?>
									
																				
												</select>
								</td>
								<td align="center">
									<div><a title = "Upload" style = "color:white;" onclick="$('#form_upload').submit();" class="btn btn-primary">Upload</a></div>
								</td>
							</tr>
						</tbody>
					</table>
				  </div>
				</form>
			</div>
		</div>
      </div>
    </div>
  </div>
<style>
	a.button, .list a.button{
		padding: 5px 20px 7px 20px !important;
		border-radius: 5px 5px 5px 5px !important;
	}
</style>
<script>
	$(function(){
		$('.tab-section').hide();
		$('#tabs a').bind('click', function(e){
			$('#tabs a.current').removeClass('current');
			$('.tab-section:visible').hide();
			$(this.hash).show();
			$(this).addClass('current');
			e.preventDefault();
		}).filter(':first').click();
	});
</script>
<script>
	function addrows(){
		var counter = $('#counter').val();
		var setvalue = parseInt(counter)+1;
		$('#counter').val(setvalue);
		$row_string='<tr id = "row'+counter+'"><td class="left"><input type = "text" name = "data['+counter+'][pin]"></td><td class="left"><select name = "data['+counter+'][service]"><option value = "0">Serviceable</option/><option value = "1">Cash on Delivery</option/></select></td><td class="left"><select name = "data['+counter+'][delivery]"><?php foreach($delivery_time as $delivery){ ?><option value = "<?php echo $delivery['id'] ; ?>"><?php echo $delivery['delivery_time'] ; ?></option><?php } ?></select></td><td class="left"><a style = "background: rgba(255, 0, 0, 0) !important;" title = "Remove" onclick="removerow('+counter+');" class="button"><img src="../image/pincode/remove.png" /></a></td></tr></tbody>';
		$('#last_row').before($row_string);
	}
	function removerow(counter){
		$("#row"+counter).remove();
	}
</script>
<?php echo $footer; ?>