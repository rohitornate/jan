<?php echo $header; ?>
<link type="text/css" href="view/stylesheet/pcode.css" rel="stylesheet" />
<style>
div.import{

    background-color: #000;
    opacity: 0.4;

}
div.transbox {

    margin: 30px;
    background-color: #000;
    border: 1px solid black;
    opacity: 0.6;
    filter: alpha(opacity=60);
    margin-top: 9% !important;
    overflow: hidden;
    position: absolute;
    width: 77.5%;
    text-align: center;
    padding-top: 1%;
    margin: 0px auto;
    margin-top: 0px;

}
.blure_image img{
	width: 100%;
}
div.transbox p {
     font-size: 20px;
    text-transform: uppercase;
	color:#fff;
}
</style>

<?php echo $column_left; ?>

<div id="content">

    <div class="page-header">

         <div class="container-fluid">

         <div class="pull-right">

          <a data-toggle="tooltip" title="Documentation" class="btn postcode-btn" target="_blank" href="http://mdtecho.com/postcode-extension-for-opencart/"><i class="fa fa-book"></i></a>

           <a data-toggle="tooltip" title="Support / HelpDesk" class="btn postcode-btn" target="_blank" href="http://mdtecho.com/support-ticket/"><i class="fa fa-life-ring"></i></a>

		   <?php foreach($links as $link) { ?>

                <a data-toggle="tooltip" class="btn postcode-btn" title="<?php echo $link['text']; ?>" href="<?php echo $link['href']; ?>"><i class="fa fa-<?php echo $link['font']; ?>"></i></a>

           <?php } ?>

          </div>

        </div>

      </div>

  

    <div class="container-fluid">
    	<div class="import">
          	<a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank"><div class="transbox">
    			<p>Click here to Enable all feature</p>
  			</div></a>
           <a href="https://www.opencart.com/index.php?route=marketplace/extension/info&member_token=hU128tleO4lEnkyzs7OmXqdsPIVM2NUS&extension_id=34841" target="_blank" class="blure_image"><img src="view/image/postcode/import_export.png" /></a>
		  </div>
    
    </div>

</div>



<?php echo $footer; ?>