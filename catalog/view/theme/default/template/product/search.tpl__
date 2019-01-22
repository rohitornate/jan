<?php echo $header; ?>
<section class="categories-main"> <!--main start here -->
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <div id="content" class="search-result"><?php echo $content_top; ?>
        <div class="heading-bg">
      <h1><?php echo $heading_title; ?></h1>
      <h2><?php echo $text_search; ?></h2>
      </div>
      <?php if ($products) { ?>
      <div class="row clearfix">
        <div class="col-md-4 col-xs-6 sebox">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="col-md-3 col-xs-6 sebox">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
      <section class="categories"> <!--categories  start  here --> 
                <?php foreach ($products as $product) { ?>
                <div class="c-box">
                            <a href="<?php echo $product['href']; ?>">
                                <img  src="<?php echo $product['thumb']; ?>">
                        <p><?php echo $product['name'] ?></p>
                            </a>
                            <?php if ($product['price']) { ?>
                            <div class="price-box clearfix">
                                <?php if (!$product['special']) { ?>
                                    <div class="price-retail">
                                        <small>Retail Price</small>
                                        <strike><?php echo $product['price']; ?></strike><span>(0% Off)</span></strong>
                                    </div>
                                    <div class="price-save">
                                        <strong><?php echo $product['price']; ?></strong>
                                        <small>You Save Rs 0</small>
                                    </div> 
                                <?php } else { ?>
                                    <div class="price-retail">
                                        <small>Retail Price</small>
                                        <strike><?php echo $product['price']; ?></strike><span>(<?php echo $product['discount_persent']; ?>% Off)</span></strong>
                                    </div>
                                    <div class="price-save">
                                        <strong><?php echo $product['special']; ?></strong>
                                        <small>You Save <?php echo $product['discount_price']; ?></small>
                                    </div> 
                                <?php } ?>
                                <?php if($product['quantity']<1){ ?>
                                <span class="cart-btn">Out Of Stock</span>
                                <?php }else{ ?>
                                <span class="cart-btn" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">Add To Cart</span>
                                <?php } ?>
                            </div>
                        <?php } ?>


                        </div>
                    
                <?php } ?>
            </section>  <!--categories  end  here --> 
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
</section>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>