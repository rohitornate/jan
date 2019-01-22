<?php echo $header; ?>
<style>
.form-only-page__form {
    box-shadow: 0 -0.1rem 0.3rem 0 #dcdcdc;
    background: #f1f3f6 none repeat scroll 0 0;
    padding: 60px 50px;
}
@media (max-width: 767px){
.form-only-page__form {
 padding: 0px 0px;
}

}

</style>

<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/shipway_default.css" />
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row"><?php echo $column_left; ?>
			<div class="form-only-page__form form-margin">
		<div id="content " class="onj_content"><?php echo $content_top; ?>
			<h1 align="center">Track Your Shipment Status</h1>
			<!--<div id="shipway_track_wrapper" >
			<form action="<?php echo $action; ?>" id="form" method="post" style="margin:0 auto;" >
				<fieldset>
					<legend>Track now</legend>
						<table>
							<tbody>
								<tr>
									<th width="80">ORDER ID :</th><td><input type="text" name="order_id"  value="<?php if(isset($order_id)){ echo $order_id;} ?>" /></td>									
									<td><input type="submit" value="Track"  name="btnSubmit" class="btn btn-default"/></td>
								</tr>
							</tbody>
						</table>
				</fieldset>
			</form>-->
			
			<div id="shipway_track_wrapper" align="center" >
					<form action="https://www.ornatejewels.com/index.php?route=information/shipway_track" id="form" method="post" style="margin:0 auto;" >
						<fieldset>
							
								<table>
									<tbody>
										<tr>
											<th>ORDER ID :</th>
											<td><input type="text" name="order_id"  value="<?php if(isset($order_id)){ echo $order_id;} ?>" /></td>									
											<td><input type="submit" value="Track"  name="btnSubmit" class="btn btn-default"/></td>
										</tr>
									</tbody>
								</table>
						</fieldset>
					</form>
			<?php if(isset($status_result)){ ?>
			<table class="track_table">
			<?php if(isset($awbno)) { ?>	
				<tr class="head">
					<th>Tracking ID</th>
					<th>Carrier Name</th>					
				</tr>
				<tr>
					<td class="rhead"><?php if(isset($awbno)){ echo $awbno;} ?></td>
					<td class="rhead"><?php if(isset($carrier_name)){ echo $carrier_name;} ?></td>
				</tr>
				<?php } ?>	
				<tr>
					<td colspan="2">
					<div id="status_container" style="text-align:center;"></div>
					<?php echo $status_result; ?>				
					</td>
				</tr>
			</table>		
			<?php } ?>							
		  <?php echo $content_bottom; ?>
		  </div>
		<?php echo $column_right; ?>
		</div>
	</div></div>
</div>
<?php echo $footer; ?>