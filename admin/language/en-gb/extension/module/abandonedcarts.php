<?php
$_['text_module']               = 'Modules';
$_['heading_title']             = 'AbandonedCarts';
// Module strings
$_['tab_controlpanel']          = 'Control Panel';
$_['tab_abandonedcarts']        = 'Abandoned Carts';
$_['tab_templates']             = 'Mail Template';
$_['tab_analytics']             = 'Statistics';
$_['tab_scheduled_tasks']       = 'Scheduled Tasks';
$_['tab_coupons']               = 'Coupons';
$_['tab_givencoupons']          = 'Given Coupons';
$_['tab_usedcoupons']           = 'Used Coupons';
$_['tab_support']               = 'Support';
$_['btn_savechanges']           = 'Save Changes';
$_['btn_cancel']                = 'Cancel';
$_['text_success']              = 'Success: You have modified the module Abandoned Carts!';
$_['text_default']		        = '(Default)';
$_['text_status']               = 'Extension Status:';
$_['text_status_help']          = 'This is the master switch of the module. Use it to <strong>enable</strong> or <strong>disable</strong> the extension.';
$_['text_dateformat']           = 'Date Format:';
$_['text_dateformat_help']      = 'From here you can choose how date format for the end date of coupon validity to be displayed in the emails. If you are not using discount codes, you can disregard this option.';
$_['text_applytaxes']           = 'Apply Taxes: (!)';
$_['text_applytaxes_help']      = 'Enable this option to apply taxes (if you use taxes) for the products in the emails. If you do not have taxes on your products, then toggling this option will make no difference for you.<br /><br /><strong>NOTE:</strong> This is an experimental feature.';
$_['text_expired_coupons']      = 'Remove Expired Coupons:';
$_['text_expired_coupons_help'] = 'Remove all expired coupons created from the module.<br /><br /><strong>NOTE:</strong> It does not matter if the coupons were used or not. All expired coupons which were generated from the module will be removed.';
$_['btn_clear_expired_coupons'] = 'Clean up the Coupons!';
$_['text_send_bcc']             = 'Send BCC to store owner:';
$_['text_send_bcc_help']        = 'Enabling this option will add your store main email as BCC recepient';
$_['text_sched_tasks']          = 'Scheduled Tasks:';
$_['text_sched_tasks_help']     = 'When activated, this function will send automatically emails to the customers who abandoned their carts.';
$_['text_sched_type']           = 'Type:';
$_['text_sched_type_help']      = 'Choose the type of the schedule.';
$_['select_fixed_dates']        = 'Fixed dates';
$_['select_periodic_date']      = 'Periodic';
$_['text_schedule']             = 'Schedule:';
$_['text_schedule_help']        = 'Enter the desired schedule for the reminders. You will see the options for the fixed dates functionality or the periodic functionality depending on the option above.<br /><br/><strong>IMPORTANT:</strong> Keep in mind that the scheduling time is global variable for all stores in your OpenCart installation.';
$_['text_date']                 = 'Date...';
$_['text_time']                 = 'Time...';
$_['btn_add']                   = 'Add';
$_['alert_date_time']           = 'Please fill date and time!';
$_['alert_remove_coupons']      = 'The expired coupons were removed! The page will be reloaded now.';
$_['confirm_remove_coupons']    = 'Are you sure that you want to remove all expired coupons?';
$_['confirm_template_remove']   = 'Are you sure you want to remove';
$_['btn_add_template']          = 'Add New Template';
$_['text_template']             = 'Template';
$_['text_status_small']         = 'status:';
$_['text_name_small']           = 'name:';
$_['text_template_help']        = 'Enable or disable the selected mail template configuration.';
$_['text_name_help']            = 'Set the name of the template which will show up on the left column.';
$_['text_message_delay']        = 'Send After:';
$_['text_message_delay_help']   = 'Define after how many days to send the email.<br /><br /><strong>NOTE: </strong>If you set the delay to 0, the email will be sent immediately after you run the cron job and if the conditions are met.';
$_['text_days_small']           = 'days';
$_['text_type_of_discount']     = 'Type of Discount:';
$_['text_type_of_discount_help']    = 'If you choose the option \'No discount\', you will have to remove the following codes from the mail template: {discount_code}, {discount_value}, {total_amount} and {date_end}.';
$_['text_percentage']           = 'Percentage';
$_['text_fixed_amount']         = 'Fixed Amount';
$_['text_no_discount']          = 'No Discount';
$_['text_discount']             = 'Discount:';
$_['text_discount_help']        = 'Enter the discount percent or value.';
$_['text_total_amount']         = 'Total amount:';
$_['text_total_amount_help']    = 'The total amount that must reached before the coupon is valid';
$_['text_discount_free_shipping']       = 'Free Shipping:';
$_['text_discount_free_shipping_help']  = 'Enable/disable free shipping for the generated coupon.';
$_['text_discount_customer_login']      = 'Customer Login:';
$_['text_discount_customer_login_help'] = 'Customer must be logged in to use the coupon.<br /><br /><strong>NOTE:</strong> The module can also send emails to guest customers (if email is provided). Keep in mind that if you set this option to "Yes" and there are guest customer records, the generated coupons will not work for them.';
$_['text_discount_validity']    = 'Discount Validity:';
$_['text_discount_validity_help']   = 'Define how many days the discount code will be active after sending the reminder.';
$_['text_apply_discount']       = 'Apply the Discount for:';
$_['text_apply_discount_help']  = 'Choose the products that the discount will apply to.';
$_['text_all_products']         = 'All products in the store';
$_['text_specific_products']    = 'Products in the cart';
$_['text_product_dimensions']   = 'Product Image Dimensions:';
$_['text_product_dimens_help']  = 'Define the width the height of the product images in the email which the customers will receive from this template.';
$_['text_width']                = 'Width:';
$_['text_height']               = 'Height:';
$_['text_message_customer']     = 'Message to the Customer:';
$_['text_message_customer_help']    = 'Use can the following shortcodes: <br /><br /><strong>Subject:</strong><br />{firstname} - First name<br />{lastname} - Last name<br /><br /><strong>Template:</strong><br />{firstname} - First name<br />{lastname} - Last name<br />{cart_content} - Cart content<br />{discount_code} - Discount code<br />{discount_value} - Discount code<br />{total_amount} - Total amount<br />{date_end} - End date of coupon validity<br/>{unsubscribe_link} - Link for unsubscribe<br />{restore_link} - Restore cart link<br /><br />*** Keep in mind that {restore_link} will work only if the option "Remove the abandoned cart record after the email is sent." is disabled.';
$_['text_template_sample']      = 'Template Subject';
$_['column_text_template']      = '<p>Hello <strong>{firstname} {lastname}</strong>,</p><p>We noticed that during you last visit to our store you placed the following products to you shopping cart and proceeded through checkout, but for some reason you did not complete the order:</p>{cart_content}<p>We do not know why you decided not to purchase this time, but we want to give you a special discount code - <strong>{discount_code}</strong> - which gives you <strong>{discount_value}% OFF</strong>. The code applies after you spent <strong>${total_amount}</strong>. This promotion is just for you and expires on <strong>{date_end}</strong>.</p><p>Kind Regards,</p><p>YourStore<br /><a href="http://www.example.com" target="_blank">http://www.example.com</a></p>';
$_['text_remove_empty_records'] = 'Remove Empty Records:';
$_['text_remove_empty_help']    = 'When the CRON job is executed, all empty records for the given delay in the template will be removed.';
$_['text_additional_options']   = 'Additional Options:';
$_['text_additional_options_help']  = 'Here you can find the additional options for the emails.';
$_['text_remove_email_after_sending']   = 'Remove the abandoned cart record after the email is sent.<br /><br />This option is useful for the cases when the store owners want to use the CRON job of the module more than once. This will ensure that the customers will not receive the same email more than once.';
$_['text_type']                 = 'Type';
$_['text_count']                = 'Count';
$_['text_coupons']              = 'Coupons';
$_['text_abandoned_carts']      = 'Abandoned carts';
$_['text_used_coupons']         = 'Used coupons';
$_['text_notused_coupons']      = 'Not used coupons';
$_['text_total_coupons']        = 'Total coupons:';
$_['text_registerd_customers']  = 'Registered customers';
$_['text_guest_customers']      = 'Guest customers';
$_['text_total_carts']          = 'Total abandoned carts:';
$_['text_total_carts_2']        = 'Total carts';
$_['text_last_visited_carts']   = 'Last visited pages';
$_['column_coupon_name']        = 'Coupon Name';
$_['column_code']               = 'Code';
$_['column_discount']           = 'Discount';
$_['column_date_start']         = 'Date Start';
$_['column_date_end']           = 'Date End';
$_['column_status']             = 'Status';
$_['column_date_added']         = 'Date Added';
$_['text_no_results']           = 'No results!';
$_['text_default_ac_tab_name']  = 'Default (not notified)';
$_['text_already_notified_tab_name']    = 'Already notified (at least once)';
$_['text_ordered_tab_name']     = 'Ordered';
$_['text_ID_number']            = 'ID';
$_['text_customer_info']        = 'Customer Info';
$_['text_shopping_cart_info']   = 'Shopping Cart';
$_['text_date_time_info']       = 'Date & Time';
$_['text_last_visited_page']    = 'Last Visited Page';
$_['text_ip_info']              = 'IP';
$_['text_status_actions']       = 'Status & Actons';
$_['text_not_provided']         = '(not provided)';
$_['text_guest_label']          = 'Guest';
$_['text_language_label']       = 'Language:';
$_['text_guest_customer_label'] = 'Guest customer';
$_['text_registed_customer_label']  = 'Existing customer';
$_['text_customer_more_helper'] = 'Click to view more about the customer';
$_['text_more_word']            = 'More';
$_['text_check_ip_location']    = 'Check IP';
$_['text_send_reminder_action'] = 'Send reminder';
$_['text_remove_button']        = 'Remove';
$_['text_ac_status']            = 'Status:';
$_['text_notified']             = 'Notified';
$_['text_ordered']              = 'Ordered';
$_['text_yes']                  = 'Yes';
$_['text_no']                   = 'No';
$_['text_no_records']           = 'There are no records yet.';
$_['text_remove_all']           = 'Remove all';
$_['text_remove_all_empty_records'] = 'Remove all empty records';
$_['text_you_cannot_send_helper']   = 'You cannot send message to a customer with no email or already ordered.';
$_['text_confirm_remove_all_records']   = 'Are you sure that you want to remove all records from this store?';
$_['text_confirm_remove_all_empty_records'] = 'Are you sure that you want to remove all empty records (with no emails) from this store?';
$_['text_learn_more_user_location_helper']  = 'Click here to learn more about customer\'s location';
$_['text_first_visit']          = 'First Visit:';
$_['text_last_visit']           = 'Last Visit:';
$_['text_total_time_spent']     = 'Time Spent:';
$_['text_confirm_remove_entry'] = 'Are you sure you want to remove this entry?';
$_['text_close']                = 'Close';
$_['text_send_mail']            = 'Send mail!';
$_['text_send_reminder']        = 'Send reminder';
$_['text_checkout_fixes']       = 'Third-party Checkout Fix: (!)';
$_['text_checkout_fixes_help']  = 'This feature is useful for checkout modules, which have special success pages. Those pages do not contain full information about the orders and they prevent AbandonedCarts from removing the abandoned record from the module, which can result in some of your customers receiving emails for abandoned carts, even if they have placed their order. Setting this feature to "Enabled" should resolve those issues.<br /><br /><strong>NOTE:</strong> This is an experimental feature.';
$_['text_dashboard_widget']     = 'Show Widget in the Shop\'s Dashboard:';
$_['text_dashboard_widget_help']= 'Shows a widget, similar to the default ones in the dashboard page, displaying the number of the abandoned carts in your store.';
$_['text_menu_widget']          = 'Show Link in the OpenCart\'s Main Menu:';
$_['text_menu_widget_help']     = 'Shows a link to the module in the main OpenCart admin menu. It also displays the number of the abandoned carts in your store.';
$_['text_total']                = 'Total:';
$_['btn_text_cron']             = 'Test CRON support';
$_['text_test_cron']            = 'CRON availability:';
$_['text_test_cron_help']       = 'Click here to check if the CRON service is supported on your server.';
$_['text_module_view_settings'] = 'Module View Settings:';
$_['text_experimental_settings']= 'Experimental Settings:';
$_['text_main_settings']        = 'Main Settings:';
$_['text_scheduling_settings']  = 'Scheduling Settings:';
$_['text_cron_faq']             = 'Frequently Asked Questions:';
// Helpers
$_['helper_id']                 = 'Every record has unique ID number.';
$_['helper_customer']           = 'This column shows you information about the customers with abandoned carts.';
$_['helper_shopping_cart']      = 'This column displays the contents of the abandoned carts from your customers.';
$_['helper_date_time_info']     = 'When the customers visited your store and how long they have browsed it.';
$_['helper_last_page']          = 'From here you can see on which pages the customers are leaving your store.';
$_['helper_ip_info']            = 'Here we collect the IP addresses of the customers.';
$_['helper_actions']            = 'You can send messages to the customers or delete the records.';
// Licensing
$_['text_your_license']         = 'Your License';
$_['text_please_enter_the_code']= 'Please enter your product purchase license code:';
$_['text_activate_license']     = 'Activate License';
$_['text_not_having_a_license'] = 'Not having a code? Get it from here.';
$_['text_license_holder']       = 'License Holder';
$_['text_registered_domains']   = 'Registered domains';
$_['text_expires_on']           = 'License Expires on';
$_['text_valid_license']        = 'VALID LICENSE';
$_['text_manage']               = 'manage';
$_['text_get_support']          = 'Get Support';
$_['text_community']            = 'Community';
$_['text_ask_our_community']    = 'We have a big community. You are free to ask it about your issue on the iSenseLabs forum.';
$_['text_browse_forums']        = 'Browse forums';
$_['text_tickets']              = 'Tickets';
$_['text_open_a_ticket']        = 'Want to comminicate one-to-one with our tech people? Then open a support ticket.';
$_['text_open_ticket_for_real'] = 'Open a ticket';
$_['text_pre_sale']             = 'Pre-sale';
$_['text_pre_sale_text']        = 'Have a brilliant idea for your webstore? Our team of top-notch developers can make it real.';
$_['text_bump_the_sales']       = 'Bump the sales';
// Strings for emails
$_['text_product']	            = 'Product';
$_['text_price']	            = 'Price';
$_['text_qty']	                = 'Quantity';
$_['text_unsubscribe']          = 'Unsubscribe';
// Custom alerts
$_['alert_invalid_email']       = 'The email entered by the customer is invalid.';
// Very custom
$_['text_close_text']           = 'Close';
// CRON
$_['text_sched_notify']         = 'Receive Notification Email:';
$_['text_sched_notify_help']    = 'An email with the number of sent emails will be sent to the email address set in the store\'s settings.';
$_['heading_what_is_cron']      = 'What is CRON?';
$_['heading_how_to_setup_cron'] = 'How to set up a CRON job?';
$_['heading_cron_not_appearing']= 'I did setup a CRON job, but it did not appear? Why?';
$_['heading_cron_no_support']   = 'My server does not support CRON jobs. What should I do?';
$_['heading_cron_modal']        = 'Schedule options & CRON jobs';
$_['cron_what_is_cron']         = 'If you want to use the scheduling features, your server has to support <strong>CRON</strong> functions.<br /><br />The <strong>CRON</strong> daemon is a long running process that executes commands at specific dates and times. By clicking on the button "<strong>Test CRON support</strong>", you can check if your server supports <strong>CRON</strong> commands. If you have other running CRON jobs and the service is enabled, you should be able to see them in the "Current CRON jobs" list, which is displayed in the newly opened popup.';
$_['cron_setup_text']           = 'You just have to set up the settings above and click on the "Save Changes" button. The page will refresh and you should be able to see the CRON job under the "Current CRON jobs" list, which is displayed in the "Test CRON support" popup.<br /><br /><strong>NOTE:</strong> Keep in mind that you should have at least one active mail template in order for the module to be able to send emails to your customers.';
$_['cron_does_not_support']     = 'If your server <strong>does</strong> support CRON jobs, but after you set up one it does not show up in the "Current CRON jobs" list, this means that the automatic creation of CRON commands is disabled from your hosting provider. In that case, you can use the following command string:';
$_['cron_does_not_support_2']   = 'The script above will be executed <strong>every day at 00:00</strong>. You can change it depending on your preferences.';
$_['cron_support_external']     = 'If your server does not support cron jobs, you can try using services such as <strong>easycron.com</strong>, <strong>setcronjob.com</strong> or others which can provide you this feature.<br /><br />In order to do that, you have to register in the selected service and use this URL for execution:';
$_['cron_support_external_2']   = 'You should also enable the <strong>Scheduled Tasks</strong> feature above and set the <strong>Delay</strong> option in each template.';
$_['heading_cron_more_than_once']   = 'How can I setup the CRON to be executed more than once a day?';
$_['cron_more_than_once']       = 'This means that you have noticed that you can currently set the <strong>CRON</strong> job to be executed only <strong>once</strong> a day. This is because in our experience, most of the customers are getting frustrated if they get an email more than once.<br /><br />As you know, our templates are with a set <strong>Delay</strong>, which means that when the CRON is executing, it is checking for all orders which are matching the delay in the given template. With that said, if the <strong>CRON</strong> is executed more than once, that check will be executed also more than once, which will therefore result in sending emails more than once.<br /><br /><strong>Still</strong>, if you still want to send emails more than once a day, you get around that quite easily. What you have to do is:<br /><br /><ol><li>Set the <strong>CRON</strong> command manually in your <strong>crontab</strong>, depending on how often you want it to be executed.</li><li>Set <strong>just one</strong> email template with delay of <strong>0</strong> days.</li><li>This is it! You are good to go!</li></ol>As you can see, you can send emails more than once a day with no coding whatsoever. The only limitation would be that you will only have just one template that you can use.';
$_['cron_no_support_helper']    = 'If your server does not support CRON jobs, scroll down to the FAQ section to see the alternatives.';
$_['text_cron_status']          = 'CRON job status:';
$_['text_cron_current_jobs']    = 'Current CRON jobs:';
$_['text_shell_exec_function']  = 'shell_exec() function status:';
$_['text_cron_system']          = 'System information:';
$_['text_cron_enabled']         = 'Enabled';
$_['text_cron_disabled']        = 'Disabled';
$_['text_cron_writable']        = 'Writable';
$_['text_cron_unwritable']      = 'Unwritable';
// 2.3 
$_['widget_2_3_x_text']         = '<strong>IMPORTANT</strong>: This feature is now located in Extensions -> Extensions -> Dashboard. There you can find the extension "Total Abandoned Carts" and enable it.';
$_['text_restorecart']          = 'View Cart';