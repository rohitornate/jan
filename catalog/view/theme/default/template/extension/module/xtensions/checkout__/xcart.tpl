<?php if(!isset($redirect) && ($products || $vouchers)) { ?>
<div class="panel panel-green1 xcart cartpanel">
<div class="panel-heading xcollapsable" data-toggle="collapse" data-target="#xcart-content-<?php echo $section; ?>" aria-expanded="true"><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;<?php echo $total_products; ?></div>
<div id="xcart-content-<?php echo $section; ?>" class="panel-body collapse in">
<?php if($xcart_success){ ?>
<div class="alert alert-success alert-small"><?php echo $xcart_success; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
<?php } ?>
<div class="cartproducts">
<?php $countOptions = 1; foreach ($products as $product) { ?>
<div class="cartelement">
<div class="media">
  <div class="media-left">
   <a target="_newtab" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
  </div>
  <div class="media-body">
  	<div class="col-xs-12 nopadding">
    <div class="media-heading"><a target="_newtab" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?>
    <?php if (!$product['stock']) { ?>
     <span class="text-danger">***</span>
     <?php } ?></a></div>
    <a class="optionLink pointer text-right" onclick="toggleOptions('xoptions<?php echo $countOptions; ?>-<?php echo $section; ?>')"><i class="fa fa-info-circle" aria-hidden="true"></i></a>
  	<div class="clearfix"></div>
  	<div class="text-left width50"><span class="is_amount text-muted"><?php echo $product['quantity']; ?> &times; <?php echo $product['price']; ?></span></div><div class="text-right width50"><span class="is_total"><?php echo $product['total']; ?></span></div>
   <div class="clearfix"></div>   
  <div class="text-left"><div class="text-muted">      	
        	<div style="display: none;" id="xoptions<?php echo $countOptions; ?>-<?php echo $section; ?>">
        	<div class="text-left"><span><?php echo $column_model?>: </span><span class="text-muted"><?php echo $product['model']; ?></span></div>  
        	<?php foreach ($product['option'] as $option) { ?>
        		<div class="xgray"><?php echo $option['name']; ?>: <?php echo $option['value']; ?></div>        		
        	<?php } ?>
        	<?php if ($product['reward']) { ?>                  
              <div class="xgray"><?php echo $product['reward']; ?></div>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
                  <div class="xgray"><?php echo $text_recurring_item; ?>: <?php echo $product['recurring']; ?></div>
			<?php } ?>
        	</div>
        	</div> 
  			</div> 
  			
  		<div class="clearfix"></div>
  <?php if($product['error_warning']){ ?>
  <div class="text-danger"><?php echo $product['error_warning']; ?></div>
  <?php } ?>
   <?php if($section == 'payment'){ ?>
   <div class="text-left"><a class="pointer underline" onclick="click2();"><?php echo $text_cart_edit; ?></a></div>
   <div class="clearfix"></div> 
   <?php } ?>   
   </div> 
   </div>
</div>
<?php if($section != 'payment'){ ?>
<div class="input-group cartedit">  	
    <div class="input-group-addon editcart minus" onclick="$(this).children('button').children('i').removeClass('icon ion-minus');$(this).children('button').children('i').addClass('fa fa-circle-o-notch fa-spin');xcart.xupdate('<?php echo $product['cart_id']; ?>',parseInt(+($('input[name=\'quantity[<?php echo $product['cart_id']; ?>]\']').val())-1),'<?php echo $section; ?>');"><button type="button" data-toggle="tooltip" title="<?php echo $button_update; ?>"><i class="icon ion-minus"></i></button></div>
    <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" onchange="xcart.xupdate('<?php echo $product['cart_id']; ?>',$('input[name=\'quantity[<?php echo $product['cart_id']; ?>]\']').val(),'<?php echo $section; ?>');" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />                                     
    <div class="input-group-addon editcart plus" onclick="$(this).children('button').children('i').removeClass('icon ion-plus-round');$(this).children('button').children('i').addClass('fa fa-circle-o-notch fa-spin');xcart.xupdate('<?php echo $product['cart_id']; ?>',parseInt(+($('input[name=\'quantity[<?php echo $product['cart_id']; ?>]\']').val())+1),'<?php echo $section; ?>');"><button type="button" data-toggle="tooltip" title="<?php echo $button_update; ?>"><i class="icon ion-plus-round"></i></button></div>
    <div class="input-group-addon editcart xremove" onclick="$(this).children('button').children('i').removeClass('icon ion-trash-b');$(this).children('button').children('i').addClass('fa fa-circle-o-notch fa-spin');xcart.xremove('<?php echo $product['cart_id']; ?>','<?php echo $section; ?>');"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>"><i class="icon ion-trash-b"></i></button></div>
    <div class="input-group-addon editcart xwishlist" onclick="$(this).children('button').children('i').removeClass('icon ion-android-favorite-outline');$(this).children('button').children('i').addClass('fa fa-circle-o-notch fa-spin');xcart.wishlist('<?php echo $product['product_id']; ?>','<?php echo $product['cart_id']; ?>','<?php echo $section; ?>');"><button type="button" data-toggle="tooltip" title="<?php echo $text_move_to_wishlist; ?>"><i class="icon ion-android-favorite-outline"></i></button></div>
   </div>
<div class="clearfix"></div>   
<?php } ?>
</div>
<?php  $countOptions++; } ?>
<?php foreach ($vouchers as $voucher){ ?>
<div class="cartelement">
<div class="media">
<div class="media-left">
   <span><img src="<?php echo $voucher_image; ?>" alt="<?php echo $voucher['description']; ?>" class="img-thumbnail" /></span>
  </div>
<div class="media-body">
  	<div class="col-xs-12 nopadding">
    <div class="media-heading"><?php echo $text_gift_voucher; ?></div>
    <a class="optionLink pointer text-right" onclick="toggleOptions('xoptions<?php echo $countOptions; ?>-<?php echo $section; ?>')"><i class="fa fa-info-circle" aria-hidden="true"></i></a>
    <div class="clearfix"></div>  	
  	<div class="text-left width50"><span class="is_total"><?php echo $voucher['amount']; ?></span></div>
  	<?php if($section != 'payment'){ ?>
  	<div class="text-right width50"><a class="pointer underline" onclick="xvoucher.xremove('<?php echo $voucher['key']; ?>','<?php echo $section; ?>');"><?php echo $button_remove; ?></a></div>
  	<?php } else { ?>
  	<div class="text-right width50"><a class="pointer underline" onclick="click2();"><?php echo $text_cart_edit; ?></a></div>
  	<?php } ?>
   <div class="clearfix"></div>  
   <div class="text-left"><div class="text-muted">      	
   <div style="display: none;" id="xoptions<?php echo $countOptions; ?>-<?php echo $section; ?>">
   <div class="text-left"><span><?php echo $voucher['description']; ?></span></div>
   </div>
   </div> 
   </div> 
   <div class="clearfix"></div>			
</div>
</div>
</div>
</div>
<?php  $countOptions++; } ?>
</div>
</div>
</div>
<?php } ?>