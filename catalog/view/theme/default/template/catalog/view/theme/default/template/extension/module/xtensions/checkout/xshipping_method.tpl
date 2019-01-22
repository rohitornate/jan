<?php if ($shipping_methods) { ?>            
<table class="table">
<?php foreach ($shipping_methods as $shipping_method) { ?>          
<?php if (!$shipping_method['error']) { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>
<tbody><tr>
<td><label for="<?php echo $quote['code']; ?>">
<?php if ($quote['code'] == $shipping_code || !$shipping_code) { ?>
<?php $shipping_code = $quote['code']; ?>
<input type="radio" class="input-radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
<?php }else{?>
<input type="radio" class="input-radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
<?php } ?>
<?php echo $quote['title']; ?></label></td>
<td class="text-right"><label class="text-strong" for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label></td>
</tr></tbody>
<?php } ?>
<?php } else { ?>
<tbody><tr>
<td colspan="2"><div class="xerror"><?php echo $shipping_method['error']; ?></div></td>
</tr></tbody>
<?php } ?>
<?php } ?>
</table>
<?php } ?>