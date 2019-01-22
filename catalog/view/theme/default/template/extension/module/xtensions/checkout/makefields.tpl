<?php if(!isset($field['custom_field'])){ ?>
<?php if ($field['show'] && !in_array($field['type'], array('checkbox'))) { ?>
<?php if($key != 'customer_group_id'){ ?>
<div class="group regular-field<?php echo $field['hide_guest']?' hide_guest':''; ?><?php echo ($field['type'] == 'select')?' filled':''; ?>" id="regular-field-<?php echo $key ?>">
<?php if(in_array($field['type'], array('text','date','datetime','password','email','tel'))){ ?>
<?php if(in_array($field['type'],array('password','email')) && false) { ?>
<?php /* this was supposed to be a fix to disable autofill in chrome and other browsers that ignore automplete */ ?>
<input name="email" style="display: none;" readonly disabled type="text" />
<input name="password" style="display: none;" readonly disabled type="password" />
<?php } ?>
<input autocomplete="off" type="<?php echo $field['type']; ?>" id="input-<?php echo $key ?>" name="<?php echo $key ?>" value="<?php echo $field['value']; ?>"  <?php echo $field['maximum'] ?'maxlength="'.$field['maximum'].'"':''; ?> class="inputMaterial<?php echo $field['dependency'] ?' dependent':''; ?><?php echo $field['numeric'] ?' '.$field['numeric']:''; ?><?php echo $field['is_mask'] ?' mask':''; ?>" <?php if ($field['required']) echo "required" ; ?> />
<label><?php echo $field['title']; ?>
<span class="<?php echo $field['required']?'required':''; ?>">
<?php if($field['tooltip']) { ?>
<span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $field['tooltip']; ?>" class="is_floating_tooltip"></span>
<?php } ?>
</span>
</label>
<?php echo false && $field['required'] ?'<required data-placement="left" data-toggle="tooltip" title="Required" class="is_required"></required>':''; ?>
<?php echo false && $field['tooltip']?'<tooltip data-placement="left" data-toggle="tooltip" title="'.$field['tooltip'].'" class="is_tooltip"></tooltip>':''; ?>
<?php } else if($field['type'] == 'select') { ?>
<select name="<?php echo $key ?>" id="input-<?php echo $key ?>" class="inputMaterial">
<?php foreach ($field['select_values'] as $option){ ?>
<option value="<?php echo $option['value_id']; ?>" <?php echo $field['value']==$option['value_id']?'selected="selected"':''; ?>><?php echo $option['display_name']; ?></option>
<?php } ?>
</select>
<label><?php echo $field['title']; ?><?php echo $field['required']?'<span class="required"></required>':''; ?></label>
<labelselect></labelselect>
<?php } ?>
</div>
<?php } else { ?>
<?php if(isset($customer_groups,$entry_customer_group,$customer_group_id)){ ?>
<div id="regular-field-<?php echo $key ?>" class="form-group required" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
            <label class="control-label" style="padding-left: 0px;"><?php echo $entry_customer_group; ?></label>
            <div>
              <?php foreach ($customer_groups as $customer_group) { ?>
              <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
              <div>
                <label class="pointer">
                  <input type="radio" class="input-radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                  <?php echo $customer_group['name']; ?></label>
              </div>
              <?php } else { ?>
              <div>
                <label class="pointer">
                  <input type="radio" class="input-radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                  <?php echo $customer_group['name']; ?></label>
              </div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
<?php } ?>          
<?php } ?>
<?php } else { ?>
<input type="hidden" name="<?php echo $key ?>" value="<?php echo $field['value']; ?>" />
<?php } ?>
<?php } else{ ?>
<?php $custom_field = $field; ?>
    <?php if ($custom_field['type'] == 'select') { ?>    
    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="group custom-field filled">      
        <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom_field<?php echo $custom_field['custom_field_id']; ?>" class="inputMaterial">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
		  <?php if (isset($value_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $value_custom_field[$custom_field['custom_field_id']]) { ?>
          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
          <?php } ?>          
          <?php } ?>
        </select>        
        <label for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>">
        <?php echo $custom_field['name']; ?>
        <span class="fieldlabel <?php echo ($custom_field['required'] ? 'required': ''); ?>">
		<?php if($custom_field['tips']) { ?>
		<span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $custom_field['tips']; ?>" class="is_floating_tooltip"></span>
		<?php } ?>
		</span>
        </label>
        <labelselect></labelselect>
    </div>    
    <?php } else if ($custom_field['type'] == 'radio') { ?>    
    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field is<?php echo $custom_field['type']; ?>">
      	<label class="control-label"><?php echo $custom_field['name']; ?>
      	<span class="fieldlabel <?php echo ($custom_field['required'] ? 'required': ''); ?>">
      	<?php if($custom_field['tips']) { ?>
		<span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $field['tips']; ?>" class="is_floating_tooltip"></span>
		<?php } ?>
		</span>
		</label>
        <div id="input-custom_field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="">
            <?php if (isset($value_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $value_custom_field[$custom_field['custom_field_id']]) { ?>
            <label class="pointer">
              <input class="input-radio" type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } else { ?>
            <label class="pointer">
              <input class="input-radio" type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
      </div>    
    <?php } else if ($custom_field['type'] == 'checkbox') { ?>
    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field is<?php echo $custom_field['type']; ?>">
      	<label class="control-label"><?php echo $custom_field['name']; ?>
      	<span class="fieldlabel <?php echo ($custom_field['required'] ? 'required': ''); ?>">
      	<?php if($custom_field['tips']) { ?>
		<span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $field['tips']; ?>" class="is_floating_tooltip"></span>
		<?php } ?>
		</span>
		</label>
        <div id="input-custom_field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="checkbox is_checkbox">
            <?php if (isset($value_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $value_custom_field[$custom_field['custom_field_id']])) { ?>
            <label>
              <input class="input-checkbox" type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
              <?php echo $custom_field_value['name']; ?>
              </label>
            <?php } else { ?>
            <label>
              <input class="input-checkbox" type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?>
              </label>
            <?php } ?> 
          </div>
          <?php } ?>
        </div>
      </div>
    <?php } else if ($custom_field['type'] == 'text') { ?>    
    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="group custom-field">      
        <input  type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($value_custom_field[$custom_field['custom_field_id']]) ? $value_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" <?php echo $custom_field['maximum'] ?'maxlength="'.$custom_field['maximum'].'"':''; ?> id="input-custom_field<?php echo $custom_field['custom_field_id']; ?>" class="inputMaterial <?php if($custom_field['isnumeric']) echo "numeric";?>" />
        <label for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>">
        <?php echo $custom_field['name']; ?>
        <span class="fieldlabel <?php echo $custom_field['required']?' required':''; ?>">
		<?php if($custom_field['tips']) { ?>
		<span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $custom_field['tips']; ?>" class="is_floating_tooltip"></span>
		<?php } ?>
		</span>
        </label>        
      </div>    
    <?php } else if ($custom_field['type'] == 'textarea') { ?>    
    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="group custom-field">      
        <textarea  name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" id="input-custom_field<?php echo $custom_field['custom_field_id']; ?>" class="inputMaterial"><?php echo (isset($value_custom_field[$custom_field['custom_field_id']]) ? $value_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
        <label for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>">
        <?php echo $custom_field['name']; ?>
        <span class="fieldlabel <?php echo $custom_field['required']?' required':''; ?>">
		<?php if($custom_field['tips']) { ?>
		<span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $custom_field['tips']; ?>" class="is_floating_tooltip"></span>
		<?php } ?>
		</span>
        </label>
      </div>    
    <?php } else if ($custom_field['type'] == 'file') { ?>    
    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field is<?php echo $custom_field['type']; ?>">
      	<label class="control-label"><?php echo $custom_field['name']; ?>
      	<span class="fieldlabel <?php echo ($custom_field['required'] ? 'required': ''); ?>">
      	<?php if($custom_field['tips']) { ?>
		<span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $field['tips']; ?>" class="is_floating_tooltip"></span>
		<?php } ?>
		</span>
		</label>
        <button  type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($value_custom_field[$custom_field['custom_field_id']]) ? $value_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"  id="input-custom_field<?php echo $custom_field['custom_field_id']; ?>" />
      </div>    
    <?php } else if ($custom_field['type'] == 'date') { ?>    
    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="group custom-field">      
        <div class="input-group date">
          <input  type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($value_custom_field[$custom_field['custom_field_id']]) ? $value_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"  data-date-format="YYYY-MM-DD" id="input-custom_field<?php echo $custom_field['custom_field_id']; ?>" class="inputMaterial" />
          <label for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>">
	        <?php echo $custom_field['name']; ?>
	        <span class="fieldlabel <?php echo ($custom_field['required'] ? 'required': ''); ?>">
			<?php if($custom_field['tips']) { ?>
			<span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $custom_field['tips']; ?>" class="is_floating_tooltip"></span>
			<?php } ?>
			</span>
	        </label>
          <span class="input-group-btn">
          <button onclick="$(this).closest('.group').addClass('filled');" type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>    
    <?php } else if ($custom_field['type'] == 'time') { ?>    
    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="group custom-field">      
        <div class="input-group time">
          <input  type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($value_custom_field[$custom_field['custom_field_id']]) ? $value_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"  data-date-format="HH:mm" id="input-custom_field<?php echo $custom_field['custom_field_id']; ?>" class="inputMaterial" />
          <label for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>">
	        <?php echo $custom_field['name']; ?>
	        <span class="fieldlabel <?php echo ($custom_field['required'] ? 'required': ''); ?>">
			<?php if($custom_field['tips']) { ?>
			<span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $custom_field['tips']; ?>" class="is_floating_tooltip"></span>
			<?php } ?>
			</span>
	        </label>
          <span class="input-group-btn">
          <button onclick="$(this).closest('.group').addClass('filled');" type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>    
    <?php } else if ($custom_field['type'] == 'datetime') { ?>    
    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="group custom-field">      
        <div class="input-group datetime">
          <input  type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($value_custom_field[$custom_field['custom_field_id']]) ? $value_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"  data-date-format="YYYY-MM-DD HH:mm" id="input-custom_field<?php echo $custom_field['custom_field_id']; ?>" class="inputMaterial" />
          <label for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php echo $custom_field['name']; ?>
          <span class="fieldlabel <?php echo ($custom_field['required'] ? 'required': ''); ?>">
		  <?php if($custom_field['tips']) { ?>
		  <span data-placement="right" data-toggle="tooltip" data-container="body" title="<?php echo $custom_field['tips']; ?>" class="is_floating_tooltip"></span>
		  <?php } ?>
		</span>
        </label>
          <span class="input-group-btn">
          <button onclick="$(this).closest('.group').addClass('filled');" type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    <?php } ?>
    <div class="clearfix"></div>
    <?php } ?>