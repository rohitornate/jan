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
<?php $token = $_GET['token'];?>		
  <div class="container-fluid">
        <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i>Pincode Module</h3>
      </div>
      <div class="panel-body">
        <form action = "?route=common/pincode/delete&token=<?php echo $_GET['token']; ?>" method="post" enctype="multipart/form-data" id="form-pincode" class="form-horizontal">
         <!-- <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Status</label>
            <div class="col-sm-10">
              <select name="pincode_status" id="input-status" class="form-control">
                                <option value="1">Enabled</option>
                <option value="0" selected="selected">Disabled</option>
                              </select>
            </div>
          </div>-->
        </form>
		
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-6" style = "width:20% !important;">
				<div class="tile">
					<div class="tile-heading">Insert Pincode</div>
					<div class="tile-body" align="center"><a href ='<?php echo $add; ?>'><i class="fa fa-insert" style = "font-size: 101px; !important;"></i></div>
					<div class="tile-footer"><a href ='<?php echo $add; ?>'>Insert Pincode...</a></div>
				</div>
			</div>
		 <div class="col-lg-3 col-md-3 col-sm-6" style = "width:20% !important;">
			  <div class="tile">
				  <div class="tile-heading">List Pincode</div>
				  <div class="tile-body" align="center"><a href = 'index.php?route=catalog/pincode/getlist&amp;token=<?php echo $_GET['token']; ?>'><i class="fa fa-list" style = "font-size: 101px; !important;"></i></a></div>
				  <div class="tile-footer"><a href="index.php?route=catalog/pincode/getlist&amp;token=<?php echo $_GET['token']; ?>">List Pincode...</a></div>
			  </div>
		</div>
        <div class="col-lg-3 col-md-3 col-sm-6" style = "width:20% !important;">
			<div class="tile">
			  <div class="tile-heading">Insert Delivery Options</div>
			  <div class="tile-body" align="center"><a href = "<?php echo $insert_delivery;?>"><i class="fa fa-truck" style = "font-size: 101px; !important;"></a></i></div>
			  <div class="tile-footer"><a href = '<?php echo $insert_delivery;?>'>Insert Delivery Options...</a></div>
			</div>
		</div>
        <div class="col-lg-3 col-md-3 col-sm-6" style = "width:20% !important;">
			<div class="tile">
				<div class="tile-heading">Delivery Options List</div>
				<div class="tile-body" align="center"><a href = '?route=catalog/pincode/delivery_getlist&amp;token=<?php echo $_GET['token']; ?>'><i class="fa fa-list" style = "font-size: 101px; !important;"></i></a></div>
				<div class="tile-footer"><a href = 'index.php?route=catalog/pincode/delivery_getlist&amp;token=<?php echo $_GET['token']; ?>'>Delivery Options List...</a></div>
			</div>
		</div>
		 <div class="col-lg-3 col-md-3 col-sm-6" style = "width:20% !important;">
			  <div class="tile">
				  <div class="tile-heading">Settings</div>
				  <div class="tile-body" align="center"><a href = "?route=common/pincode/setting&token=<?php echo $_GET['token']; ?>"><i class="fa fa-setting" style = "font-size: 101px; !important;"></i></a></div>
				  <div class="tile-footer"><a href = "?route=common/pincode/setting&token=<?php echo $_GET['token']; ?>">Setting</a></div>
			  </div>
		</div>
     </div>
	</div>
    </div>
  </div>





	<?php if(isset($_GET['allpin'])){ ?>
		<div class="box">
			<div class="heading">
			  <h1><img style = "height:21px" src="../image/data/postbox.png" alt="">All Pincode</h1>
			  <div class="buttons"><a title="CSV Download" style = "background: rgba(255, 0, 0, 0) !important;" href="<?php echo $downloadcsv; ?>" class="button"><img style = "height: 15px;" src="../image/pincode/download.png" /></a><a title="Cancel" style = "background: rgba(255, 0, 0, 0) !important;" href="?route=common/pincode&token=<?php echo $_GET['token'] ; ?>&allpin=1" class="button"><img style = "height:15px" src="../image/pincode/x.png" /></a><a title="Delete" style = "background: rgba(255, 0, 0, 0) !important;" class="button" onclick="$('#form').submit();"><img style = "height:15px" src="../image/pincode/delete.png" /></a></div>
			</div>
			<div class="content">
			<form action = "?route=common/pincode/delete&token=<?php echo $_GET['token']; ?>" method="post"  id="form">
	        <table id="module" class="list">
	          <thead>
				<tr class="filter">
					<td align="center">Search</td>
					<td>
						<select id="myselect">
							<?php if(isset($_GET['myselect'])){if($_GET['myselect'] == 1){ ?>
								<option value = "1">COD Pincode</option>
								<option value = "2">All Pincode</option>
								<option value = "0">Prepaid Pincode</option>
							<?php }
								else if($_GET['myselect'] == 0) { ?>
									<option value = "0">Prepaid Pincode</option>
									<option value = "2">All Pincode</option>
									<option value = "1">COD Pincode</option>
							<?php }}
								  else{ ?>
										<option value = "2">All Pincode</option>
										<option value = "1">COD Pincode</option>
										<option value = "0">Prepaid Pincode</option>
							<?php   } ?>
						</select>
					</td>
					<td colspan="4" align="right"><a style = "background: rgba(255, 0, 0, 0) !important;"  title = "Filter" onclick="filter();" class="button"><img src="../image/pincode/filter_data.png" /></a></td>
				</tr>
	            <tr>
				  <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);"></td>
	              <td class="left">Pincode:</td>
	              <td class="left">Services Avaliable:</td>
				  <td class="left">Cash on Delivery:</td>
				   <td class="left">Delivery Option:</td>
				  <td class="left">Edit:</td>
	            </tr>
	          </thead>
		<?php 
			if (isset($pincodes)) {
			foreach ($pincodes as $pincode) {
		?>
			<td style="text-align: center;"> </td>
			<tr align = "center">
				<td style="text-align: center;">                
					<input type="checkbox" name="selected[]" value="<?php echo $pincode['id'];?>" >
				</td>
				<td class="left"><?php echo $pincode['pin']; ?></td>
				<?php  if($pincode['service'] == 1){
							echo '<td class="left">YES</td><td class="left">YES</td>';
						}
						else if($pincode['service'] == 0){
							echo '<td class="left">YES</td><td class="left">NO</td>';
						}
					?>
				<td class="left"><?php echo $pincode['delivery'] ?></td>
				<td class="left"><a title = "EDIT"  href = "index.php?route=common/pincode&token=<?php echo $this->request->get['token']?>&editpin=<?php echo $pincode['id'];?>"><font color = 'blue'><img src = "../image/pincode/edit.png" /></font></a></td>
			</tr>
	<?php
			}
			}
			echo "</table>";
	?>
	<div style = "padding-left:5%;padding-right:5%; width:90%;" class="pagination"><?php echo $pagination; ?></div>
	</div>
	</div>
	<?php } if(isset($_GET['editpin'])){ ?>	
		<div class="box">
			<div class="heading">
				<h1><img style = "height:21px" src="../image/data/postbox.png" alt="">Edit Pincode</h1>
				<div class="buttons"><a title = "Update" style = "background: rgba(255, 0, 0, 0) !important;" onclick="$('#form_update').submit();" class="button"><img src="../image/pincode/update.png" /></a><a title = "Cancel" style = "background: rgba(255, 0, 0, 0) !important;" href="index.php?route=common/pincode&token=<?php echo $_GET['token'] ; ?>&allpin=1" class="button"><img src="../image/pincode/x.png" /></a></div>
			</div>
			<div class="content">
				<form action = "index.php?route=common/pincode/update&token=<?php echo $_GET['token']; ?>" method="POST"  id="form_update">
					<table id="module" class="list">
						<thead>
							<tr>
							  <td class="left">Pincode:</td>
							  <td class="left">Services Avaliable:</td>
							  <td class="left">Delivery Option:</td>
							</tr>
						</thead>
						<tbody id="module-row">
							<tr id = "row1"> 
								<td class="left"><input type = "text" value = "<?php echo $pin_code[0]['pincode']; ?>" name = "e_pin" ></td>
								<td class="left"><select name = "e_service">
									<?php
										if($pin_code[0]['service_available'] == 1){
											echo '<option value = "1">Cash on Delivery</option/>';
											echo '<option value = "0">Serviceable</option/>';
										}
										else{
											echo '<option value = "0">Serviceable</option/>';
											echo '<option value = "1">Cash on Delivery</option/>';
										}
									?>
									</select>
								</td>
								<td>
									<select name = "e_delivery">
										<?php foreach($delivery_time as $delivery){ ?>
											<option value = "<?php echo $delivery['id']; ?>" <?php if($delivery['id'] == $pin_code[0]['delivery_option']){ echo "selected";} ?>><?php echo $delivery['delivery_time']; ?></option>
										<?php } ?>
									</select>
								</td>
								<input type = "hidden" name = "id" value = '<?php echo $_GET['editpin'];?>'>
							</tr>
						</tbody>			
					</table>
				</form>
			</div>
		</div>
		
	<?php	
		}
?>-->
<style>
	td,th{
		padding-top:5px;
		padding-bottom:5px;
	}
</style>
<style>
	a.button, .list a.button{
		padding: 5px 20px 7px 20px !important;
		border-radius: 5px 5px 5px 5px !important;
	}
</style>
<script>
	function check(){
		var r=confirm("Delete Pincode?");
		if (r==true){
			return true;
		}
		else{
			return false;
		}
	}
</script>
<script>
	function filter() {
		url = 'index.php?route=common/pincode&token=<?php echo $token; ?>&allpin=1';
		var select = $( "#myselect").val();
		if (select != 2) {
			url += '&myselect='+select;
		}		
		location = url;
	}
</script>
<?php
echo $footer;
?>
