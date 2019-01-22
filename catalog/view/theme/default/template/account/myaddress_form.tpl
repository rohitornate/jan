<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="my-account-header">My Account</div>
			</div>
	</div>
  <div class="row">
  
  

<style>
  a {
    
    color: #337ab7;
}
 
  .my-account-header {
    margin-bottom: .781rem;
    font-size: 28px;
    font-size: 1.75rem;
    line-height: 2.125;
    padding-bottom: .500rem;
    letter-spacing: .1em;
    border-bottom: .1rem solid #ccc;
    text-transform: uppercase;
    font-weight: 700;
    
	}
	
	.my-account-welcome__hello {
    font-weight: 700;
    padding: 0px;
    font-size: 1.25rem;
    padding-bottom:1.25em;
    }
	ul.my-account-welcome__links {
    margin-left: 0px;
	list-style:none;
	font-size:1.1rem;
	}
	ul.my-account-nav-list {
    margin-left: 0px;
    
	}
	
	.my-account-nav-list>li {
    list-style: none;
    position: relative;
    padding:15px 0px;
	}
	.my-account-nav-list>li>a {
      font-size:large;
	  text-decoration:none;
	}
	.fa{
	color: #360736;
    /*padding-right:10px;*/
	
	}
	.fa:hover{
	color: black;
    
	}
    .myaccount .inset {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
	}
	.my-account__header {
    margin-bottom: 36px;
    border-bottom: 5px solid #ccc;
	}
	.my-account__header.addr h1 {
    font-weight: 600;
    color: #474747;
    line-height: 1;
    font-size: 24px;
    font-size: 1.375rem;
    text-transform: uppercase;
    margin-top: 0;
	}
	.my-account__header h2 {
    font-size: 1rem;
    font-weight: 600;
    color: #474747;
    padding: 0;
    margin-top: 24px;
    margin-bottom: 15px;
	}
	.myaccount .form-group {
    
    margin: 0 0 20px;
	}
	
	.form-horizontal .control-label {
    
    text-align: left;
	}
	.required .form-control {
    outline: 0;
    width: 100%;
    height: 36px;
    padding: 0 10px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: 1px solid #4a4a4a; 
    font-size: .8125rem;
    color: #000;
    background-color: #ededed;
    border: 0;
	}
	
	.btn-default {
    background: #e6e7e8;
    font-size: .9375rem;
    color: #000;
    padding: 11px 10px;
    display: block;
    border: 0;
    cursor: pointer;
    width: 90%;
    text-transform: uppercase;
    float: left;
    margin-right: 17px;
	}

	.btn-default {
    background: #670067 !important;
	}
	.myaccount .btn-yellow {
    font-size: .9375rem;
    color: #fff;
}
.btn-default {
    background: #670067;
    color:#fff;
}
.btn-primary{
    background: #670067;
    color:#fff;
}

.btn {
    font-size: .9375rem;
    padding: 11px 10px;
    display: inline-block;
}
.btn-yellow {
    background: #000;
    font-size: 1.125rem;
    color: #fff;
    padding: 10px;
    display: block;
    border: 0;
    cursor: pointer;
    width: 100%;
    text-transform: uppercase;
	}
	@media (max-width: 767px){
	.my-account__header.addr h1{
	font-size:unset;
	}
	.my-account__header.addr {
	padding-top:10px;
	}
	
	.col-md-9, .col-md-3, .col-sm-9, .col-sm-3, .col-md-12 .col-sm-12{
	padding-right: 0px !important;
    padding-left: 0px !important;
	}
	}
  </style>


