<?php echo $header; ?>
<style>
.fa-mail-reply:before, .fa-reply:before {
    content: "\f112";
}
</style>


<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  
	<div class="my-account__header addr">
			<h1 class="title">Order History</h1>
	</div>
  
  <div class="row myaccount">
  
 <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <!--<h2 class="title"><?php echo $heading_title; ?></h2>-->
		
		<div class="my-account__header addr">
			<h1 class="title">ORDER INFORMATION</h1>
		</div>
		
      <!--<table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" colspan="2"><?php echo $text_order_detail; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left" style="width: 50%;"><?php if ($invoice_no) { ?>
              <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
              <?php } ?>
              <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
            <td class="text-left" style="width: 50%;"><?php if ($payment_method) { ?>
              <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
              <?php } ?>
              <?php if ($shipping_method) { ?>
              <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
              <?php } ?></td>
          </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" style="width: 50%; vertical-align: top;"><?php echo $text_payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left" style="width: 50%; vertical-align: top;"><?php echo $text_shipping_address; ?></td>
            <?php } ?>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $shipping_address; ?></td>
            <?php } ?>
          </tr>
        </tbody>
      </table>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
			<td class=""><?php echo 'Image'; ?></td>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
<td class="text-right"><?php echo 'Action'; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { //print_r($product);?>
            <tr>
			<td class="" style="width:100px"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></td>
              <td class="text-left"><?php echo $product['name']; ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['total']; ?></td>

			  <td class="text-right" style="white-space: nowrap;">
                
                <a href="<?php echo $product['return']; ?>"  title="<?php echo $button_return; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></td>
			  
			 
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
            
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="4"></td>
              <td class="text-right"><b><?php echo $total['title']; ?></b></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
      <?php if ($comment) { ?>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $text_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $comment; ?></td>
          </tr>
        </tbody>
      </table>
      <?php } ?>
      <?php if ($histories) { ?>
        <h3 class="title"><?php echo $text_history; ?></h3>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($histories) { ?>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="text-left"><?php echo $history['date_added']; ?></td>
            <td class="text-left"><?php echo $history['status']; ?></td>
            <td class="text-left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>-->
	  
	  <table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-left" colspan="2">Order Details</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-left" style="width: 50%;"><?php if ($invoice_no) { ?>
							<b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
							<?php } ?>
							<b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
							<b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
							<td class="text-left" style="width: 50%;"><?php if ($payment_method) { ?>
							<b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
							<?php } ?>
							<?php if ($shipping_method) { ?>
							<b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
							<?php } ?></td>
							</tr>
						</tbody>
				</table>
				 <table class="table table-bordered table-hover">
					<thead>
					<tr>
						<td class="text-left" style="width: 50%; vertical-align: top;"><?php echo $text_payment_address; ?></td>
						<?php if ($shipping_address) { ?>
						<td class="text-left" style="width: 50%; vertical-align: top;"><?php echo $text_shipping_address; ?></td>
						<?php } ?>
					</tr>
					</thead>
					<tbody>
						<tr>
						<td class="text-left"><?php echo $payment_address; ?></td>
						<?php if ($shipping_address) { ?>
						<td class="text-left"><?php echo $shipping_address; ?></td>
						<?php } ?>
						</tr>
						</tbody>
					</table>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td class=""><?php echo 'Image'; ?></td>
								<td class="text-left"><?php echo $column_name; ?></td>
								<td class="text-left"><?php echo $column_model; ?></td>
								<td class="text-right"><?php echo $column_quantity; ?></td>
								<td class="text-right"><?php echo $column_price; ?></td>
								<td class="text-right"><?php echo $column_total; ?></td>
								<td class="text-right"><?php echo 'Action'; ?></td>
								
							</tr>
						</thead>
						<tbody>
            <?php foreach ($products as $product) { //print_r($product);?>
            <tr>
				<td class="" style="width:100px"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></td>
				<td class="text-left"><?php echo $product['name']; ?>
					<?php foreach ($product['option'] as $option) { ?>
					<br />
					&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
					<?php } ?>
				</td>
				<td class="text-left"><?php echo $product['model']; ?></td>
				<td class="text-right"><?php echo $product['quantity']; ?></td>
				<td class="text-right"><?php echo $product['price']; ?></td>
				<td class="text-right"><?php echo $product['total']; ?></td>
				<?php if($product['invoice_num'] != 0){  ?>
				<td class="text-right" style="white-space: nowrap;">
					<a href="<?php echo $product['return']; ?>"  title="<?php echo $button_return; ?>" class="btn btn-warning"><i class="fa fa-reply"></i></a>
				</td>
				<?php }else{ ?>
				<td class="text-right" style="white-space: nowrap;">
					<?php if($cancel_id == 0) { ?>
						<a href="<?php echo $product['close']; ?>"  title="<?php echo $button_close; ?>" class="btn btn-danger"><i class="fa fa fa-times"></i></a>
					<?php }elseif($order_status_id == 7){ ?>
						<a href="<?php echo $product['close']; ?>"  title="<?php echo $button_close; ?>" class="btn btn-danger"><i class="fa fa fa-times"></i></a>
					<?php				
					}else{'<p style="color:red; ">Order Cancel<p>'; } ?>					
				</td>
				<?php } ?>
			</tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
            
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="4"></td>
              <td class="text-right"><b><?php echo $total['title']; ?></b></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            
            </tr>
            <?php } ?>
          </tfoot>
					</table>
				</div>
				<?php if ($histories) { ?>
        <div class="my-account__header addr">
				<h1 class="title">Order History</h1>
				</div>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($histories) { ?>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="text-left"><?php echo $history['date_added']; ?></td>
            <td class="text-left"><?php echo $history['status']; ?></td>
            <td class="text-left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>
				
				
				
				
				<!--<div class="my-account__header addr">
				<h1 class="title">Order History</h1>
				</div>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-left">Date Added</td>
							<td class="text-left">Status</td>
							<td class="text-left">Comment</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-left">05/07/2018</td>
							<td class="text-left">Pending</td>
							<td class="text-left"></td>
						</tr>
						<tr>
							<td class="text-left">05/07/2018</td>
							<td class="text-left">Pending</td>
							<td class="text-left"></td>
						</tr>
						<tr>
							<td class="text-left">05/07/2018</td>
							<td class="text-left">Pending</td>
							<td class="text-left"></td>
						</tr>
						<tr>
							<td class="text-left">05/07/2018</td>
							<td class="text-left">Canceled</td>
							<td class="text-left"></td>
						</tr>
					</tbody>
					</table>-->
	  
	  
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-yellow"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
