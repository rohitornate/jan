<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo 'Return Invoice'; ?></title>
<base href="<?php echo $base; ?>" />
<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>
<body>
<div class="container">
  <?php foreach ($orders as $order) { ?>
  <div style="page-break-after: always;">
    <h1><img  title="Ornate Jewels" alt="Ornate Jewels" src="<?php echo $logo;?>"></h1>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td colspan="3"><?php echo 'Return Invoice'; ?></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="width: 33%;"><address>
            <strong><?php echo $order['store_name']; ?></strong><br />
            <?php echo $order['store_address']; ?>
            </address>
			</td>
          <td style="width: 33%;"><b><?php echo $text_date_added; ?></b> <?php echo $order['date_added']; ?><br />
            <?php if ($order['invoice_no']) { ?>
            <b><?php echo $text_invoice_no; ?></b> <?php echo $order['invoice_no']; ?><br />
            <?php } ?>
            <b><?php echo $text_order_id; ?></b> <?php echo $order['order_id']; ?><br />
			 <b><?php echo 'Return Id'; ?></b> <?php echo $order['return_id']; ?><br />
            <!--<b><?php echo $text_payment_method; ?></b> <?php echo $order['payment_method']; ?><br />
            <?php if ($order['shipping_method']) { ?>
            <b><?php echo $text_shipping_method; ?></b> <?php echo $order['shipping_method']; ?><br />-->
			<b><?php echo 'GSTIN : ' ?></b> <?php echo '27AABCW5767E1Z3'; ?><br />
            <b><?php echo $text_telephone; ?></b> <?php echo $order['store_telephone']; ?><br />
            <?php if ($order['store_fax']) { ?>
            <b><?php echo $text_fax; ?></b> <?php echo $order['store_fax']; ?><br />
            <?php } ?>
            <b><?php echo $text_email; ?></b> <?php echo $order['store_email']; ?><br />
            <b><?php echo $text_website; ?></b> <a href="<?php echo $order['store_url']; ?>"><?php echo $order['store_url']; ?></a>
			
            <?php } ?></td>
			<td style="width: 33%;">
			<address>
            <?php echo $order['payment_address']; ?><br/>
			<?php echo "<b>Mobile</b>: ".$order['telephone']; ?>    
            </address>
			
			</td>
			
			
        </tr>
      </tbody>
    </table>
	<table class="table table-bordered">
      <thead>
        <tr>
          <td style="width: 50%;"><b><?php echo 'Reason for Return'; ?></b></td>
          <td style="width: 50%;"><b><?php echo 'Opened'; ?></b></td>
		 
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><address>
            <?php echo $order['return_resson']; ?><br/>
			
            </address></td>
          <td><address>
            <?php if($order['opened']==0){ 
					echo "No";
					}else { 
							
					echo 'Yes';		
					}		


			?><br/>
			 
            </address></td>
        </tr>
      </tbody>
    </table>
	
    <!--<table class="table table-bordered">
      <thead>
        <tr>
          <td style="width: 50%;"><b><?php echo $text_payment_address; ?></b></td>
          <td style="width: 50%;"><b><?php echo $text_shipping_address; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><address>
            <?php echo $order['payment_address']; ?><br/>
			<?php echo "<b>Mobile</b>: ".$order['telephone']; ?>    
            </address></td>
          <td><address>
            <?php echo $order['shipping_address']; ?><br/>
			<?php echo "<b>Mobile</b>: ".$order['telephone']; ?>   
            </address></td>
        </tr>
      </tbody>
    </table>-->
    <table class="table table-bordered">
      <thead>
        <tr>
		 <td><b><?php echo 'Image'; ?></b></td>
          <td><b><?php echo $column_product; ?></b></td>
          <td><b><?php echo $column_model; ?></b></td>
          <td class="text-right"><b><?php echo $column_quantity; ?></b></td>
          <td class="text-right"><b><?php echo $column_price; ?></b></td>
          <td class="text-right"><b><?php echo $column_total; ?></b></td>
		  <td class="text-right"><b><?php echo $column_price; ?></b></td>
          <td class="text-right"><b><?php echo $column_total; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($order['product'] as $product) { ?>
        <tr>
		<td class="" style="width:100px"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></td>
          <td><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <td><?php echo $product['model']; ?></td>
          <td class="text-right"><?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['price']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
		   <td class="text-right"><?php echo $order['tax']; ?></td>
		    <td class="text-right"><?php echo $order['total']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($order['voucher'] as $voucher) { ?>
        <tr>
          <td><?php echo $voucher['description']; ?></td>
          <td></td>
          <td class="text-right">1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
        </tr>
        <?php } ?>
<!--<?php foreach ($order['total'] as $total) { ?>
        <tr>
          <td class="text-right" colspan="5"><b><?php echo $total['title']; ?></b></td>
          <td class="text-right"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>-->
      </tbody>
    </table>
    <?php if ($order['comment']) { ?>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><b><?php echo $text_comment; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><?php echo $order['comment']; ?></td>
        </tr>
      </tbody>
    </table>
    <?php } ?>
	<div><b>Declaration:</b></div>
  <p>I/We hereby certify that my/our registration certificate under the Maharashtra Value Added Tax Act. 2002 is in force on the date on which the sale of  the goods specified in this " Tax Invoice"  is made by me/us and that the transaction of sales covered by this "TAX INVOICE" Thas been effected by me/us and it shall be accounted  for in  the turn over of  sales while filing return and due tax ax Invoice, If any payable on the sales has been paid shall be paid.
  </p>
  <br>
  <div><center>SUBJECT TO PUNE JURISDICTION</center></div>
   <div><center>This is a Computer Generate Invoice</center></div>
  </div>
  
  <?php } ?>
  
</div>

</body>
</html>