<div class="col-md-12 col-sm-12">
					<div id="left-panel" class="columns">
						<div class="my-account-welcome__hello">Hello, <span id="displayName">prem</span></div>
							<ul class="my-account-welcome__links">
								<li>
									<a href="index.php?route=account/edit">My Account</a>
								</li>
							  
							</ul>
							<ul class="my-account-nav-list">
								<li>
									<a href="index.php?route=account/edit">
										<i class="fa fa-cog"></i>
										Edit Profile 
									</a>
								</li>
						  
								<li>
								  <a href="index.php?route=account/order">
									 <i class="fa fa-truck"></i>
									  Orders History
								  </a>
								</li>
								<li>
								  <a href="index.php?route=account/address">
									  <i class="fa fa-book"></i>
									  Address 
								</li>
								 <li>
								  <a href="index.php?route=account/wishlist">
									 <i class="fa fa-cog"></i>
									  Wish List
								  </a>
								</li>
								   
								<li>
									<a  href="index.php?route=account/return">
										<i class="fa fa-cog"></i>
										Return Status
									</a>
								</li>   
							
								<li>
								  <a href="#">
									  <i class="fa fa-gift"></i>
									  Ornate Wallet
								  </a>
								</li>
								<li>
								  <a href="index.php?route=account/logout">
									  <i class="fa fa-gift"></i>
									  Sign Out
								  </a>
								</li>
							</ul>
							<!--<ul class="my-account-welcome__links">
								<li><a href="#">Sign Out</a></li>
							</ul>-->
					</div>
				</div>

  
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"> <?php echo $content_top; ?>
     <div class="my-account__header addr">
										<h1>Update Address</h1>
										<h2>Add and edit your addresses to save you time during your checkout.</h2>
									</div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset class="xaddress">
          <?php if ($modData['f_name_show_edit']) { ?>
          <xdiv sort="a<?php echo $modData['f_name_sort']; ?>">
          <div class="form-group <?php if ($modData['f_name_req_edit'])  echo "required" ; ?>">
            <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" <?php echo $title_firstname;?> placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
              <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php }else{?>
       		 <input type="hidden" name="firstname" value="<?php echo $firstname; ?>" />
          <?php }?>
          <?php if ($modData['l_name_show_edit']) { ?>
          <xdiv sort="a<?php echo $modData['l_name_sort']; ?>">
          <div class="form-group <?php if ($modData['l_name_req_edit'])  echo "required" ; ?>">
            <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" <?php echo $title_lastname;?> placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
              <?php if ($error_lastname) { ?>
              <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php }else{?>
       		 <input type="hidden" name="lastname" value="<?php echo $lastname; ?>" />
          <?php }?>
          <?php if ($modData['company_show_edit']) { ?>
          <xdiv sort="a<?php echo $modData['company_sort']; ?>">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
            <div class="col-sm-10">
              <input type="text" name="company" value="<?php echo $company; ?>" <?php echo $title_company;?> placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control <?php echo ($modData['company_numeric']?"numeric":""); ?>" autocomplete="off"/>
            </div>
          </div>
          </xdiv>
          <?php }else{?>
       		 <input type="hidden" name="company" value="<?php echo $company; ?>" />
          <?php }?>
          <?php if ($modData['address1_show_edit']) { ?>
          <xdiv sort="a<?php echo $modData['address1_sort']; ?>">
          <div class="form-group <?php if ($modData['address1_req_edit'])  echo "required" ; ?>">
            <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
            <div class="col-sm-10">
              <input type="text" name="address_1" value="<?php echo $address_1; ?>" <?php echo $title_address_1;?> placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
              <?php if ($error_address_1) { ?>
              <div class="text-danger"><?php echo $error_address_1; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php }else{?>
       		 <input type="hidden" name="address_1" value="<?php echo $address_1; ?>" />
          <?php }?>
          <?php if ($modData['address2_show_edit']) { ?>
          <xdiv sort="a<?php echo $modData['address2_sort']; ?>">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="address_2" value="<?php echo $address_2; ?>" <?php echo $title_address_2;?> placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
            </div>
          </div>
          </xdiv>
          <?php }else{?>
       		 <input type="hidden" name="address_2" value="<?php echo $address_2; ?>" />
          <?php }?>
          <?php if ($modData['city_show_edit']) { ?>
          <xdiv sort="a<?php echo $modData['city_sort']; ?>">
          <div class="form-group <?php if ($modData['city_req_edit'])  echo "required" ; ?>">
            <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
            <div class="col-sm-10">
              <input type="text" name="city" value="<?php echo $city; ?>" <?php echo $title_city;?> placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
              <?php if ($error_city) { ?>
              <div class="text-danger"><?php echo $error_city; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php }else{?>
       		 <input type="hidden" name="city" value="<?php echo $city; ?>" />
          <?php }?>
          <?php if ($modData['pin_show_edit']) { ?>
          <xdiv sort="a<?php echo $modData['pin_sort']; ?>">
          <div class="form-group <?php if ($modData['pin_req_edit'])  echo "required" ; ?>">
            <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
            <div class="col-sm-10">
              <input type="text" name="postcode" value="<?php echo $postcode; ?>" <?php echo $title_postcode;?> placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control <?php echo ($modData['pin_numeric']?"numeric":"")." ".($modData['pin_masking']?"mask postcode":""); ?>" />
              <?php if ($error_postcode) { ?>
              <div class="text-danger"><?php echo $error_postcode; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php }else{?>
       		 <input type="hidden" name="postcode" value="<?php echo $postcode; ?>" />
          <?php }?>
          <?php if ($modData['country_show_edit']) { ?>
          <xdiv sort="a<?php echo $modData['country_sort']; ?>">
          <div class="form-group <?php if ($modData['country_req_edit'])  echo "required" ; ?>">
            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-10">
              <select name="country_id" id="input-country" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if ($error_country) { ?>
              <div class="text-danger"><?php echo $error_country; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } else {?>
        	<input type ="hidden" name="country_id" value ="<?php echo $country_id;?>">
          <?php }?>
          <?php if ($modData['state_show_edit']) { ?>
          <xdiv sort="a<?php echo $modData['state_sort']; ?>">
          <div class="form-group <?php if ($modData['state_req_edit'])  echo "required" ; ?>">
            <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
            <div class="col-sm-10">
              <select name="zone_id" id="input-zone" class="form-control">
              </select>
              <?php if ($error_zone) { ?>
              <div class="text-danger"><?php echo $error_zone; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } else {?>
        	<input type ="hidden" name="zone_id" value ="<?php echo $zone_id;?>">
          <?php }?>
          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'address') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> class="radio">
                  <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> class="checkbox">
                  <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $address_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control <?php if($custom_field['isnumeric']) echo "numeric";?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <xdiv sort="a<?php echo $custom_field['sort_order']; ?>">
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field<?php echo ($custom_field['required'] ? ' required' : ''); ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input <?php if($custom_field['tips']) echo $title.$custom_field['tips'] ."'" ; ?> type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          </xdiv>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          <xdiv sort="z99">
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_default; ?></label>
            <div class="col-sm-10">
              <?php if ($default) { ?>
              <label class="radio-inline">
                <input type="radio" name="default" value="1" checked="checked" />
                <?php echo $text_yes; ?></label>
              <label class="radio-inline">
                <input type="radio" name="default" value="0" />
                <?php echo $text_no; ?></label>
              <?php } else { ?>
              <label class="radio-inline">
                <input type="radio" name="default" value="1" />
                <?php echo $text_yes; ?></label>
              <label class="radio-inline">
                <input type="radio" name="default" value="0" checked="checked" />
                <?php echo $text_no; ?></label>
              <?php } ?>
            </div>
          </div>
          </xdiv>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript" src="catalog/view/xtensions/stylesheet/bs/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript" src="catalog/view/xtensions/stylesheet/bs/js/xcustom.js"></script>
<script type="text/javascript">
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
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
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
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
	
					if (json['success']) {
						alert(json['success']);
	
						$(node).parent().find('input').val(json['code']);
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

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
<script type="text/javascript"><!--
$('<?php (($modData['country_show_edit'])?'select':'input');?>[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
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
	
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('<?php (($modData['country_show_edit'])?'select':'input');?>[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>
