<?php
// Heading
$_['heading_title']       = '快递网查询';
//添加单号页面
$_['heading_title_add_tracking']='添加物流单号';
$_['entry_edit_key']='物流单号';
$_['error_edit_permission']    = '警告: 你没有权限编辑物流号!';
$_['error_edit_code']          = '请填写物流号';
$_['error_no_choose']          = '请选择邮件发送的状态';

//帮助信息
$_['help_info']='帮助信息';
$_['help_info_list1']='使用本插件前，请先安装VQMOD';
$_['help_info_list2']='使用本插件前，需要先向快递网申请API的授权KEY';
$_['help_info_list3']='<a target="_blank" href="http://global.kuaidi.com/openapi.html">http://global.kuaidi.com/openapi.html</a>';
//物流状态
$_['express'] =array(
	'0'=>'暂无结果',
	'3'=>'运输中',
	'4'=>'揽件',
	'5'=>'未送达',
	'6'=>'签收',
	'7'=>'退签',
	'8'=>'派件',
	'9'=>'退回',
	);
$_['express_desc'] =array(
	'0'=>'物流单号暂无结果',
	'3'=>'快递处于运输过程中',
	'4'=>'快递已被快递公司揽收',
	'5'=>'快递邮寄过程中出现问题',
	'6'=>'收件人已签收',
	'7'=>'快递因被拒签、超区等原因退回',
	'8'=>'快递员正在同城派件',
	'9'=>'货物处于退回途中',
	);
//邮件发送状态
$_['kdtracker_email_entry']='邮件发送状态';
$_['email_status'] =array('请选择','当物流状态发生变化','当包裹在途或签收','只有当包裹签收','通过邮件通知顾客','不发送');

//物流信息浏览页面
$_['view_company']  ='物流名称';
$_['view_heading_title']  ='查看物流信息';
$_['view_order_id']  ='订单号';
$_['view_tracking_info']  ='物流信息';
$_['view_tracking_status']  ='物流状态';
$_['view_update_time']  ='物流更新时间';
// Text
$_['text_kdtracker']       = '物流管理';
$_['text_list']       = '订单物流列表';
$_['text_edit']       = '编辑';
$_['text_module']         = '模块管理';
$_['text_enabled']         = '可用';
$_['text_disabled']         = '不可用';
$_['text_success']        = '快递网查询插件模块,设置成功!';
$_['text_content_top']    = 'Content Top';
$_['text_content_bottom'] = 'Content Bottom';
$_['text_column_left']    = 'Column Left';
$_['text_column_right']   = 'Column Right';
$_['text_column_empty']   = '无物流号';

// Entry
$_['entry_key']          = '输入您申请的秘钥';
$_['entry_code']        = '快递公司代码:';
$_['entry_name']      = '公司名称:';
$_['entry_status']        = '是否可用:';
$_['entry_sort_order']    = '排序:';


//按钮名称
$_['button_view']    = '浏览物流信息';
$_['button_edit']    = '编辑物流单号';
$_['button_refrsh']    = '更新状态并发送邮件';
$_['button_save']    = '保存';
$_['button_cancel']    = '取消';
$_['button_remove']    = '移出';
$_['button_add_module']    = '添加快递代码和公司名称:';
$_['button_search']    = '搜索';
// Error
$_['error_permission']    = '警告: 你没有权限修改此快递网查询插件模块!';
$_['error_code']          = '请填写在快递网申请的授权KEY';


// Entry
$_['entry_store']             = '商店：';
$_['entry_customer']          = '客户：';
$_['entry_customer_group']    = '客户组：';
$_['entry_firstname']         = '名字：';
$_['entry_lastname']          = '姓氏：';
$_['entry_email']             = 'E-Mail：';
$_['entry_telephone']         = '电话：';
$_['entry_fax']               = '传真：';
$_['entry_address']           = '选择地址：';
$_['entry_company']           = '公司名称：';
$_['entry_address_1']         = '地址 1：';
$_['entry_address_2']         = '地址 2：';
$_['entry_city']              = '城市：';
$_['entry_postcode']          = '邮编：';
$_['entry_country']           = '国家：';
$_['entry_zone']              = '地区 / 省：';
$_['entry_zone_code']         = '地区 / 省代码：';
$_['entry_product']           = '选择商品：';
$_['entry_option']            = '商品选项：';
$_['entry_quantity']          = '数量：';
$_['entry_to_name']           = '收券人姓名：';
$_['entry_to_email']          = '收券人Email：';
$_['entry_from_name']         = '发券人姓名：';
$_['entry_from_email']        = '发券人Email：';
$_['entry_theme']             = '礼品券主题：';
$_['entry_message']           = '礼券信息：';
$_['entry_amount']            = '礼品券额：';
$_['entry_affiliate']         = '加盟会员：';
$_['entry_order_status']      = '状态：';
$_['entry_notify']            = '通知客户：';
$_['entry_comment']           = '订单附言：';
$_['entry_shipping_method']   = '配送方式：';
$_['entry_payment_method']    = '支付方式：';
$_['entry_coupon']            = '折扣券：';
$_['entry_voucher']           = '礼品券：';
$_['entry_reward']            = '积分：';
$_['entry_order_id']                          = '订单 ID';
$_['entry_total']                             = '总计';
$_['entry_date_added']                        = '添加日期';
$_['entry_date_modified']                     = '修改日期';

// Column
$_['column_order_id']         = '订单号';
$_['column_customer']         = '客户名称';
$_['column_status']           = '状态';
$_['column_date_added']       = '生成日期';
$_['column_date_modified']    = '修改日期';
$_['column_total']            = '总计';
$_['column_product']          = '商品名称';
$_['column_model']            = '型号';
$_['column_quantity']         = '数量';
$_['column_price']            = '价格';
$_['column_comment']          = '订单附言';
$_['column_notify']           = '通知客户';
$_['column_location']         = '位置';
$_['column_reference']        = '参考';
$_['column_action']           = '管理';
$_['column_weight']           = '商品重量';
$_['column_kdtracker_number'] = '物流号';
$_['column_email']             = '邮箱';
$_['column_telephone']        = '手机号';


?>