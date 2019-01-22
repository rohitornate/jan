<div class="panel panel-green1">              
<div class="panel-heading"><?php echo $text_totals;?></div>        
<table class="table">
<tbody>
<?php foreach ($totals as $total) { ?>
<tr><td><?php echo $total['title']; ?>:</td><td class="text-right"><?php echo $total['text']; ?></td></tr>
<?php } ?>            
</tbody>            
</table>
</div>