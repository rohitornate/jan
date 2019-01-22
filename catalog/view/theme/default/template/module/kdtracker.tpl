<div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="panel-body">
  	<?php if ($kdtracker) { ?>
        <p><b><?php echo $view_tracking_status; ?>:</b> <?php echo $status; ?></p>
        <p><b><?php echo $view_company; ?>:</b> <?php echo $company; ?></p>
        <p><b><?php echo $view_tracking_info; ?>:</b></p>
    	<?php foreach($tracking_info as $key=>$value){?>
          <?php if($key==1){?>
        <p><?php echo $value['time'].'&nbsp;&nbsp;'.$value['context'];?></p>
          <?php break;} ?>
        <?php } ?>
 
    	<p><a target="_blank" href="http://global.kuaidi.com/query.html?nus=<?php echo $nu;?>"><b>get more logistics information about this order.   (kdtracker number:<?php echo $nu;?>)</b></a></p>
      <?php }else{ ?>
      	<form method="get">
      	<?php foreach($get as $k=>$v){?>
      		<?php if($k!='order_id'){?>
      		<input type="hidden" name="<?php echo $k;?>" value="<?php echo $v;?>" >
      		<?php } ?>
      		<?php if($k=='order_id'&&!empty($get['order_id'])){?>
      		<p style="text-align: center;">empty</p>
      		<?php } ?>
      	<?php } ?>
      	<div class="form-group">
      		<label class="control-label" for="input-order-id"><?php echo $entry_order_id; ?></label>
			<input id="input-order-id" class="form-control" name="order_id" value="" placeholder="<?php echo $entry_order_id; ?>" type="text">
      	</div>
      	<button type="submit" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i><?php echo $button_search; ?></button>
      	</form>
      <?php } ?>
  </div>
</div>