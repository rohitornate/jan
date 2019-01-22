<table class="table">
   <tr>
    <td class="col-xs-3">
      <h5><strong><?php echo $text_settings; ?></strong></h5>
      <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_settings_help; ?></span>
    </td>
    <td>
      <div class="col-xs-4">
          <select name="notifywhenavailable[Enabled]" class="NotifyWhenAvailableEnabled form-control">
              <option value="yes" <?php echo (!empty($nwa_data['notifywhenavailable']['Enabled']) && $nwa_data['notifywhenavailable']['Enabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
             <option value="no" <?php echo (empty($nwa_data['notifywhenavailable']['Enabled']) || $nwa_data['notifywhenavailable']['Enabled'] == 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
          </select>
      </div>
   </td>
  </tr>
	<tr>
      <td class="col-xs-3">
		<h5><strong><?php echo $text_scheduled; ?></strong></h5>
		<span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_scheduled_help; ?></span>
      </td>
      <td class="col-xs-9">
            <div class="col-xs-12">
                <select id="ScheduleToggle" name="notifywhenavailable[ScheduleEnabled]" class="form-control" style="width:31% !important;">
                  <option value="yes" <?php echo (!empty($nwa_data['notifywhenavailable']['ScheduleEnabled']) && $nwa_data['notifywhenavailable']['ScheduleEnabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                  <option value="no"  <?php echo (empty($nwa_data['notifywhenavailable']['ScheduleEnabled']) || $nwa_data['notifywhenavailable']['ScheduleEnabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
                </select>
				<br />                
                <div class="well well-sm">
                    <i class="icon-question-sign"></i> <?php echo $text_scheduled_help_sec; ?>
                </div>
            </div>
       </td>
    </tr>
</table>
<table class="table cronForm" id="mainSettings" style="border-top: 1px solid #ddd;
<? echo (!empty($nwa_data['notifywhenavailable']['ScheduleEnabled']) && $nwa_data['notifywhenavailable']['ScheduleEnabled'] == 'yes') ? '' : 'display:none;'; ?>;">
   <tr class="nwaCron">
     <td><h5><strong><?php echo $text_receive_notifications; ?></strong></h5><span class="help"><?php echo $text_receive_notifications_help; ?></span></td>
     <td>
     	<div class="col-md-4">
            <select name="notifywhenavailable[CronNotify]" class="form-control">
                <option value="yes" <?php echo (!empty($nwa_data['notifywhenavailable']['CronNotify']) && $nwa_data['notifywhenavailable']['CronNotify'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                <option value="no"  <?php echo (empty($nwa_data['notifywhenavailable']['CronNotify']) || $nwa_data['notifywhenavailable']['CronNotify']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
            </select>
        </div>
     </td>
  </tr>
  <tr>
    <td class="col-xs-3">
    	<h5><span class="required">*</span> <strong><?php echo $text_type; ?></strong></h5>
        <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_type_help; ?></span>
    </td>
    <td class="col-xs-9">
    	<div class="col-md-4">
          <select name="notifywhenavailable[ScheduleType]" class="form-control">
            <option value="F" <?php if(!empty($nwa_data['notifywhenavailable']['ScheduleType']) && $nwa_data['notifywhenavailable']['ScheduleType'] == 'F') echo "selected" ?>><?php echo $text_fixed; ?></option>
            <option value="P" <?php if(!empty($nwa_data['notifywhenavailable']['ScheduleType']) && $nwa_data['notifywhenavailable']['ScheduleType'] == 'P') echo "selected" ?>><?php echo $text_periodic; ?></option>
          </select>
		</div>
	</td>
  </tr>
  <tr>
    <td class="col-xs-3">
    	<h5><span class="required">*</span> <strong><?php echo $text_schedule; ?></strong></h5>
        <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_schedule_help; ?></span>
    </td>
    <td class="col-xs-9">
	  <div class="col-md-6">
            <div id="FixedDateOptions" class="row">
                <div class="col-md-5">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                       <input type="text" id="FixedDate" class="form-control" data-date-format="DD.MM.YYYY" value="" placeholder="Date..." readonly />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="input-group">
                       <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                    <input type="text" id="FixedDateTime" class="timepicker form-control" data-date-format="HH:mm" placeholder="Time..." readonly />
                    </div>
                </div>
                <div class="col-md-2">
                    <button class="btn addDate"><i class="fa fa-plus"></i> <?php echo $text_add; ?></button>
                </div>
            <div style="height:10px;clear:both;"></div>
            <div class="scrollbox dateList">
                <?php if(isset($nwa_data['notifywhenavailable']['FixedDates'])) { 
                        foreach($nwa_data['notifywhenavailable']['FixedDates'] as $date) {?>
                <div id="date<?php  $id = explode( '/', $date); $id=explode('.' , $id[0]); echo $id[0].$id[1].$id[2]; ?>"><?php echo $date ?> 
                <i class="fa fa-minus-circle removeIcon"></i>
                <input type="hidden" name="notifywhenavailable[FixedDates][]" value="<?php echo $date ?>" />
                </div>
                        <?php } } ?> 
             </div>
          </div>
          <div id="PeriodicOptions">
            <div id="CronSelector"></div>
            <input type="hidden" id="abCron" name="notifywhenavailable[PeriodicCronValue]" value="">
          </div>
      </div>
    </td>
  </tr>
  <tr>
    <td class="col-xs-2" style="vertical-align:top;padding-top:20px;">
      <a id="TestCronAvailablity" class="btn btn-warning cronBtn"><i class="fa fa-certificate"></i><?php echo $text_test_cron; ?> </a>
      <br /><br /><span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_test_cron_help; ?></span>
	</td>
	<td class="col-xs-10">
	  <div class="well" style="margin-left: 15px;">
      	<i class="fa fa-question-circle"></i><?php echo $text_test_cron_help_sec; ?> 
        <br /><br /><?php echo $text_test_cron_help_third; ?> <br /><br />
        <a id="MyHostDoesNotHaveCron" class="btn btn-info btn-mini genericCronBtn" data-toggle="modal" data-target="#genericCronModal"><i class="fa fa-info-circle"></i>&nbsp;&nbsp;<?php echo $text_cron_disabled; ?></a>
      </div>  
    </td> 
  </tr>
</table>
<div class="modal fade" id="cronModal" tabindex="-1" role="dialog" aria-labelledby="cronModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo $text_close; ?> </span></button>
        <h4 class="modal-title" id="cronModalLabel"><?php echo $text_schedule_cron; ?></h4>
      </div>
      <div class="modal-body" id="cronModalBody">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $text_close; ?></button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="genericCronModal" tabindex="-2" role="dialog" aria-labelledby="genericCronModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo $text_close; ?></span></button>
        <h4 class="modal-title" id="genericCronModalLabel"><?php echo $text_alternative_cron; ?></h4>
      </div>
      <div class="modal-body">
        <p><?php echo $text_alternative_cron_help; ?>
        <ul>
            <li>- <a href="<?php echo HTTP_CATALOG; ?>index.php?route=extension/module/notifywhenavailable/sendMails&store_id=0"><?php echo HTTP_CATALOG; ?>index.php?route=extension/module/notifywhenavailable/sendMails&amp;store_id=0</a></li>
        </ul>
        <span class="required"><?php echo $text_alternative_cron_help_two; ?>
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $text_close; ?></button>
      </div>
    </div>
  </div>
</div>
<script>
// Cron
$('.cronBtn').on('click', function(e){
	var modal = $('#cronModal'), modalBody = $('#cronModal .modal-body');
    modal
        .on('show.bs.modal', function () {
            modalBody.load('index.php?route=extension/module/notifywhenavailable/testcron&token=<?php echo $token; ?>')
        })
        .modal();
    e.preventDefault();
});

// Date & Time picker
$(document).ready(function() {	
	$('#FixedDate').datetimepicker({ pickTime: false });
	$('.timepicker').datetimepicker({ pickDate: false });
	$('#CronSelector').cron({
		  initial: "<?php if(!empty($nwa_data['notifywhenavailable']['PeriodicCronValue'])) echo $nwa_data['notifywhenavailable']['PeriodicCronValue']; else echo "* * * * *";  ?>",
    onChange: function() {
        $('#abCron').val($(this).cron("value"));		 
    }
	});
});
	if($('select[name="notifywhenavailable[ScheduleType]"]').val() == 'P') {
		$('#FixedDateOptions').hide();
	 	$('#PeriodicOptions').show(200);
	} else {
		$('#PeriodicOptions').hide();
		$('#fixedDateOptions').show(200);	
	}
$('select[name="notifywhenavailable[ScheduleType]"]').on('change', function(e){ 
	if($(this).val() == 'P') {
		$('#FixedDateOptions').hide();
	 	$('#PeriodicOptions').show(200);	
	} else {
		$('#PeriodicOptions').hide();
		$('#FixedDateOptions').show(200);	
		}	
});
$('.btn.addDate').on('click', function(e){
		e.preventDefault();
		if($('#FixedDate').val() && $('#FixedDateTime').val() ){
			$('.scrollbox.dateList').append('<div id="date' + $('#FixedDate').val().replace(/\./g,'') + '">' + $('#FixedDate').val() + '/' + $('#FixedDateTime').val() +'<i class="fa fa-minus-circle removeIcon"></i><input type="hidden" name="notifywhenavailable[FixedDates][]" value="' + $('#FixedDate').val() + '/' + $('#FixedDateTime').val() + '" /></div>');
			$('#FixedDate').val('');
			$('#FixedDateTime').val('');
		} else {
			alert('Please fill date and time!');
		}
		refreshRemoveButtonForTheCronJobs();
});
function refreshRemoveButtonForTheCronJobs() {
	$('.scrollbox.dateList div .removeIcon').click(function() {
		$(this).parent().remove();
	});
}
refreshRemoveButtonForTheCronJobs();
// Hide & Show Scheduled table
$(function() {
    var $typeSelector = $('#ScheduleToggle');
    var $toggleArea = $('#mainSettings');
	 
    $typeSelector.change(function(){
        if ($typeSelector.val() === 'yes') {
            $toggleArea.show(500) 
        }
        else {
            $toggleArea.hide(500);
        }
    });
});
</script>