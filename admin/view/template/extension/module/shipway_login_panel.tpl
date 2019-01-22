<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<style>
	.pull-right > a:hover{color:#fff;}
	.button{color:#FFF;display:inline-block;padding:5px 15px;background:#003A88;-webkit-border-radius:10px;-moz-border-radius:10px;-khtml-border-radius:10px 10px 10px 10px;border-radius:10px;border:none;cursor:pointer}
	.carrier_container{position: absolute;right: 10%;background: #ffffff;padding: 10px;border: 1px solid #eee;width:15%;text-align:center;}
	.carrier_container ul{list-style: none;margin: 0px;padding: 0px;max-height: 150px;overflow-x: scroll;text-align:left;}
	.carrier_container ul li{margin-left: 0px;padding-left: 0px;}
	.btnUpdate{padding: 5px 25px;background-color: #2EADE0;color: #fff;text-decoration: none;display: inline-block;cursor:pointer;}
</style>
   <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
	    <a data-toggle="tooltip" title="Save" class="btn btn-primary" onclick="$('#login_form').submit();" ><i class="fa fa-save"></i></a>
		<?php if(isset($hasShipWayAccount) && $hasShipWayAccount){ ?>
		<a data-toggle="tooltip" title="Sync Carriers With Shipway" class="btn btn-default" onclick="updateCarriers();" ><i class="fa fa-exchange"></i></a>
		<?php } ?>
		
		<a href="https://shipway.in/contact.php" data-toggle="tooltip" title="Support" class="btn btn-default" target="_blank"><i class="fa fa-life-ring"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_back; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
	<?php if (isset($_SESSION['success'])) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $_SESSION['success'];unset($_SESSION['success']); ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	
 <div class="panel panel-default">
    <div class="panel-body">
   
    
	<!-- Courier List -->
	<?php if(isset($hasShipWayAccount) && $hasShipWayAccount){ ?>
	  <div class="carrier_container">
		  <ul class="carrier_list"><h3 class="panel-title" style = "font-weight:bold;"> Activated Carriers(<?php echo $carrier_count; ?>)</h3>
		  <form id="form_carrier_status" action="<?php echo $action_carrier_status; ?>" method="POST">
		  <?php if(isset($carrier_list) && !empty($carrier_list)){
					foreach($carrier_list as $carrier){
						echo '<li><input type="checkbox" name="carriers[]" value="'.$carrier['courier_id'].'" '.(($carrier['status'])?'checked="checked"':'').' />'.$carrier['name'].'</li>';
					}
			  ?>
			
		  <?php }else{ echo '<li>No carrier </li>'; } ?>
		  </ul>
		  <a class="btnUpdate" onclick="$('#form_carrier_status').submit();">Activate</a>
		  </form>
	  </div>
	<?php } ?>
	  <!-- end -->
	  
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="login_form">
        <table id="module" class="table table-bordered table-hover" style="width:75%;">
		  <tbody>
			<tr >
				<td  colspan="2">
					<a href="http://shipway.in/admin/index.php/auth/register" target="_blank" style="background-color: #2eade0;color: #ffffff;text-decoration: none;padding: 4px;border: thin solid #ababab;">Register here</a> 
					<span style="font-size:14px;">for free courier tracking.</span> </td>
			</tr>
			<tr>
				<td>Login ID : </td><td><input type="text" name="shipway_login[loginid]" value="<?php echo $shipway_loginid; ?>" class="form-control" /> </td>
			</tr>
			<tr>
				<td>Licence Key : </td><td><input type="text" name="shipway_login[licencekey]" value="<?php echo $shipway_licencekey; ?>"  class="form-control" /> </td>
			</tr>
          </tbody>
        </table>
      </form>
	  
	  <div id="onj_news">
		<iframe src="http://shipway.in/newupdates/updates.php?extension=shipway_courier_tracking" scrolling="no"  style="border:none;width:100%;min-height:200px;margin-top:50px;" > </iframe>
	  </div>
    </div>
  </div>
</div>
</div>

<script type="text/javascript">
 
function updateCarriers(){
	$.ajax({
		type: 'POST',
		url: 'index.php?route=extension/module/shipway_login_panel/updateCarriers&token=<?php echo $_GET['token']; ?>',
		dataType: 'json',
		success: function(json) { //alert(json['msg']);
			
			if (json['msg']) {
		          $('.panel-default').before('<div class="alert alert-success">'+'<i class="fa fa-check-circle"></i>' + json['msg'] + '</div>');
				  location.reload();
            }
		}
	});
}
</script>
<?php echo $footer; ?>