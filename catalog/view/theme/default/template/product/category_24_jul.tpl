<?php echo $header; ?>
<section class="categories-main"> <!--main start here -->
    <div class="container">  <!--container start here -->   
        <ul class="breadcrumb"> <!--breadcrumb start here -->
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul> <!--breadcrumb end  here -->
        <div class="wholesale"> <!--wholesale start  here -->
                    <img src="images/strip.jpg"> 
            </div> <!--wholesale end  here -->
          <?php if ($thumb || $description) { ?>
        <div class="wholesale"> <!--wholesale start  here -->
            <?php if ($thumb) { ?>
            <figure>
                <img src="<?php echo $thumb; ?>"> 
            </figure>
            <?php } ?>
        </div> <!--wholesale end  here -->
        <div class="page-head"> <!--page-head start  here -->
            <h1 class="title"><?php echo $heading_title;?></h1>
            <?php if ($description) { ?>
            <?php echo $description; ?> 
            <?php } ?>
            <a href="javascript:void(0)" class="more-btn"></a>
        </div>  <!--page-head end  here -->
            <?php } ?>
        
        <div class="filter clearfix"> <!--filter  start  here -->
            <?php echo $content_top; ?>
<!--            <form class="filter-option pull-left">
                <label>Filter By:</label>
                <div class="box">
                    <span class="title">Price</span>
                    <ul>
                        <li><label><input type="checkbox"> 50000-74999 (17)</label></li>
                         <li><label><input type="checkbox">  40000-49999 (39)</label></li>
                          <li><label><input type="checkbox"> 30000-39999 (24)</label></li>
                           <li><label><input type="checkbox"> 20000-24999 (4)</label></li>
                            <li><label><input type="checkbox"> 50000-74999 (17)</label></li>
                    </ul>
                </div>
                <div class="box">
                    <span class="title">Metal</span>
                    <ul>
                        <li><label><input type="checkbox"> White</label></li>
                         <li><label><input type="checkbox">  White Gold</label></li>
                          <li><label><input type="checkbox"> Plan White</label></li>
                    </ul>
                </div>
                <div class="box">
                    <span class="title">Type</span>
                    <ul>
                        <li><label><input type="checkbox"> 50000-74999 (17)</label></li>
                         <li><label><input type="checkbox">  40000-49999 (39)</label></li>
                          <li><label><input type="checkbox"> 30000-39999 (24)</label></li>
                           <li><label><input type="checkbox"> 20000-24999 (4)</label></li>
                            <li><label><input type="checkbox"> 50000-74999 (17)</label></li>
                    </ul>
                </div>
            </form>
            <form class="filter-option">   
                <label>SORT BY:</label>
                <div class="box">
                    <span class="title">Type</span>
                    <ul>
                        <li><label>Popular</label></li>
                        <li><label>Price Low  To High</label></li>
                        <li><label>Price High To Low</label></li>
                    </ul>
                </div>
            </form>-->
        </div>  <!--filter  end  here -->   
        <?php if ($products) { ?>
            <section class="categories"> <!--categories  start  here --> 
                <?php foreach ($products as $product) { ?>
                <div class="c-box">
                            <a href="<?php echo $product['href']; ?>">
                                <img  src="<?php echo $product['thumb']; ?>">
                                <p><?php echo $product['name'] ?></p>
                            </a>
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
                                <span class="cart-btn" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">Add To Cart</span>
                            </div>
                        <?php } ?>


                        </div>
                    
                <?php } ?>
            </section>  <!--categories  end  here --> 
            <?php if($long_description){ ?>
        <div class="content"> <!--article  start  here --> 
            <?php echo $long_description; ?>
        </div> <!--article  end  here -->
            <?php } ?>
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
    </div>     <!--container end here -->
</section> <!--main end here -->

<?php echo $footer; ?>
