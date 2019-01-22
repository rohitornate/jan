<?php echo $header; ?>




  <!-- gun88 -->
<style>
.not-available-mark,.product-not-available{position:absolute;text-transform:uppercase;background-color:#404040}.not-available-mark,.product-not-available,.stickyfilter{color:#fff;text-align:center}.btn,.filter,.not-available-mark,.stickyfilter{text-align:center}.product-layout{overflow:hidden}.product-not-available{border:3px double #fff;width:146px;margin-left:-79px;margin-top:18px;-ms-transform:rotate(-45deg);-webkit-transform:rotate(-45deg);transform:rotate(-45deg);z-index:0;height:26px}.product-not-available p{padding-top:5px;width:115px;margin:auto auto auto 30px;font-size:11px}.not-available-mark{font-size:30px;padding:10px;border:5px double #fff;-ms-transform:rotate(-45deg);-webkit-transform:rotate(-45deg);transform:rotate(-45deg);margin-top:94px;left:50%;margin-left:-140px;width:280px}.sortByOptions{background-color:#fff;border:none;width:none}.stickyfilter{position:fixed;left:0;bottom:0;width:100%;background-color:red}.ripple-container{position:relative;overflow:hidden}.btn.primary.flat,.btn.primary.outline{color:#ff3e6c;font-weight:700}.ripple-container .ripple{position:absolute;border-radius:50%;-webkit-transform:scale(0);transform:scale(0)}.btn{display:inline-block;padding:6px 12px;margin-bottom:0;font-size:14px;font-weight:400;line-height:1.42857143;white-space:nowrap;vertical-align:middle;-ms-touch-action:manipulation;touch-action:manipulation;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-image:none;border:1px solid transparent;border-radius:4px}.results-btn{width:100%;height:50px;padding:16px 14px 12px;font-size:13px}.col-1-2{width:50%;float:left;}.filter{background-color:#fff;width:100%;border-top:1px solid #eaeaec;z-index:10;margin:0}.buttonDivider{border-left:.5px solid #ababb6;width:1px;height:22px;position:absolute;left:50%;top:15px}













/*input[type=text].bf-range-max,input[type=text].bf-range-min,input[type=text].bf-slider-input{width:65px;min-width:50px;border:.67px solid #ccc;border-radius:.188rem;box-shadow:0 .063rem .188rem .125rem rgba(0,0,0,.024) inset;height:32px;line-height:1;max-width:100%;padding:0 .425rem;font-weight:400;text-align:left}*/.bf-cell .ui-slider-horizontal .ui-slider-range,.bf-slider-range.ui-slider .ui-slider-range{height:3px;top:0}.bf-price-slider-container{padding:20px 17px 40px 26px}.bf-slider-container.ui-slider .ui-slider-handle,.bf-slider-range.ui-slider .ui-slider-handle{background:#3f91e2!important;border-radius:0;width:11px;height:11px}/*#customPriceButton{background:#f0f6fc;border-color:#83a9cf;color:#2f7ec0;position:relative;top:0;height:32px;font-size:1.2rem;font-size:12px;border-width:.2rem;border-style:solid;box-shadow:none;line-height:2.45;border-radius:0 5px 5px 0;width:38px;float:inherit;margin-left:-10px}*/.bf-cell .ui-slider-horizontal .ui-slider-range,.bf-slider-range.ui-slider .ui-slider-range{background-color:#6e2653!important}.bf-arrow{float:left;color:#474747}


		
		
		.bf-cell,.bf-cell label{font-size:14px;font-weight:600;line-height:17px;font-family: 'Nunito', sans-serif;}/*.bf-sliding-cont{padding-top:15px;padding-bottom:15px;background-color:#f4f4f4}*/.bf-attr-header:hover{background:#f0f6fc}/*.bf-attr-block-cont{font-family: 'Nunito', sans-serif;padding-left:15px}*/.bf-cell{padding:0}.bf-cell label{color:#4d4d4d;cursor:pointer;display:block}.bf-cell label:hover{color:#2f7ec0}.bf-c-1{width:12px;padding-right:5px!important}label{color:#4d4d4d;cursor:pointer;display:block;font-weight:400;line-height:1.5;margin-bottom:0}input[type=checkbox],input[type=radio]{margin:0!important;margin-top:1px\9;line-height:normal}.itemrow{border-top:1px solid #e6dcdc;border-bottom:1px solid #e6dcdc;padding-bottom:50px}.itemrow p{padding:17px 0;color:#565656;text-decoration:none!important;font-size:16px;font-weight:600;line-height:19px}.form-group.input-group.input-group-sm{padding:8px 0;margin-right:-17px}.bf-cur-symb-left{color:#949494}select#input-sort{width:auto;font-size:14px;background:url('https://ornate-bc57.kxcdn.com/image/brainyfilter/down-arrow.png') right center no-repeat!important;-webkit-appearance:none;padding:.56rem 2.75rem .56rem .5rem;border-radius:.3rem;border:.67px solid #ccc;box-shadow:0 1px 0 0 rgba(0,0,0,.13);height:auto}.caption a:hover{color:#2f7ec0}.boxfilter{border:none}@media (max-width:767px){.bf-sliding-cont{padding-top:15px;padding-bottom:0;background-color:#f4f4f4}input[type=text].bf-range-max,input[type=text].bf-range-min,input[type=text].bf-slider-input{width:84px}}


.product-new-available{
    color: #670067;
    position: absolute;
    text-transform: uppercase;
    text-align: center;
   
    width: 210px;
    background-color: #f0f6fc;
    margin-left: -74px;
    margin-top: 15px;
    -ms-transform: rotate(-45deg); 
    -webkit-transform: rotate(-45deg); 
    transform: rotate(-45deg);
    z-index: 3;
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

</style>

<script src="https://ornate-bc57.kxcdn.com/catalog/view/javascript/brainyfilter.js" ></script>
<meta property="og:image" content="<?php echo $og_image; ?>"/>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  
  
 
  
   <?php if($cat_strip){ ?>
        <div class="wholesale"> 
                    <img src="<?php echo $cat_strip; ?>" alt="<?php echo $strip_alt;?>" >
            </div> 
          <?php } ?>
  
  
  
  <!--prem css landing page-->
	
  
  <?php  ?>
  
  
<div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
		
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12 ">
			    <div class="itemrow">
				<div class="col-md-7 col-sm-12 col-xs-12">
				 <h1> <p><?php echo $heading_title; ?></p></h1>
				</div>
				<div class="col-md-5 col-sm-6 col-xs-6 hidden-xs">
				  <div class="form-group input-group input-group-sm">
					<!-- <label class="input-group-addon" for="input-sort">Sort By:</label> -->
					<label for="right-label" class="pull-right">
								<span style="float:left;padding: 7px 8px;"></span>
						
						<select id="input-sort" class="form-control" onchange="location = this.value;">
						
							<option value="">Sort By</option>
							<option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=p.sort_order&amp;order=ASC">Default</option>
																	
																	<option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=p.price&amp;order=ASC">Price (Low &gt; High)</option>
																	<option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=p.price&amp;order=DESC">Price (High &gt; Low)</option>
																	<option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=rating&amp;order=DESC">Rating (Highest)</option>
																	<option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=rating&amp;order=ASC">Rating (Lowest)</option>
						</select>
					
					</label>
				</div>
				</div>
				</div>
			</div>
		</div>
		<?php if ($products) { ?>
         <div class="row">
        <?php foreach ($products as $product) { //print_r($product) ;?>
        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
         <div class="product-thumb transition " >
						<?php if($product['quantity']<1){ ?>
		
					<div class="product-new-available">
                        <p>Sold Out</p>
                    </div>
					
					
		<?php }else{ ?>
		
		<?php if($category_id==182){ ?>
		<div class="product-not-available">
                        <p>New </p>
                    </div>
		<?php } ?>
		
		<?php } ?>
			 <div class="imageInn">
<a href="<?php echo $product['href']; ?>"> <img src="<?php echo $product['thumb'];?>" alt="<?php echo $product['alt']; ?>" ></a>
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
              <h5><a href="<?php echo $product['href']; ?>"><?php 
			  $pro_name= utf8_substr(strip_tags(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')), 0, 24) . '..';
			  echo  $pro_name; ?></a></h5>
               <?php if ($product['price']) { ?>
					<!--<?php if($product['gold_category_id']!=true){ ?>
				
				<div class="product-info" style="min-height: 70px;">
					<div class="price-box">
						
						<p class="special-price" style="padding-left:0px;">
						
						<span class="price"  style="color:#414141">
						<?php echo $product['special']; ?> </span>
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
						
						<span style="color:#505050; font-size: 16px;">70% Off </span>
					</div>
					<?php } ?>-->
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
    <!--<?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>-->
<?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
<section class="categories-main" style="margin-top:50px;">
<div class="container">
<h1 class="title" style="text-align:center;padding:20px;">
            <?php echo $hone; ?>
            </h1>
  <?php if($long_description){ ?>
      <div class="content mCustomScrollbar content-scroll" >
            <?php echo $long_description; ?>
		</div>
            <?php } ?>
 </div>
</section>
<div class="stickyfilter filter hidden-lg hidden-md  hidden-sm">
  <div class="">
  	<div class="">
		<div class="col-md-6 col-sm-6 col-1-2">
  			<div class="ripple-container ">
  				<div class=" btn primary flat results-btn filter1">Filter</div>
  				<div class="ripple "></div>
  			</div>
  		</div>
  		<div class="buttonDivider"></div>
  		<div class="col-md-6 col-sm-6 col-1-2 ">
  			<div class="ripple-container ">
  				<div class="btn primary flat results-btn"> 
				 <select class="sortByOptions"  onchange="location = this.value;"  >
              <option value="">Sort By</option>
													<option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=p.sort_order&amp;order=ASC">Default</option>
                                                       
                                                        <option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=p.price&amp;order=ASC">Price (Low &gt; High)</option>
                                                        <option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=p.price&amp;order=DESC">Price (High &gt; Low)</option>
                                                        <option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=rating&amp;order=DESC">Rating (Highest)</option>
                                                        <option value="https://www.ornatejewels.com/index.php?route=product/category&amp;path=<?php echo $path; ?>&amp;sort=rating&amp;order=ASC">Rating (Lowest)</option>
                                          </select>
 </div>
  				<div class="ripple "></div>
  			</div>
  		</div>
  	</div>
  </div>
</div>
</div>
<script>
$(document).ready(function(){
$(".filter1").click(function(){
	
$('.bf-panel-wrapper').toggleClass('bf-opened');
$('.rightclose').show();
 $('body').addClass('bodyfix');
$('.leftreset').show();

$('.boxfilter-heading').show();
});
$(".rightclose").click(function(){
$('.bf-panel-wrapper').toggleClass('bf-opened');
 $('body').removeClass('bodyfix');
});
});
</script>
<style>
/*.bodyfix{
	position:fixed;
	overflow:hidden;
	
	
}*/
@media only screen and(min-width:768px) and(max-width:768px){
.stickyfilter{
	display:block;
}
}


</style>


<?php echo $footer; ?>