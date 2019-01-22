<?php if($modData['cv_show'] || $modData['show_p_method_comment'] || $reward_status){?>
<div class="panel panel-green1">
              <!-- Default panel contents -->
        <div class="panel-heading"><?php echo $text_options;?></div>        
          <table class="table">
          <tbody>
          	<?php if($modData['c_show']){?>
          	<tr>
           	<td><b><?php echo $coupon_text;?></b></td>
			<td class="text-right"><span style="cursor: pointer;"><a data-toggle="modal" data-target="#couponModal"><b><?php echo $coupon_apply_text;?></b></a></span></td>
            </tr>
            <?php } ?>
            <?php if($modData['v_show']){?>
            <tr>          
           	<td><?php echo $voucher_text;?></td>
			<td class="text-right"><span style="cursor: pointer;"><a data-toggle="modal" data-target="#voucherModal"><?php echo $voucher_apply_text;?></a></span></td>
            </tr>
            <?php } ?>
            <?php if($reward_status){?>
          	<tr>
           	<td><?php echo $reward_text;?></td>
			<td class="text-right"><span style="cursor: pointer;"><a data-toggle="modal" data-target="#rewardModal"><?php echo $reward_apply_text;?></a></span></td>
            </tr>
            <?php } ?>
            <?php if($modData['show_p_method_comment']){?>
            <tr>
           	<td><?php echo 'Add Comments/Add Gift Message';?></td>
			<td class="text-right"><span style="cursor: pointer;"><a data-toggle="modal" data-target="#commentModal"><?php echo $comment_apply_text1;?></a></span></td>
            </tr>
            <?php } ?>
            </tbody>            
            </table>
</div>
<?php } ?>