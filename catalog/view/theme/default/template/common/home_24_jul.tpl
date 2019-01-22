<?php echo $header; ?>
    <?php echo $content_top; ?>
        <?php echo $content_bottom; ?>
    <?php echo $column_right; ?>
  <!-- service start here -->
            <ul  class="service container clearfix">
                <li>Manufacturers <br /> Prices</li>
                <li>7 Day Money <br /> Back Guarantee</li>
                <li>Free Shipping and Transit Insurance</li>
                <li>Hallmarked <br /> for Purity</li>
            </ul>
           <!-- service end here -->
        <div class="wrapper"> <!-- wrapper start here -->
            <div class="container">  <!--container start here -->
                <div class="page-head"> <!--page-head start here -->
                    <h2> <span>Shop by <strong>Categories</strong></span></h2>
                    <p>Find an exclusive range of high-quality sterling silver jewellery online at jaw dropping prices. We offer certified hall marked silver and gold plated jewellery online with high bench-mark of authenticity. You will find intricate silver jewellery designs at best competitive prices. Ornate jewels offer anti-tarnish silver ornaments with trusted quality. Get your hands on stylish and wearable gold plated jewellery and silver ornaments online at Ornate jewels. Offering elegant silver jewlery at affordability is what we aim at.</p>
                </div>  
                
                <div class="home-shopcat">
                    
                    <a href="earrings">
                        <picture>
                            <source media="(max-width:767px)" srcset="images/home/m-good-things.jpg">
                            <img src="images/home/good-things.jpg" alt="good things">
                        </picture>
                        </a>
                    <a href="rings">
                        <picture>
                            <source media="(max-width:767px)" srcset="images/home/m-lasting-memory.jpg">
                            <img src="images/home/lasting-memory.jpg" alt="lasting memory">
                        </picture>
                        </a>
                    <div class="group">
                        <a href="necklaces">
                        <picture>
                            <source media="(max-width:767px)" srcset="images/home/m-sliver-necklaces.jpg">
                            <img src="images/home/sliver-necklaces.jpg" alt="sliver necklaces">
                        </picture>    
                            </a>
                    <a href="kids-jewels">
                        <picture>
                            <source media="(max-width:767px)" srcset="images/home/m-kids-jewellery.jpg">
                            <img src="images/home/kids-jewellery.jpg" alt="kids jewellery">
                        </picture>
                        </a>
                    </div>
                    <div class="group group-three">
                    <a href="blue-hues">
                        <picture>
                            <source media="(max-width:767px)" srcset="images/home/m-blue-hugs.jpg">
                        <img src="images/home/blue-hugs.jpg" alt="blue hugs">
                        </picture>
                        </a>    
                    <a href="solitaire-stories">
                        <picture>
                            <source media="(max-width:767px)" srcset="images/home/m-solitaire-storeis.jpg">
                        <img src="images/home/solitaire-storeis.jpg" alt="solitaire storeis">
                        </picture>
                        </a>
                    <a href="999-Deals">
                        <picture>
                            <source media="(max-width:767px)" srcset="images/home/m-999-deals.jpg">
                        <img src="images/home/999-deals.jpg" alt="999 deals">
                        </picture>
                        </a>
                    </div>
                    <div class="group">
                    <a href="bracelets">
                        <picture>
                            <source media="(max-width:767px)" srcset="images/home/m-stunning-braclets.jpg">
                        <img src="images/home/stunning-braclets.jpg" alt="stunning braclets">
                        </picture>
                        </a>    
                    <a href="pearls">
                        <picture>
                        <source media="(max-width:767px)" srcset="images/home/m-pearl-jewelry.jpg">
                        <img src="images/home/pearl-jewelry.jpg" alt="pearl jewelry">
                        </picture>
                        </a>
                    </div>
                    <a href="hearts-jewelry">
                        <picture>
                        <source media="(max-width:767px)" srcset="images/home/m-have-heart.jpg">
                        <img src="images/home/have-heart.jpg" alt="have heart">
                        </picture>
                        </a>    
                    <div class="group">
                    <a href="sim-stone-in-motion">
                    <picture>
                        <source media="(max-width:767px)" srcset="images/home/m-stone-motion.jpg">
                        <img src="images/home/stone-motion.jpg" alt="stone motion">
                        </picture>
                    </a>    
                    <a href="#">
                        <picture>
                        <source media="(max-width:767px)" srcset="images/home/m-alphabet-jewelry.jpg">
                        <img src="images/home/alphabet-jewelry.jpg" alt="alphabet-jewelry">
                        </picture>
                        </a>
                    </div>
                </div>
                
                
                
                
                <div class="blog-box"> <!-- blog-box start here -->
                    <div class="page-head">
                        <h2> <span>From the <strong>Blog</strong></span></h2>
                    </div> 
                    <section class="top">
                    <a href="#">
                        <picture>
                        <source media="(max-width:767px)" srcset="images/home/m-know-ring-size.jpg">
                        <img src="images/home/know-ring-size.jpg" alt="know-ring size">
                        </picture>
                        </a>
                    <a href="what-is-your-birthstone">
                        <picture>
                        <source media="(max-width:767px)" srcset="images/home/m-birthstone.jpg">
                        <img src="images/home/birthstone.jpg" alt="birthstone">
                        </picture>
                        </a>
                    </section>
                    <section class="bottom">
                    <a href="#">
                        <picture>
                        <source media="(max-width:767px)" srcset="images/home/m-diamond-alternate.jpg">
                        <img src="images/home/diamond-alternate.jpg" alt="diamond-alternate">
                        </picture>
                        </a>
                    <a href="#">
                        <picture>
                        <source media="(max-width:767px)" srcset="images/home/m-gemstone-jewelry.jpg">
                        <img src="images/home/gemstone-jewelry.jpg" alt="gemstone jewelry">
                        </picture>
                        </a>
                    </section>
                    
                </div> <!-- blog-box end here -->
                <?php if($testimonials){ ?>
                <div class="customer-box"> <!-- customer-box start here -->
                    <div class="page-head">
                        <h2><span>Happy  <strong>Customers</strong></span></h2>
                    </div> 
                    <div class="flexslider-carousel hocu-carousel">
                        <ul class="slides clearfix">
                            <?php foreach($testimonials as $testimonial){ ?>
                            <li>
                                <div class="customer">
                                    <figure>
                                        <image src="images/customer2.jpg" alt="Ornate jewels happy cutomer <?php echo $testimonial['author']; ?>">   
                                        <figcaption><i class="my-icons-user"></i>Verified Customer</figcaption>
                                    </figure>
                                    <article>  
                                        <div class="clearfix">
                                            <span class="detail">
                                                <strong><?php echo $testimonial['author']; ?></strong>
                                                <small>on <?php echo $testimonial['date_added']; ?></small>
                                            </span> 
                                            <span class="city"><?php echo $testimonial['city']; ?> </span>  
                                        </div>
                                        <p> <?php echo $testimonial['text']; ?></p>
                                    </article> 
                                </div>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div> <!-- customer-box end here -->
                <?php } ?>
                <div class="news-box"> <!-- news-box start here -->
                    <div class="page-head">
                        <h2><span>We’re <strong> Making News</strong></span></h2>
                    </div> 
                    <figure class="one-half">
                        <div class="flexslider">
                            <ul class="slides">
                                <li><img src="images/news.png"> </li>
                            </ul>
                        </div>

                    </figure>
                    <figure class="one-half one-half-mawo">
                       
                        <a class="youtube" href="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fornatejewelscom%2Fvideos%2F491210634336380%2F&width=640&show_text=false&height=390&appId"><img src="images/news-video.jpg"></a>
                        <a class="youtube" href="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fornatejewelscom%2Fvideos%2F481521515305292%2F&width=640&show_text=0&height=390&appId"><img src="images/news-video1.jpg"></a>
                    </figure>
                </div> <!-- news-box end here -->  
            </div> <!--container end here -->

        </div> <!-- wrapper end here --> 
        <div class="container">   <!--folllow-us start  here -->
            <div class="folllow-us">
                <div class="page-head">
                    <h2><span>Follow Us <strong>On</strong></span></h2>
                </div>
                <div class="social-col">
                    <a href="https://www.instagram.com/ornatejewels" target="_blank" class="title"> <i class="my-icons-instgrame"></i> Instagram
                    <figure><img src="images/instgrame-gallery.jpg"></figure></a>
                </div>
                <div class="social-col">
                    <a href="https://www.facebook.com/ornatejewelscom" target="_blank" class="title">  <i class="my-icons-facebook facebook"></i> Facebook
                    <figure><img src="images/facebook-gallery.jpg"></figure>
</a>
                </div>   
            </div>
        </div>   <!--folllow-us end  here -->


<?php echo $footer; ?>