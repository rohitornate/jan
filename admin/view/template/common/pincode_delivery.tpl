<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i>Insert Delivery Options</h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-delivery">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
			`	<thead>
					<tr>
						<td class="left">Delivery Time:</td>
						<td class="left"></td>
					</tr>
				</thead>
				<tbody id="module-row">
					<tr id = "row1">
						<td class="left"><input style = "height: 24px;width: 300px;" type = "text" name = "data[1][delivery]"></td>
						<td class="left">
							<a style = "background: rgba(255, 0, 0, 0) !important;" title = "Remove" onclick="$('#row1').remove();" class="button"><i class="fa fa-minus-circle fa-2x" style="color:red;"></i></a>
							<input type = "hidden" id = "counter" value = "2">
						</td>					  
					</tr>
					<tr id = "last_row">
						<td colspan="1"></td>
						<td class="left"><a  style = "background: rgba(255, 0, 0, 0) !important;" title = "Add Row" class="button" onclick="addrows();" ><i class="fa fa-plus-circle fa-2x" style="color:green;"></i></a>
					</tr>
				</tbody>
			</table>
		  </div>
		</form>
      </div>
    </div>
  </div>
<script>
	function addrows(){
		var counter = $('#counter').val();
		var setvalue = parseInt(counter)+1;
		$('#counter').val(setvalue);
		$row_string='<tr id = "row'+counter+'"><td class="left"><input style = "height: 24px;width: 300px;" type = "text" name = "data['+counter+'][delivery]"></td></td><td class="left"><a style = "background: rgba(255, 0, 0, 0) !important;" title = "Remove" onclick="removerow('+counter+');" class="button"><i class="fa fa-minus-circle fa-2x" style="color:red;"></i></td></tr></tbody>';
		$('#last_row').before($row_string);
	}
	function removerow(counter){
		$("#row"+counter).remove();
	}
</script>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>


<?php echo $footer; ?>