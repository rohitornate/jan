<?php if (!isset($redirect)) { ?>
<?php if($isBestActive) { ?>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#step_payment_panel .pull-right').removeClass('pull-right');
		$('#step_payment_panel .btn-primary').addClass('btn-success mybutton');
		$('#step_payment_panel #payubox .xbutton').addClass('btn btn-success mybutton');
		$('#step_payment_panel #payubox .xbutton').removeClass('xbutton');
		$('#step_payment_panel .btn-primary').parent().addClass('paddingb');
		$('#step_payment_panel .right .button').addClass('btn btn-success mybutton');
		$('#step_payment_panel .right .button').parent().addClass('paddingb');
		$('#step_payment_panel .right .button').removeClass('button');
		$('#step_payment_panel .btn-primary').removeClass('btn-primary');
		$('#step_payment_panel input[type=\'button\']').wrapAll('<h3>');
	});
	</script>
<?php } ?>
<div class="table-responsive hidden" >
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-left"><?php echo $column_name; ?></td>
        <td class="text-left"><?php echo $column_model; ?></td>
        <td class="text-right"><?php echo $column_quantity; ?></td>
        <td class="text-right"><?php echo $column_price; ?></td>
        <td class="text-right"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?>
          <?php if($product['recurring']) { ?>
          <br />
          <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
          <?php } ?></td>
        <td class="text-left"><?php echo $product['model']; ?></td>
        <td class="text-right"><?php echo $product['quantity']; ?></td>
        <td class="text-right"><?php echo $product['price']; ?></td>
        <td class="text-right"><?php echo $product['total']; ?></td>
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
        <td colspan="4" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
        <td class="text-right"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
</div>
<?php echo $before_content; ?>
<?php echo $payment; ?>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>