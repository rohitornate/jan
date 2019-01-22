<div class="panel panel-green1">              
<div class="panel-heading"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;<?php echo $text_totals;?> - <?php echo $final_price; ?></div>
<div id="xtotals-content">        
<table class="table">
<tbody>
<?php foreach ($totals as $total) { ?>
<tr><td><?php echo $total['title']; ?>:</td><td class="text-right"><?php echo $total['text']; ?></td></tr>
<?php } ?>            
</tbody>            
</table>
</div>
</div>