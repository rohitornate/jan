



<?php echo $header; ?>
<link  href="https://ornate-bc57.kxcdn.com/css/oc-iscroller.css" rel="stylesheet" />
<style>

.not-available-mark,.product-not-available{position:absolute;text-transform:uppercase;background-color:#a074a0}.not-available-mark,.product-not-available,.stickyfilter{color:#fff;text-align:center}.btn,.filter,.not-available-mark,.stickyfilter{text-align:center}.product-layout{overflow:hidden}.product-not-available{border:3px double #fff;width:146px;margin-left:-79px;margin-top:18px;-ms-transform:rotate(-45deg);-webkit-transform:rotate(-45deg);transform:rotate(-45deg);z-index:3;height:26px}.product-not-available p{padding-top:5px;width:115px;margin:auto auto auto 30px;font-size:11px}.not-available-mark{font-size:30px;padding:10px;border:5px double #fff;-ms-transform:rotate(-45deg);-webkit-transform:rotate(-45deg);transform:rotate(-45deg);margin-top:94px;left:50%;margin-left:-140px;width:280px}.sortByOptions{background-color:#fff;border:none;width:none}.stickyfilter{position:fixed;left:0;bottom:0;width:100%;background-color:red}.ripple-container{position:relative;overflow:hidden}.btn.primary.flat,.btn.primary.outline{color:#ff3e6c;font-weight:700}.ripple-container .ripple{position:absolute;border-radius:50%;-webkit-transform:scale(0);transform:scale(0)}.btn{display:inline-block;padding:6px 12px;margin-bottom:0;font-size:14px;font-weight:400;line-height:1.42857143;white-space:nowrap;vertical-align:middle;-ms-touch-action:manipulation;touch-action:manipulation;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-image:none;border:1px solid transparent;border-radius:4px}.results-btn{width:100%;height:50px;padding:16px 14px 12px;font-size:13px}.col-1-2{width:50%;float:left;}.filter{background-color:#fff;width:100%;border-top:1px solid #eaeaec;z-index:10;margin:0}.buttonDivider{border-left:.5px solid #ababb6;width:1px;height:22px;position:absolute;left:50%;top:15px}



.product-new-available{
    color: #670067;
    position: absolute;
    text-transform: uppercase;
    text-align: center;
   /* border: 3px #670067 double;*/
    width: 210px;
    background-color: #f0f6fc;
    margin-left: -74px;
    margin-top: 15px;
    -ms-transform: rotate(-45deg); 
    -webkit-transform: rotate(-45deg); 
    transform: rotate(-45deg);
    z-index: 0;
    height: 27px;
}

.product-new-available p{
    padding-top: 9px;
    width: 124px;
    margin: auto;
    font-size: 11px;
    margin-left: 30px;
	font-weight:700;
}
.form-group.input-group.input-group-sm {
    width: 50%;
    float: right;
}




</style>



<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

    	
			

		<div class="col-md-7 col-sm-4 col-xs-6">
		
		</div>
		<div class="col-md-5 col-sm-4   col-xs-6">
          <div class="form-group input-group input-group-sm">
            <!-- <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label> -->
            <select id="input-sort" class="form-control" onchange="location = this.value;" style="font-size: 14px;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="">Sort By</option>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>



      
      <?php if ($products) { ?>
      <div class="row">
       <div class="col-md-5 col-sm-6  ">
          <div class="btn-group btn-group-sm hidden-xs hidden-md hidden-lg hidden-sm ">
            <button type="button" id="list-view1" class="btn btn-default" data-toggle="tooltip" title="" data-original-title="List"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default active" data-toggle="tooltip" title="" data-original-title="Grid"><i class="fa fa-th"></i></button>
          </div>
        </div>
      





      </div>
      <div class="row">
        <?php foreach ($products as $product) { //print_r($product) ;?>
        <div class="product-layout product-list col-xs-12 ">
         <div class="product-thumb transition " >

		 <?php if($product['quantity']<1){ ?>
		
					<div class="product-new-available">
                        <p>Sold Out</p>
                    </div>
					
					
		<?php }else{ ?>
		
		<?php if($product['category_id_new_arrical']==true){ ?>
		<div class="product-not-available">
                        <p>New </p>
                    </div>
		<?php } ?>
		
		<?php } ?>
		 
		 
		 
          	 <div class="imageInn">




          	 	
          	 	 <a href="<?php echo $product['href']; ?>"> <img src="<?php echo $product['thumb'];?>" alt="Default Image" ></a>
               
			</div>


   			
            <div>
              <div class="caption">
             
              <div class="rating">  <?php if ($product['rating']) { ?>
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($product['rating'] < $i) { ?>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
								<?php } else { ?>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
								<?php } ?>
								<?php } ?>
								  <?php } ?>
								</div>
              <h5><a href="<?php echo $product['href']; ?>">
			  
			  
			  <?php 
			  
			  
			 $pro_name= utf8_substr(strip_tags(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')), 0, 25) . '..';
			  
			  
			  
			  
			  
			  
			  echo  $pro_name; ?>
			  
			  
			  
			  
			  </a></h5>
               
               
               <?php if ($product['price']) { ?>
					<?php if (!$product['special']) { ?>
					
						<div class="product-info" style="min-height: 70px;">
							<div class="price-box">
						
								<p class="special-price" style="padding-left:0px;">
						
								<span class="price"  style="color:#414141">
									<?php echo $product['price']; ?> </span>
								</p>
							</div>
						

						</div>
					
					
					
					
					
					<?php } else { ?>
					
					
					<div class="product-info" style="min-height: 70px;">
					<div class="price-box">
						<p class="old-price">
						<span class="price-label">Regular Price:</span>
						<span class="price" >
						<?php echo $product['price']; ?> </span>
						</p>
						<p class="special-price">
						<span class="price-label">Discount</span>
						<span class="price" id="product-price-60393">
						<?php echo $product['special']; ?> </span>
						</p>
					</div>
						
						<span style="color:#69a6d8; font-size: 16px;font-weight:500;"><b><?php echo $product['discount_persent']; ?>% OFF </b></span>
					</div>
					
					
					
					
					<?php } ?>
  <?php } ?>
     </div>
              <!--<div class="button-group">
                <button type="button" onclick="addTOcart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>','<?php echo $product['name']; ?>','<?php echo $product['thumb'];?>');"><i class="fa fa-shopping-cart" style="display: inline-block; font-size: 18px;">
            </i> <span style="margin-left: 15px;" ><?php echo $button_cart; ?></span></button>
                </div>-->
            </div>
          </div>
        </div>


        <?php } ?>
      </div>
      <div class="row">
         <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div> 

        
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>



</div>

<script>
  
$(document).ready(function(){
    $(".filter1").click(function(){
        $('.bf-panel-wrapper').toggleClass('bf-opened');
    });
});

</script>
<script type="text/javascript"> 


if($(window).width()<767){
$(".m-menu").click(function(){
	//$(".menu").animate({width:'toggle'},400);
	$(".menu-overlay").toggleClass("active");
	$("body, html").toggleClass("bohidden");
});
$(".menu-overlay").click(function(){
	$(".menu").animate({width:'toggle'},400);
	$(".menu-overlay").toggleClass("active");
	$("body, html").toggleClass("bohidden");});

}

</script>

<?php echo $footer; ?>



