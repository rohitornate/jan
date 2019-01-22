

<?php echo $header;     ?>

<!-- Facebook Pixel Code -->
<script>

 
 
  fbq('track', 'Microdata');
</script>
<noscript><img height="1" width="1" style="display:none"
  src="https://www.facebook.com/tr?id=290183114743026&ev=PageView&noscript=1" alt="facebook"
/></noscript>
<!-- End Facebook Pixel Code -->
<style>
.content-scroll1 {
  /*  height: 170px;*/
    overflow: hidden;
    border: 1px solid #e1e1e1;
    border-right: 0;
    padding: 10px 0 10px 15px;
    margin-bottom: 40px;
}</style>


<section class="categories-main"> <!--main start here -->
    <div class="container">  <!--container start here -->   
        <ul class="breadcrumb"> <!--breadcrumb start here -->
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul> <!--breadcrumb end  here -->
		<?php if(!empty($url)) { ?>
		
        <?php if($cat_strip){ ?>
        <div class="wholesale"> <!--wholesale start  here -->
                 <a href="<?php echo $url; ?>">    <img src="<?php echo $cat_strip; ?>" alt="<?php echo $strip_alt;?>" ></a> 
            </div> <!--wholesale end  here -->
          <?php } ?>
		<?php } else { ?>
		<img src="<?php echo $cat_strip; ?>" alt="<?php echo $strip_alt;?>" >
		
		
		<?php } ?>
        <div class="page-head"> <!--page-head start  here -->
            
            
             <?php if($hone!=''){ ?>
            <h1 class="title">
            <?php echo $hone; ?>
            </h1>
             <?php }else{ ?>
            <h1 class="title"><?php echo $heading_title; ?></h1>
           <?php } ?>
            <?php if ($description) { ?>
            <?php echo $description; ?> 
            
            <a href="javascript:void(0)" class="more-btn"></a>
            <?php } ?>
        </div>  <!--page-head end  here -->
          
        
        <div class="filter clearfix"> <!--filter  start  here -->
            <?php echo $content_top; ?>
			
			<form class="filter-option pull-left"><!--<label>Filter By:</label>--><div class="box"><span class="title">Trending</span><ul style="display: none; height: 70px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;"><li><label><input type="checkbox" name="filter[]" id="filter_38" value="38">
Bestsellers (157)            
</label></li><li><label><input type="checkbox" name="filter[]" id="filter_40" value="40">
New Arrivals (89)            
</label></li></ul></div><div class="filter-result"></div></form>

<form class="filter-option pull-left"><!--<label>Filter By:</label>--><div class="box"><span class="title">Trending</span><ul style="display: none; height: 70px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;"><li><label><input type="checkbox" name="filter[]" id="filter_38" value="38">
Bestsellers (157)            
</label></li><li><label><input type="checkbox" name="filter[]" id="filter_40" value="40">
New Arrivals (89)            
</label></li></ul></div><div class="filter-result"></div></form>



        </div>  <!--filter  end  here -->   
        <?php if ($products) { ?>
            <section class="categories"> <!--categories  start  here --> 
                <?php foreach ($products as $product) { ?>
                <div class="c-box">
                            <a href="<?php echo $product['href']; ?>">
                                <img  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['alt']; ?>">
                                <p><?php echo $product['name'] ?></p>
                            </a>
							<br/>
							
							
							<?php if ($product['rating']) { ?>
								<div class="rating">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($product['rating'] < $i) { ?>
								<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } else { ?>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
								<?php } ?>
								<?php } ?>
								</div>
								<?php } ?>
							
							<?php if (!empty($product['category_id'])) { ?>
                            <?php if ($product['price']) { ?>
                            <div class="price-box clearfix">
                                <?php if (!$product['special']) { ?>
                                    <div class="price-retail">
                                        <small>Retail Price</small>
                                        <strike><?php echo $product['price']; ?></strike><span>(0% Off)</span></strong>
                                    </div>
                                    <div class="price-save">
                                        <strong><?php echo $product['price']; ?></strong>
                                        <small>You Save Rs 0</small>
                                    </div> 
                                <?php } else { ?>
                                    <div class="price-retail">
                                        <small>Retail Price</small>
                                        <strike><?php echo $product['price']; ?></strike><span>(<?php echo $product['discount_persent']; ?>% Off)</span></strong>
                                    </div>
                                    <div class="price-save">
                                        <strong><?php echo $product['special']; ?></strong>
                                        <small>You Save <?php echo $product['discount_price']; ?></small>
                                    </div> 
                                <?php } ?>
                                <?php if($product['quantity']<1){ ?>
                                <span class="cart-btn" >Out Of Stock</span>
                                <?php }else{ ?>
                                <span class="cart-btn" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">Add To Cart</span>
                                <?php } ?>
                            </div>
                        <?php } ?>
						<?php } else { ?>
								 <?php if ($product['price']) { ?>
                            <div class="price-box clearfix">
                                <?php if (!$product['special']) { ?>
                                    <!--<div class="price-retail">
                                        <small>Retail Price</small>
                                        <strike><?php echo $product['price']; ?></strike><span>(0% Off)</span></strong>
                                    </div>-->
                                    <!--<div class="price-save">
                                        <strong><?php echo $product['price']; ?></strong>
                                        <small>You Save Rs 0</small>
                                    </div>--> 
                                <?php } else { ?>
                                   <!-- <div class="price-retail">
                                        <small>Price</small>
                                        <strike><?php echo $product['price']; ?></strike><span>(<?php echo $product['discount_persent']; ?>% Off)</span></strong>
                                    </div>-->
                                    <div class="price-save">
									<small>Price</small><br>
                                        <strong><?php echo $product['special']; ?></strong>
                                     <!-- <small>You Save <?php echo $product['discount_price']; ?></small>-->
                                    </div> 
                                <?php } ?>
                                <?php if($product['quantity']<1){ ?>
                                <span class="cart-btn" >Out Of Stock</span>
                                <?php }else{ ?>
                                <span class="cart-btn" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">Add To Cart</span>
                                <?php } ?>
                            </div>
                        <?php } ?>
						<?php } ?>
                        </div>
                    
                <?php } ?>
            </section>  <!--categories  end  here --> 
			<div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            <?php if($long_description){ ?>
        <div class="content  content-scroll1" > <!--article  start  here --> 
            <?php echo $long_description; ?>
        </div> <!--article  end  here -->
            <?php } ?>
        
        <?php } ?>
        <style>a {
    text-decoration: none;
    color: ##1e91cf !important;
}</style>
        <?php if (!$categories && !$products) { ?>
                <p><?php echo $text_empty; ?></p>
                <div class="buttons">
                    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
            <?php } ?>
    </div>     <!--container end here -->
</section> <!--main end here -->

<?php echo $footer; ?>
