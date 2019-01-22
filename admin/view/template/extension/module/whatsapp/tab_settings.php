<table id="Settings" class="table">
    <tr>
        <td class="col-xs-3">
        	<h5><strong><?php echo $text_image_dimensions; ?></strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_image_dimensions_help; ?></span></td>
        <td class="col-xs-9">
            <div class="col-xs-4">
                <div class="input-group">
                  <span class="input-group-addon">Width:&nbsp;</span>
                  <input type="text" class="form-control" name="<?php echo $moduleNameSmall; ?>[ImageWidth]" value="<?php if(isset($moduleData['ImageWidth'])) { echo $moduleData['ImageWidth']; } else { echo "100"; }?>" />
                  <span class="input-group-addon"><?php echo $text_pixels; ?></span>
                </div><br />
                <div class="input-group">
                  <span class="input-group-addon">Height:</span>
                  <input type="text" class="form-control" name="<?php echo $moduleNameSmall; ?>[ImageHeight]" value="<?php if(isset($moduleData['ImageHeight'])) { echo $moduleData['ImageHeight']; } else { echo "100"; }?>" />
                  <span class="input-group-addon"><?php echo $text_pixels; ?></span>
                </div>
            </div>
        </td>
    </tr>

<tr>
        <td class="col-xs-3">
            <h5><strong><?php echo $text_button_preview; ?></strong></h5>
            
        </td>
        <td class="col-xs-3">    
        <div class="col-xs-4" style="text-align: center"> 
        <?php
		if((!isset($moduleData['ImageWidth'] )&& !isset($moduleData['ImageHeight']))||(strlen($moduleData['ImageWidth'])==0 && strlen($moduleData['ImageHeight'])==0)) { $moduleData['ImageWidth']="100";$moduleData['ImageHeight']="100";}?>
               <img id="img" width="<?php echo $moduleData['ImageWidth']?>" height="<?php echo $moduleData['ImageHeight']?>" border="0" > 
         </div>
        </td>                 
        </tr>
     <script>        
        $(document).ready(function() {
            $("#img").attr("src", "<?php echo HTTPS_SERVER. "view/image/whatsapp/";?>"+$("select#input-status option:selected").val());
                        
            $("#input-status").change(function() {                          
                
                $("#img").attr("src", "<?php echo HTTPS_SERVER. "view/image/whatsapp/";?>"+$("select#input-status option:selected").val());         
            });
        });         
    </script>    

     <!-- End Preview -->
      
     <!-- Design -->  

    <tr>
        <td class="col-xs-3">
            <h5><strong><?php echo $text_button_design; ?></strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_button_design_help; ?></span>
        </td>
        <td class="col-xs-3">
            <div class="col-xs-4">
                    <select name="<?php echo $moduleNameSmall; ?>[ButtonDesign]" id="input-status" class="form-control">
                    <option value="logo-color.png" <?php echo(!empty($moduleData['ButtonDesign']) && $moduleData['ButtonDesign'] == 'logo-color.png') ? 'selected=selected' : '' ?> id="Color button"><?php echo $color_button; ?></option>
                    <option value="logo-bw.png" <?php echo(!empty($moduleData['ButtonDesign']) && $moduleData['ButtonDesign'] == 'logo-bw.png') ? 'selected=selected' : '' ?> id="Black and white button"><?php echo $bw_button; ?></option>                           
                </select>
             </div>
         </td>
    </tr>

	<tr>
        <td class="col-xs-3">
        	<h5><strong><?php echo $whatsapp; ?></strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $whatsapp_help; ?></span></td>
            
    
        <td class="col-xs-9">
<ul class="nav nav-tabs popup_tabs">
		<?php  $i=0; foreach ($languages as $language) {   ?>
			<li <?php if ($i==0) echo 'class="active"'; ?>><a href="#tab-<?php echo $moduleNameSmall; ?>-<?php echo $language['language_id']; ?>" data-toggle="tab">
        <?php if (version_compare(VERSION, '2.2.0.0', "<")) { ?>
            <img src="view/image/flags/<?php echo $language['image']; ?>"/>
        <?php } else { ?>
            <img src="language/<?php echo $language['code'] . '/' . $language['code'] . '.png'; ?>"/>
        <?php } ?>
      <?php echo $language['name'];  ?></a></li>
		<?php  $i++; }?>
	</ul>
    <div class="tab-content">
		<?php $i=0; foreach ($languages as $language) { ?>
            <div id="tab-<?php echo $moduleNameSmall; ?>-<?php echo $language['language_id']; ?>" language-id="<?php echo $language['language_id']; ?>" class="row-fluid tab-pane language <?php if ($i==0) echo 'active'; ?>">
                         <div class="row">
             
                    <div class="col-md-9">
                    
                        <textarea rows="8" cols="60" id="message_<?php echo $moduleNameSmall; ?>_<?php echo $language['language_id']; ?>" name="<?php echo $moduleNameSmall; ?>[content][<?php echo $language['language_id']; ?>]"><?php if(!empty($moduleData['content'][$language['language_id']])) echo $moduleData['content'][$language['language_id']]; else echo '';?></textarea>
                    </div>
                </div>
                <br />
               
			</div>
        <?php $i++; } ?>
	</div>
        </td>
    </tr>
</table>