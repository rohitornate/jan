  <div class="form-group required">
  <label class="control-label" for="input-captcha-<?php echo $view; ?>"><?php echo $entry_captcha; ?></label>
    <input type="text" name="<?php echo $view; ?>_captcha" class="form-control" autocomplete="off" />
    <div id="input-captcha-<?php echo $view; ?>">
    <img  src="index.php?route=xcheckout/xbasic_captcha/captcha&view=<?php echo $view; ?>" alt="" />
    </div>    
  </div>

