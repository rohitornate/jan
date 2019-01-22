<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
    <div class="container-fluid">
       <div class="pull-right">
        <button type="submit" form="form-xcheckout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $text_save_and_stay; ?></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $text_cancel_or_back; ?></a>
        </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
   <div class="panel panel-default">
      <div class="panel-heading">
      <div class="row">
      <h3 class="panel-title col-sm-12">
      <span class="col-sm-10 "><i class="fa fa-pencil"></i> <?php echo $edit_heading; ?>: <?php echo $heading_title; ?> <b><?php echo $text_version.$xtensions_version; ?></b></span>
      <span class="col-sm-2 text-right">
	  <select name="store_id" class="form-control">
	  <option value="0" <?php echo $store_id==0?'selected="selected"':''; ?>><?php echo $default_heading; ?></option>
	  <?php foreach ($stores as $store){ ?>
	  <option value="<?php echo $store['store_id']; ?>" <?php echo $store_id==$store['store_id']?'selected="selected"':''; ?>><?php echo $store['name']; ?></option>
	  <?php } ?>
	  </select>
	  </span>
      </h3>
      </div>
      <div class="clearfix"></div>
      </div>   
    <div class="panel-body">
    <ul class="nav nav-tabs tab-horizontal">         
		<li class="active"><a href="#tab-module" data-toggle="tab"><?php echo $tab_module_settings; ?></a></li>
		<li><a href="#tab-support-license" data-toggle="tab"><?php echo $help_heading; ?></a></li>
	</ul>
<div class="tab-content">
<div id="tab-module" class="tab-pane active">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-xcheckout">
<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
<?php } ?>  
<?php if ($success) { ?>
<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
<?php } ?>  
<?php if(!isset($config_license['xtensions_checkout_activation_code'])){ ?>
<div class="row xtensionsalertmain">
<div class="col-sm-12">
<div class="alert alert-danger"><?php echo $text_license_alert_2; ?><span style="margin-left:20px"><a onclick="$('.nav-tabs a[href=#tab-support-license]').tab('show');$('.nav-tabs a[href=#tab-license]').tab('show');" class="btn btn-success"><?php echo $text_license_activate; ?></a></span><button type="button" class="close" data-dismiss="alert">&times;</button></div>
</div>
</div>
<?php } ?>   
<div class="alert alert-xinfo inline">
<div class="row">
<div class="col-sm-5">
<label>
<b><?php echo $module_heading_title; ?></b> 
</label>
<div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-status_yes" value="1"  name="status" <?php if ((isset($xconfig['status']) && $xconfig['status'])) echo 'checked'; ?> />
				<label for="option-status_yes"><?php echo $yes_option; ?></label>
				<input type="radio" id="option-status_no" value="0"  name="status" <?php if (!isset($xconfig['status']) || (isset($xconfig['status']) && !$xconfig['status'])) echo 'checked'; ?> />
				<label for="option-status_no"><?php echo $no_option; ?></label>
				</div>
