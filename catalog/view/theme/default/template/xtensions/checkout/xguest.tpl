<div id="addressModalPayment" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div id="modalLoader" class="loader"></div>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><?php echo $text_address_new;?> </h4>
      </div>
      <div class="modal-body">
        <div id="addressfieldsPayment" class="row">
          <form class="form-horizontal" role="form">
            <fieldset id="gaddfields" class="xaddress">
            <?php if($modData['f_name_show_checkout']){ ?>              
              <xdiv sort="a<?php echo $modData['f_name_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_firstname; ?>
                <?php if($modData['f_name_req_checkout']) echo '<span class="xrequired">*</span>';  ?>
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_firstname; ?>" <?php if($title_firstname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_firstname."'";?> name="firstname" value="<?php echo $firstname; ?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php }else{?>
              <input type="hidden" name="firstname" value="<?php echo $firstname; ?>"  />
              <?php } ?>
              <?php if($modData['l_name_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['l_name_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_lastname; ?>
                <?php if($modData['l_name_req_checkout']) echo '<span class="xrequired">*</span>';  ?>
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_lastname; ?>" <?php if($title_lastname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_lastname."'";?> name="lastname" value="<?php echo $lastname; ?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php }else{?>
              <input type="hidden" name="lastname" value="<?php echo $lastname; ?>"  /> 
              <?php } ?>
              <?php if($modData['company_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['company_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_company; ?></label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_company; ?>" <?php if($title_company) echo "data-toggle='tooltip' data-placement='top' title ='".$title_company."'";?> name="company" value="<?php echo $company; ?>"  class="form-control <?php echo ($modData['company_numeric']?"numeric":""); ?>" />
                </div>
              </div>
              </xdiv>
              <?php }else{?>
              <input type="hidden" name="company" value=""  />
              <?php } ?>
              <?php if($modData['address1_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['address1_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_address_1; ?>
                <?php if($modData['address1_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_address_1; ?>" <?php if($title_address_1) echo "data-toggle='tooltip' data-placement='top' title ='".$title_address_1."'";?> name="address_1" value="<?php echo $address_1;?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
          <input type="hidden" name="address_1" value=""  />
          <?php } ?>
          <?php if($modData['address2_show_checkout']){ ?>
               <xdiv sort="a<?php echo $modData['address2_sort']; ?>">
               <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_address_2; ?></label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_address_2; ?>" <?php if($title_address_2) echo "data-toggle='tooltip' data-placement='top' title ='".$title_address_2."'";?> name="address_2" value="<?php echo $address_2;?>" class="form-control" />
                </div>
              </div>
              </xdiv>
               <?php } else { ?>
          <input type="hidden" name="address_2" value=""  />
          <?php } ?>
              <?php if($modData['city_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['city_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_city; ?>
                <?php if($modData['city_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_city; ?>" <?php if($title_city) echo "data-toggle='tooltip' data-placement='top' title ='".$title_city."'";?> name="city" value="<?php echo $city;?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
          <input type="hidden" name="city" value=""  />
              <?php } ?>
              <?php if($modData['pin_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['pin_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_postcode; ?>
                <?php if($modData['pin_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_postcode; ?>" <?php if($title_postcode) echo "data-toggle='tooltip' data-placement='top' title ='".$title_postcode."'";?> name="postcode" value="<?php echo $postcode;?>" class="form-control <?php echo ($modData['pin_numeric']?"numeric":""); ?> <?php echo ($modData['pin_masking']?"mask postcode":""); ?>" />
                </div>
              </div>
              </xdiv>
               <?php } else { ?>
           <input type="hidden" name="postcode" value=""  />
           <?php } ?>
           <?php if($modData['country_show_checkout']){ ?>               
              <xdiv sort="a<?php echo $modData['country_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_country; ?>
                <?php if($modData['country_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <select name="country_id" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
               <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
               <?php } else { ?>
               <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
                  </select>
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
              <input type="hidden" name="country_id" value="<?php echo $country_id; ?>"  />
              <?php } ?>
              <?php if($modData['state_show_checkout']){ ?> 
        <xdiv sort="a<?php echo $modData['state_sort']; ?>">
        <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_zone; ?>
                <?php if($modData['state_req_checkout']) echo '<span class="xrequired">*</span>';  ?>
                </label>
                <div class="col-sm-9">
                  <select name="zone_id" class="form-control"></select>
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
          <input type="hidden" name="zone_id" value="<?php echo $zone_id; ?>"  />
              <?php } ?>
              <?php foreach ($custom_fields as $custom_field) { ?>
        <?php if ($custom_field['location'] == 'address') { ?>
    <?php if ($custom_field['type'] == 'select') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field">
      <label class="col-sm-3 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <select <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
          <?php } ?>          
          <?php } ?>
        </select>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'radio') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="radio">
          <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } else { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } ?>            
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'checkbox') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="checkbox">
            <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $guest_custom_field[$custom_field['custom_field_id']])) { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } else { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } ?>            
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'text') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control <?php if($custom_field['isnumeric']) echo "numeric";?>" />
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'textarea') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <textarea <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'file') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <button <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'date') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div class="input-group date">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'time') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div class="input-group time">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'datetime') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div class="input-group datetime">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php } ?>
    <?php } ?>  
            </fieldset>
          </form>
        </div>
        <!-- /.col-lg-12 -->
      </div>
      <div class="modal-footer">
        <div class="progress" id="progress">
                    <div class="progress-bar progress-bar-success" role="progressbar" id="gpaddAdress" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                      <span><?php echo $text_address_new;?></span>
                    </div>
                  </div>
      </div>
    </div>
  </div>
