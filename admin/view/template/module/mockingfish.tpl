<?php

echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <style>
        .error {
            margin-top: 3px;
            color: #FF0000;
            display: block;
            font-size: 14px;
            font-weight: normal;
        }

    </style>
    <div id="velsof_plugin">
        <div  class="container-960 fluid  ">
            <!-- Top navbar -->

            <div style="z-index: 0! important; background-color: #3c8dbc;" class="navbar navbar-static-top skin-blue">

                <!-- Brand & save buttons -->
                <ul style="margin-top: 15px;" class="pull-left">
                    <li ><a href="" class="appbrand"><span style="color:white;font-weight: 700;">MockingFish v0.1<span></span></span></a></li>
                </ul>

                <div style="color: white; margin-right:243px; max-width:85%; text-align: center;  floxxat: left;    margssin-left: 350px;    margin-top: 15px;"  class=" layhout">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <?php echo $breadcrumb['separator']; ?><a class="text-center layhout" style="color:white;" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                </div>
                <div style="float: right;margin-top: -27px;margin-right: 8px;" class="topbuttons"><?php if (isset($stores)) { ?>
                    <select class="selectpicker col-md-4" onChange="location = '<?php echo $route; ?>&store_id=' + $(this).val()">
                            <?php foreach ($stores as $store) { ?>
                                <?php if ($store['store_id'] == $_GET['store_id'] && $_GET['store_id'] != 0) { ?>
                        <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                                <?php } else { ?>
                        <option value="<?php echo $store['store_id']; ?>" ><?php echo $store['name']; ?></option>
                                <?php } ?>
                            <?php } ?>
                    </select>
                    <?php } ?> 
                    <a onClick="saveAndStay()" class="btn btn-default"><span><?php echo $button_save_and_stay; ?></span></a>&nbsp;&nbsp;&nbsp;<a onClick="submitForm();" class="btn btn-default"><span><?php echo $button_save; ?></span></a>&nbsp;&nbsp;&nbsp;<a onClick="location = '<?php echo $cancel; ?>';" class="btn btn-default"><span><?php echo $button_cancel; ?></span></a>
                    <span class="gritter-add-primary btn btn-default btn-block hidden">For notifications on saving</span>
                </div>
            </div>
            <!-- Top navbar END -->

            <div id="wrapper">
                <!-- Sidebar Menu -->
                <div style="margin-top: -20px !important;"class="row">
                    <div style="width:100% !important;" class="col-md-6">
                        <!-- Scrollable menu wrapper with Maximum height -->
                        <div class="nav-tabs-custom" >
                            <!-- Regular Size Menu -->
                            <ul class="nav nav-tabs">
                                <!-- Menu Regular Item -->

                                <li class="glyphicons settings active"><a href="#tab_general_settings" data-toggle="tab"><i></i><span><?php echo $text_general; ?></span></a></li>
                            </ul>

                            <div class="clearfix"></div>
                            <div class="separator bottom"></div>
                            <!-- Sidebar Stats Widgets -->
                            <!-- // Sidebar Stats Widgets END -->

                            <!-- Menu Position Change -->

                            <!-- Menu Position Change Ends -->

                            <!-- // Menu Position Change END -->                      


                            <!-- // Scrollable Menu wrapper with Maximum Height END -->


                            <!-- // Sidebar Menu END -->

                            <!-- Content -->


                            <?php if ($error_warning) { ?>
                            <div class="alert alert-error" style="background: #bd362f;
                                 color: #fff;
                                 border-color: #bd362f;
                                 margin-top: 11px;
                                 display:block;">
                                <button class="close" data-dismiss="alert" type="button">-</button>
                                <strong>Warning!</strong>
                                    <?php echo $error_warning; ?>
                            </div>
                            <?php } ?>

                            <div class="successSave"></div> 

                            <div class="bssox"> 
                                <!-- 100% -->

                                <!-- 960px -->
                                <div class="content tabs" style="padding:0 50px 35px;">
                                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

                                        <div class="layout">
                                            <div class="tab-content">
                                                <!---------------------------------- General ---------------------------------->

                                                <div id="tab_general_settings" class="tab-pane active">
                                                    <div style="margin-top:12px;" class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h3 class="panel-title"><i class="fa fa-wrench"></i> <?php echo $text_general; ?></h3>
                                                        </div>
                                                        <div class="blfock">
                                                            <table style="border-top:none !important;text-align:right;" class="table table-hover">
                                                                <tr>
                                                                    <td  class="left-td" >

                                                                        <span class="control-label"><?php echo $text_general_enable; ?></span>                                                                
                                                                        <i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $general_enable_tooltip; ?>"></i></td>
                                                                    <td class="right-td">
                                                                        <!--<input type="hidden" value="0" name="mockingfish_status" />-->
                                                                        <?php if (isset($mockingfish_status) && $mockingfish_status == 1) { ?>
                                                                        <input <?php
                                                                            if ($IE7 == true) {
                                                                                echo'class="onoffswitch-checkbox"';
                                                                            } else {
                                                                                echo'class="onoffswitch-checkbox"';
                                                                            }
                                                                            ?> type="checkbox" value="1" name="mockingfish_status" id="checkout_enable" checked="checked" />


                                                                        <label class="onoffswitch-label" for="checkout_enable">  
                                                                            <div class="onoffswitch-inner">  
                                                                                <div class="onoffswitch-active"><div class="onoffswitch-switch">ON</div></div>  
                                                                                <div class="onoffswitch-inactive"><div class="onoffswitch-switch">OFF</div></div>  
                                                                            </div>  
                                                                        </label> 
                                                                        <?php } else { ?>


                                                                        <input <?php
                                                                            if ($IE7 == true) {
                                                                                echo'class="onoffswitch-checkbox"';
                                                                            } else {
                                                                                echo'class="onoffswitch-checkbox"';
                                                                            }
                                                                            ?> type="checkbox" value="1" name="mockingfish_status" id="checkout_enable" />

                                                                        <label class="onoffswitch-label" for="checkout_enable">  
                                                                            <div class="onoffswitch-inner">  
                                                                                <div class="onoffswitch-active"><div class="onoffswitch-switch">ON</div></div>  
                                                                                <div class="onoffswitch-inactive"><div class="onoffswitch-switch">OFF</div></div>  
                                                                            </div>  
                                                                        </label> 
                                                                        <?php } ?>                    

                                                                    </td>

                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                                <td class="left-td">
                                                                    <span class="control-label">
                                                                        <span class="required" style="color:red;">*</span>
                                                                        <?php echo $text_general_mockinfish_code ?></span>
                                                                </td>
                                                                <td class="right-td"> 
                                                                    <textarea name="mockingfish_code" cols="40" rows="5" id="mockingfish_code"><?php echo $mockingfish_code; ?></textarea>
                                                                    <?php if ($error_code) { ?>
                                                                    <span class="error" id="err"><?php echo $error_code; ?></span>
                                                                    <?php } ?>
                                                                    <span class="error" id="code_error"></span>
                                                                </td>

                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<?php echo $footer; ?>
