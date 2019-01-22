<div id="couponModal" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="modal-title"><?php echo $coupon_apply_text;?></h4>
      </div>
      <div class="modal-body">
  	<div class="form-group">
    <label><?php echo $coupon_text;?></label>
    <input type="text" class="form-control" name="coupon" value="<?php echo $coupon_value;?>" placeholder="<?php echo $coupon_placeholder;?>">
  	</div>
   	<button id="couponbtn" class="btn btn-success"><?php echo $coupon_apply_text;?></button>
   	</div>     
    </div>
  </div>
</div>
<div id="voucherModal" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="modal-title"><?php echo $voucher_apply_text;?></h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
    	<label><?php echo $voucher_text;?></label>
   		<input type="text" class="form-control" name="voucher" value="<?php echo $voucher_value;?>" placeholder="<?php echo $voucher_placeholder;?>">
  		</div>
   		<button id="voucherbtn" class="btn btn-success"><?php echo $voucher_apply_text;?></button>      </div>     
    </div>
  </div>
</div>
<div id="rewardModal" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="modal-title"><?php echo $reward_apply_text;?></h4>
      </div>
      <div class="modal-body">
  	<div class="form-group">
    <label><?php echo $text_use_reward;?></label>
    <input type="text" class="form-control" name="reward" value="<?php echo $reward_value;?>" placeholder="<?php echo $entry_reward;?>">
  	</div>
   	<button id="rewardbtn" class="btn btn-success"><?php echo $reward_apply_text;?></button>
   	</div>     
    </div>
  </div>
</div>
<div id="commentModal" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="modal-title"><?php echo $comment_apply_text;?></h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
    	<label><?php echo 'Add Comments/Add Gift Message';?></label>
   		<textarea rows="8" cols="40" class="form-control" name="comment" placeholder="<?php echo $comment_apply_text;?>.."><?php echo $comment;?></textarea>
   		
  		</div>
   		<button id="commentbtn" class="btn btn-success"><?php echo $comment_apply_text;?></button>
   		</div>     
    </div>
  </div>
</div>