<?php if ($shipping_methods) { ?>
     <div id="shipping_method" class="panel panel-green1" >
              <!-- Default panel contents -->
        <div class="panel-heading"><?php echo $text_shipping_method; ?></div>        
          <table class="table table-hover">
          <?php foreach ($shipping_methods as $shipping_method) { ?>
          <thead><tr>
			<th width="80%"><?php echo $shipping_method['title']; ?></th>			
			<th width="20%"></th>
            </tr></thead>
            <?php if (!$shipping_method['error']) { ?>
  			<?php foreach ($shipping_method['quote'] as $quote) { ?>
           	<tbody><tr>
           	<td><label for="<?php echo $quote['code']; ?>">
           	<?php if ($quote['code'] == $shipping_code || !$shipping_code) { ?>
      		<?php $shipping_code = $quote['code']; ?>
			<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
			<?php }else{?>
			<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
			<?php } ?>
			<?php echo $quote['title']; ?></label></td>
			<td class="text-right"><label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label></td>
            </tr></tbody>
             <?php } ?>
  			<?php } else { ?>
  			<tbody><tr>
  			<td colspan="2"><div class="xerror"><?php echo $shipping_method['error']; ?></div></td>
  			</tr></tbody>
  			<?php } ?>
            <?php } ?>
            </table>
        </div>
        <script type="text/javascript">
$(document).on("change", "input[name='shipping_method']", function(event) {
  	loadShippingMethods();	
});
</script>
<?php } ?>