</div>
<div id="addressModalShipping" class="modal fixed"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div id="modalLoaderS" class="loader"></div>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><?php echo $text_address_new;?> </h4>
      </div>
      <div class="modal-body">
        <div id="addressfieldsShipping" class="row">
          <form class="form-horizontal" role="form">
            <fieldset id="gsaddfields" class="xaddress1">
            <?php if($modData['f_name_show_checkout']){ ?>              
              <xdiv sort="a<?php echo $modData['f_name_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_firstname; ?>
                <?php if($modData['f_name_req_checkout']) echo '<span class="xrequired">*</span>';  ?>
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_firstname; ?>" <?php if($title_firstname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_firstname."'";?> name="sfirstname" value="<?php echo $sfirstname; ?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php }else{?>
              <input type="hidden" name="sfirstname" value="<?php echo $sfirstname; ?>"  />
              <?php } ?>
              <?php if($modData['l_name_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['l_name_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_lastname; ?>
                <?php if($modData['l_name_req_checkout']) echo '<span class="xrequired">*</span>';  ?>
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_lastname; ?>" <?php if($title_lastname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_lastname."'";?> name="slastname" value="<?php echo $slastname; ?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php }else{?>
              <input type="hidden" name="slastname" value="<?php echo $slastname; ?>"  />
              <?php } ?>
              <?php if($modData['company_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['company_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_company; ?></label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_company; ?>" <?php if($title_company) echo "data-toggle='tooltip' data-placement='top' title ='".$title_company."'";?> name="scompany" value="<?php echo $scompany; ?>"  class="form-control <?php echo ($modData['company_numeric']?"numeric":""); ?>" />
                </div>
              </div>
              </xdiv>
              <?php }else{?>
              <input type="hidden" name="scompany" value=""  />
              <?php } ?>              
              <?php if($modData['address1_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['address1_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_address_1; ?>
                <?php if($modData['address1_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_address_1; ?>" <?php if($title_address_1) echo "data-toggle='tooltip' data-placement='top' title ='".$title_address_1."'";?> name="saddress_1" value="<?php echo $saddress_1;?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
          <input type="hidden" name="saddress_1" value=""  />
          <?php } ?>
          <?php if($modData['address2_show_checkout']){ ?>
               <xdiv sort="a<?php echo $modData['address2_sort']; ?>">
               <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_address_2; ?></label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_address_2; ?>" <?php if($title_address_2) echo "data-toggle='tooltip' data-placement='top' title ='".$title_address_2."'";?> name="saddress_2" value="<?php echo $saddress_2;?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
          <input type="hidden" name="saddress_2" value=""  />
          <?php } ?>
              <?php if($modData['city_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['city_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_city; ?>
                <?php if($modData['city_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_city; ?>" <?php if($title_city) echo "data-toggle='tooltip' data-placement='top' title ='".$title_city."'";?> name="scity" value="<?php echo $scity;?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
          <input type="hidden" name="scity" value=""  />
              <?php } ?>
              <?php if($modData['pin_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['pin_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_postcode; ?>
                <?php if($modData['pin_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_postcode; ?>" <?php if($title_postcode) echo "data-toggle='tooltip' data-placement='top' title ='".$title_postcode."'";?> name="spostcode" value="<?php echo $spostcode;?>" class="form-control <?php echo ($modData['pin_numeric']?"numeric":""); ?> <?php echo ($modData['pin_masking']?"mask postcode":""); ?>" />
                </div>
              </div>
              </xdiv>
               <?php } else { ?>
           <input type="hidden" name="spostcode" value=""  />
           <?php } ?>
           <?php if($modData['country_show_checkout']){ ?>               
              <xdiv sort="a<?php echo $modData['country_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_country; ?>
                <?php if($modData['country_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <select name="scountry_id" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $scountry_id) { ?>
               <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
               <?php } else { ?>
               <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
                  </select>
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
              <input type="hidden" name="scountry_id" value="<?php echo $country_id; ?>"  />
              <?php } ?>
              <?php if($modData['state_show_checkout']){ ?> 
        <xdiv sort="a<?php echo $modData['state_sort']; ?>">
        <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_zone; ?>
                <?php if($modData['state_req_checkout']) echo '<span class="xrequired">*</span>';  ?>
                </label>
                <div class="col-sm-9">
                  <select name="szone_id" class="form-control"></select>
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
          <input type="hidden" name="szone_id" value="<?php echo $zone_id; ?>"  />
              <?php } ?>
              <?php foreach ($custom_fields as $custom_field) { ?>
        <?php if ($custom_field['location'] == 'address') { ?>
    <?php if ($custom_field['type'] == 'select') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field">
      <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <select <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <?php if (isset($guest_shipping_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_shipping_custom_field[$custom_field['custom_field_id']]) { ?>
          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
          <?php } ?>          
          <?php } ?>
        </select>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'radio') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="radio">
          <?php if (isset($guest_shipping_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_shipping_custom_field[$custom_field['custom_field_id']]) { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="radio" name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } else { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="radio" name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } ?>            
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'checkbox') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="checkbox">
            <?php if (isset($guest_shipping_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $guest_shipping_custom_field[$custom_field['custom_field_id']])) { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="checkbox" name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } else { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="checkbox" name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } ?>            
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'text') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_shipping_custom_field[$custom_field['custom_field_id']]) ? $guest_shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control <?php if($custom_field['isnumeric']) echo "numeric";?>" />
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'textarea') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <textarea <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($guest_shipping_custom_field[$custom_field['custom_field_id']]) ? $guest_shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'file') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <button <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <input type="hidden" name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_shipping_custom_field[$custom_field['custom_field_id']]) ? $guest_shipping_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'date') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div class="input-group date">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_shipping_custom_field[$custom_field['custom_field_id']]) ? $guest_shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'time') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div class="input-group time">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_shipping_custom_field[$custom_field['custom_field_id']]) ? $guest_shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'datetime') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div class="input-group datetime">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="scustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_shipping_custom_field[$custom_field['custom_field_id']]) ? $guest_shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php } ?>
    <?php } ?> 
            </fieldset>
          </form>
        </div>
        <!-- /.col-lg-12 -->
      </div>
      <div class="modal-footer">
        <div class="progress" id="progress">
                    <div class="progress-bar progress-bar-success" role="progressbar" id="gsaddAdress" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                      <span><?php echo $text_address_new;?></span>
                    </div>
                  </div>
      </div>
    </div>
  </div>
</div>
<div id="guestPage" class="container">
<div class="row equal">
<div class="col-md-9">
<?php if($shipping_address1 && $shipping_required && !$xshipping_method) { ?>
              <div class="alert alert-danger noshipping"><?php echo $shipping_error; ?></div>
             <?php } ?>
<?php if ($shipping_required) { ?>
<?php if($modData['same_shipping']){ ?>
  <input type="hidden" name="xshipping_address_check" value="1"  />
  <div style="margin-bottom: 20px;"></div>
<?php }else{ ?>
<div class="alert info-back text-center checkbox" role="alert">  
  <label for="shipping_check"><input type="checkbox" name="xshipping_address_check" value="1" id="shipping_check" <?php if($shipping_same) echo 'checked="checked"'; ?>/><?php echo $entry_shipping; ?></label>
</div> 
<?php }?>
<?php }else{?>
<div style="margin-bottom: 20px;"></div>
<?php }?>
<div class="row">
<div class="col-sm-6 col-md-6">
<?php if($payment_address){ ?>
<div class="panel panel-default">
<div id="ptext" class="panel-heading text-center selected">
<?php echo ($shipping_required && ($shipping_same || $modData['same_shipping'])? $text_psaddress:$text_paddress); ?>
</div>                                      
<div class="panel-body highlight">
<p class="text-center text-justified"><?php echo $payment_address; ?></p>
</div>
<div class="panel-footer text-right highlight">
 <a class="pointer" data-toggle="modal" data-target="#addressModalPayment"><i class="fa fa-edit"></i><?php echo $text_edit_address; ?></a>                                      
</div>
</div>
<?php } else{?>
<div class="panel panel-default">
<div id="ptext" class="panel-heading text-center ">
<?php echo ($shipping_required && ($shipping_same || $modData['same_shipping'])? $text_psaddress:$text_paddress); ?>
</div>                                      
<div class="panel-body alert-info pointer"  data-toggle="modal" data-target="#addressModalPayment">
<div class="center">                  
<h4 class="text-center"><a><span style="line-height: 170px;" class="glyphicon glyphicon-plus"></span><?php echo $text_add_paddress; ?></a></h4>
</div>
</div>
</div>
<?php } ?>
</div>
<?php if($shipping_required && !$modData['same_shipping']){?>
<div style="<?php if($shipping_same) echo 'display:none;'; ?>" class="col-sm-6 col-md-6 xshipping">
<?php if($shipping_address1){?>
<div class="panel panel-default">
<div id="ptext" class="panel-heading text-center selected">
<?php echo $text_saddress; ?>
</div>                                      
<div class="panel-body highlight">
<p class="text-center text-justified"><?php echo $shipping_address1; ?></p>
</div>
<div class="panel-footer text-right highlight">
 <a class="pointer" data-toggle="modal" data-target="#addressModalShipping"><i class="fa fa-edit"></i><?php echo $text_edit_address; ?></a>                                       
</div>
</div>
<?php } else{?>
<div class="panel panel-default">
<div id="ptext" class="panel-heading text-center">
<?php echo $text_saddress; ?>
</div>                                      
<div class="panel-body alert-info pointer" data-toggle="modal" data-target="#addressModalShipping">
<div class="center">                  
<h4 class="text-center"><a><span style="line-height: 170px;" class="glyphicon glyphicon-plus"></span><?php echo $text_add_saddress; ?></a></h4>
</div>
</div>
</div>
<?php } ?>
</div>
<?php } ?>
</div>
</div><!--col-md-9 ends-->
<div  class="col-md-3 lborder">
<div id="sLoader" class="loader"></div>      
<div id="shipping_method"><?php echo $xshipping_method; ?></div>
<?php if ($payment_next) { ?>
 <div id="addressRight" <?php echo ($shipping_address1 && $shipping_required && !$xshipping_method)?'style="display:none;"':''; ?>>
  <?php if($text_agree){ ?>
   <div id="agreeText" class="text-center" style="font-size: 20px; margin-bottom: 20px;">
  <?php echo $text_agree;?>&nbsp;<input type="checkbox" name="agree" value="1" <?php echo ($agree?'checked="checked"':'');?>>
   </div>
  <?php }?>
  <div class="progress" id="progress-continue-disabled" <?php echo ($text_agree && !$agree?'style="display: block"':'style="display: none"');?> >
                    <div data-trigger="focus" tabindex="0" data-placement="bottom" data-toggle="popover" title="<?php echo $info_title;?>" data-content="<?php echo $agree_content;?>" class="progress-bar" role="progressbar" id="button-payment-disabled" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="background-color:#ccc;width: 100%">
                      <span><?php echo $text_payment_continue;?></span>
                    </div>
                  </div>
        <div class="progress" id="progress-continue" <?php echo ($text_agree && !$agree?'style="display: none"':'');?> >
                    <div class="progress-bar progress-bar-success" role="progressbar" id="button-payment" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                      <span><?php echo $text_payment_continue;?></span>
                    </div>
                  </div>
 </div>
<?php } ?>
<div id="totals"><?php echo $xtotals; ?></div>
<div id="options"><?php echo $xoptions;?></div>      
<div class="clearfix"></div>
</div>
</div><!--row ends-->
</div>
<script type="text/javascript" src="catalog/view/xtensions/stylesheet/bs/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript" src="catalog/view/xtensions/stylesheet/bs/js/xcustom.js"></script>  
<script type="text/javascript"><!--
$(function () {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();
  }); 
$(document).on("click", 'input[type="checkbox"][name="xshipping_address_check"]', function(event) {
    if(this.checked) {
      $('.xshipping').css('display','none');
      $('#ptext').html('<?php echo $text_psaddress;?>');
      <?php if($payment_address){?>
      showLoader();  
      $.ajax({
            url: 'index.php?route=xcheckout/xguest/sameAddress',
            type: 'post',
            data: $('#guestPage input[type=\'checkbox\']:checked'),
            dataType: 'json',
            beforeSend: function() {                    
               
            },
            complete: function() {                  
                                
            },
            success: function(json) {
              
                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {                     
                  
          }else{
            $('#address').html(json['xguest']);
                    $('#address').show();
                    hideLoader();
            }                    
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
        <?php } ?>
    }else{
      $('.xshipping').css('display','block');
      $('#ptext').html('<?php echo $text_paddress;?>');
    }
});
$('#addressfieldsPayment <?php (($modData['country_show_checkout'])?'select':'input');?>[name=\'country_id\']').bind('change', function() {
  if (this.value == '') return;
  $.ajax({
    url: 'index.php?route=xcheckout/checkout/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('#addressModalPayment select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },      
    success: function(json) {
      if (json['postcode_required'] == '1') {
        $('#payment-postcode-required').show();
      } else {
        $('#payment-postcode-required').hide();
      }
      
      html = '<option value=""><?php echo $text_select; ?></option>';
      
      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
              html += '<option value="' + json['zone'][i]['zone_id'] + '"';
            
          if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                html += ' selected="selected"';
            }
  
            html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }
      
      $('#addressModalPayment select[name=\'zone_id\']').html(html);      
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
$('#addressfieldsPayment <?php (($modData['country_show_checkout'])?'select':'input');?>[name=\'country_id\']').trigger('change');
$('#addressfieldsShipping <?php (($modData['country_show_checkout'])?'select':'input');?>[name=\'scountry_id\']').bind('change', function() {
  if (this.value == '') return;
  $.ajax({
    url: 'index.php?route=xcheckout/checkout/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('#addressModalShipping select[name=\'scountry_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },      
    success: function(json) {
      if (json['postcode_required'] == '1') {
        $('#spayment-postcode-required').show();
      } else {
        $('#spayment-postcode-required').hide();
      }
      
      html = '<option value=""><?php echo $text_select; ?></option>';
      
      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
              html += '<option value="' + json['zone'][i]['zone_id'] + '"';
            
          if (json['zone'][i]['zone_id'] == '<?php echo $szone_id; ?>') {
                html += ' selected="selected"';
            }
  
            html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }
      
      $('#addressModalShipping select[name=\'szone_id\']').html(html);      
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
$('#addressfieldsShipping <?php (($modData['country_show_checkout'])?'select':'input');?>[name=\'scountry_id\']').trigger('change');
$('#step1 a').click(function(event){
    event.preventDefault();               
  click1();
});
$("#click1").click(function() {
  click1();
});
function click1(){
  $('#step3').removeClass('active');
  $('#step3').addClass('disabled');
  $('#step2').removeClass('active');
  $('#step2').removeClass('complete');
  $('#step2').addClass('disabled');
  $('#click2').removeClass('clickable');
  $('#undo2').hide();
  $('#step1').removeClass('complete');
    $('#step1').addClass('active');
    $('#click1').removeClass('clickable');          
  $('#step1 a').removeAttr('href');
  $('#undo1').hide(); 
  $('#payment').hide();
  $('#payment').html('');
  $('#address').hide();
  $('#address').html('');
  $('#xlogin').show();
};
$('input[type="checkbox"][name="agree"]').change(function() {
  if(this.checked){
      $('#progress-continue').css('display','block');
      $('#progress-continue-disabled').css('display','none');
    }else{
      $('#progress-continue').css('display','none');
      $('#progress-continue-disabled').css('display','block');        
    }
});

$(document).on("click", "#button-payment", function(event) {
  $.ajax({
        url: 'index.php?route=xcheckout/xpayment_method',
        dataType: 'html',
        beforeSend: function() {                    
          $('#button-payment').addClass('progress-bar-striped active'); 
          showLoader();       
        },
        complete: function() {
          
        },
        success: function(html) {
          $('#xlogin').hide();
          $('#address').hide();
          $('html, body').animate({
                scrollTop: $('body').offset().top
            }, 1);
            $('#payment').html(html);
            $('#payment').show();            
            $('#step2').removeClass('active');
      $('#step2').addClass('complete');
      $('#step2 a').attr('href','#address');
      $('#click2').addClass('clickable');
      $('#undo2').show(); 
      $('#step3').removeClass('disabled');
      $('#step3').addClass('active');
      $('#button-payment').removeClass('progress-bar-striped active');
      hideLoader();               
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
</script>
<script type="text/javascript"><!--
$('#addressfieldsPayment button[id^=\'button-payment-custom-field\']').on('click', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);
      
      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $(node).parent().find('.text-danger').remove();
          
          if (json['error']) {
            $(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
          }
  
          if (json['success']) {
            alert(json['success']);
  
            $(node).parent().find('input[name^=\'custom_field\']').val(json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#addressfieldsShipping button[id^=\'button-shipping-custom-field\']').on('click', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);
      
      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $(node).parent().find('.text-danger').remove();;
          
          if (json['error']) {
            $(node).parent().find('input[name^=\'scustom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
          }
  
          if (json['success']) {
            alert(json['success']);
  
            $(node).parent().find('input[name^=\'scustom_field\']').val(json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});

$('.time').datetimepicker({
  pickDate: false
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});
jQuery(function($) {
  <?php if($modData['company_mask']){?>$("input[name='company'] , input[name='scompany']").mask("<?php echo $modData['company_mask'];?>");<?php } ?>
  <?php if($modData['company_id_mask']){?>$("input[name='company_id']").mask("<?php echo $modData['company_id_mask'];?>");<?php } ?>
  <?php if($modData['tax_id_mask']){?>$("input[name='tax_id']").mask("<?php echo $modData['tax_id_mask'];?>");<?php } ?>
  <?php if($modData['postcode_mask']){?>$("input[name='postcode'] , input[name='spostcode']").mask("<?php echo $modData['postcode_mask'];?>");<?php } ?>
    
    <?php foreach ($custom_fields as $custom_field){?>
      <?php if(($custom_field['location']=='address') && ($custom_field['type']=='text') && !empty($custom_field['mask'])){?>
        $("input[name='custom_field[<?php echo $custom_field['custom_field_id']; ?>]'], input[name='scustom_field[<?php echo $custom_field['custom_field_id']; ?>]']").mask("<?php echo $custom_field['mask']; ?>");
      <?php }?>
    <?php }?>
 });
//--></script>