<style type="text/css">
	 .coupon-code {
    color: #434343;
    font-weight: bold;
    font-size: 12px;
    padding: 7px 45px;
    border: 1px dashed #434343;
    margin-left: 20px;
	background-color: #f0f6fc;
}



.coupon-desc
	{
		font-size: 14px;
    padding: 12px 45px;
    border-bottom: 1px solid #eeeeef;
	}



</style>

<?php if($display_coupons){ ?>
<div id="couponModal" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <form role="form" id="form_add_coupon" action="#" method="post" enctype="multipart/form-data">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="modal-title"><?php echo $coupon_apply_text;?></h4>
      </div>
      <div class="modal-body">
  	<div class="form-group">
    <label><?php echo $coupon_text;?></label>
    <input type="text" class="form-control coupon1" name="coupon" value="<?php echo $coupon_value;?>" placeholder="<?php echo $coupon_placeholder;?>">
  	</div>
	
	
			<ul style="list-style-type: none;padding: 0;">
			
			

			
	
			
			 
			
			 
			 
			
			
			

            <li>
            		<input type="radio" class="radioBtnClass" value="ORNATE100" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE100</span>
	<div class="coupon-desc" > <span class="text"> BUY 999 GET 100 OFF VALID TILL 31TH December, 2018</span>
              
			  <span class="coupon-valid"> </span>
            </div></li>
			<li>
            		<input type="radio" class="radioBtnClass" value="ORNATE200" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE200</span>
	<div class="coupon-desc" > <span class="text"> BUY FOR 1999 GET 200 OFF VALID TILL 31TH December, 2018</span>
             
			  <span class="coupon-valid"> </span>
            </div></li>
			<li>
            		<input type="radio" class="radioBtnClass" value="ORNATE300" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE300</span>
	<div class="coupon-desc" > <span class="text"> BUY FOR 2499 GET 300 OFF VALID TILL 31TH December, 2018</span>
             
			  <span class="coupon-valid"> </span>
            </div></li>
			
			<li>
            		<input type="radio" class="radioBtnClass" value="ORNATE5000" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE5000</span>
	<div class="coupon-desc" > <span class="text"> BUY FOR 5000 GET 750 OFF VALID TILL 31TH December, 2018</span>
             
			  <span class="coupon-valid"> </span>
            </div></li>
</ul>
	
   	<div class="modal-footer">
        <button type="button" class="btn btn-secondary" style="background-color:#670067; border-radius:5px; color: #fff;" data-dismiss="modal">Close</button>
        <button type="button" id="couponbtn" class="btn btn-primary button-coupon1" style="background-color:#670067; border: none;  border-radius:5px;">Use Coupon</button>
      </div>
   	</div>  
   	</form>   
    </div>
  </div>
</div>
<?php } ?>
<?php if($display_vouchers){ ?>
<div id="voucherModal" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <form role="form" id="form_add_voucher" action="#" method="post" enctype="multipart/form-data">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="modal-title"><?php echo $voucher_apply_text;?></h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
    	<label><?php echo $voucher_text;?></label>
   		<input type="text" class="form-control" name="voucher" value="<?php echo $voucher_value;?>" placeholder="<?php echo $voucher_placeholder;?>">
  		</div>
   		<button id="voucherbtn" class="btn btn-success"><?php echo $voucher_apply_text;?></button>      
   		</div>  
   		</form>   
    </div>
  </div>
</div>
<?php } ?>
<?php if($display_rewards){ ?>
<div id="rewardModal" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <form  role="form" id="form_add_reward" action="#" method="post" enctype="multipart/form-data">
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
   	</form> 
    </div>
  </div>
</div>
<?php } ?>
<?php if($display_comments){ ?>
<div id="commentModal" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <form role="form" id="form_add_comment" action="#" method="post" enctype="multipart/form-data">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="modal-title"><?php echo $comment_apply_text;?></h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
    	<label><?php echo $comment_text;?></label>
   		<textarea rows="8" cols="40" class="form-control" name="comment" placeholder="<?php echo $comment_apply_text;?>.."><?php echo $comment;?></textarea>   		
  		</div>
   		<button id="commentbtn" class="btn btn-success"><?php echo $comment_apply_text;?></button>
   		</div>     
   		</form>
    </div>
  </div>
</div>
<?php } ?>

<script type="text/javascript">
    $(document).ready(function(){
   $('input[name=radio]').change(function(){
           $('.coupon1').val($("input[name='radio']:checked").val());

   });
    });
</script>