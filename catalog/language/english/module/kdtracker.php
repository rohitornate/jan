<?php
// Heading
$_['heading_title']       = 'kdtracker';
//添加单号页面
$_['heading_title_add_tracking']='add kdtracker number';
$_['entry_edit_key']='kdtracker number';
$_['error_edit_permission']    = 'warn: You don\'t have permission to edit !';
$_['error_edit_code']          = 'please leave kdtracker number';
//帮助信息
$_['help_info']='supporting information';
$_['help_info_list1']='before you use this plugin,please install VQMOD first';
$_['help_info_list2']='before you use this plugin,you need to apply for the key form the website,';
$_['help_info_list3']='url of website:<a target="_blank" href="http://global.kuaidi.com/openapi.html">http://global.kuaidi.com/openapi.html</a>';
//物流状态
$_['express'] =array(
	'0'=>'In Transit',
	'3'=>'In Transit',
	'4'=>'Pick up',
	'5'=>'Undelivered',
	'6'=>'Delivered',
	'7'=>'Exception',
	'8'=>'Pick up',
	'9'=>'Exception',
	);
$_['express_desc'] =array(
	'0'=>'Your package is on the way to it\'s destination.',
	'3'=>'Your package is on the way to it\'s destination.',
	'4'=>'Your package is out of delivery, please get ready to pick up.',
	'5'=>'Your package was attempted for delivery but failed.',
	'6'=>'Your package was delivered successfully to it\'s destination.',
	'7'=>'Item might undergo unusual shipping condition, this may due to several reasons.Custom hold, undelivered, returned shipment to sender or any shipping exceptions.',
	'8'=>'Your package is out of delivery, please get ready to pick up.',
	'9'=>'Item might undergo unusual shipping condition, this may due to several reasons.Custom hold, undelivered, returned shipment to sender or any shipping exceptions.',
	);
//邮件发送状态
$_['kdtracker_email_entry']='mail status';
$_['email_status'] =array('please choose','when shipping status changed','when package is in transit or delivered','only when package is delivered','notice customers by email','no send');

//物流信息浏览页面
$_['view_company']  ='company';
$_['view_heading_title']  ='view kdtracker information';
$_['view_order_id']  ='order number';
$_['view_tracking_info']  ='kdtracker information';
$_['view_tracking_status']  ='kdtracker status';
$_['view_update_time']  ='kdtracker update time';
// Text
$_['text_kdtracker']       = 'kdtracker';
$_['text_list']       = 'kdtracker list';
$_['text_edit']       = 'edit';
$_['text_module']         = 'module management';
$_['text_enabled']         = 'enabled';
$_['text_disabled']         = 'disabled';
$_['text_success']        = 'The module kdtracker,Setup success!';
$_['text_content_top']    = 'Content Top';
$_['text_content_bottom'] = 'Content Bottom';
$_['text_column_left']    = 'Column Left';
$_['text_column_right']   = 'Column Right';
$_['text_column_empty']   = 'empty';

// Entry
$_['entry_key']          = 'input the key you applied';

//按钮名称
$_['button_view']    = 'view kdtracker information';
$_['button_refrsh']    = 'update status and send emails';
$_['button_edit']    = 'edit kdtracker number';
$_['button_save']    = 'save';
$_['button_cancel']    = 'cancel';
$_['button_remove']    = 'remove';
$_['button_search']    = 'search';
// Error
$_['error_permission']    = 'warn: you don\'t have permission to edit this moudle!';
$_['error_code']          = 'please input the key you apply for';
$_['error_no_choose']          = 'please choose the status you want to send email';

// Entry
$_['entry_store']                = 'Store';
$_['entry_customer']             = 'Customer';
$_['entry_customer_group']       = 'Customer Group';
$_['entry_firstname']            = 'First Name';
$_['entry_lastname']             = 'Last Name';
$_['entry_email']                = 'E-Mail';
$_['entry_telephone']            = 'Telephone';
$_['entry_fax']                  = 'Fax';
$_['entry_address']              = 'Choose Address';
$_['entry_company']              = 'Company';
$_['entry_address_1']            = 'Address 1';
$_['entry_address_2']            = 'Address 2';
$_['entry_city']                 = 'City';
$_['entry_postcode']             = 'Postcode';
$_['entry_country']              = 'Country';
$_['entry_zone']                 = 'Region / State';
$_['entry_zone_code']            = 'Region / State Code';
$_['entry_product']              = 'Choose Product';
$_['entry_option']               = 'Choose Option(s)';
$_['entry_quantity']             = 'Quantity';
$_['entry_to_name']              = 'Recipient\'s Name';
$_['entry_to_email']             = 'Recipient\'s Email';
$_['entry_from_name']            = 'Senders Name';
$_['entry_from_email']           = 'Senders Email';
$_['entry_theme']                = 'Gift Certificate Theme';
$_['entry_message']              = 'Message';
$_['entry_amount']               = 'Amount';
$_['entry_affiliate']            = 'Affiliate';
$_['entry_order_status']         = 'Order Status';
$_['entry_notify']               = 'Notify Customer';
$_['entry_override']             = 'Override';
$_['entry_comment']              = 'Comment';
$_['entry_currency']             = 'Currency';
$_['entry_shipping_method']      = 'Shipping Method';
$_['entry_payment_method']       = 'Payment Method';
$_['entry_coupon']               = 'Coupon';
$_['entry_voucher']              = 'Voucher';
$_['entry_reward']               = 'Reward';
$_['entry_order_id']             = 'Order ID';
$_['entry_total']                = 'Total';
$_['entry_date_added']           = 'Date Added';
$_['entry_date_modified']        = 'Date Modified';

// Column
$_['column_order_id']            = 'Order ID';
$_['column_customer']            = 'Customer';
$_['column_status']              = 'Status';
$_['column_date_added']          = 'Date Added';
$_['column_date_modified']       = 'Date Modified';
$_['column_total']               = 'Total';
$_['column_product']             = 'Product';
$_['column_model']               = 'Model';
$_['column_quantity']            = 'Quantity';
$_['column_price']               = 'Unit Price';
$_['column_comment']             = 'Comment';
$_['column_notify']              = 'Customer Notified';
$_['column_location']            = 'Location';
$_['column_reference']           = 'Reference';
$_['column_action']              = 'Action';
$_['column_weight']              = 'Product weight';
$_['column_kdtracker_number'] = 'kdtracker number';
$_['column_email']             = 'E-mail';
$_['column_telephone']        = 'telephone';


?>