<?php echo $header; ?>
    <div class="container">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
        <div class="blog">
            <h1 style="display:none;"><?php echo $heading_title; ?></h1>
            <section class="blog-banner disflex">
                
                <img src="images/blog/banner.jpg" alt="banner" width="100%">
            </section>
            
            <div class="blog-main disflex-spbetween">
                <section class="left">
                     <?php if($articles) { ?>
                        <?php foreach($articles as $article) { ?>  
                    <article>
                        <div class="heading"><?php echo ucwords($article['article_title']); ?></div>
                        <span class="date"><?php echo $article['date_added']; ?></span>
                        <?php if($article['image']) { ?>
                                <?php if($article['featured_found']) { ?>
                                    <a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['image']; ?>" alt="<?php echo $article['article_title']; ?>" /></a>
                                <?php } else { ?>
                                    <a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['image']; ?>" alt="<?php echo $article['article_title']; ?>" /></a>
                                <?php } ?>
                        <?php } ?>
                        <?php if($article['featured_found']) { ?>						
                                    <p><?php echo $article['description']; ?></p>
                                        <?php } else { ?>
                                    <p><?php echo $article['description']; ?></p>
                        <?php } ?>
                        <!--<p>Pearls are undoubtedly the world’s oldest gems known to mankind. It’s believed that no one person has discovered pearls but was discovered along the seashore while hunting for food.</p>-->
                        <!--<a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a> <a class="addthis_button_google_plusone_share"></a> <a class="addthis_button_linkedin"></a> <a class="addthis_button_pinterest_share"></a>-->
                        <div class="bottom disflex-spbetween"><span class="date view"><?php echo $article['view']?> viewed</span><a href="<?php echo $article['href']; ?>" class="read-btn">Read More</a>
                            <ul class="social">
                                <li><a class="addthis_button_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a class="addthis_button_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a class="addthis_button_google_plusone_share"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                            <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script>

                        </div>
                    </article>
                        <?php } ?>
                        <?php }else{ ?>
                     <h3 class="text-center"><?php echo $text_no_found; ?></h3>
                        <?php } ?>
                    <?php echo $pagination; ?>
<!--                    <ul class="pagination">
                        <li><a href="#">Prev</a></li>
                        <li><a href="#" class="active">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">Next</a></li>
                    </ul>-->
                </section>
                
                <aside>
                    <div class="blog-newsletter">
                        <div class="title"><span> Follow Us</span></div>
                        <ul class="social-list">
                        <li>
                             <a href="https://www.facebook.com/ornatejewelscom/"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="https://twitter.com/ornatejewelscom"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="https://www.pinterest.com/ornatejewels"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                            <a href="https://www.instagram.com/ornatejewels"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                        </li>
                        </ul>
                        <p>Sign up for exciting offers</p>
                       <form action="" method="post">
                            <input type="email" placeholder="Email Address" name="txtemail" id="txtemailblog"  class="form-control">
                            <input type="submit" value="Subscribe Now" class="btn"  onclick="return subscribe();">
                        </form>
                        
                    </div>
                    <?php echo $column_right; ?>
                    <div class="instragram">
                        <div class="title title-border"><span>#Instagram</span></div>
                        <a href="https://www.instagram.com/ornatejewels" target="_blank"><img src="images/blog/instragram.jpg" alt="instragram"></a>
                    </div>
                </aside>
                
            </div>
            
        </div>
    </div>    
<?php echo $footer; ?>
<script>
		function subscribe()
		{
			var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var email = $('#txtemailblog').val();
			if(email != "")
			{
				if(!emailpattern.test(email))
				{
					alert("Invalid Email");
                                        $('#txtemailblog').focus();
					return false;
				}
				else
				{
					$.ajax({
						url: 'index.php?route=extension/module/newsletters/news',
						type: 'post',
						data: 'email=' + $('#txtemailblog').val(),
						dataType: 'json',
						
									
						success: function(json) {
                                                    $("#txtemailblog").val('');
                                                    alert(json.message);
                                                }
						
					});
					return false;
				}
			}
			else
			{
				alert("Email Is Require");
				$(email).focus();
				return false;
			}
			

		}
	</script>