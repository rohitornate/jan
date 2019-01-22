<table class="table">
	<!-- Out-Of-Stock statuses -->
	<tr>
        <td class="col-xs-3">
            <h5><strong><?php echo $text_stock_status; ?> </strong></h5> <span class="help"><i class="fa fa-info-circle"></i>&nbsp;</span><?php echo $text_stock_status_help; ?> </td>
        <td>
            <div class="col-xs-4">
                <?php foreach($stock_statuses as $stock_status) { ?>
                   <div class="checkbox">
                      <label>
                         <input type="checkbox" name="notifywhenavailable[stock_status][<?php echo $stock_status['stock_status_id']?>]" <?php echo !isset($nwa_data['notifywhenavailable']) || (isset($nwa_data['notifywhenavailable']['stock_status'][$stock_status['stock_status_id']]) && $nwa_data['notifywhenavailable']['stock_status'][$stock_status['stock_status_id']] == 'on') ? 'checked="checked"' : ''; ?>/> <?php echo $stock_status['name'] ?>
                      </label>
                   </div>
                  <?php } ?>
            </div>
        </td>
    </tr>

<!--End Customer Groups -->
    <tr>
        <td class="col-xs-3">
            <h5><strong><?php echo $text_admin_notifications; ?></strong></h5> <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_admin_notifications_help; ?></span> </td>
        <td>
            <div class="col-xs-4">
                <select name="notifywhenavailable[Notifications]" class="NotifyWhenAvailableNotifications form-control">
                    <option value="yes" <?php echo ((isset($nwa_data['notifywhenavailable'][ 'Notifications']) && $nwa_data[ 'notifywhenavailable'][ 'Notifications']=='yes' )) ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                    <option value="no" <?php echo ((isset($nwa_data['notifywhenavailable'][ 'Notifications']) && $nwa_data[ 'notifywhenavailable'][ 'Notifications']=='no' )) ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                </select>
            </div>
        </td>
    </tr>
    <tr>
        <td class="col-xs-3">
            <h5><strong><?php echo $text_popup_width; ?></strong></h5> <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_popup_width_help; ?></span> </td>
        <td>
            <div class="col-xs-3">
                <div class="input-group">
                    <input type="text" name="notifywhenavailable[PopupWidth]" class="NotifyWhenAvailablePopupWidth form-control" value="<?php echo (isset($nwa_data['notifywhenavailable']['PopupWidth'])) ? $nwa_data['notifywhenavailable']['PopupWidth'] : '250' ?>" /></input> <span class="input-group-addon">px</span> </div>
            </div>
        </td>
    </tr>
    
    <tr>
    <td class="col-xs-3">
            <h5><strong><?php echo $text_design; ?></strong></h5> <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_design_help; ?>

  </span> </td>
        <td>
            <div class="col-xs-12">
                <ul class="nav nav-tabs">
                    <?php $i=0; foreach ($languages as $language) { ?>
                    <li <?php if ($i==0) echo 'class="active"'; ?>><a href="#pouptab-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo $language['flag_url']; ?>"/> <?php echo $language['name']; ?></a> </li>
                    <?php $i++; }?> </ul>
                <div class="tab-content">
                    <?php $i=0; foreach ($languages as $language) { ?>
                    <div id="pouptab-<?php echo $language['language_id']; ?>" language-id="<?php echo $language['language_id']; ?>" class="row-fluid tab-pane language <?php if ($i==0) echo 'active'; ?>">
                        <div class="row">
                            <div class="col-md-8">
                                <h5><strong><?php echo $text_button_label; ?></strong></h5> <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_button_label_help; ?></span>
                                <div class="input-group">
                                    <input type="text" name="notifywhenavailable[ButtonLabel][<?php echo $language['code']; ?>]" class="NotifyWhenAvailableButtonLabel form-control" value="<?php echo (isset($nwa_data['notifywhenavailable']['ButtonLabel'][$language['code']]) && !empty($nwa_data['notifywhenavailable']['ButtonLabel'][$language['code']])) ? $nwa_data['notifywhenavailable']['ButtonLabel'][$language['code']] : 'Notify Me!'; ?>" /></input>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-8">
                                <h5><strong><?php echo $text_popup_title; ?></strong></h5>
                                <div class="input-group">
                                    <input name="notifywhenavailable[CustomTitle][<?php echo $language['code']; ?>]" class="NotifyWhenAvailableCustomTitle form-control" type="text" value="<?php echo (isset($nwa_data['notifywhenavailable']['CustomTitle'][$language['code']])) ? $nwa_data['notifywhenavailable']['CustomTitle'][$language['code']] : 'Out of stock!' ?>" /> </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <textarea class="summernote" id="description_<?php echo $language['code']; ?>" name="notifywhenavailable[CustomText][<?php echo $language['code']; ?>]" style="height:80px;" class="NotifyWhenAvailableCustomText form-control">
                                    <?php echo (isset($nwa_data[ 'notifywhenavailable'][ 'CustomText'][$language[ 'code']])) ? $nwa_data[ 'notifywhenavailable'][ 'CustomText'][$language[ 'code']] : '<p align="left"><span style="line-height: 1.6em;">Fill your email below and we will notify you as soon as the product is back in stock!</span></p>

                            <p align="left">Name: {name_field}</p>

                            <p align="left">Email: {email_field}</p>

                            <p align="left">{submit_button}</p>' ?> </textarea>
                            </div>
                        </div>
                    </div>
                    <?php $i++; } ?> </div>
            </div>
        </td>
    </tr>

    <tr>
        <td class="col-xs-3">
            <h5><strong><?php echo $text_notification_customer; ?></strong></h5> <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_notification_customer_help; ?></span> </td>
        <td>
            <div class="col-xs-4">
                <select name="notifywhenavailable[CustomerNotification]" id="notifyCustomer" class="NotifyWhenAvailableNotifications form-control">
                    <option value="yes" <?php echo ((isset($nwa_data[ 'notifywhenavailable'][ 'CustomerNotification']) && $nwa_data[ 'notifywhenavailable'][ 'CustomerNotification']=='yes' )) ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                    <option value="no" <?php echo ((isset($nwa_data[ 'notifywhenavailable'][ 'CustomerNotification']) && $nwa_data[ 'notifywhenavailable'][ 'CustomerNotification']=='no' )) ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                </select>
            </div>
        </td>
    </tr>
    <tr id="notificationEmailRow">
          <td class="col-xs-3">
                <h5><strong><?php echo $text_notification_mail; ?></strong></h5> <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_notification_mail_help; ?>   </span> 
          </td>
            <td>
                <div class="col-xs-12">
                    <ul class="nav nav-tabs">
                        <?php $i=0; foreach ($languages as $language) { ?>
                        <li <?php if ($i==0) echo 'class="active"'; ?>><a href="#emailtab-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo $language['flag_url']; ?>"/> <?php echo $language['name']; ?></a> </li>
                        <?php $i++; }?> </ul>
                    <div class="tab-content">
                        <?php $i=0; foreach ($languages as $language) { ?>
                        <div id="emailtab-<?php echo $language['language_id']; ?>" language-id="<?php echo $language['language_id']; ?>" class="row-fluid tab-pane language <?php if ($i==0) echo 'active'; ?>">
                            <div class="row">
                                <div class="col-md-8">
                                    <h5><strong><?php echo $text_notification_subject; ?></strong></h5>
                                    <input name="notifywhenavailable[NotificationEmailSubject][<?php echo $language['language_id']; ?>]" class="input-xxlarge form-control" type="text" value="<?php echo (isset($nwa_data['notifywhenavailable']['NotificationEmailSubject'][$language['language_id']])) ? $nwa_data['notifywhenavailable']['NotificationEmailSubject'][$language['language_id']] : 'We will notify you once the product is back in stock.' ?>" /> </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <textarea class="summernote" id="email_notification_text_<?php echo $language['language_id']; ?>" name="notifywhenavailable[NotificationEmailText][<?php echo $language['language_id']; ?>]" style="height:80px;" class="NotifyWhenAvailableEmailText form-control">
                                        <?php echo (isset($nwa_data[ 'notifywhenavailable'][ 'NotificationEmailText'][$language[ 'language_id']])) ? $nwa_data[ 'notifywhenavailable'][ 'NotificationEmailText'][$language[ 'language_id']] : '<p align="center"><b>Hello, {name}!</b></p>

                            <p align="center">Thank you for your interest in {product_name}. We will notify you as soon as the product is back in stock!</p>' ?> </textarea>
                                </div>
                            </div>
                        </div>
                        <?php $i++; } ?> </div>
                </div>
            </td>
        </tr>

    <tr>
        <td class="col-xs-3">
            <h5><strong><?php echo $text_email_text; ?></strong></h5><span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_email_text_help; ?></span><br/> <br/><span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_email_text_help_sec; ?></span> </td>
        <td>
            <div class="col-xs-12">
                <ul class="nav nav-tabs">
                    <?php $i=0; foreach ($languages as $language) { ?>
                    <li <?php if ($i==0) echo 'class="active"'; ?>><a href="#instockemailtab-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo $language['flag_url']; ?>"/> <?php echo $language['name']; ?></a> </li>
                    <?php $i++; }?> </ul>
                <div class="tab-content">
                    <?php $i=0; foreach ($languages as $language) { ?>
                    <div id="instockemailtab-<?php echo $language['language_id']; ?>" language-id="<?php echo $language['language_id']; ?>" class="row-fluid tab-pane language <?php if ($i==0) echo 'active'; ?>">
                        <div class="row">
                            <div class="col-md-8">
                                <h5><strong><?php echo $text_email_subject; ?></strong></h5>
                                <input name="notifywhenavailable[EmailSubject][<?php echo $language['code']; ?>]" class="input-xxlarge form-control" type="text" value="<?php echo (isset($nwa_data['notifywhenavailable']['EmailSubject'][$language['code']])) ? $nwa_data['notifywhenavailable']['EmailSubject'][$language['code']] : 'The product is back in stock!' ?>" /> </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <textarea class="summernote" id="email_text_<?php echo $language['code']; ?>" name="notifywhenavailable[EmailText][<?php echo $language['code']; ?>]" style="height:80px;" class="NotifyWhenAvailableEmailText form-control">
                                    <?php echo (isset($nwa_data[ 'notifywhenavailable'][ 'EmailText'][$language[ 'code']])) ? $nwa_data[ 'notifywhenavailable'][ 'EmailText'][$language[ 'code']] : '<p align="center"><b>Hello, {c_name}!</b></p>

                            <p align="center">We are happy to notify you that the product you were interested in, {p_name}&nbsp;is back in stock!</p>

                            <p align="center">{p_image}</p>

                            <p align="center"><strong>What are you waiting for?&nbsp;<a href="http://{p_link}" target="_blank">Order now</a>!</strong></p>' ?> </textarea>
                            </div>
                        </div>
                    </div>
                    <?php $i++; } ?> </div>
            </div>
        </td>
    </tr>
    <tr>
        <td class="col-xs-3">
            <h5><strong><?php echo $text_custom_css; ?></strong></h5> <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_custom_css_help; ?></span> </td>
        <td>
            <div class="col-xs-4">
                <textarea name="notifywhenavailable[CustomCSS]" class="NotifyWhenAvailableCustomCSS form-control">
                    <?php echo (isset($nwa_data[ 'notifywhenavailable'][ 'CustomCSS'])) ? $nwa_data[ 'notifywhenavailable'][ 'CustomCSS'] : '' ?> </textarea>
            </div>
        </td>
    </tr>
</table>
<?php $token=$_GET[ 'token']; ?>
<script>
 $(function() {
    var $typeSelector = $('#notifyCustomer');
    var $toggleArea = $('#notificationEmailRow');
     if ($typeSelector.val() === 'yes') {
            $toggleArea.show(); 
        }
        else {
            $toggleArea.hide(); 
        }
    $typeSelector.change(function(){
        if ($typeSelector.val() === 'yes') {
            $toggleArea.show(400); 
        }
        else {
            $toggleArea.hide(400); 
        }
    });
});
 </script>