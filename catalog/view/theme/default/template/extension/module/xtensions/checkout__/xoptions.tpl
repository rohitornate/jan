<?php if($inline_view){ ?>
<?php if($display_coupons || $display_vouchers || $display_rewards || $display_comments){?>
<div class="col-md-12 paddingright0 paddingleft0">
<div class="panel panel-green1 couponpanel">
<!--<div class="panel-heading"><i class="fa fa-tags" aria-hidden="true"></i>&nbsp;<?php echo $text_options;?></div>-->
<div id="xoptions-content">
  <?php if($display_coupons){?>
  <form role="form" id="form_add_coupon" action="#" method="post" enctype="multipart/form-data">
  <div id="coupon-panel" class="cvc-panel coupon-panel">
  		<div class="input-group group">
     		<input name="coupon" type="text" value="<?php echo $coupon_value;?>" class="inputMaterial" />
     		<label><?php echo $coupon_apply_text;?>&nbsp;<i class="fa fa-scissors" aria-hidden="true"></i></label>
      		<div class="input-group-addon"><button id="couponbtn1" type="submit"><i class="cvcapply fa fa-check"></i></button></div>
    </div>
  </div>
  </form>
  <?php } ?>
  <?php if($display_vouchers){?>
  <form role="form" id="form_add_voucher" action="#" method="post" enctype="multipart/form-data">
  <div id="voucher-panel" class="cvc-panel voucher-panel">
  		<div class="input-group group">
     		<input name="voucher" value="<?php echo $voucher_value;?>" type="text" class="inputMaterial"  />
     		<!--<label><?php echo $voucher_apply_text;?>&nbsp;<i class="fa fa-tag" aria-hidden="true"></i></label>-->
      		<div class="input-group-addon"><button id="voucherbtn1" type="submit"><i class="cvcapply fa fa-check"></i></button></div>
    </div>
  </div>
  </form>
  <?php } ?>
  <?php if($display_rewards){?>
  <form role="form" id="form_add_reward" action="#" method="post" enctype="multipart/form-data">
  <div id="reward-panel" class="cvc-panel reward-panel">
  		<div class="input-group group filledalways">
     		<input name="reward" value="<?php echo $reward_value;?>" type="text" placeholder="Rewards" class="numeric inputMaterial" />
     		<label><?php echo $text_use_reward;?></label>
      		<div class="input-group-addon"><button id="rewardbtn1" type="submit"><i class="cvcapply fa fa-check"></i></button></div>
    </div>
  </div>
  </form>
  <?php } ?> 
  <?php if($display_comments){ ?>
  <div id="comment-panel" class="form-group cvc-panel">
  	<div class="row">
		<span class="col-xs-6"><?php echo $comment_text;?></span>
		<div class="col-xs-6 text-right"><a data-toggle="modal" data-target="#commentModal"><i class="fa fa-comment" aria-hidden="true"></i>&nbsp;<?php echo $comment_apply_text1;?></a></div>
	</div>           
</div>
<?php } ?>
</div>
</div>
</div>
<?php } ?>
<?php } else { ?>
<?php if($display_coupons || $display_vouchers || $display_rewards || $display_comments){?>
<div class="col-md-12 paddingright0 paddingleft0">
<div class="panel panel-green1 couponpanel">
        <!--<div class="panel-heading"><i class="fa fa-tags" aria-hidden="true"></i>&nbsp;<?php echo $text_options;?></div>-->
		<div id="xoptions-content">
          <table class="table">
          <tbody>
          	<?php if($display_coupons){?>
          	<tr>
           	<td><b><?php echo $coupon_text;?></b></td>
			<td class="text-right ><span style="cursor: pointer;"><a data-toggle="modal" data-target="#couponModal" style="background-color:#f5d964; padding:10px; border-radius:5px; border:1px solid #d7b215" ><b><?php echo $coupon_apply_text;?></b></a></span></td>
            </tr>
            <?php } ?>
            <?php if($display_vouchers){?>
            <tr>          
           	<td><?php echo $voucher_text;?></td>
			<td class="text-right"><span style="cursor: pointer;"><a data-toggle="modal" data-target="#voucherModal"><?php echo $voucher_apply_text;?></a></span></td>
            </tr>
            <?php } ?>
            <?php if($display_rewards){?>
          	<tr>
           	<td><?php echo $reward_text;?></td>
			<td class="text-right"><span style="cursor: pointer;"><a data-toggle="modal" data-target="#rewardModal"><?php echo $reward_apply_text;?></a></span></td>
            </tr>
            <?php } ?>           
            <?php if($display_comments){ ?>
            <tr>
           	<td><?php echo $comment_text;?></td>
			<td class="text-right"><span style="cursor: pointer;"><a data-toggle="modal" data-target="#commentModal"><?php echo $comment_apply_text1;?></a></span></td>
            </tr>
            <?php }?>
            </tbody>            
            </table>
            </div>
</div>
</div>
<?php } ?>
<?php } ?>
