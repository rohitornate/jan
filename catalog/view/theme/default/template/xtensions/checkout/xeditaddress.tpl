<?php if (isset($redirect)) { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } else{ ?>
<div id="modalEditLoader" class="loader"></div>
<div id="editField" class="row">
          <form class="form-horizontal" role="form">
            <fieldset id="gaddfields" class="xaddress1">
            <input type="hidden" name="address_id" value="<?php echo $address['address_id']; ?>" />
            <?php if($modData['f_name_show_checkout']){ ?>              
              <xdiv sort="a<?php echo $modData['f_name_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_firstname; ?>
                <?php if($modData['f_name_req_checkout']) echo '<span class="xrequired">*</span>';  ?>
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_firstname; ?>" <?php if($title_firstname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_firstname."'";?> name="firstname" value="<?php echo $address['firstname']; ?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php }else{?>
              <input type="hidden" name="firstname" value="<?php echo $address['firstname']; ?>"  />
              <?php } ?>
              <?php if($modData['l_name_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['l_name_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_lastname; ?>
                <?php if($modData['l_name_req_checkout']) echo '<span class="xrequired">*</span>';  ?>
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_lastname; ?>" <?php if($title_lastname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_lastname."'";?> name="lastname" value="<?php echo $address['lastname']; ?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php }else{?>
              <input type="hidden" name="lastname" value="<?php echo $address['lastname']; ?>"  /> 
              <?php } ?>
              <?php if($modData['company_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['company_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_company; ?></label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_company; ?>" <?php if($title_company) echo "data-toggle='tooltip' data-placement='top' title ='".$title_company."'";?> name="company" value="<?php echo $address['company']; ?>"  class="form-control <?php echo ($modData['company_numeric']?"numeric":""); ?>" />
                </div>
              </div>
              </xdiv>
              <?php }else{?>
              <input type="hidden" name="company" value="<?php echo $address['company'];?>"  />
              <?php } ?>              
              <?php if($modData['address1_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['address1_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_address_1; ?>
                <?php if($modData['address1_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_address_1; ?>" <?php if($title_address_1) echo "data-toggle='tooltip' data-placement='top' title ='".$title_address_1."'";?> name="address_1" value="<?php echo $address['address_1'];?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
          <input type="hidden" name="address_1" value="<?php echo $address['address_1'];?>"  />
          <?php } ?>
          <?php if($modData['address2_show_checkout']){ ?>
               <xdiv sort="a<?php echo $modData['address2_sort']; ?>">
               <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_address_2; ?></label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_address_2; ?>" <?php if($title_address_2) echo "data-toggle='tooltip' data-placement='top' title ='".$title_address_2."'";?> name="address_2" value="<?php echo $address['address_2'];?>" class="form-control" />
                </div>
              </div>
              </xdiv>
               <?php } else { ?>
          <input type="hidden" name="address_2" value="<?php echo $address['address_2'];?>"  />
          <?php } ?>
              <?php if($modData['city_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['city_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_city; ?>
                <?php if($modData['city_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_city; ?>" <?php if($title_city) echo "data-toggle='tooltip' data-placement='top' title ='".$title_city."'";?> name="city" value="<?php echo $address['city'];?>" class="form-control" />
                </div>
              </div>
              </xdiv>
              <?php } else { ?>
          <input type="hidden" name="city" value="<?php echo $address['city'];?>"  />
              <?php } ?>
              <?php if($modData['pin_show_checkout']){ ?>
              <xdiv sort="a<?php echo $modData['pin_sort']; ?>">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_postcode; ?>
                <?php if($modData['pin_req_checkout']) echo '<span class="xrequired">*</span>';  ?> 
                </label>
                <div class="col-sm-9">
                  <input type="text" placeholder="<?php echo $entry_postcode; ?>" <?php if($title_postcode) echo "data-toggle='tooltip' data-placement='top' title ='".$title_postcode."'";?> name="postcode" value="<?php echo $address['postcode'];?>" class="form-control <?php echo ($modData['pin_numeric']?"numeric":""); ?> <?php echo ($modData['pin_masking']?"mask postcode":""); ?>" />
                </div>
              </div>
              </xdiv>
               <?php } else { ?>
           <input type="hidden" name="postcode" value="<?php echo $address['postcode'];?>"  />
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
              <?php if ($country['country_id'] == $address['country_id']) { ?>
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
              <input type="hidden" name="country_id" value="<?php echo $address['country_id']; ?>"  />
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
          <input type="hidden" name="zone_id" value="<?php echo $address['zone_id']; ?>"  />
              <?php } ?>
              <?php foreach ($custom_fields as $custom_field) { ?>
        <?php if ($custom_field['location'] == 'address') { ?>
    <?php if ($custom_field['type'] == 'select') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field">
      <label class="col-sm-3 control-label" for="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <select <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
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
        <div id="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="radio">
          <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
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
        <div id="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="checkbox">
            <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $address_custom_field[$custom_field['custom_field_id']])) { ?>
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
      <label class="col-sm-3 control-label" for="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control <?php if($custom_field['isnumeric']) echo "numeric";?>" />
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'textarea') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <textarea <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
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
        <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'date') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div class="form-group custom-field" >
      <label class="col-sm-3 control-label" for="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div class="input-group date">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
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
      <label class="col-sm-3 control-label" for="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div class="input-group time">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
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
      <label class="col-sm-3 control-label" for="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
      <div class="col-sm-9">
        <div class="input-group datetime">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-edit-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    </xdiv>
    <?php } ?>
    <?php } ?>
    <?php } ?>
    <?php if (!$default) { ?>
    <xdiv sort="z99">
          <div class="form-group">
            <label for ="defualtEdit" class="col-sm-3 control-label pointer"><?php echo $entry_default; ?></label>
            <div class="col-sm-9">                     
                <input  style="margin-top: 10px;" type="checkbox" name="default" value="1" id="defualtEdit" />            
            </div>
          </div>
          </xdiv>
          <?php }?>  
            </fieldset>
          </form>
        </div>
<script type="text/javascript" src="catalog/view/xtensions/stylesheet/bs/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript" src="catalog/view/xtensions/stylesheet/bs/js/xcustom.js"></script>
<script type="text/javascript">
$(function () {
    $('[data-toggle="tooltip"]').tooltip();
});
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
$('#editField <?php (($modData['country_show_checkout'])?'select':'input');?>[name=\'country_id\']').bind('change', function() {
  if (this.value == '') return;
  $.ajax({
    url: 'index.php?route=xcheckout/checkout/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('#modal-agree select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
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
      
      if (json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
              html += '<option value="' + json['zone'][i]['zone_id'] + '"';
            
          if (json['zone'][i]['zone_id'] == '<?php echo $address['zone_id']; ?>') {
                html += ' selected="selected"';
            }
  
            html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }
      
      $('#modal-agree select[name=\'zone_id\']').html(html);      
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
$('#editField <?php (($modData['country_show_checkout'])?'select':'input');?>[name=\'country_id\']').trigger('change');

$(document).on("click", "#editAdress", function(event) {
    $.ajax({
        url: 'index.php?route=xcheckout/xpayment_address/editAddress',
        type: 'post',
        data: $('#gaddfields input[type=\'text\'], #gaddfields input[type=\'password\'], #gaddfields input[type=\'checkbox\']:checked,  #gaddfields input[type=\'radio\']:checked, #gaddfields input[type=\'hidden\'], #gaddfields select, #gaddfields textarea'),
        dataType: 'json',
        beforeSend: function() {                    
            $('#editAdress').addClass('progress-bar-striped active');
            $('#modalEditLoader').css({
              height: $('#modalEditLoader').parent().height(), 
              width: $('#modalEditLoader').parent().width()
          });
          $('#modalEditLoader').show();
          showBar();                    
            $('#modal-agree .warning,#modal-agree .error,#modal-agree .alert,#modal-agree .alert-warning,#modal-agree .alert-danger,#modal-agree .alert-dismissible, #gaddfields .xerror').remove();
        },
        complete: function() {                  
          $('#editAdress').removeClass('progress-bar-striped active');                  
        },
        success: function(json) {
            $('#modal-agree .warning,#modal-agree .error,#modal-agree .alert,#modal-agree .alert-warning,#modal-agree .text-danger, #modal-agree .alert-danger,#modal-agree .alert-dismissible, #gaddfields .xerror').remove();
      $('#modal-agree .has-error').removeClass('has-error');          
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
              for (i in json['error']) {
          var element = $('#input-edit-' + i.replace('_', '-'));
          
          if ($(element).parent().hasClass('input-group')) {
            $(element).parent().addClass('has-error');
            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
          } else {
            $(element).parent().addClass('has-error');
            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
          }
        }
              if (json['error']['firstname']) {
                $('#gaddfields input[name=\'firstname\']').parent().addClass('has-error');
          $('#gaddfields input[name=\'firstname\']').after('<span class="xerror">' + json['error']['firstname'] + '</span>');
        }               
        if (json['error']['lastname']) {
          $('#gaddfields input[name=\'lastname\']').parent().addClass('has-error');
          $('#gaddfields input[name=\'lastname\']').after('<span class="xerror">' + json['error']['lastname'] + '</span>');
        }               
        if (json['error']['telephone']) {
          $('#gaddfields input[name=\'telephone\']').parent().addClass('has-error');
          $('#gaddfields input[name=\'telephone\']').after('<span class="xerror">' + json['error']['telephone'] + '</span>');
        }
        if (json['error']['company_id']) {
          $('#gaddfields input[name=\'company_id\']').parent().addClass('has-error');
          $('#gaddfields input[name=\'company_id\']').after('<span class="xerror">' + json['error']['company_id'] + '</span>');
        }
        if (json['error']['tax_id']) {
          $('#gaddfields input[name=\'tax_id\']').parent().addClass('has-error');
          $('#gaddfields input[name=\'tax_id\']').after('<span class="xerror">' + json['error']['tax_id'] + '</span>');
        }                   
        if (json['error']['address_1']) {
          $('#gaddfields input[name=\'address_1\']').parent().addClass('has-error');
          $('#gaddfields input[name=\'address_1\']').after('<span class="xerror">' + json['error']['address_1'] + '</span>');
        }
        if (json['error']['city']) {
          $('#gaddfields input[name=\'city\']').parent().addClass('has-error');
          $('#gaddfields input[name=\'city\']').after('<span class="xerror">' + json['error']['city'] + '</span>');
        }
        if (json['error']['postcode']) {
          $('#gaddfields input[name=\'postcode\']').parent().addClass('has-error');
          $('#gaddfields input[name=\'postcode\']').after('<span class="xerror">' + json['error']['postcode'] + '</span>');
        }
        if (json['error']['country']) {
          $('#gaddfields input[name=\'country_id\']').parent().addClass('has-error');
          $('#gaddfields select[name=\'country_id\']').after('<span class="xerror">' + json['error']['country'] + '</span>');
        }
        if (json['error']['zone']) {
          $('#gaddfields input[name=\'zone_id\']').parent().addClass('has-error');
          $('#gaddfields select[name=\'zone_id\']').after('<span class="xerror">' + json['error']['zone'] + '</span>');
        }
        $('#modalEditLoader').hide();
        hideBar();
      }else{
        $('#modalEditLoader').hide();
        $('#modal-agree').modal('hide');
        hideBar();
        $('#modal-agree').remove();
        //$('.modal-open').removeClass('modal-open'); 
        $('#address').html(json['xpayment_address']);                                                               
        }                    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
jQuery(function($) {
  <?php if($modData['company_mask']){?>$("input[name='company']").mask("<?php echo $modData['company_mask'];?>");<?php } ?>
  <?php if($modData['company_id_mask']){?>$("input[name='company_id']").mask("<?php echo $modData['company_id_mask'];?>");<?php } ?>
  <?php if($modData['tax_id_mask']){?>$("input[name='tax_id']").mask("<?php echo $modData['tax_id_mask'];?>");<?php } ?>
  <?php if($modData['postcode_mask']){?>$("input[name='postcode']").mask("<?php echo $modData['postcode_mask'];?>");<?php } ?>
  <?php foreach ($custom_fields as $custom_field){?>
      <?php if(($custom_field['location']=='address') && ($custom_field['type']=='text') && !empty($custom_field['mask'])){?>
        $("input[name='custom_field[<?php echo $custom_field['custom_field_id']; ?>]']").mask("<?php echo $custom_field['mask']; ?>");
      <?php }?>
    <?php }?>
 });
</script>
<?php } ?>