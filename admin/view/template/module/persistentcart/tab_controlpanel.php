<table class="table">
 <tr>
    <td class="col-xs-3"><h5><span class="required">* </span><?php echo $entry_code; ?></h5><span class="help"><?php echo $entry_code_help; ?></span></td>
    <td class="col-xs-9">
        <div class="col-xs-4">
            <select id="Checker" name="<?php echo $moduleName; ?>[Enabled]" class="form-control">
                  <option value="yes" <?php echo (!empty($moduleData['Enabled']) && $moduleData['Enabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                  <option value="no"  <?php echo (empty($moduleData['Enabled']) || $moduleData['Enabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
            </select>
        </div>
    </td>
    </tr>
</table>
<table id="module" class="table">
	<tr>
        <td class="col-xs-3"><h5>Save cart data in:</h5><span class="help">Choose how to save the data in the shopping cart.</span></td>
        <td class="col-xs-9">
        <div class="col-xs-4">
            <select name="<?php echo $moduleName; ?>[CartData]" class="form-control">
                  <option value="cookies" <?php echo (!empty($moduleData['CartData']) && $moduleData['CartData'] == 'cookies') ? 'selected=selected' : '' ?>>Cookies</option>
                  <option value="files"  <?php echo (empty($moduleData['CartData']) || $moduleData['CartData']== 'files') ? 'selected=selected' : '' ?>>Files</option>
                  <option value="cookies_files"  <?php echo (empty($moduleData['CartData']) || $moduleData['CartData']== 'cookies_files') ? 'selected=selected' : '' ?>>Cookies & files</option>
            </select>
        </div>
        </td>
    </tr>
	<tr>
        <td class="col-xs-3"><h5>Cookie & files validity:</h5><span class="help">Choose how long to keep the cookies & files.</span></td>
        <td class="col-xs-9">
        <div class="col-xs-4">
                <div class="input-group">
                  	<input type="text" class="form-control" name="<?php echo $moduleName; ?>[Limit]" value="<?php if(isset($moduleData['Limit'])) { echo $moduleData['Limit']; } else { echo "35"; }?>" />
					<span class="input-group-addon">days</span>
                </div>
            </div>
        </td>
    </tr>
</table>
<script>
 $(function() {
    var $typeSelector = $('#Checker');
    var $toggleArea = $('#module');
	 if ($typeSelector.val() === 'yes') {
            $toggleArea.show(); 
        }
        else {
            $toggleArea.hide(); 
        }
    $typeSelector.change(function(){
        if ($typeSelector.val() === 'yes') {
            $toggleArea.show(300); 
        }
        else {
            $toggleArea.hide(300); 
        }
    });
});
</script>