<input type="hidden" name="account" id="account" value="<?php echo $account; ?>" />
<div id="loginPage" class="container">
  <div class="row equal">
    <div class="col-md-9">
      <div class="col-md-3 pside-bar">
        <!--col-md-3 starts-->
        <nav id="login-tabs" class="nav-sidebar">
          <ul class="nav nav-tabs tabs-left">
            <li <?php if($account=='login') echo 'class="active"';?>>
              <a href="#tab1" data-toggle="tab" account="login">
                <span style="text-transform: uppercase;"><?php echo $text_login; ?></span>
              </a>
            </li>
            <li <?php if($account=='register') echo 'class="active"';?>>
              <a href="#tab2" data-toggle="tab" account="register">
                <span style="text-transform: uppercase;"><?php echo $text_register; ?></span>
              </a>
            </li>
            <?php if ($checkout_guest) { ?>             
            <li <?php if($account=='guest') echo 'class="active"';?>>
              <a href="#tab3" data-toggle="tab" account="guest">
                <span style="text-transform: uppercase;"><?php echo $text_guest; ?></span>
              </a>
            </li>
           <?php } ?>
          </ul>
        </nav>
      </div>
      <!--col-md-3 ends-->
      <div class="col-md-9">
        <!--col-md-9 starts-->
        <div class="tab-content">
          <div class="tab-pane <?php if($account=='login') echo 'active';?>  text-style" id="tab1">
             <h2><?php echo $text_returning_customer; ?></h2>
            <br/>
            <div class="row">
              <div class="col-md-12">
               <div id="xlogin-panel" class="form-group">
                    <label for="lemail"><?php echo $entry_email; ?><span class="xrequired">*</span></label>
                    <input type="text" name="lemail" class="form-control" id="lemail" placeholder="<?php echo $entry_email; ?>">
                  </div> 
                  
                    <div class="form-group">
                      <label for="lpassword"><?php echo $entry_password; ?><span class="xrequired">*</span></label>
                      <input type="password" name="lpassword" class="form-control" id="lpassword" placeholder="<?php echo $entry_password; ?>">
                      <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                    </div>                    
                     <div class="progress" id="progress">
                    <div class="progress-bar progress-bar-success" role="progressbar" id="button-login" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                      <span><?php echo $button_continue; ?></span>
                    </div>                    
                  </div>                               
              </div>
            </div>
          </div>
          <div class="tab-pane <?php if($account=='register') echo 'active';?> text-style" id="tab2">
            <h2><?php echo $text_your_details; ?></h2>
            <br/>
            <div class="row">
              <div class="col-md-12 xpersonal" >                
                  <?php if ($modData['f_name_show']) { ?>
                  <xdiv sort="a<?php echo $modData['f_name_sort']; ?>">
                  <div class="form-group">
                    <label class="control-label" for="fname"><?php echo $entry_firstname; ?><?php if ($modData['f_name_req'])  echo "<span class = xrequired >*</span>" ; ?></label>
                    <input type="text" class="form-control" name="firstname" id="fname" placeholder="<?php echo $entry_firstname; ?>" <?php if($title_firstname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_firstname."'";?>>
                  </div>
                  </xdiv>
                  <?php } ?>
                  <?php if ($modData['l_name_show']) { ?>
                  <xdiv sort="a<?php echo $modData['l_name_sort']; ?>">
                  <div class="form-group">
                    <label class="control-label" for="lname"><?php echo $entry_lastname; ?><?php if ($modData['l_name_req'])  echo "<span class = xrequired >*</span>" ; ?></label>
                    <input type="text" class="form-control" name="lastname" id="lname" placeholder="<?php echo $entry_lastname; ?>" <?php if($title_lastname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_lastname."'";?>>
                  </div>
                  </xdiv>
                  <?php } ?>
                  <?php if ($modData['mob_show']) { ?>
                  <xdiv  sort="a<?php echo $modData['mob_sort']; ?>">
                  <div class="form-group">
                    <label class="control-label" for="telephone"><?php echo $entry_telephone; ?><?php if ($modData['mob_req'])  echo "<span class = xrequired >*</span>" ; ?></label>
                    <input type="text" class="form-control <?php echo ($modData['mob_numeric']?"numeric":""); ?> <?php echo ($modData['mob_masking']?"mask telephone":""); ?>" name="telephone" id="telephone" placeholder="<?php echo $entry_telephone; ?>" <?php if($title_telephone) echo "data-toggle='tooltip' data-placement='top' title ='".$title_telephone."'";?>>
                  </div>
                  </xdiv>
                  <?php } ?>
                  <?php if ($modData['fax_show']) { ?>
                  <xdiv  sort="a<?php echo $modData['fax_sort']; ?>">
                  <div class="form-group">
                    <label class="control-label" for="fax"><?php echo $entry_fax; ?></label>
                    <input type="text" class="form-control <?php echo ($modData['fax_numeric']?"numeric":""); ?>" name="fax" id="fax" placeholder="<?php echo $entry_fax; ?>" <?php if($title_fax) echo "data-toggle='tooltip' data-placement='top' title ='".$title_fax."'";?>>
                  </div>
                  </xdiv>
                  <?php } ?>
                  <xdiv sort="a<?php echo $modData['cgroup_sort']; ?>" >
                  <div style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">  
  					<div class="form-group">
  					<label class="control-label" for="customer-group"><?php echo $entry_customer_group; ?><span class="xrequired">*</span></label>  					
  					<?php foreach ($customer_groups as $customer_group) { ?>
  					<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
  					<div class="radio">
  					<label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>">
  					<input type="radio" name="customer_group_id" checked="checked" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
					</div>
 					 <?php } else { ?>
 					 <div class="radio">
  					<label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>">
  					<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
					</div>					
 					 <?php } ?>
  					<?php } ?> 					   
					</div>
					</div>
					</xdiv>
					<xdiv sort="a<?php echo $modData['email_sort']; ?>" >	
                  <div class="form-group">
                    <label class="control-label" for="email"><?php echo $entry_email; ?><span class="xrequired">*</span></label>
                    <input type="text" class="form-control" name="email" id="email" placeholder="<?php echo $entry_email; ?>" <?php if($title_email) echo "data-toggle='tooltip' data-placement='top' title ='".$title_email."'";?>>
                  </div>
                  </xdiv>
                  <xdiv sort="a<?php echo $modData['pass_sort']; ?>" class="pwd">                  
                  <div class="form-group">
                      <label class="control-label" for="password"><?php echo $entry_password;?><span class="xrequired">*</span></label>
                      <input type="password" class="form-control" name="password" id="password" placeholder="<?php echo $entry_password; ?>" <?php if($title_password) echo "data-toggle='tooltip' data-placement='top' title ='".$title_password."'";?>>
                  </div>
                  </xdiv>
                  <?php if ($modData['passconf_show']) { ?>
                  <xdiv sort="a<?php echo $modData['passconf_sort']; ?>" class="pwd">
                  <div class="form-group">
                      <label class="control-label" for="cpassword"><?php echo $entry_confirm; ?><span class="xrequired">*</span></label>
                      <input type="password" class="form-control" name="confirm" id="cpassword" placeholder="<?php echo $entry_confirm; ?>" <?php if($title_confirm) echo "data-toggle='tooltip' data-placement='top' title ='".$title_confirm."'";?>>
                  </div>
                  </xdiv>
                  <?php } ?>
                  <?php foreach ($custom_fields as $custom_field) { ?>
   			<?php if ($custom_field['location'] == 'account') { ?>
    <?php if ($custom_field['type'] == 'select') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="register-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <select <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
          <?php } ?>
        </select>
    </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'radio') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="register-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div id="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="radio">
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
          </div>
          <?php } ?>
        </div>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'checkbox') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="register-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div id="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="checkbox">
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
          </div>
          <?php } ?>
        </div>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'text') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="register-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control <?php if($custom_field['isnumeric']) echo "numeric";?>" />
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'textarea') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="register-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <textarea <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'file') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="register-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <button <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="button" id="button-register-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="" id="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'date') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="register-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div class="input-group date">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'time') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="register-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div class="input-group time">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'datetime') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="register-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div class="input-group datetime">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-account-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </xdiv>
    <?php } ?>
    <?php } ?>
    <?php } ?>
                  <xdiv sort="za97" id="captcha">   
    			<?php echo $captcha; ?> 
    			</xdiv>  
    			<?php if ($modData['subsribe_show'] ) { ?>
                  <xdiv sort="zb97" class="pwd">
                  <div class="form-group">
                      <div class="checkbox">
					  	<label for="newsletter"><input type="checkbox" name="newsletter" value="1" id="newsletter" checked="checked"><?php echo $entry_newsletter; ?></label>
					  </div>
                  </div>
                  </xdiv>
                  <?php } ?>                 
                   <?php if ($text_agree) { ?>
                  <xdiv sort="zz98" class="pwd">
                  <div id="xagreep" class="form-group">
                      <div class="checkbox">
					  	<label id="xagree" for="agree"><input type="checkbox" name="agree" value="1" id="agree"><?php echo $text_agree; ?></label>
					  </div>
                  </div>
                  </xdiv>
                  <?php }?>
                        
                  <xdiv sort="zb99" class="pwd">          
                  <div class="progress" id="progress">
                    <div class="progress-bar progress-bar-success" role="progressbar" id="submit1" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                      <span><?php echo $button_continue; ?></span>
                    </div>
                  </div>
                </xdiv>
              </div>
            </div>
          </div>
          <?php if ($checkout_guest) { ?>
          <div class="tab-pane <?php if($account=='guest') echo 'active';?> text-style" id="tab3">
            <h2><?php echo $text_your_details; ?></h2>
            <br/>
            <div class="row">
            <div class="col-md-12 xpersonal1" >                
                  <?php if ($modData['f_name_show_checkout']) { ?>
                  <xdiv sort="a<?php echo $modData['f_name_sort']; ?>">
                  <div class="form-group">
                    <label class="control-label" for="gfname"><?php echo $entry_firstname; ?><?php if ($modData['f_name_req_checkout'])  echo "<span class = xrequired >*</span>" ; ?></label>
                    <input type="text" class="form-control" name="gfirstname" value="<?php echo $firstname;?>" id="gfname" placeholder="<?php echo $entry_firstname; ?>" <?php if($title_firstname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_firstname."'";?>>
                  </div>
                  </xdiv>
                  <?php } ?>
                  <?php if ($modData['l_name_show_checkout']) { ?>
                  <xdiv sort="a<?php echo $modData['l_name_sort']; ?>">
                  <div class="form-group">
                    <label class="control-label" for="glname"><?php echo $entry_lastname; ?><?php if ($modData['l_name_req_checkout'])  echo "<span class = xrequired >*</span>" ; ?></label>
                    <input type="text" class="form-control" name="glastname" value="<?php echo $lastname;?>" id="glname" placeholder="<?php echo $entry_lastname; ?>" <?php if($title_lastname) echo "data-toggle='tooltip' data-placement='top' title ='".$title_lastname."'";?>>
                  </div>
                  </xdiv>
                  <?php } ?>
                  <?php if ($modData['mob_show_checkout']) { ?>
                  <xdiv  sort="a<?php echo $modData['mob_sort']; ?>">
                  <div class="form-group">
                    <label class="control-label" for="gtelephone"><?php echo $entry_telephone; ?><?php if ($modData['mob_req_checkout'])  echo "<span class = xrequired >*</span>" ; ?></label>
                    <input type="text" value="<?php echo $telephone; ?>" class="form-control <?php echo ($modData['mob_numeric']?"numeric":""); ?> <?php echo ($modData['mob_masking']?"mask telephone":""); ?>" name="gtelephone" id="gtelephone" placeholder="<?php echo $entry_telephone; ?>" <?php if($title_telephone) echo "data-toggle='tooltip' data-placement='top' title ='".$title_telephone."'";?>>
                  </div>
                  </xdiv>
                  <?php } ?>
                  <?php if ($modData['fax_show_checkout']) { ?>
                  <xdiv  sort="a<?php echo $modData['fax_sort']; ?>">
                  <div class="form-group">
                    <label class="control-label" for="gfax"><?php echo $entry_fax; ?></label>
                    <input type="text" value="<?php echo $fax; ?>" class="form-control <?php echo ($modData['fax_numeric']?"numeric":""); ?>" name="gfax" id="gfax" placeholder="<?php echo $entry_fax; ?>" <?php if($title_fax) echo "data-toggle='tooltip' data-placement='top' title ='".$title_fax."'";?>>
                  </div>
                  </xdiv>
                  <?php } ?>
                  <xdiv sort="a<?php echo $modData['cgroup_sort']; ?>" >
                  <div style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">  
  					<div class="form-group">
  					<label class="control-label" for="gcustomer-group"><?php echo $entry_customer_group; ?><span class="xrequired">*</span></label>  					
  					<?php foreach ($customer_groups as $customer_group) { ?>
  					<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
  					<div class="radio">
  					<label for="gcustomer_group_id<?php echo $customer_group['customer_group_id']; ?>">
  					<input type="radio" name="gcustomer_group_id" checked="checked" value="<?php echo $customer_group['customer_group_id']; ?>" id="gcustomer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
					</div>
 					 <?php } else { ?>
 					 <div class="radio">
  					<label for="gcustomer_group_id<?php echo $customer_group['customer_group_id']; ?>">
  					<input type="radio" name="gcustomer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="gcustomer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
					</div>					
 					 <?php } ?>
  					<?php } ?> 					   
					</div>
					</div>
					</xdiv>
					<xdiv sort="a<?php echo $modData['email_sort']; ?>" >	
                  <div class="form-group">
                    <label class="control-label" for="gemail"><?php echo $entry_email; ?><span class="xrequired">*</span></label>
                    <input type="text" class="form-control" name="gemail" value="<?php echo $email;?>" id="gemail" placeholder="<?php echo $entry_email; ?>" <?php if($title_email) echo "data-toggle='tooltip' data-placement='top' title ='".$title_email."'";?>>
                  </div>
                  </xdiv>
                  <?php foreach ($custom_fields as $custom_field) { ?>
   			<?php if ($custom_field['location'] == 'account') { ?>
    <?php if ($custom_field['type'] == 'select') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <select <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
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
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'radio') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div id="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="radio">
            <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="radio" name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } else { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="radio" name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'checkbox') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div id="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="checkbox">
            <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $guest_custom_field[$custom_field['custom_field_id']])) { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="checkbox" name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } else { ?>
            <label <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?>>
              <input type="checkbox" name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
            <?php } ?> 
          </div>
          <?php } ?>
        </div>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'text') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control <?php if($custom_field['isnumeric']) echo "numeric";?>" />
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'textarea') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <textarea <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'file') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <button <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="button" id="button-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <input type="hidden" name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'date') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div class="input-group date">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'time') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div class="input-group time">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </xdiv>
    <?php } ?>
    <?php if ($custom_field['type'] == 'datetime') { ?>
    <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
    <div id="guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field">
      <label class="control-label" for="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?><?php echo ($custom_field['required'] ? ' <span class="xrequired">*</span>' : ''); ?></label>
        <div class="input-group datetime">
          <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-guest-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </xdiv>
    <?php } ?>
    <?php } ?>
    <?php } ?>  
    <xdiv sort="za99" id="gcaptcha">   
    			<?php echo $gcaptcha; ?> 
    			</xdiv>                 
                  <xdiv sort="zb99" class="pwd">          
                  <div class="progress" id="gprogress">
                    <div class="progress-bar progress-bar-success" role="progressbar" id="submit2" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                      <span><?php echo $button_continue; ?></span>
                    </div>
                  </div>
                </xdiv>
              </div>              
            </div>
          </div>
          <?php }?>
        </div>
      </div>
    </div>
    <!--col-md-9 outer ends-->
  
  <div class="col-md-3 lborder">
  <div id="options"><?php echo $xoptions; ?></div>
  <div id="totals"><?php echo $xtotals; ?></div>
  </div>
  </div>
