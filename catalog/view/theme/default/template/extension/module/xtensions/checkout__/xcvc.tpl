<style type="text/css">
	 .coupon-code {
    color: #434343;
    font-weight: bold;
    font-size: 12px;
    padding: 7px 45px;
    border: 1px dashed #434343;
    margin-left: 20px;
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
	
	<!--<div class="coupon-desc" style="padding: 10px;
    border: 1px solid #d4d5d9;
    margin-bottom: 10px;"> <span class="text"> 20%  off on minimum purchase of Rs. 999</span><span class="coupon-valid"> on first time Signup</span>
              <div class="coupon-info">
                <ul>
                  <li ><b>GET20</b></li>
                </ul>
              </div>
            </div>
			<div class="coupon-desc" style="padding: 10px;
    border: 1px solid #d4d5d9;
    margin-bottom: 10px;"> <span class="text"> Valentine Offer</span><span class="coupon-valid"> Valid till 14st February, 2018</span>
              <div class="coupon-info">
                <ul>
                  <li ><b>LOVE10</b></li>
                </ul>
              </div>
            </div>
	<div class="coupon-desc"  style="padding: 10px;
    border: 1px solid #d4d5d9;
    margin-bottom: 10px;"> <span class="text"> Flat 100 off on minimum purchase of Rs. 999</span><span class="coupon-valid"> Valid till 31st January, 2018</span>
              <div class="coupon-info">
                <ul>
                  <li><b>ORNATE100</b></li>
                </ul>
              </div>
            </div>
	<div class="coupon-desc" style="padding: 10px;
    border: 1px solid #d4d5d9;
    margin-bottom: 10px;"> <span class="text"> Flat 300  off on minimum purchase of Rs. 2000</span><span class="coupon-valid"> Valid till 31st January, 2018</span>
              <div class="coupon-info"> 
                <ul>
                  <li><b>ORNATE300</b></li>
                </ul>
              </div>
            </div>
	<div class="coupon-desc" style="padding: 10px;
    border: 1px solid #d4d5d9;
    margin-bottom: 10px;"> <span class="text"> Flat 500  off on minimum purchase of Rs. 2500</span><span class="coupon-valid"> Valid till 31st January, 2018</span>
              <div class="coupon-info"> 
                <ul>
                  <li><b>ORNATE2500</b></li>
                </ul>
              </div>
            </div>-->
			<ul style="list-style-type: none;padding: 0;">


	<li>
		<input type="radio" class="radioBtnClass" value="GET10" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>	
  <span class="coupon-code">GET10</span>	
	<div class="coupon-desc"> <span class="text"> 10% OFF ON MINIMUM PURCHASE OF RS. 999 ON FIRST TIME SIGNUP</span>
              <!-- <div class="coupon-info">
                <ul>
                  <li onclick="applycoupon('ORNATE100');" style="margin-top:10px; margin-bottom:10px">Use Code <span > <b style="color: red;cursor:pointer;">ORNATE100</b></span></li>
                </ul>
              </div> -->
			  <span class="coupon-valid"></span>
            </div></li>

            <li>
            		<input type="radio" class="radioBtnClass" value="EID20" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">EID20</span>
            	<div class="coupon-desc" > <span class="text"> EID OFFER EVERY THING 20% OFF VALID TILL 30TH JUNE, 2018</span>
              <!-- <div class="coupon-info"> 
                <ul>
                  <li onclick="applycoupon('ORNATE300');" style="margin-top:10px; margin-bottom:10px">Use Code <span > <b style="color: red;cursor:pointer;">ORNATE300</b></span></li>
                </ul>
              </div> -->
			  <span class="coupon-valid"> </span>
            </div></li>

            <li>
            		<input type="radio" class="radioBtnClass" value="ORNATE100" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE100</span>
	<div class="coupon-desc" > <span class="text"> BUY 999 GET 100 OFF VALID TILL 30TH JUNE, 2018</span>
              <!-- <div class="coupon-info"> 
                <ul>
                  <li onclick="applycoupon('ORNATE500');" style="margin-top:10px; margin-bottom:10px">Use Code <span > <b style="color: red;cursor:pointer;">ORNATE500</b></span></li>
                </ul>
              </div> -->
			  <span class="coupon-valid"> </span>
            </div></li>
			<li>
            		<input type="radio" class="radioBtnClass" value="ORNATE300" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE300</span>
	<div class="coupon-desc" > <span class="text"> BUY FOR 2000 GET 300 OFF VALID TILL 30TH JUNE, 2018</span>
              <!-- <div class="coupon-info"> 
                <ul>
                  <li onclick="applycoupon('ORNATE500');" style="margin-top:10px; margin-bottom:10px">Use Code <span > <b style="color: red;cursor:pointer;">ORNATE500</b></span></li>
                </ul>
              </div> -->
			  <span class="coupon-valid"> </span>
            </div></li>
			<li>
            		<input type="radio" class="radioBtnClass" value="ORNATE500" name="radio" style="width: 25px; height:25px;  position: relative; top: 9px">
  <span class="checkmark"></span>
  <span class="coupon-code">ORNATE500</span>
	<div class="coupon-desc" > <span class="text"> BUY FOR 2500 GET 500 OFF VALID TILL 30TH JUNE, 2018</span>
              <!-- <div class="coupon-info"> 
                <ul>
                  <li onclick="applycoupon('ORNATE500');" style="margin-top:10px; margin-bottom:10px">Use Code <span > <b style="color: red;cursor:pointer;">ORNATE500</b></span></li>
                </ul>
              </div> -->
			  <span class="coupon-valid"> </span>
            </div></li>
</ul>
	
   	<button id="couponbtn" class="btn btn-success"><?php echo 'Use Coupon';?></button>
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