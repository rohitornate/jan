<?php echo $header; ?>

<style>
.table td {
    
    text-align: center;
   
	}
	.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
    border: 1px solid #ddd;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding:8px 2px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
	}
	.text-left a {
    text-decoration: none;
    color: #000;
    }
	.btn .fa-shopping-cart{
	padding:0px;
	color:#fff;
	font-size:large;
	}
	.btn .fa-times{
	padding:0px;
	color:#fff;
	font-size:large;
	}
	.btn-primary {
    background: #670067 !important;
}
.btn-danger {
    background: #cadbe8 !important;
}
.btn-info {
    color: #fff;
    background-color: #cadbe8;
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
  <div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="my-account-header">My Account</div>
			</div>
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
        <div class="my-account__header addr">
        <h1 class="title">My Wish List</h1>
		</div>
      <?php if ($products) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-center"><?php echo $column_image; ?></td>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_stock; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-center"><?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?></td>
              <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['stock']; ?></td>
              <td class="text-right"><?php if ($product['price']) { ?>
                <div class="price1">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <b><?php echo $product['special']; ?></b><br> <s><?php echo $product['price']; ?></s>
                  <?php } ?>
                </div>
                <?php } ?></td>
              <!--<td class="text-right"><button  onclick="cart.add('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_cart; ?>" class="btn btn-info">Add To Cart</button>
                <a href="<?php echo $product['remove']; ?>"  title="<?php echo $button_remove; ?>" class="btn btn-danger">Remove</a></td>-->
				<td class="text-center">
				<button onclick="cart.add('<?php echo $product['product_id']; ?>');" title="Add To Cart" class="btn btn-primary">
					<i class="fa fa-shopping-cart"></i>
				</button>
				<a href="<?php echo $product['remove']; ?>" title="Remove" class="btn btn-danger">
					<i class="fa fa-times"></i>
				</a>
			</td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-yellow"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>