</div>
<?php if($captcha || $gcaptcha && $gcaptcha_key){ ?>
<script src="//www.google.com/recaptcha/api.js?onload=myCallBack&render=explicit" async defer></script>
    <script>
      var recaptcha1;
      var recaptcha2;
      var myCallBack = function() {
    	<?php if($captcha){ ?>   
        //Render the recaptcha1 on the element with ID "recaptcha1"
        recaptcha1 = grecaptcha.render('input-captcha-register', {
          'sitekey' : '<?php echo $gcaptcha_key; ?>', //Replace this with your Site key
          'theme' : 'light'
        });
        <?php } ?>
        <?php if($gcaptcha){ ?>
        //Render the recaptcha2 on the element with ID "recaptcha2"
        recaptcha2 = grecaptcha.render('input-captcha-guest', {
          'sitekey' : '<?php echo $gcaptcha_key; ?>', //Replace this with your Site key
          'theme' : 'light'
        });
        <?php } ?>
      };
    </script>
<?php } ?>    
<script type="text/javascript" src="catalog/view/xtensions/stylesheet/bs/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript" src="catalog/view/xtensions/stylesheet/bs/js/xcustom.js"></script>  
<script type="text/javascript">

$('#tab2 input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=xcheckout/checkout/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('#tab2 .custom-field').hide();
			$('#tab2 .custom-field').removeClass('required');
			for (i = 0; i < json.length; i++) {
				custom_field = json[i];
				$('#register-custom-field' + custom_field['custom_field_id']).show();
				if (custom_field['required']) {
					$('#register-custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('#tab2 input[name=\'customer_group_id\']:checked').trigger('change');
$('#tab3 input[name=\'gcustomer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=xcheckout/checkout/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('#tab3 .custom-field').hide();
			$('#tab3 .custom-field').removeClass('required');
			for (i = 0; i < json.length; i++) {
				custom_field = json[i];
				$('#guest-custom-field' + custom_field['custom_field_id']).show();
				if (custom_field['required']) {
					$('#guest-custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('#tab3 input[name=\'gcustomer_group_id\']:checked').trigger('change');
</script>
<script type="text/javascript">
$(document).on("click", "#login-tabs [data-toggle='tab']", function(event) {     
     $('#account').val($(this).attr('account'));  
     captcha();        
});
function captcha(){
	if($('#account').val() == 'register'){
		$('#tab2 #input-captcha').attr('name','captcha');
   	 	$('#tab3 #input-captcha').removeAttr('name');
     }else if($('#account').val() == 'guest'){
    	 $('#tab3 #input-captcha').attr('name','captcha');
    	 $('#tab2 #input-captcha').removeAttr('name');
     }   
}
$(function () {
	  captcha();
	  $('[data-toggle="tooltip"]').tooltip();
})

</script>
<script type="text/javascript"><!--
$('#tab2 button[id^=\'button-register-custom-field\']').on('click', function() {
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
$('#tab3 button[id^=\'button-guest-custom-field\']').on('click', function() {
	var node = this;
	$('#form-upload').remove();
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	$('#form-upload input[name=\'file\']').trigger('click');
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
						$(node).parent().find('input[name^=\'gcustom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					if (json['success']) {
						alert(json['success']);
						$(node).parent().find('input[name^=\'gcustom_field\']').val(json['code']);
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
	<?php if($modData['mob_mask']){?>$("input[name='telephone'], input[name='gtelephone']").mask("<?php echo $modData['mob_mask'];?>");<?php } ?>
	<?php if($modData['fax_mask']){?>$("input[name='fax'], input[name='gfax']").mask("<?php echo $modData['fax_mask'];?>");<?php } ?>
    <?php foreach ($custom_fields as $custom_field){?>
    	<?php if(($custom_field['location']=='account') && ($custom_field['type']=='text') && !empty($custom_field['mask'])){?>
    		$("input[name='custom_field[<?php echo $custom_field['custom_field_id']; ?>]']").mask("<?php echo $custom_field['mask']; ?>");
    		$("input[name='gcustom_field[<?php echo $custom_field['custom_field_id']; ?>]']").mask("<?php echo $custom_field['mask']; ?>");
    	<?php }?>
    <?php }?>
 });
//--></script>