<script type="text/javascript">

    function save() {
        $.ajax({
            type: "POST",
            url: $('#form').attr('action') + '&save',
            data: $('#form').serialize(),
            beforeSend: function () {
                $('#form').fadeTo('slow', 0.2);
            },
            complete: function () {
                $('#form').fadeTo('slow', 1);
            },
            success: function (response) {
                $('.gritter-add-primary').trigger('click');
            }
        });
    }
    function saveAndStay() {
        var error = validate_data();
        if (!error) {
            $.ajax({
                type: "POST",
                url: 'index.php?route=module/mockingfish/validateSaveAndStay&token=<?php echo $token; ?>',
                data: $('#form').serialize(),
                datatype: 'json',
                beforeSend: function () {
                    $('#form').fadeTo('slow', 0.5);
                },
                complete: function () {
                    $('#form').fadeTo('slow', 1);
                },
                success: function (json) {
                    obj = jQuery.parseJSON(json);

                    if (obj.error == 0)
                    {
                        $.ajax({
                            type: "POST",
                            url: $('#form').attr('action') + '&save',
                            data: $('#form').serialize(),
                            beforeSend: function () {
                                $('#form').fadeTo('slow', 0.2);
                            },
                            complete: function () {
                                $('#form').fadeTo('slow', 1);
                            },
                            success: function (response) {
                                console.log(response);
                                $('.gritter-add-primary').trigger('click');
                            }
                        });
                    } else
                    {

                        $.gritter.add({
                            title: 'Warning!',
                            text: obj.error,
                            sticky: false,
                            class_name: 'gritter-warning',
                            time: '8000'
                        });

                    }
                }
            });
        } else {
            $.gritter.add({
                title: 'Warning!',
                text: 'Please provide required information with valid data.',
                sticky: false,
                class_name: 'gritter-warning',
                time: '8000'
            });
        }
    }
    function validate_data() {
        $("#code_error").html('');
        var error = false;
        var element;

        element = $('input[name="mockingfish_status"]:checked').val();
        if (element == 1) {

            if ($("#mockingfish_code").val() == '' || $("#mockingfish_code").val() == ' ') {
                error = true;
                $('#code_error').html('Code Required');
            }
        }
        return error;
    }

    function submitForm() {
        $('#code-error').html('');
        var error = validate_data();

        if (!error) {
            $('#form').submit();
        } else {
            $.gritter.add({
                title: 'Warning!',
                text: 'Please provide required information with valid data.',
                sticky: false,
                class_name: 'gritter-warning',
                time: '8000'
            });
        }

    }
</script> 
