<?php echo $header; ?>
<?php if(isset($orderDetails) && (isset($route) && $route == 'checkout/success')){ ?> 

  <?php foreach ($products as $product) { ?>
  
  <?php $final_total=$product['total1']; ?>
  
  
  <?php } ?>
 <?php  $date = date('Y-m-d', strtotime('+7 days'));  ?>
  
  <script src="https://apis.google.com/js/platform.js?onload=renderOptIn" async defer></script>
<script>
  window.renderOptIn = function() {
    window.gapi.load('surveyoptin', function() {
      window.gapi.surveyoptin.render(
        {
          // REQUIRED FIELDS
          "merchant_id": 118714105,
          "order_id": "<?php echo $order_id; ?>",
          "email": "<?php echo $email; ?>",
          "delivery_country": "IN",
          "estimated_delivery_date": "<?php echo $date; ?>",

          // OPTIONAL FIELDS
         // "products": [{"gtin":"GTIN1"}, {"gtin":"GTIN2"}]
        });
    });
  }
</script>
  
  
  


<!-- Google Code for ornatejewelsgoogleconversions Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 833288049;
var google_conversion_label = "GaYHCL2l5XUQ8e6rjQM";
var google_conversion_value = 1.00;
var google_conversion_currency = "INR";
var google_remarketing_only = false;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/833288049/?value=1.00&amp;currency_code=INR&amp;label=GaYHCL2l5XUQ8e6rjQM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<img style="position:absolute; visibility:hidden" src="https://www.ref-r.com/campaign/t1/settings?bid_e=5D1853A286F27F74EA7711E998DE74DD&bid=25959&t=420&event=sale&email=<?php echo $email; ?>&orderID=<?php echo $order_id; ?>&purchaseValue=<?php echo $final_total; ?>&fname=<?php echo $fname; ?>" />


<?php } ?>

<style>

.btn-continue {
    background: #670067;
    color: #fff;
}

</style>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="row myaccount"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

  <!--  <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>-->
       


    <div id="content" class="<?php echo $class; ?> success-text"><?php echo $content_top; ?>
        
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>

