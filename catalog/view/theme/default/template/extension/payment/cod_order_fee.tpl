<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" data-loading-text="<?php echo $text_loading; ?>" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=extension/payment/cod_order_fee/confirm',
		cache: false,
		beforeSend: function() {
			$('#button-confirm').button('loading');
			$('#button-confirm').attr('disabled',true);
		},
		complete: function() {
			$('#button-confirm').button('reset');
			$('#button-confirm').attr('disabled',false);
		},
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script>