</div>	
</div>
<div class="col-sm-3">
<label>
<b class="inline30"><?php echo $default_country_heading ; ?></b>
<select class="inline60 form-control" name="options[country_id]">
                  <option value="0"><?php echo $select_option_heading; ?></option>
                    <?php foreach ($countries as $country) { ?>
                    <?php if (isset($xconfig['options']['country_id']) && $xconfig['options']['country_id'] == $country['country_id']) { ?>
                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
              </select>
</label>
</div>
<div class="col-sm-4">
<label>
<b class="inline50"><?php echo $default_default_state_region; ?></b>
<select class="inline50 form-control" name="options[zone_id]"></select>
</label>
</div>
</div>
</div>
<div class="row">
<div class="col-sm-3">
<nav id="login-tabs" class="nav-sidebar">
<ul class="nav nav-tabs tabs-left" id="tab-xcheckout"> 
<li class="active"><a href="#tab-fields" data-toggle="tab"><?php echo $text_fields_heading; ?></a></li>
<li><a href="#tab-sort-validation" data-toggle="tab"><?php echo $text_sort_validation; ?></a></li>
<li><a href="#tab-language" data-toggle="tab"><?php echo $language_heading; ?></a></li>
<li><a href="#tab-misc" data-toggle="tab"><?php echo $checkout_misc_heading; ?></a></li>
<li><a href="#tab-social" data-toggle="tab"><?php echo $social_login_heading; ?></a></li>
<li><a href="#tab-override" data-toggle="tab"><?php echo $design_heading; ?></a></li>
</ul>
</nav>                       
</div>
<div class="col-sm-9">
<div class="tab-content"> 
<div id="tab-fields" class="tab-pane active">  
<ul class="nav nav-tabs tab-horizontal">         
<li class="active"><a href="#tab-reg" data-toggle="tab"><?php echo $register_area_heading; ?></a></li>
<li><a href="#tab-edit" data-toggle="tab"><?php echo $edit_area_heading; ?></a></li>
<li><a href="#tab-checkout" data-toggle="tab"><?php echo $guest_area_heading; ?></a></li>
</ul>
<div class="tab-content">
<div id="tab-reg" class="tab-pane active">
<div class="row">
<div class="col-md-12">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td colspan="3" class="text-left"><?php echo $register_page_field_heading; ?></td>           
            </tr>
          </thead>
               <tr>
                  <td class="text-left">
                   <span data-toggle="tooltip" title="(Account, Address, password will appear in single section)"> <?php echo $single_section_heading; ?></span>
                  </td>                  
                  <td colspan="2" class="text-center"> 
                  <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-single_box_yes" value="1"  name="options[single_box]" <?php if (!isset($xconfig['options']['single_box']) || (isset($xconfig['options']['single_box']) && $xconfig['options']['single_box'])) echo 'checked'; ?> />
				<label for="option-single_box_yes"><?php echo $yes_option; ?></label>
				<input type="radio" id="option-single_box_no" value="0"  name="options[single_box]" <?php if (isset($xconfig['options']['single_box']) && !$xconfig['options']['single_box']) echo 'checked'; ?> />
				<label for="option-single_box_no"><?php echo $no_option; ?></label>
				</div>
  				</div>	
  				
  				</td>                             
               </tr>
               <tr>
                  <td class="text-left">
                  <span data-toggle="tooltip" title="(On Registration Page Only for faster registration)"><?php echo $hide_address_heading; ?></br><?php echo $hide_address_subheading; ?></span>
                  </td>                  
                  <td colspan="2" class="text-center">
                  <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-hide_yes" value="1"  name="options[hide_address]" <?php if (!isset($xconfig['options']['hide_address']) || (isset($xconfig['options']['hide_address']) && $xconfig['options']['hide_address'])) echo 'checked'; ?> />
				<label for="option-hide_yes"><?php echo $yes_option; ?></label>
				<input type="radio" id="option-hide_no" value="0"  name="options[hide_address]" <?php if (isset($xconfig['options']['hide_address']) && !$xconfig['options']['hide_address']) echo 'checked'; ?> />
				<label for="option-hide_no"><?php echo $no_option; ?></label>
				</div>
  				</div>	
  				                             
               </tr>
               <thead >            
            <tr >
            <td></td>
               <td class="text-center" width="20%"><?php echo $show_title; ?></td>
              <td class="text-center" width="20%"><?php echo $required_title; ?></td>
              </tr> 
              </thead>      
               <?php foreach ($fields as $key=>$field){ ?>
               <?php if($field['register'] || (isset($field['mandatory']) && $field['mandatory'])){ ?>
		          <tr>
					<td class="text-left">
					<?php echo isset($field['title'])?'<span data-toggle="tooltip" title="'.$field['title'].'">':''; ?><?php echo $field_title[$key]; ?><?php echo isset($field['title'])?'</span>':''; ?></td>
					<td class="text-center">
					<?php if(isset($field['mandatory']) && $field['mandatory']){ ?>
						<?php if($key == 'customer_group_id'){ ?>
						<?php echo $always_displayed_in_store; ?>
						<?php } else { ?>
						<?php echo $always_displayed; ?>
						<?php } ?>
					<?php } else if ($field['register'] && !isset($field['mandataory'])) { ?>                  
		            <input type="checkbox" value ="1" name="register[<?php echo $key;?>][show]" <?php echo isset($xconfig['register'][$key]['show'])?'checked="checked"':''; ?> />
		            <?php } ?>
		            </td>
		            <td class="text-center">
		            <?php if(isset($field['required_default']) && $field['required_default']){ ?>
		            <?php echo $always_mandatory_heading; ?>
		            <?php } else if(isset($field['required']) && !$field['required']){ ?>
		            <?php echo $cannot_mandatory_heading; ?>
		            <?php } else { ?>
		            <input type="checkbox" value="1"  name="register[<?php echo $key;?>][required]" <?php echo isset($xconfig['register'][$key]['required'])?'checked="checked"':''; ?> <?php echo !$field['required']?'disabled="disabled"':''; ?> />
		            <?php } ?>
		            </td>          
				  </tr>
				<?php } ?>
          	  <?php } ?>
              
</table>
</div>
</div>
</div> 
</div>
<div id="tab-edit" class="tab-pane">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left"><?php echo $personal_details_account_heading; ?></td>              
              <td class="text-center" width="20%"><?php echo $show_title; ?></td>
              <td class="text-center" width="20%"><?php echo $required_title; ?></td>                            
            </tr>
          </thead>
               <?php foreach ($fields as $key=>$field){ ?>
               <?php if($field['edit'] && in_array($field['location'],array('account','both')) || ($field['edit'] && isset($field['mandatory']) && $field['mandatory'])){ ?>
		          <tr>
					<td class="text-left"><?php echo isset($field['title'])?'<span data-toggle="tooltip" title="'.$field['title'].'">':''; ?><?php echo $field_title[$key]; ?><?php echo isset($field['title'])?'</span>':''; ?></td>                  
		            <td class="text-center">
		            <?php if(isset($field['mandatory']) && $field['mandatory'] ){ ?>
		            	<?php echo $always_displayed; ?>
		            <?php } else if ($field['edit'] && !isset($field['mandataory'])) { ?>
		            <input type="checkbox" value ="1" name="edit[account][<?php echo $key;?>][show]" <?php echo isset($xconfig['edit']['account'][$key]['show'])?'checked="checked"':''; ?>  /> 
		            <?php } ?>
		            </td>
		            <td class="text-center">
		            <?php if(isset($field['required_default']) && $field['required_default']){ ?>
		            <?php echo $always_mandatory_heading; ?>
		            <?php } else if(isset($field['required']) && !$field['required']){ ?>
		            <?php echo $cannot_mandatory_heading; ?>
		            <?php } else { ?>
		            <input type="checkbox" value="1"  name="edit[account][<?php echo $key;?>][required]" <?php echo !$field['required']?'disabled="disabled"':''; ?> <?php echo isset($xconfig['edit']['account'][$key]['required'])?'checked="checked"':''; ?> />
		            <?php } ?>
		            </td>            
				  </tr>
				<?php } ?>
          	  <?php } ?>
</table>
</div> 
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left"><?php echo $personal_details_address_heading; ?></td>              
              <td class="text-center" width="20%"><?php echo $show_title; ?></td>
              <td class="text-center" width="20%"><?php echo $required_title; ?></td>                            
            </tr>
          </thead>
               <?php foreach ($fields as $key=>$field){ ?>
               <?php if($field['edit'] && in_array($field['location'],array('address','both'))){ ?>
		          <tr>
					<td class="text-left"><?php echo isset($field['title'])?'<span data-toggle="tooltip" title="'.$field['title'].'">':''; ?> <?php echo $field_title[$key]; ?><?php echo isset($field['title'])?'</span>':''; ?></td>                  
		            <td class="text-center"><input type="checkbox" value ="1" name="edit[address][<?php echo $key;?>][show]" <?php echo isset($xconfig['edit']['address'][$key]['show'])?'checked="checked"':''; ?> /></td>
		            <td class="text-center">
		            <?php if(isset($field['required_default']) && $field['required_default']){ ?>
		            <?php echo $always_mandatory_heading; ?>
		            <?php } else if(isset($field['required']) && !$field['required']){ ?>
		            <?php echo $cannot_mandatory_heading; ?>
		            <?php } else { ?>
		            <input type="checkbox" value="1"  name="edit[address][<?php echo $key;?>][required]" <?php echo !$field['required']?'disabled="disabled"':''; ?> <?php echo isset($xconfig['edit']['address'][$key]['required'])?'checked="checked"':''; ?> />
		            <?php } ?>
		            </td>            
				  </tr>
				<?php } ?>
          	  <?php } ?>
</table>
</div>           
</div>                                  
<div id="tab-checkout" class="tab-pane">
<div class="table-responsive"><table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" width="60%"><?php echo $account_guest_heading; ?></td>              
              <td class="text-center" width="20%"><?php echo $show_title; ?></td>
              <td class="text-center" width="20%"><?php echo $required_title; ?></td>                            
            </tr>
          </thead>
               <?php foreach ($fields as $key=>$field){ ?>
               <?php if($field['checkout'] && in_array($field['location'],array('account','both'))|| (isset($field['mandatory']) && $field['mandatory'])){ ?>
		          <tr>
					<td class="text-left">
					<?php echo isset($field['title'])?'<span data-toggle="tooltip" title="'.$field['title'].'">':''; ?><?php echo $field_title[$key]; ?><?php echo isset($field['title'])?'</span>':''; ?>
					<?php if(isset($field['guest']) && !$field['guest']){ ?>
					<br /><small class="text-muted"><?php echo $guest_area_subheading; ?></small>
					<?php } ?>
					</td>                  
		            <td class="text-center">
		            <?php if(isset($field['mandatory']) && $field['mandatory'] ){ ?>
		            	<?php if($key == 'customer_group_id'){ ?>
						<?php echo $always_displayed_in_store; ?>
						<?php } else { ?>
						<?php echo $always_displayed; ?>
						<?php } ?>
		            <?php } else if ($field['checkout'] && !isset($field['mandataory'])) { ?>
		            <input type="checkbox" value ="1" name="checkout[account][<?php echo $key;?>][show]" <?php echo isset($xconfig['checkout']['account'][$key]['show'])?'checked="checked"':''; ?>  /> 
		            <?php } ?>		            
		            </td>
		            <td class="text-center">
		            <?php if(isset($field['required_default']) && $field['required_default']){ ?>
		            <?php echo $always_mandatory_heading; ?>
		            <?php } else if(isset($field['required']) && !$field['required']){ ?>
		            <?php echo $cannot_mandatory_heading; ?>
		            <?php } else { ?>
		            <input type="checkbox" value="1"  name="checkout[account][<?php echo $key;?>][required]" <?php echo !$field['required']?'disabled="disabled"':''; ?> <?php echo isset($xconfig['checkout']['account'][$key]['required'])?'checked="checked"':''; ?> />
		            <?php } ?>
		            </td>            
				  </tr>
				<?php } ?>
          	  <?php } ?>
</table>  
</div>  
<div class="table-responsive"><table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" width="60%"><?php echo $address_panel_heading; ?></td>              
              <td class="text-center" width="20%"><?php echo $show_title; ?></td>
              <td class="text-center" width="20%"><?php echo $required_title; ?></td>                           
            </tr>
          </thead>
               <?php foreach ($fields as $key=>$field){ ?>
               <?php if($field['checkout'] && in_array($field['location'],array('address','both'))){ ?>               
		          <tr>
					<td class="text-left"><?php echo isset($field['title'])?'<span data-toggle="tooltip" title="'.$field['title'].'">':''; ?><?php echo $field_title[$key]; ?><?php echo isset($field['title'])?'</span>':''; ?></td>                
		            <td class="text-center"><input type="checkbox" value ="1" name="checkout[address][<?php echo $key; ?>][show]" <?php echo isset($xconfig['checkout']['address'][$key]['show'])?'checked="checked"':''; ?> /></td>
		            <td class="text-center">
		            <?php if(isset($field['required_default']) && $field['required_default']){ ?>
		            <?php echo $always_mandatory_heading; ?>
		            <?php } else if(isset($field['required']) && !$field['required']){ ?>
		            <?php echo $cannot_mandatory_heading; ?>
		            <?php } else { ?>
		            <input type="checkbox" value="1"  name="checkout[address][<?php echo $key; ?>][required]" <?php echo isset($xconfig['checkout']['address'][$key]['required'])?'checked="checked"':''; ?> />
		            <?php } ?>        
		            </td>  
				  </tr>
				<?php } ?>
          	  <?php } ?>
</table>  
</div>           
</div>
</div>
</div>
<div id="tab-sort-validation" class="tab-pane">
<ul class="nav nav-tabs tab-horizontal">         
<li class="active"><a href="#tab-sort" data-toggle="tab"><?php echo $sorting_heading; ?></a></li>
<li><a href="#tab-validation" data-toggle="tab"><?php echo $validation_heading; ?></a></li>
</ul>
<div class="tab-content">
<div id="tab-sort" class="tab-pane active">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" width="30%"><?php echo $field_name_heading; ?></td>              
              <td class="text-left" width="70%"><?php echo $sort_name_heading; ?></td>                                          
            </tr>
          </thead>
          <?php foreach ($fields as $key=>$field){ ?>
          <?php if(!in_array($key, array('newsletter','agree'))){ ?>                   
           <tr>
            <td class="text-left"><?php echo $field_title[$key]; ?></td>                  
        	<td class="text-left"><input type="text" name="sort_order[fields][<?php echo $key;?>]" value="<?php echo (isset($xconfig['sort_order']['fields'][$key]) ? $xconfig['sort_order']['fields'][$key] : (isset($field['sort_order']) ? $field['sort_order'] : '')); ?>" size="6"  class="form-control"/></td>        	
           </tr>
           <?php } ?>
        <?php } ?>
        <?php if(count($custom_fields)>0){?>
        <?php $count_custom_fields = 1; ?>
        <?php foreach ($custom_fields as $field) { ?>
          <tr>
          <td class="text-left"><?php echo $field['name']; ?> - <?php echo $custom_field_heading; ?> (<span class="xcapitalize"><?php echo $field['location']; ?></span>)</td>                  
          <td class="text-left"><input type="text" name="sort_order[custom_fields][<?php echo $field['custom_field_id'];?>]" value="<?php echo (isset($xconfig['sort_order']['custom_fields'][$field['custom_field_id']]) ? $xconfig['sort_order']['custom_fields'][$field['custom_field_id']] : $count_custom_fields*5) ; ?>" size="6"  class="form-control"/></td>
          </tr>
          <?php $count_custom_fields++; ?>
          <?php } ?>
          <?php } ?>
</table> 

<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" width="30%"><?php echo $account_tab_heading; ?></td>              
              <td class="text-left" width="70%"><?php echo $sort_number_heading; ?></td>                                          
            </tr>
          </thead>
          <?php foreach (array('login'=>1,'register'=>2,'guest'=>3) as $key=>$value){ ?>                   
           <tr>
            <td class="text-left"><span class="xcapitalize"><?php echo $key; ?></span></td>                  
        	<td class="text-left"><input type="text" name="sort_order[account][<?php echo $key;?>]" value="<?php echo (isset($xconfig['sort_order']['account'][$key]) ? $xconfig['sort_order']['account'][$key] : $value); ?>" size="6"  class="form-control"/></td>        	
           </tr>
        <?php } ?>
</table>           
</div>
</div>
<div id="tab-validation" class="tab-pane">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" width="20%"><?php echo $validation_heading; ?></td>           
              <td class="text-center" width="10%"><?php echo $minimum_characters_heading; ?></td>
              <td class="text-center" width="10%"><?php echo $maximum_characters_heading; ?></td>              
              <td class="text-center" width="10%"><?php echo $numeric_heading; ?></td>     
              <td class="text-center" width="25%"><?php echo $masking_heading; ?></td> 
              <td class="text-center" width="25%"><?php echo $regex_heading; ?></td>
            </tr>            
          </thead>  
          <tr >
              <td colspan="3" class="text-center"><span class="text-muted"><?php echo $validation_title_first; ?></span></td>
              <td colspan="2" class="text-center"><span class="text-muted"><?php echo $validation_title_second; ?></span></td>              
              <td class="text-center"><?php echo $validation_title_third; ?></td>
            </tr>
          	<?php foreach ($fields as $key=>$field){ ?>
           <?php if($field['minimum'] || $field['maximum']){ ?>                     
           <tr>
            <td class="text-left"><b><?php echo $field_title[$key]; ?></b></td>            
            <?php if($key =='confirm'){ ?>
            <td class="text-center" colspan="2"><?php echo $confirm_password_description;  ?></td>
            <?php } else { ?>
        	<td class="text-center"><input type="text" size="6" name="validation[<?php echo $key;?>][minimum]" value="<?php echo (isset($xconfig['validation'][$key]['minimum']) ? $xconfig['validation'][$key]['minimum'] : (isset($field['minimum_default']) ? $field['minimum_default']:'')); ?>" class="form-control"/></td>
        	<td class="text-center"><input type="text" size="6" name="validation[<?php echo $key;?>][maximim]" value="<?php echo (isset($xconfig['validation'][$key]['maximim']) ? $xconfig['validation'][$key]['maximim'] : (isset($field['maximum_default']) ? $field['maximum_default']:'')); ?>" class="form-control"/></td>
        	<?php } ?>
        	<?php if($field['is_numeric'] || $field['is_masking']){ ?>            
        	<td class="text-center"><input type="checkbox" value="1" name="validation[<?php echo $key;?>][numeric]" <?php echo isset($xconfig['validation'][$key]['numeric'])?'checked="checked"':''; ?>/></td>
        	<td class="text-center"><input type="text" name="validation[<?php echo $key;?>][mask]" value="<?php echo isset($xconfig['validation'][$key]['mask'])?$xconfig['validation'][$key]['mask']:''; ?>" placeholder="Masking" title="CEP Brasil-99999-999" class="form-control"/></td>           
            <?php } else { ?>
            <td colspan="2" class="text-center"><i class="fa fa-times-circle" aria-hidden="true"></i></td>
            <?php } ?>
            <?php if(isset($field['regex'])){ ?>
        	<td class="text-center"><input type="text" name="validation[<?php echo $key;?>][regex]" value="<?php echo isset($xconfig['validation'][$key]['regex'])?$xconfig['validation'][$key]['regex']:''; ?>" placeholder="Regex" class="form-control"/></td>           
            <?php } else { ?>
            <td colspan="1" class="text-center"><i class="fa fa-times-circle" aria-hidden="true"></i></td>
            <?php } ?>                   	
           </tr>    
        <?php } ?>
        <?php } ?>                  
</table> 
</div>           
</div>
</div>
</div>
<div id="tab-language" class="tab-pane">
<div class="table-responsive"><table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" width="10%"><?php echo $field_heading; ?></td>
              <td class="text-center" width="20%"><?php echo $title_heading; ?></td>  
              <td class="text-center" width="40%"><?php echo $error_message_heading; ?></td>            
              <td class="text-center" width="30%"><?php echo $tooltip_heading; ?></td>                  
            </tr>            
          </thead>
          <?php foreach ($fields as $key=>$field){ ?>                                
           <tr>
            <td class="text-left"><?php echo $field_title[$key]; ?></td>           
        	<td class="text-center">
        	<?php foreach ($languages as $language) { ?> 
        	<div class="input-group">
        	<span data-toggle="tooltip" title="<?php echo $language['name'];; ?>" class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
        	<input type="text" name="titles[<?php echo $key;?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($xconfig['titles'][$key]['title'][$language['language_id']])?$xconfig['titles'][$key]['title'][$language['language_id']]:''; ?>"   class="form-control" />                  
        	</div>
        	<?php } ?>        	
        	</td>
        	<td class="text-center">
            <?php foreach ($languages as $language) { ?> 
        	<div class="input-group">
        	<span data-toggle="tooltip" title="<?php echo $language['name'];; ?>" class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
        	<input type="text" name="validation[<?php echo $key;?>][message][<?php echo $language['language_id']; ?>]" value="<?php echo isset($xconfig['validation'][$key]['message'][$language['language_id']])?$xconfig['validation'][$key]['message'][$language['language_id']]:''; ?>"   class="form-control" />                  
        	</div>
        	<?php } ?>
        	</td>  
        	<td class="text-center">
        	<?php foreach ($languages as $language) { ?> 
        	<div class="input-group">
        	<span data-toggle="tooltip" title="<?php echo $language['name'];; ?>" class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
        	<input type="text" name="titles[<?php echo $key;?>][tooltip][<?php echo $language['language_id']; ?>]" value="<?php echo isset($xconfig['titles'][$key]['tooltip'][$language['language_id']])?$xconfig['titles'][$key]['tooltip'][$language['language_id']]:''; ?>"   class="form-control" />                  
        	</div>
        	<?php } ?>
        	</td>
           </tr>
        <?php } ?>            
</table> 
</div>           
</div>
<div id="tab-misc" class="tab-pane">
<ul class="nav nav-tabs tab-horizontal">         
<li class="active"><a href="#tab-sub-misc" data-toggle="tab"><?php echo $checkout_misc_heading; ?></a></li>
<li><a href="#tab-footer" data-toggle="tab">Footer</a></li>
<li><a href="#tab-payment" data-toggle="tab">Payment Methods</a></li>
</ul>
<div class="tab-content">
<div id="tab-sub-misc" class="tab-pane active">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" style="width:40%;"><?php echo $field_heading; ?></td>              
              <td class="text-left" style="width:60%;"><?php echo $option_heading; ?></td>                                          
            </tr>
          </thead>               
              <tr>
              <td class="text-left" ><?php echo $payment_shipping_method_heading; ?></td>              
        	  <td class="text-left"> 
        	  <input type="checkbox" value="1"  name="options[display_comments]" <?php echo isset($xconfig['options']['display_comments'])?"checked":''; ?> />
        	  </td>
              </tr>            
              <tr>                          
              <td class="text-left"><?php echo $show_coupons; ?></td>              
        	  <td class="text-left">
        	  <input type="checkbox" value="1"  name="options[display_coupons]" <?php echo isset($xconfig['options']['display_coupons'])?"checked":''; ?> />
              </tr>
              <tr>                          
              <td class="text-left" ><?php echo $show_vouchers; ?></td>              
        	  <td class="text-left"> 
        	  <input type="checkbox" value="1"  name="options[display_vouchers]" <?php echo isset($xconfig['options']['display_vouchers'])?"checked":''; ?> />
        	  </td>
              </tr>
              <tr>                          
              <td class="text-left" ><?php echo $show_reward_points; ?><br /><small class="help"><?php echo $required_user_subheading; ?></small></td>              
        	  <td class="text-left"> 
        	  <input type="checkbox" value="1"  name="options[display_rewards]" <?php echo isset($xconfig['options']['display_rewards'])?"checked":''; ?> />
        	  </td>
              </tr>
              <tr>
              <td class="text-left" ><?php echo $same_address_heading; ?></td>              
        	  <td class="text-left"> 
        	  <input type="checkbox" value="1"  name="options[same_shipping]" <?php echo isset($xconfig['options']['same_shipping'])?"checked":''; ?> />           
              </tr>  
              <tr>
              <td class="text-left" ><?php echo $login_page_heading; ?><br/><span class="help"><?php echo $change_login_step_heading; ?></span></td>              
		      <td class="text-left">
		      <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-login-clean" value="clean"  name="options[login_type]" <?php if (!isset($xconfig['options']['login_type']) || (isset($xconfig['options']['login_type']) && $xconfig['options']['login_type'] =='clean')) echo 'checked'; ?> />
				<label for="option-login-clean"><i class="fa fa-tablet" aria-hidden="true"></i> <?php echo $clean_view; ?></label>
				<input type="radio" id="option-login-tab" value="tabs"  name="options[login_type]" <?php if (isset($xconfig['options']['login_type']) && $xconfig['options']['login_type'] =='tabs') echo 'checked'; ?> />
				<label for="option-login-tab"><i class="fa fa-th-list" aria-hidden="true"></i> <?php echo $tabs_view; ?></label>
				</div>
  				</div>
		      </td>
        	   </tr>             
              <tr>
              <td class="text-left" ><?php echo $address_list_heading; ?><br/><span class="help"><?php echo $address_list_subheading; ?></span></td>              
		      <td class="text-left">
		      <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-address-block" value="block"  name="options[address_type]" <?php if (!isset($xconfig['options']['address_type']) || (isset($xconfig['options']['address_type']) && $xconfig['options']['address_type'] =='block')) echo 'checked'; ?> />
				<label for="option-address-block"><i class="fa fa-th" aria-hidden="true"></i> <?php echo $block_view_heading; ?></label>
				<input type="radio" id="option-address-list" value="list"  name="options[address_type]" <?php if (isset($xconfig['options']['address_type']) && $xconfig['options']['address_type'] =='list') echo 'checked'; ?> />
				<label for="option-address-list"><i class="fa fa-align-justify" aria-hidden="true"></i> <?php echo $list_view_heading; ?></label>
				</div>
  				</div>
		      </td>
        	   </tr> 
        	   <tr>
              <td class="text-left" ><?php echo $address_form_heading; ?><br/><span class="help"> <?php echo $address_form_subheading; ?></span></td>              
		      <td class="text-left">
		      <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-address-form-list" value="modal"  name="options[address_form]" <?php if (isset($xconfig['options']['address_form']) && $xconfig['options']['address_form'] =='modal') echo 'checked'; ?> />
				<label for="option-address-form-list"><i class="fa fa-clone" aria-hidden="true"></i> <?php echo $modal_view_heading; ?></label>
				<input type="radio" id="option-address-form-block" value="inline"  name="options[address_form]" <?php if (!isset($xconfig['options']['address_form']) || (isset($xconfig['options']['address_form']) && $xconfig['options']['address_form'] =='inline')) echo 'checked'; ?> />
				<label for="option-address-form-block"><i class="fa fa-list-alt" aria-hidden="true"></i> <?php echo $page_view_heading; ?></label>
				</div>
  				</div>
		      </td>
        	   </tr>
        	   <tr>
              <td class="text-left" ><?php echo $other_option_heading; ?></td>              
		      <td class="text-left">
		      <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-coupon-form-modal" value="modal"  name="options[xcvc_view]" <?php if (!isset($xconfig['options']['xcvc_view']) || (isset($xconfig['options']['xcvc_view']) && $xconfig['options']['xcvc_view'] =='modal')) echo 'checked'; ?> />
				<label for="option-coupon-form-modal"><i class="fa fa-clone" aria-hidden="true"></i> <?php echo $modal_view_heading; ?></label>
				<input type="radio" id="option-coupon-form-inline" value="inline"  name="options[xcvc_view]" <?php if (isset($xconfig['options']['xcvc_view']) && $xconfig['options']['xcvc_view'] =='inline') echo 'checked'; ?> />
				<label for="option-coupon-form-inline"><i class="fa fa-list-alt" aria-hidden="true"></i> <?php echo $inline_view_heading; ?></label>
				</div>
  				</div>
		      </td>
        	   </tr>
        	   <tr>
              <td class="text-left" ><?php echo $default_step_heading; ?><br/><span class="help"><?php echo $step_active_heading; ?></span></td>              
		      <td class="text-left">
		      <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-step-default-login" value="login"  name="options[step_default]" <?php if (!isset($xconfig['options']['step_default']) || (isset($xconfig['options']['step_default']) && $xconfig['options']['step_default'] =='login')) echo 'checked'; ?> />
				<label for="option-step-default-login"><i class="fa fa-user" aria-hidden="true"></i> <?php echo $login_heading; ?></label>
				<input type="radio" id="option-step-default-register" value="register"  name="options[step_default]" <?php if (isset($xconfig['options']['step_default']) && $xconfig['options']['step_default'] =='register') echo 'checked'; ?> />
				<label for="option-step-default-register"><i class="fa fa-user-plus" aria-hidden="true"></i> <?php echo $register_heading; ?></label>
				<input type="radio" id="option-step-default-guest" value="guest"  name="options[step_default]" <?php if (isset($xconfig['options']['step_default']) && $xconfig['options']['step_default'] =='guest') echo 'checked'; ?> />
				<label for="option-step-default-guest"><i class="fa fa-user-secret" aria-hidden="true"></i> <?php echo $guest_heading; ?></label>
				</div>
  				</div>
		      </td>
        	   </tr> 
               <tr>
               <td class="text-left" ><?php echo $payment_type_heading; ?><br/><span class="help"><?php echo $payment_type_subheading; ?></span></td>              
		        <td class="text-left">
		        <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-payment-tabs" value="tabs"  name="options[payment_type]" <?php if (!isset($xconfig['options']['payment_type']) || (isset($xconfig['options']['payment_type']) && $xconfig['options']['payment_type'] =='tabs')) echo 'checked'; ?> />
				<label for="option-payment-tabs"><i class="fa fa-th-list" aria-hidden="true"></i> <?php echo $tabs_view; ?></label>
				<input type="radio" id="option-payment-accordion" value="accordion"  name="options[payment_type]" <?php if (isset($xconfig['options']['payment_type']) && $xconfig['options']['payment_type'] =='accordion') echo 'checked'; ?> />
				<label for="option-payment-accordion"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> <?php echo $accordion_view; ?></label>
				</div>
  				</div>		         
		        </td>    
		        </tr>
		        <tr id="image-row-gift_wrap_image>">
                    <td class="text-left"><?php echo $gift_wrap_image; ?></td> 
                    <td class="text-left">
                      <a href="" id="thumb-image_gift_wrap_image" data-toggle="image" class="img-thumbnail"><img width="100px" src="<?php echo (isset($xconfig['options']['gift_wrap_image']) && $xconfig['options']['gift_wrap_image'])?'../image/'.$xconfig['options']['gift_wrap_image']:'../image/catalog/xtensions/giftcard.jpg'; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                      <input type="hidden" name="options[gift_wrap_image]" value="<?php echo isset($xconfig['options']['gift_wrap_image'])?$xconfig['options']['gift_wrap_image']:'../image/catalog/xtensions/giftcard.jpg'; ?>" id="input-image-gift_wrap_image" />
                    </td>
                    </tr> 
		        <tr>
              <td class="text-left" ><?php echo $override_heading; ?><br/><span class="help"><?php echo $override_subheading; ?></span></td>              
        	  <td class="text-left"> 
        	  <input type="checkbox" value="1"  name="options[override_format]" <?php echo isset($xconfig['options']['override_format'])?"checked":''; ?> />           
              </tr>                 
              <tr>
              <td class="text-left"><?php echo $address_format_heading; ?><br/>
              <span class="help">
        		<?php echo $firstname_heading; ?><br>
        		<?php echo $lastname_heading; ?><br>
        		<?php echo $company_heading; ?><br>
		        <?php echo $address_1_heading; ?><br>
		        <?php echo $address_2_heading; ?><br>
		        <?php echo $city_heading; ?><br>
		        <?php echo $postcode_heading; ?><br>
		        <?php echo $zone_heading; ?><br>
		        <?php echo $zone_code_heading; ?><br>
		        <?php echo $country_heading; ?><br>
		        <b><?php echo $identifier_heading; ?></b><br>
		        <?php echo $Applicable_custom_field_heading; ?>
		        <br>
		        <span style="color:red">
		        <?php echo $address_format_note_text; ?>        
		        </span>
		       </span>
              </td>
              <td class="text-left"><textarea name="options[address_format]" autocomplete="off" cols="40" rows="15"><?php echo isset($xconfig['options']['address_format'])?$xconfig['options']['address_format']:''; ?></textarea></td>
              </tr>
              <?php if(count($custom_fields)>0){?>
              <tr>
              <td class="text-left"><?php echo $custom_fields_for_address_heading; ?></td>
              <td class="text-left">
              <?php foreach ($custom_fields as $field) {?>
              <?php echo $field['location']=='address'?'{'.$field['identifier'].'}<br/>':''; ?>             
              <?php }?>
              </td>
              </tr>
              <?php } ?>                                           
</table>         
</div>
</div>
<div id="tab-footer" class="tab-pane">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
<thead>            
            <tr>
              <td class="left" style="width:40%;"><?php echo $information_page_heading; ?></td>              
              <td class="left" style="width:60%;"><?php echo $display_footer_link_heading; ?></td>                                          
            </tr>
          </thead>
          <?php foreach ($informations as $information){ ?>
          <?php if($information['status']){ ?>
          <tr>
              <td class="left" style="width:40%;"><?php echo $information['title']; ?></td>              
              <td class="left" style="width:60%;"><input name="options[information][]" type="checkbox" value="<?php echo $information['information_id']; ?>" <?php echo isset($xconfig['options']['information']) && in_array($information['information_id'], $xconfig['options']['information'])?'checked="checked"':''; ?>/></td>                                          
            </tr>
          <?php } ?>  
          <?php } ?>
          <tr>
              <td class="left" style="width:40%;"><?php echo $display_contact_link; ?></td>              
              <td class="left" style="width:60%;">
              <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-contact_us_yes" value="1" name="options[footer][contact_us]" <?php if (!isset($xconfig['options']['footer']['contact_us']) || (isset($xconfig['options']['footer']['contact_us']) && $xconfig['options']['footer']['contact_us'] =='1')) echo 'checked'; ?> />
				<label for="option-contact_us_yes"><?php echo $yes_option; ?></label>
				<input type="radio" id="option-contact_us_no" value="0" name="options[footer][contact_us]" <?php if (isset($xconfig['options']['footer']['contact_us']) && $xconfig['options']['footer']['contact_us'] =='0') echo 'checked'; ?> />
				<label for="option-contact_us_no"><?php echo $no_option; ?></label>
				</div>
  				</div>
  				</td>                                          
            </tr>
            <tr>
              <td class="left" style="width:40%;"><?php echo $display_footer_modal; ?></td>              
              <td class="left" style="width:60%;">
              <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-footer_modal" value="1" name="options[footer][link_modal]" <?php if (!isset($xconfig['options']['footer']['link_modal']) || (isset($xconfig['options']['footer']['link_modal']) && $xconfig['options']['footer']['link_modal'] =='1')) echo 'checked'; ?> />
				<label for="option-footer_modal"><?php echo $yes_option; ?></label>
				<input type="radio" id="option-footer_modal_no" value="0" name="options[footer][link_modal]" <?php if (isset($xconfig['options']['footer']['link_modal']) && $xconfig['options']['footer']['link_modal'] =='0') echo 'checked'; ?> />
				<label for="option-footer_modal_no"><?php echo $no_option; ?></label>
				</div>
  				</div>
  				</td>                                          
            </tr>
</table>
<table class="table table-striped table-bordered table-hover">
<thead>            
            <tr>
              <td class="left" style="width:40%;"><?php echo $information_page_heading; ?></td>              
              <td class="left" style="width:60%;"><?php echo $contact_details_heading; ?></td>                                          
            </tr>
          </thead>
          <tr>
              <td class="left" style="width:40%;"><?php echo $contact_email_heading; ?><br /><small class="text-muted"><?php echo $contact_email_subheading; ?></small></td>              
              <td class="left" style="width:60%;"><input name="options[footer][contact_email]" type="text" value="<?php echo isset($xconfig['options']['footer']['contact_email'])?$xconfig['options']['footer']['contact_email']:$contact_email; ?>" class="form-control" /></td>                                          
            </tr>
            <tr>
              <td class="left" style="width:40%;"><?php echo $contact_telephone_heading; ?><br /><small class="text-muted"><?php echo $contact_telephone_subheading; ?></small></td>              
              <td class="left" style="width:60%;"><input name="options[footer][contact_telephone]" type="text" value="<?php echo isset($xconfig['options']['footer']['contact_telephone'])?$xconfig['options']['footer']['contact_telephone']:$contact_telephone; ?>" class="form-control" /></td>                                          
            </tr>
</table>
<div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $footer_image_heading; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                  <?php $image_row = 0; ?>
                  <?php if(isset($xconfig['options']['footer']['images'])){ ?>                    
                    <?php foreach ($xconfig['options']['footer']['images'] as $product_image) { ?>
                    <tr id="image-row<?php echo $image_row; ?>">
                      <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="../image/<?php echo $product_image; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="options[footer][images][]" value="<?php echo $product_image; ?>" id="input-image<?php echo $image_row; ?>" /></td>                      
                      <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $image_row++; ?>
                    <?php } ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td></td>
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
</div>
</div>
<div id="tab-payment" class="tab-pane">                            
<div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $payment_method_logo_heading; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                  <?php foreach ($payments as $payment) { ?>
                    <tr id="image-row-<?php echo $payment; ?>">
                    <td class="text-left"><?php echo $payment; ?></td> 
                    <td class="text-left">
                      <a href="" id="thumb-image<?php echo $payment; ?>" data-toggle="image" class="img-thumbnail"><img width="60" src="<?php echo isset($xconfig['options']['payment']['images'][$payment]) && $xconfig['options']['payment']['images'][$payment]?'../image/'.$xconfig['options']['payment']['images'][$payment]:$placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                      <input type="hidden" name="options[payment][images][<?php echo $payment; ?>]" value="<?php echo isset($xconfig['options']['payment']['images'][$payment])?$xconfig['options']['payment']['images'][$payment]:''; ?>" id="input-image-<?php echo $payment; ?>" />
                    </td>
                    </tr>
                  <?php } ?>
                  </tbody>                  
                </table>
              </div>
<div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_payment_method_content; ?></h3>
      </div>
      <div class="panel-body">
<?php foreach ($payments as $payment) { ?>
<div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $payment; ?></h3>
      </div>
      <div class="panel-body">
                <ul class="nav nav-tabs tab-horizontal" id="<?php echo $payment; ?>language">
                <?php $pcount = 0; ?>
                <?php foreach ($languages as $language) { ?>
                <li<?php echo !$pcount?' class="active"':''; ?>><a href="#<?php echo $payment; ?>language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php $pcount++; ?>
                <?php } ?>
              </ul>
              <div class="tab-content">
              	<?php $pcount = 0; ?>
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane<?php echo !$pcount?' active':''; ?>" id="<?php echo $payment; ?>language<?php echo $language['language_id']; ?>">                  
                  <div class="form-group">                    
                    <div class="col-sm-12">
                      <textarea name="options[payment][content][<?php echo $payment; ?>][<?php echo $language['language_id']; ?>]" id="input-description-<?php echo $payment; ?>-<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($xconfig['options']['payment']['content'][$payment][$language['language_id']]) ? $xconfig['options']['payment']['content'][$payment][$language['language_id']] : ''; ?></textarea>
                    </div>
                  </div>
                  </div>
                  <?php $pcount++; ?>
                  <?php } ?>
                  </div>
</div>
</div>              
<?php } ?>              
</div>
</div>
</div>
</div>
</div>
<div id="tab-social" class="tab-pane">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" colspan="2"><i class="fa fa-facebook"></i>&nbsp;<?php echo $facebook_heading; ?></td>                                          
            </tr>
          </thead>               
              <tr>
              <td class="text-left" style="width: 30%;"><?php echo $status_heading; ?></td>              
        	  <td class="text-left"> 
        	  <input type="checkbox" value="1"  name="social[facebook][status]" <?php echo isset($xconfig['social']['facebook']['status'])?"checked":''; ?> />
        	  </td>
              </tr>
              <tr>
              <td class="text-left" ><?php echo $app_id_heading; ?></td>              
        	  <td class="text-left"> 
        	  <input type="text" name="social[facebook][appId]" value="<?php echo isset($xconfig['social']['facebook']['appId'])?$xconfig['social']['facebook']['appId']:''; ?>" class="form-control" />
        	  </td>
              </tr>                                           
</table>
<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" colspan="2"><i class="fa fa-google"></i>&nbsp;<?php echo $google_heading; ?></td>                                          
            </tr>
          </thead>               
              <tr>
              <td class="text-left" style="width: 30%;"><?php echo $status_heading; ?></td>              
        	  <td class="text-left"> 
        	  <input type="checkbox" value="1"  name="social[google][status]" <?php echo isset($xconfig['social']['google']['status'])?"checked":''; ?> />
        	  </td>
              </tr>
              <tr>
              <td class="text-left" ><?php echo $client_id_heading; ?></td>              
        	  <td class="text-left"> 
        	  <input type="text" name="social[google][client_id]" value="<?php echo isset($xconfig['social']['google']['client_id'])?$xconfig['social']['google']['client_id']:''; ?>" class="form-control"/>
        	  </td>
              </tr>                                           
</table>
<table class="table table-striped table-bordered table-hover">
          <thead >            
            <tr >
              <td class="text-left" colspan="2"><i class="fa fa-linkedin"></i>&nbsp;<?php echo $linkedin_heading; ?></td>                                          
            </tr>
          </thead>               
              <tr>
              <td class="text-left" style="width: 30%;"><?php echo $status_heading; ?></td>              
        	  <td class="text-left"> 
        	  <input type="checkbox" value="1"  name="social[linkedin][status]" <?php echo isset($xconfig['social']['linkedin']['status'])?"checked":''; ?> />
        	  </td>
              </tr>
              <tr>
              <td class="text-left" ><?php echo $api_key; ?></td>              
        	  <td class="text-left"> 
        	  <input type="text" name="social[linkedin][api_key]" value="<?php echo isset($xconfig['social']['linkedin']['api_key'])?$xconfig['social']['linkedin']['api_key']:''; ?>" class="form-control" />
        	  </td>
              </tr>                                           
</table>      
</div>
<div class="panel panel-default">
<div class="panel-heading"><h3 class="panel-title"><?php echo $extra_fields_heading; ?></h3></div>
<div class="panel-body">
<div class="table-responsive additionalfields">
<table class="table table-striped table-bordered table-hover">
         
          <tr>
               <td class="text-left" ><?php echo $additional_fields_heading; ?><br/><span class="help"><?php echo $additional_fields_subheading; ?><?php echo $no_option; ?><?php echo $additional_fields_subheading_second; ?></span></td>              
		        <td class="text-left">
		        <div class="xform">
		        <div class="radio-group">
				<input type="radio" id="option-social-force-yes" value="yes"  name="social[additional]" <?php if (isset($xconfig['social']['additional']) && $xconfig['social']['additional'] =='yes') echo 'checked'; ?> />
				<label for="option-social-force-yes" onclick="$('.table-additional').removeClass('hidden');"><i class="fa fa-check" aria-hidden="true"></i> <?php echo $yes_option; ?></label>
				<input type="radio" id="option-social-force-no" value="no"  name="social[additional]" <?php if (!isset($xconfig['social']['additional']) || (isset($xconfig['social']['additional']) && $xconfig['social']['additional'] =='no')) echo 'checked'; ?> />
				<label for="option-social-force-no" onclick="$('.table-additional').addClass('hidden');"><i class="fa fa-times" aria-hidden="true"></i> <?php echo $no_option; ?></label>
				</div>
  				</div>		         
		        </td>    
		        </tr>
</table>
<table class="table table-striped table-bordered table-hover table-additional <?php if (!isset($xconfig['social']['additional']) || (isset($xconfig['social']['additional']) && $xconfig['social']['additional'] =='no')) echo 'hidden'; ?>">
          <thead >            
            <tr >
              <td class="text-left" width="60%"><?php echo $additional_fields_yes_heading; ?></td>              
              <td class="text-center" width="20%"><?php echo $show_title; ?></td>
              <td class="text-center" width="20%"><?php echo $required_title; ?></td>                            
            </tr>
          </thead>
               <?php foreach ($fields as $key=>$field){ ?>
               <?php if(isset($field['social'])){ ?>
		          <tr>
					<td class="text-left">
					<?php echo isset($field['title'])?'<span data-toggle="tooltip" title="'.$field['title'].'">':''; ?><?php echo $field_title[$key]; ?><?php echo isset($field['title'])?'</span>':''; ?>
					
					</td>                  
		            <td class="text-center">
		            <input type="checkbox" value ="1" name="social[fields][<?php echo $key;?>][show]" <?php echo isset($xconfig['social']['fields'][$key]['show'])?'checked="checked"':''; ?>  />	            
		            </td>
		            <td class="text-center">
		            <?php if(isset($field['required_default']) && $field['required_default']){ ?>
		            <?php echo $always_mandatory_heading; ?>
		            <?php } else if(isset($field['required']) && !$field['required']){ ?>
		            <?php echo $cannot_mandatory_heading; ?>
		            <?php } else { ?>
		            <input type="checkbox" value="1"  name="social[fields][<?php echo $key;?>][required]" <?php echo !$field['required']?'disabled="disabled"':''; ?> <?php echo isset($xconfig['social']['fields'][$key]['required'])?'checked="checked"':''; ?> />
		            <?php } ?>
		            </td>            
				  </tr>
				<?php } ?>
          	  <?php } ?>
</table>  
</div>
</div>
</div>
  
</div>
<div id="tab-override" class="tab-pane">
<ul class="nav nav-tabs tab-horizontal">         
<li class="active"><a href="#tab-colors" data-toggle="tab"><?php echo $custom_colors_heading; ?></a></li>
<li><a href="#tab-css" data-toggle="tab"><?php echo $custom_css_tab_heading; ?></a></li>
<li><a href="#tab-js" data-toggle="tab"><?php echo $custom_js_tab_heading; ?></a></li>
</ul>
<div class="tab-content">
<div id="tab-colors" class="tab-pane active">
<div class="panel panel-default">
<div class="panel-heading"><h3 class="pane-title xcapitalize"><?php echo $text_design_option; ?></h3></div>
<div class="panel-body" >
<div class="design">
<?php foreach ($xtensions_design as $key=>$design){ ?>
<div class="design-options">
<div class="colors">
<?php foreach ($design['placeholder'] as $color){ ?>
<div class="sub-color" style="background: <?php echo $color; ?>"></div>
<?php } ?>
</div>
<div class="xform text-center" style="display: block">
<div class="radio-group">
<input type="radio" id="option-design_<?php echo $key; ?>" value="<?php echo $key; ?>" <?php if ((isset($xconfig['design']['type']) && $xconfig['design']['type'] == $key)) echo 'checked'; ?> name="design[type]" />
<label for="option-design_<?php echo $key; ?>"><?php echo $design['title']; ?></label>
</div>
</div>
</div>
<?php } ?>
<div class="design-options">
<div class="colors">
<div class="sub-color" style="background: red;"></div>
<div class="sub-color" style="background: green;"></div>
<div class="sub-color" style="background: blue;"></div>
</div>
<div class="xform text-center" style="display: block">
<div class="radio-group">
<input type="radio" id="option-design_custom" value="custom"  name="design[type]" <?php if ((isset($xconfig['design']['type']) && $xconfig['design']['type'] == 'custom')) echo 'checked'; ?> />
<label for="option-design_custom"><?php echo $text_design_custom; ?></label>
</div>
</div>
</div>
</div>
</div>
<div class="custom_design custom-colors">
<?php foreach ($xtensions_color_section as $key => $section){ ?>
<div class="panel" style="margin-bottom: 0;">
<div class="panel-heading" style="border-top:1px solid #ddd;"><h3 class="pane-title" style="text-transform: capitalize;"><?php echo $text_xtensions_color_section[$key]; ?></h3></div>
<div class="panel-body">
<div class="row">
<?php foreach ($section as $colors){ ?>
<div class="col-md-6" style="min-height: 60px;">
<div class="form-group">
<label class="col-sm-6 control-label"><?php echo $xtensions_colors[$colors]; ?></label>
<div class="col-sm-6">
<div class="input-group colorpicker-component">
    <input type="text" name="colors[<?php echo $colors; ?>]" value="<?php echo isset($xconfig['colors'][$colors])?$xconfig['colors'][$colors]:$xtensions_custom_color[$colors]; ?>" class="form-control" />
    <span class="input-group-addon"><i></i></span>
</div>             
</div>
</div>
</div>
<?php } ?>
</div>
</div>
</div>
<?php } ?>

</div>
</div>
</div>
<div id="tab-css" class="tab-pane">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
    <thead >            
            <tr >
              <td class="text-center" ><?php echo $custom_css_heading; ?></td>     
            </tr>
          </thead>
              <tr>
              <td><textarea name="design[css]" class="form-control" rows="20"><?php echo isset($xconfig['design']['css'])?$xconfig['design']['css']:''; ?></textarea></td>
              </tr>
              
</table>
</div>
</div>
<div id="tab-js" class="tab-pane">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
    <thead >            
            <tr >
              <td class="text-center"><?php echo $custom_js_heading; ?></td>     
            </tr>
          </thead>          
              
              <tr>
              <td><textarea name="design[js]" class="form-control"  rows="20"><?php echo isset($xconfig['design']['js'])?$xconfig['design']['js']:''; ?></textarea></td>
              </tr>
</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</form>
</div>
<div id="tab-support-license" class="tab-pane">
<ul class="nav nav-tabs tab-horizontal">
  <li class="active"><a href="#tab-license" data-toggle="tab"><?php echo $tab_license_validate; ?></a></li>
  <li><a href="#help-reg" data-toggle="tab"><?php echo $register_heading; ?></a></li>
  <li><a href="#help-edit" data-toggle="tab"><?php echo $edit_heading; ?></a></li>
  <li><a href="#help-checkout" data-toggle="tab"><?php echo $checkout_heading; ?></a></li>  
  <li><a href="#help-keyp" data-toggle="tab"><?php echo $key_points_heading; ?></a></li>
  <li><a href="#help-ufeatures" data-toggle="tab"><?php echo $upcoming_features_heading; ?></a></li>  
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab-license">
<div id="validatelicense">
<div class="well licensewell">
<div class="row">
<?php if(isset($config_license['xtensions_checkout_activation_code'])){ ?>
<div class="col-sm-6">
<table class="table">
<tr>
<td><?php echo $text_license; ?></td>
<td><span class="text-success"><i class="fa fa-check-circle-o"></i> <?php echo $text_license_valid; ?></span></td>
</tr>
<?php if(isset($config_license['xtensions_checkout_license_code'])) { ?>
<tr>
<td><?php echo $text_license_code; ?></td>
<td><?php echo $config_license['xtensions_checkout_license_code'];?></td>
</tr>
<?php } ?>
<?php if(isset($config_license['xtensions_checkout_user_name'])) { ?>
<tr>
<td><?php echo $text_license_user; ?></td>
<td><?php echo $config_license['xtensions_checkout_user_name'];?></td>
</tr>
<?php } ?>
<?php if(isset($config_license['xtensions_checkout_date_support'])) { ?>
<tr>
<td><?php echo $text_license_support_date_expiry; ?></td>
<td><?php echo $config_license['xtensions_checkout_date_support']; ?></td>
</tr>
<?php } ?>
</table>
</div>
<?php } else { ?>
<div class="col-sm-6">
<form role="form" id="form_validate" action="#" autocomplete="off" method="post" novalidate enctype="multipart/form-data">
<div class="form-group">
<label for="input-username"><?php echo $text_license_code; ?></label>
<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock"></i></span>
<input type="text" name="licensecode" value="" placeholder="<?php echo $text_license_code; ?>" id="input-licensecode" class="form-control">
<div class="input-group-addon validatelicense"><?php echo $text_license_validate; ?></div>
</div>
<div class="alert alert-danger xtensionsalert" style="margin-top:10px"><?php echo $text_license_alert; ?><span style="margin-left: 20px;"><a id="howtovalidate" href="<?php echo $xtensions_docs; ?>" target="_newtab" class="btn btn-success"><?php echo $text_how_to_validate; ?></a></span></div>
</div>
</form>
</div>
<?php } ?>
<div class="col-sm-6">
<table class="table table-hover">
<?php foreach ($tab_help['content']['help-support'] as $text){ ?>  
<tr><td><ul><li><?php echo $text; ?></li></ul></td></tr>
<?php } ?>
</table>
</div>
</div> 
</div>
</div>
</div>
<div class="tab-pane" id="help-reg">
<table class="table table-striped table-hover">  
<?php foreach ($tab_help['content']['help-reg'] as $text){ ?>  
<tr><td><ul><li><?php echo $text; ?></li></ul></td></tr>
<?php } ?>
</table>
</div>
<div class="tab-pane" id="help-edit">
<table class="table table-striped table-hover">
<?php foreach ($tab_help['content']['help-edit'] as $text){ ?>  
<tr><td><ul><li><?php echo $text; ?></li></ul></td></tr>
<?php } ?>
</table>
</div>
<div class="tab-pane" id="help-checkout">
<table class="table table-striped table-hover">
<?php foreach ($tab_help['content']['help-checkout'] as $text){ ?>  
<tr><td><ul><li><?php echo $text; ?></li></ul></td></tr>
<?php } ?>
</table>
</div>
<div class="tab-pane" id="help-keyp">
<table class="table table-striped table-hover">
<?php foreach ($tab_help['content']['help-keyp'] as $text){ ?>  
<tr><td><ul><li><?php echo $text; ?></li></ul></td></tr>
<?php } ?>
</table>
</div>
<div class="tab-pane" id="help-ufeatures">
<table class="table table-striped table-hover">
 <?php foreach ($tab_help['content']['help-ufeatures'] as $text){ ?>  
<tr><td><ul><li><?php echo $text; ?></li></ul></td></tr>
<?php } ?>
</table>
</div>
</div>
</div>
</div>
    </div>
  </div>
  </div>
  </div>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="<?php echo $xtensions_support; ?>help/xsupport"></script>  
<script type="text/javascript">
var xtensions_module = '<?php echo $xtensions_module; ?>';
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="options[footer][images][]" value="" id="input-image' + image_row + '" /></td>';	
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#images tbody').append(html);

	image_row++;
}
$('select[name=\'store_id\']').bind('change', function() {
	location = 'index.php?route=<?php echo $xtensions_admin_xcheckout_path; ?>&token=<?php echo $token; ?>&store_id=' + this.value;
});
$('select[name=\'options[country_id]\']').bind('change', function() {
  $.ajax({
    url: 'index.php?route=<?php echo $xtensions_admin_xcheckout_path; ?>/country&token=<?php echo $token; ?>&country_id=' + this.value,
    dataType: 'json',          
    success: function(json) {     
      html='';
      if (json['zone'] != '' && undefined !=json['zone']) {
        html = '<option value="999">--Please Select--</option>';
        for (i = 0; i < json['zone'].length; i++) {
              html += '<option value="' + json['zone'][i]['zone_id'] + '"';
            
          if (json['zone'][i]['zone_id'] == '<?php echo (isset($xconfig['options']['zone_id']) && $xconfig['options']['zone_id'])?$xconfig['options']['zone_id']:"";?>') {
                html += ' selected="selected"';
            }
  
            html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected">--None--</option>';
      }
      
      $('select[name=\'options[zone_id]\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
$('select[name=\'options[country_id]\']').trigger('change');
$('input[name=\'design[type]\']').bind('change', function() {
	changeDesign();
});
function changeDesign(){
	if($('input[name=\'design[type]\']:checked').val() == 'custom'){
		$('.custom-colors').show();
	 }else{
		$('.custom-colors').hide();
	 }
}
$(document).on("submit", "#form_validate", function(event) {	
	event.preventDefault();	
	$('.validatelicense').trigger('click');
});
<?php if(!isset($config_license['xtensions_checkout_activation_code'])){ ?>
function submitLicense(activation_code,license_code,user_name,date_support,message){
	$.ajax({
	    url: 'index.php?route=<?php echo $xtensions_admin_xcheckout_path; ?>/license&token=<?php echo $token; ?>&activation_code=' + activation_code +'&license_code=' + license_code +'&user_name=' + user_name +'&date_support=' + date_support,
	    dataType: 'json',          
	    success: function(json) {
	      $('#form_validate').before('<div class="alert alert-success"><i class="fa fa-check-circle-o"></i> '+message+'</div>');     
	      $('#form_validate').remove();
	    },
	    error: function(xhr, ajaxOptions, thrownError) {
	      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	    }
	  });
}
<?php } ?>
changeDesign();
$(function() {
    $('.colorpicker-component').colorpicker({
		'format':'hex'
    });
});
</script>
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>  
<?php echo $footer; ?>
