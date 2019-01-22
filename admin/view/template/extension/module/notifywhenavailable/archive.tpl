<table id="archiveWrapper<?php echo $store_id; ?>" class="table table-bordered table-hover" width="100%">
	<thead>
        <tr class="table-header">
            <th width="20%"><?php echo $text_customer_email; ?></th>
            <th width="15%"><?php echo $text_customer_name; ?></th>
            <th width="25%"><?php echo $text_product; ?></th>
            <th width="10%"><?php echo $text_date; ?></th>
            <th width="5%"><?php echo $text_language; ?></th>
            <th width="5%"><?php echo $text_actions; ?></th>
        </tr>
    </thead>
    <tbody>
        <?php foreach($sources as $source) { ?>
            <tr>
                <td><?php echo $source['customer_email']; ?></td>
                <td><?php echo $source['customer_name']; ?></td>
                <td><a href="<?php echo '../index.php?route=product/product&product_id='.$source['product_id']; ?>" target="_blank"><strong><?php echo $source['product_name']; ?></strong></a>
                    <br />
                    <?php 
                        if($source['selected_options'] != NULL) {
                            $options = unserialize($source['selected_options']); 
                            foreach($options as $item) {
                                    echo $item['name'].'<br />';
                           	}
                        }
                    ?>
                </td>
                <td><?php echo $source['date_created']; ?></td>
                <td><?php echo $source['language']; ?></td>
                <td><a onclick="removeCustomer('<?php echo $source['notifywhenavailable_id']; ?>')" class="btn btn-sm btn-danger"><i class="fa fa-times"></i><?php echo $text_remove; ?></a></td>
            </tr>
    	<?php } ?>
	</tbody>
	<tfoot>
    	<tr><td colspan="6">
        	<div class="row">
              <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
              <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
		</td></tr>
    </tfoot>
</table>
<div style="float:right;padding: 5px;">
	<a onclick="removeAllArchive()" class="btn btn-small btn-info"><i class="fa fa-trash"></i>&nbsp;&nbsp;<?php echo $text_remove_all; ?></a>
</div>
<script>
function removeCustomer(notifywhenavailableID) {      
	var r=confirm("Are you sure you want to remove the customer?");
	if (r==true) {
		$.ajax({
			url: 'index.php?route=extension/module/notifywhenavailable/removecustomer&token=<?php echo $token; ?>',
			type: 'post',
			data: {'notifywhenavailable_id': notifywhenavailableID},
			success: function(response) {
				location.reload();
			}
		});
	}
}
function removeAllArchive() {      
	var r=confirm("Are you sure you want to remove all records?");
	if (r==true) {
		$.ajax({
			url: 'index.php?route=extension/module/notifywhenavailable/removeallarchive&token=<?php echo $token; ?>',
			type: 'post',
			data: {'remove': r},
			success: function(response) {
				location.reload();
			}
		});
	}
}
$(document).ready(function(){
	$('#archiveWrapper<?php echo $store_id; ?> .pagination a').click(function(e){
		e.preventDefault();
		$.ajax({
			url: this.href,
			type: 'get',
			dataType: 'html',
			success: function(data) {				
				$("#archiveWrapper<?php echo $store_id; ?>").html(data);
			}
		});
	});		 
});
</script>