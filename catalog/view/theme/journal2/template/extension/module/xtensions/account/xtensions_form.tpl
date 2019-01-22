<?php if(!isset($field['custom_field'])){ ?>
<?php if ($field['show']){ ?>
<?php if($key != 'customer_group_id'){ ?>
<div id="regular-field-<?php echo $key ?>" class="form-group regular-field <?php echo $field['required']?'required':''; ?>">
<?php if ($field['tooltip']){ ?>
<label class="col-sm-2 control-label" for="input-<?php echo $key ?>"><span data-toggle="tooltip" title="<?php echo $field['tooltip']; ?>"><?php echo $field['title']; ?></span></label>
<?php } else { ?>
<label class="col-sm-2 control-label" for="input-<?php echo $key ?>"><?php echo $field['title']; ?></label>
<?php } ?>
<div class="col-sm-10">
<?php if(in_array($field['type'], array('text','date','datetime','password','email','tel'))){ ?>
<input type="<?php echo $field['type']; ?>" name="<?php echo $key ?>" value="<?php echo $field['value']; ?>" <?php echo $field['required'] && $field['maximum'] ?'maxlength="'.$field['maximum'].'"':''; ?> placeholder="<?php echo $field['title']; ?>" id="input-<?php echo $key ?>" class="form-control<?php echo $field['required'] && $field['numeric'] ?' '.$field['numeric']:''; ?><?php echo $field['is_mask'] ?' mask':''; ?>" />
<?php } else if($field['type'] == 'select') { ?>
<select name="<?php echo $key ?>" id="input-<?php echo $key ?>" class="form-control">
<?php foreach ($field['select_values'] as $option){ ?>
<option value="<?php echo $option['value_id']; ?>" <?php echo $field['value']==$option['value_id']?'selected="selected"':''; ?>><?php echo $option['display_name']; ?></option>
<?php } ?>
</select>
<?php } ?>
<?php if ($field['error']) { ?>
<div class="text-danger"><?php echo $field['error']; ?></div>
<?php } ?>
</div>
</div>
<?php } else { ?>
<div id="regular-field-<?php echo $key ?>" class="form-group required" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
            <label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
            <div class="col-sm-10">
              <?php foreach ($customer_groups as $customer_group) { ?>
              <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                  <?php echo $customer_group['name']; ?></label>
              </div>
              <?php } else { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                  <?php echo $customer_group['name']; ?></label>
              </div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
<?php } ?>
<?php } else { ?>
<input type="hidden" name="<?php echo $key ?>" value="<?php echo $field['value']; ?>" />
<?php } ?>
<?php } else{ ?>
<?php $custom_field = $field; ?>
		  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>">
            <?php if ($custom_field['tips']){ ?>
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $custom_field['tips']; ?>"><?php echo $custom_field['name']; ?></span></label>
			<?php } else { ?>
			<label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
			<?php } ?>            
            <div class="col-sm-10">          
          	<?php if ($custom_field['type'] == 'select') { ?>
              <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>                       
          	<?php } else if ($custom_field['type'] == 'radio') { ?>
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>         
          	<?php } else if ($custom_field['type'] == 'checkbox') { ?>
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>         
          	<?php } else if ($custom_field['type'] == 'text') { ?>
              <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control <?php if($custom_field['isnumeric']) echo "numeric";?>" />          
          	<?php } else if ($custom_field['type'] == 'textarea') { ?>
              <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>                     
          	<?php } else if ($custom_field['type'] == 'file') { ?>
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>" />                       
          	<?php } else if ($custom_field['type'] == 'date') { ?>
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span>
                </div>       
          	<?php } else if ($custom_field['type'] == 'time') { ?>
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span>
                </div>     
          	<?php } else if ($custom_field['type'] == 'datetime') { ?>
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span>
                </div>      
          	<?php } ?>
          	<?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
             <?php } ?>
            </div>
          </div>                 
<?php } ?>