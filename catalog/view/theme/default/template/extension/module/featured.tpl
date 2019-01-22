	
	<div class="container">
	<div class="related-main" style="">      
    <div class="page-head">
        <h2><span>New <strong>Arrivals</strong></span></h2>
    </div>
    <div class="flexslider-car">
        <ul class="slides clearfix" >
						
						<?php foreach ($products as $product) { ?>
                                        <li>
                                            <a href="<?php echo $product['href']; ?>" class="related-coloum">
                                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                                                <p><?php echo $product['name']; ?></p>
                                                <span class="price-discount">
                                                    <?php if(!$product['special']){ echo $product['price']; }else{ echo $product['special']; } ?><!--<small>(<?php echo $product['discount_persent']; ?>% Off)</small>-->
                                                </span>
                                            </a>
                                        </li>
                                    <?php } ?>
						
						
					</ul>
    </div>
</div>
	
	
	
	
	
	 </div>