<?php if (isset($order_id)) { ?>
  <div id="print">
	<!--<div style="padding: 0px 0px 20px 0px;">
		<?php echo $store_name; ?><br />
		<?php echo $store_address; ?><br />
		<?php echo $store_emal; ?><br />
		<?php echo $store_tel; ?>
	</div>-->
      <table class="table table-bordered table-hover">
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
              <b><?php echo $text_order_id; ?></b> <?php echo $order_id; ?><br />
              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
            <td class="text-left"><?php if ($payment_method) { ?>
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
            <td class="text-left" style="width: 50%;"><?php echo $text_payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $text_shipping_address; ?></td>
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
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <?php if ($products) { ?>
              <td style="width: 20px;"></td>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-left"><?php echo $product['name']; ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['total']; ?></td>
              <td class="text-right" style="white-space: nowrap;"><?php if ($product['reorder']) { ?>
                <a href="<?php echo $product['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></a>
                <?php } ?>
                <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="3"></td>
              <td class="text-right"><b><?php echo $total['title']; ?></b></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
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
     <!-- <?php if ($histories) { ?>
      <h3><?php echo $text_history; ?></h3>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="text-left"><?php echo $history['date_added']; ?></td>
            <td class="text-left"><?php echo $history['status']; ?></td>
            <td class="text-left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>-->
  </div>
<?php } ?>



      <div class="buttons">
        <div><a href="<?php echo $continue; ?>" class="btn btn-continue"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>


<?php if(isset($orderDetails) && (isset($route) && $route == 'checkout/success' || $route == 'checkout/success/index' || $route == 'quickcheckout/success') && (!$user_logged || $ga_exclude_admin != 1 && $user_logged)) { ?>     
           	<?php if ($ga_tracking_type == 1) { ?>
           	<?php if ($ga_cookie == 1) { echo '<script type="text/plain" class="cc-onconsent-analytics">';} else{echo '<script type="text/javascript">'; } ?>

              _gaq.push(['_addTrans',
                '<?php echo $orderDetails['order_id']; ?>',
                '<?php echo addslashes($orderDetails['store_name']); ?>',
                '<?php echo round($orderDetails['total'], 2); ?>',
                '<?php echo round($orderDetails['order_tax'], 2); ?>',
                '<?php echo $orderDetails['shipping_total']; ?>',
                '<?php echo $orderDetails['shipping_city']; ?>',
                '<?php echo $orderDetails['shipping_zone']; ?>',
                '<?php echo $orderDetails['shipping_country']; ?>',
              ]);

            <?php if(isset($orderProduct)) { ?>
            <?php foreach($orderProduct as $product) { ?>
                _gaq.push(['_addItem',
                "<?php echo $product['order_id']; ?>",
                <?php if(isset($product['sku'])) { ?><?php echo json_encode(html_entity_decode($product['sku'],ENT_QUOTES, 'UTF-8')); ?><?php } else { ?><?php echo json_encode(html_entity_decode($product['model'],ENT_QUOTES, 'UTF-8')); ?><?php } ?>,
                <?php echo json_encode(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')); ?>,
                <?php echo json_encode(html_entity_decode($product['category_name'], ENT_QUOTES, 'UTF-8')); ?>,
                "<?php echo round($product['price'], 2); ?>",
                "<?php echo $product['quantity']; ?>"
              ]);
			<?php } ?>
 			<?php } ?>

			<?php if(isset($orderProductOptions)) { ?>
			<?php foreach($orderProductOptions as $product) { ?>
                _gaq.push(['_addItem',
                "<?php echo $product['order_id']; ?>",
                "<?php if(isset($product['sku'])) { ?><?php echo addslashes($product['sku']); ?><?php } else { ?><?php echo addslashes($product['model']); ?><?php } ?> - <?php echo html_entity_decode(addslashes($product['options_data']),ENT_QUOTES, 'UTF-8'); ?>",
                <?php echo json_encode(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')); ?>,
                <?php echo json_encode(html_entity_decode($product['category_name'], ENT_QUOTES, 'UTF-8')); ?>,
                "<?php echo round($product['price'], 2); ?>",
                "<?php echo $product['quantity']; ?>"
              ]);
			<?php } ?>
			<?php } ?>
			
              _gaq.push(['_trackTrans']); //submits transaction to the Analytics servers
              
              (function() {
              var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
              ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
              var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
              })();
            </script>  
            <?php } else if ($ga_tracking_type == 0)  { ?>
            <?php if ($ga_cookie == 1) { echo '<script type="text/plain" class="cc-onconsent-analytics">';} else{echo '<script>'; } ?>
            
              ga('require', 'ecommerce', 'ecommerce.js');

              ga('ecommerce:addTransaction', {
                'id': '<?php echo $orderDetails['order_id']; ?>',
                'affiliation': '<?php echo addslashes($orderDetails['store_name']); ?>',
                'revenue': '<?php echo round($orderDetails['total'], 2); ?>',
                'tax': '<?php echo round($orderDetails['order_tax'], 2); ?>',
                'shipping': '<?php echo round($orderDetails['shipping_total'], 2); ?>'
              });

            <?php if(isset($orderProduct)) { ?>
            <?php foreach($orderProduct as $product) { ?>
              ga('ecommerce:addItem', {
                'id': '<?php echo $product['order_id']; ?>',
                'sku': <?php if(isset($product['sku'])) { ?><?php echo json_encode(html_entity_decode($product['sku'],ENT_QUOTES, 'UTF-8')); ?><?php } else { ?><?php echo json_encode(html_entity_decode($product['model'],ENT_QUOTES, 'UTF-8')); ?><?php } ?>,
                'name': <?php echo json_encode(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')); ?>,
                'category': <?php echo json_encode(html_entity_decode($product['category_name'], ENT_QUOTES, 'UTF-8')); ?>,
                'price': '<?php echo round($product['price'], 2); ?>',
                'quantity': '<?php echo $product['quantity']; ?>'
              });
			<?php } ?>
 			<?php } ?>

			<?php if(isset($orderProductOptions)) { ?>
			<?php foreach($orderProductOptions as $product) { ?>
              ga('ecommerce:addItem', {
                'id': '<?php echo $product['order_id']; ?>',
                'sku': '<?php if(isset($product['sku'])) { ?><?php echo addslashes($product['sku']); ?><?php } else { ?><?php echo addslashes($product['model']); ?><?php } ?> - <?php echo html_entity_decode(addslashes($product['options_data']),ENT_QUOTES, 'UTF-8'); ?>',
                'name': <?php echo json_encode(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')); ?>,
                'category': <?php echo json_encode(html_entity_decode($product['category_name'], ENT_QUOTES, 'UTF-8')); ?>,
                'price': '<?php echo round($product['price'], 2); ?>',
                'quantity': '<?php echo $product['quantity']; ?>'
              });
			<?php } ?>
			<?php } ?>

              ga('ecommerce:send');

            </script>
            <?php } ?>
			
		
			
          
            <!--<?php if ($ga_adwords == 1) { ?> 
           
            <?php if ($ga_cookie == 1) { ?>
			
			<script type="text/plain" class="cc-onconsent-analytics"><?php } else{  ?> <script type="text/javascript">  <?php } ?>
            
            var google_conversion_id = 833288049;
            var google_conversion_language = "en";
            var google_conversion_format = "3";
            var google_conversion_color = "666666";
            var google_conversion_label = "<?php echo $ga_label; ?>";
          
            var google_conversion_value = 1.00;
			var google_conversion_currency = "INR";
			var google_remarketing_only = false;
			
			
			</script>
            <<?php if ($ga_cookie == 1) { echo 'script type="text/plain" class="cc-onconsent-analytics"';} else{echo 'script type="text/javascript"'; } ?> src="//www.googleadservices.com/pagead/conversion.js">
            </script>
            <noscript>
            <div style="display:none;visibility:hidden">
          
			<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/833288049/?value=1.00&amp;currency_code=INR&amp;label=GaYHCL2l5XUQ8e6rjQM&amp;guid=ON&amp;script=0"/>

			</div>
            </noscript>
          
            <?php } ?>-->
            
            <!-- Place any additional third party Tracking code below this line (eg Bing, Facebook etc) -->
            
            <!-- Place any additional third party Tracking code above this line (eg Bing, Facebook etc) -->
			
			
				<!-- Google Code for ornatejewelsgoogleconversions Conversion Page -->
<!--<script type="text/javascript">

var google_conversion_id = 833288049;
var google_conversion_label = "GaYHCL2l5XUQ8e6rjQM";
var google_conversion_value = 1.00;
var google_conversion_currency = "INR";
var google_remarketing_only = false;

</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/833288049/?value=1.00&amp;currency_code=INR&amp;label=GaYHCL2l5XUQ8e6rjQM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>-->
			
			
			
            
            <?php } ?>  


<?php echo $footer; ?>