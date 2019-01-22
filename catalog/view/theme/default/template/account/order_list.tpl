<?php echo $header; ?>
<style>
.table td {
    
    text-align: center;
   
}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 8px 10px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
	}
	
	.btn-info {
    color: #fff;
    background-color: #cadbe8;
}
	.btn {
    font-size: .9375rem;
    padding: 0px 0px;
    display: inline-block;
}
.btn-yellow {
    background: #360736;
    font-size: 1.125rem;
    color: #fff;
    padding: 10px;
    display: block;
    border: 0;
	outline:0;
    cursor: pointer;
    width: 100%;
    text-transform: uppercase;
	}
	@media (max-width: 767px){
	.my-account__header.addr h1{
	font-size:unset;
	}
	.my-account__header.addr {
	padding-top:10px;
	}
.fa-eye:before {
    content: "\f06e";
}

</style>


<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
			
				<div class="my-account-header">My Account</div>
			
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
			<h1 class="title">Order History</h1>
		</div>
      <?php if ($orders) { ?>
      <div class="table-responsive">
        <!--<table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-right"><?php echo $column_order_id; ?></td>
              <td class="text-left"><?php echo $column_customer; ?></td>
              <td class="text-right"><?php echo $column_product; ?></td>
              <td class="text-left"><?php echo $column_status; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <td class="text-left"><?php echo $column_date_added; ?></td>
			 
			  
			  
			  
              <td class="text-right">View</td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($orders as $order) { ?>
            <tr>
              <td class="text-right">#<?php echo $order['order_id']; ?></td>
              <td class="text-left"><?php echo $order['name']; ?></td>
              <td class="text-right"><?php echo $order['products']; ?></td>
              <td class="text-left"><?php echo $order['status']; ?></td>
              <td class="text-right"><?php echo $order['total']; ?></td>
              <td class="text-left"><?php echo $order['date_added']; ?></td>
			  
              <td class="text-right"><a href="<?php echo $order['view']; ?>" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a>
		


				</td>
            </tr>
            <?php } ?>
          </tbody>
        </table>-->
		<table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-center">Order ID</td>
              <td class="text-center">Customer</td>
              <td class="text-center">Products</td>
              <td class="text-center">Status</td>
              <td class="text-center">Total</td>
              <td class="text-center">Date Added</td>
			 
			  
			  <td class="text-center">Tracking</td>
			  
              <td class="text-center">View</td>
            </tr>
          </thead>
          <tbody>
		  
		  <?php foreach ($orders as $order) { //print_r($product);?>
                        <tr>
              <td class="text-center">#<?php echo $order['order_id']; ?></td>
              <td class="text-center"><?php echo $order['name']; ?></td>
              <td class="text-center"><?php echo $order['products']; ?></td>
              <td class="text-center"><?php echo $order['status']; ?></td>
              <td class="text-center"><?php echo $order['total']; ?></td>
              <td class="text-center"><?php echo $order['date_added']; ?></td>
			  	 <?php if(isset($order['tracking_code']) && !empty($order['tracking_code'])){ ?>		  
			  <td class="text-left"><a class="btn-info" style="
    /* text-align: center; */
    padding: 5px 10px 9px 10px;
" href="https://ecomexpress.in/tracking/?awb_field=<?php echo $order['tracking_code']; ?>" target="_blank">Track</a></td>
			  <?php }else{ ?>
			  
			  <td ></td>
			  <?php } ?>
			                <td class="text-center"><a href="<?php echo $order['view']; ?>" title="View" class="btn btn-info"><i class="fa fa-eye"></i></a>
		<!--	<a href="http://localhost/new/index.php?route=account/order/info&amp;order_id=573" title="View" class="btn btn-danger"><i class="fa fa-reply"></i></a>-->


				</td>
            </tr>
			
		  <?php } ?>
                        
                      </tbody>
        </table>
		
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
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
