<?php echo $header; ?>
<script type="text/javascript">
		/*			
					var isMobile = false; //initiate as false
	var isDesktop = true;

	// device detection
	if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
    || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) {

		isMobile = true;
		isDesktop = false;
	}

				if(isMobile){
				var pagesshow = 1;
				}else{
					var pagesshow = 5;
				}*/
				
				//if ($(window).width() <= 767 ) {
               //       var pagesshow = 1;
                      
                //     }else{
				//		var pagesshow = 3; 
				//	 }
				
</script>
<Style>
body {
	background:#f5f3f4;
}
.row {
    margin-right: 0;
    margin-left: 0;
}
.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
    overflow: hidden;
}

</style>

<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<!-- Mobile Device  -->
	<div class="row  ">	
	<div class="container-fluid">
		<div class="mod-category-links">
			<div class="mod-category-links-inner">
				<ul>
					
						
						<li class="category-rings">
							<a href="rings"  title="Rings">
								<img src="<?php if(CDN_HTTPS_SERVER!="") echo CDN_HTTPS_SERVER; ?>images/fevicon/fevicon/ring.svg" alt="silver rings jewelry">
								<span>Rings</span>
							</a>
						</li>
					
						
						<li class="category-earrings">
							<a href="earrings"  title="Earrings">
								<img src="<?php if(CDN_HTTPS_SERVER!="") echo CDN_HTTPS_SERVER; ?>images/fevicon/fevicon/earrings.svg" alt="silver earring">
								<span>Earrings</span>
							</a>
						</li>
					
						
						<li class="category-pendants">
							<a href="necklaces"  title="Pendants">
								<img src="<?php if(CDN_HTTPS_SERVER!="") echo CDN_HTTPS_SERVER; ?>images/fevicon/fevicon/pendent.svg" alt="silver necklace">
								<span>Necklace</span>
							</a>
						</li>
					
						
						<!--<li class="category-bangles">
							<a href="/jewellery/bangles.html"  title="Bangles">
								<img src="images/fevicon/fevicon/bangles.svg">
								<span>Bangles</span>
							</a>
						</li>-->
					
						
						
						
						
						<li class="category-necklaces">
							<a href="necklaces-sets-with-earring"  title="Necklaces">
								<img src="<?php if(CDN_HTTPS_SERVER!="") echo CDN_HTTPS_SERVER; ?>images/fevicon/fevicon/necklace_set.svg" alt="silver necklace set">
								<span>Necklace Sets</span>
							</a>
						</li>
					
						
						<li class="category-bracelets">
							<a href="bracelets"  title="Bracelets">
								<img src="<?php if(CDN_HTTPS_SERVER!="") echo CDN_HTTPS_SERVER; ?>images/fevicon/fevicon/bracelate.svg" alt="silver bracelate">
								<span>Bracelets</span>
							</a>
						</li>
					
						<li class="category-mangalsutras">
							<a href="kids-jewels"  title="Kids">
								<img src="<?php if(CDN_HTTPS_SERVER!="") echo CDN_HTTPS_SERVER; ?>images/fevicon/fevicon/kids.svg" alt="silver kids jewelry">
								<span>Kids</span>
							</a>
						</li>
						<li class="category-mangalsutras">
							<a href="pearl-jewelry"  title="Pearl">
								<img src="<?php if(CDN_HTTPS_SERVER!="") echo CDN_HTTPS_SERVER; ?>images/fevicon/fevicon/pearl.svg" alt="silver pearl jewelry">
								<span>Pearl</span>
							</a>
						</li>
						<li class="category-mangalsutras">
							<a href="index.php?route=information/shipway_track" title="Pearl" >
								<img src="<?php if(CDN_HTTPS_SERVER!="") echo CDN_HTTPS_SERVER; ?>images/fevicon/fevicon/track_order.svg" alt="silver rings">
								<span>Track Order</span>
							</a>
						</li>
				</ul>
				<i class="clear"></i>
			</div>
			<i class="clear"></i>
		</div>
		<div data-position="1" class="banner-disp">
			<div class="banner-img">
			<a href="35-off-collection">
				
				<img   src="https://ornate-bc57.kxcdn.com/images/offer/main-sale.jpg" alt="chrismas offer" />
				
			</a>	
			</div>
			
		</div>

		
		<div data-position="1" class="banner-disp">
			<div class="banner-img">
			
			<a href="18k-yellow-gold-plated-jewelry">
			
			<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/offer/gold-plated.jpg" alt="sale"/>
			
				
			</a>	
			</div>
			
		</div>
		
		<div data-position="1" class="banner-disp">
			<div class="banner-img">
			<a href="all-under-999">
				<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/offer/999-deals.jpg" alt="silver rings"/>

			</a>	
			</div>
			
		</div>
	</div>
</div>
<!-- End Mobile Device  -->


<!--END Desktop Device  -->
<!-- MObile Device  -->
	<div class="container">
	    <div class="row contents">
			<div class="col-md-12 col-xs-12">
				<div class="strip-banner">
					
				<a href="all-under-2000">
				<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/gift_strip_new.jpg" alt="mothers-day" class="">
				</a>
				</div>
			</div>
		</div>
		<div class="row ">
			<div class="col-md-6 col-xs-6 contents">
				<div class="responsively">
				
					<a href="solitaire-rings">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/solitaire_rings.jpg" alt="silver solitaire rings for girls and women" class="img-responsive">
							
							</a>
				</div>
				<div class="pdata">
						<p>Silver Solitaire Rings - Women's Best Friend</p>
						<div class="clearfixed"></div>
				</div>
				
			</div>
			<div class="col-md-6 col-xs-6 contents">
				<div class="responsively">
					
					<a href="heart-rings">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/hearts_rings_mobile.jpg" alt="Silver Heart Rings" class="img-responsive">
							
							</a>
				</div>
				<div class="pdata">
						<p>Silver Heart Rings - Let Her Heart Sing With Joy</p>
						<div class="clearfixed"></div>
				</div>
				
			</div>
			<div class="col-md-6 col-xs-6 contents">
				<div class="responsively">
				
				<a href="cocktail-rings">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/cocktail_rings1.jpg" alt="Silver Cocktail Rings" class="img-responsive">
							
							</a>
				</div>
				<div class="pdata">
						<p>Party Rings - Statement Occasion Rings </p>
						<div class="clearfixed"></div>
				</div>
				
			</div>
			<div class="col-md-6 col-xs-6 contents">
				<div class="responsively">
					
					<a href="tree-of-life-jewelry">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/treeoflife1.jpg" alt="Three stone promise ring in 925 Silver" class="img-responsive">
							
							</a>
					
				</div>
				<div class="pdata">
						<p>3 Stone Silver Rings - Make Memories</p>
						<div class="clearfixed"></div>
				</div>
				
			</div>
		</div>
		
		
		<div class="row  contents section category-listing-block ">
		
		   <div class="col-xs-12 col-sm-12">
			<h1 class="title-1"><span>Shop Silver Jewelry</span></h1> 
			
		<?php foreach ($categories as $category) { ?>
			<?php if ($category['children']) { ?>	
			
			<button class="accordion">
		
			 <img src="<?php if(CDN_HTTPS_SERVER!="") echo CDN_HTTPS_SERVER; ?><?php echo $category['icon']; ?>" alt="<?php echo $category['name']; ?>">
			 <span><?php echo $category['name']; ?></span>
		
	        </button>
			<div class="panel">
			<ul class="animate"> 
					<li><a href="<?php echo $category['href']; ?>"  title="Rings">View All <?php echo $category['name']; ?> Designs</a></li> 
					<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>	
					<?php foreach ($children as $child) { ?>
					<li><a href="<?php echo $child['href']; ?>"  title="<?php echo $child['name']; ?>"><?php echo $child['name']; ?></a></li> 
					<?php } ?>
			<?php } ?>	
			</ul> 
			</div>
			<?php } ?>
			<?php } ?>	
			</div>
			<script>
			var acc = document.getElementsByClassName("accordion");
			var i;
			for (i = 0; i < acc.length; i++) {
				acc[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var panel = this.nextElementSibling;
					if (panel.style.display === "block") {
						panel.style.display = "none";
					} else {
						panel.style.display = "block";
					}
				});
			}
			</script>
	</div>
<div class="clear"></div>
		<div class="row  ">
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
					
					<a href="dancing-american-diamond">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/dancing_GIF.gif" alt="Silver Stud Earrings for daily wear" class="img-responsive">
							
							</a>
					
					
					
					</div>
					<div class="pdata">
							<p>Timeless Studs - Light Weight Studs For Daily Wear</p>
							<div class="clearfixed"></div>
					</div>
					
				</div>
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
					<a href="pearl-jewelry">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/pearl_mobile.jpg" alt="Silver Hoop Earrings" class="img-responsive">
							
							</a>
					</div>
					<div class="pdata">
							<p>Silver Hoop Earrings – The Latest Trend</p>
							<div class="clearfixed"></div>
					</div>
				</div>
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
					
						<a href="ruby-hues">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/Ruby_collection.jpg" alt="Silver Danglers" class="img-responsive">
							
							</a>
					
						<!--<img class="responsively-lazy"  src="images/desk/danglers-min.jpg" data-srcset=""  alt="Diamond_Gemstone">-->
						 
					</div>
					<div class="pdata">
							<p>Silver Danglers – Must Have Earrings For The Festive Season</p>
							<div class="clearfixed"></div>
					</div>
					
				</div>
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
					<a href="blue-hues">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/blue-hues.jpg" alt="Silver Ear Climbers" class="img-responsive">
							
							</a>
						<!--<img class="responsively-lazy"  src="images/desk/climbers-min.jpg" data-srcset=""  alt="Diamond_Gemstone">-->
						
					</div>
					<div class="pdata">
							<p>For The Fashionista - Most Wanted Crawler Earrings</p>
							<div class="clearfixed"></div>
					</div>
					
				</div>
		</div>
		
	
		

		<div class="row contents">
		<div class="col-md-6 col-xs-12">
			
		<div class="responsively video">
		
		
		
			<a class="youtube cboxElement" href="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fornatejewelscom%2Fvideos%2F1565330503612050%2F&amp;width=640&amp;show_text=0&amp;height=390&amp;appId">
			
              <img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/bangle_video_mobile.jpg" alt="silver jewellery wholesale india" >
                                                                </a>	
		</div>													
			
		</div>
		<div class=" col-md-6 col-xs-12">
			<div id="" class="view view-tenth">
				<a>
					
						<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/hbanner/desk-advantage-min.jpg" class="img-responsive" alt="Ornate Jewels – Why Buy from Us">
					
				</a>
			</div>
		</div>
		
		
		
		</div>
	
		<div class="row  ">
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
					
					<a href="studs-earrings">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/stud_mobile.jpg" alt="Silver Stud Earrings for daily wear" class="img-responsive">
							
							</a>
					
					
					
					</div>
					<div class="pdata">
							<p>Timeless Studs - Light Weight Studs For Daily Wear</p>
							<div class="clearfixed"></div>
					</div>
					
				</div>
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
					<a href="hoops-earrings">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/hoops_mobile.jpg" alt="Silver Hoop Earrings" class="img-responsive">
							
							</a>
					</div>
					<div class="pdata">
							<p>Silver Hoop Earrings – The Latest Trend</p>
							<div class="clearfixed"></div>
					</div>
				</div>
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
					
						<a href="danglers-earrings">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/danglers_mobile.jpg" alt="Silver Danglers" class="img-responsive">
							
							</a>
					
						<!--<img class="responsively-lazy"  src="images/desk/danglers-min.jpg" data-srcset=""  alt="Diamond_Gemstone">-->
						 
					</div>
					<div class="pdata">
							<p>Silver Danglers – Must Have Earrings For The Festive Season</p>
							<div class="clearfixed"></div>
					</div>
					
				</div>
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
					<a href="climbers-earrings">
						
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/climbers.jpg" alt="Silver Ear Climbers" class="img-responsive">
							
							</a>
						<!--<img class="responsively-lazy"  src="images/desk/climbers-min.jpg" data-srcset=""  alt="Diamond_Gemstone">-->
						
					</div>
					<div class="pdata">
							<p>For The Fashionista - Most Wanted Crawler Earrings</p>
							<div class="clearfixed"></div>
					</div>
					
				</div>
		</div>
		<div class="row contents">
		<div class="col-md-12 col-xs-12 col-sm-12">
			<div class="strip-banner">
				
				<a href="emerald-hues">
					
						<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/EMERALD-COLLECTION_mobile.jpg" class="img-responsive" alt="gifts ideas for girls and women">
					
				</a>
				
			</div>
		</div>
		</div>
		<div class="row contents">
		<div class="col-md-12 col-xs-12 col-sm-12">
			<div class="strip-banner">
				
				<a href="bracelets">
					
						<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/BRACELETS.jpg" class="img-responsive" alt="gifts ideas for girls and women">
					
				</a>
				
			</div>
		</div>
		</div>
		<div class="row contents">
		<div class="col-md-12 col-xs-12 col-sm-12">
			<div class="strip-banner">
				
				<a href="all-under-999">
					
						<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/Under_999.jpg" class="img-responsive" alt="gifts ideas for girls and women">
					
				</a>
				
			</div>
		</div>
		</div>
	
	<div class="row">
            <div class="col-xs-12 col-md-12 col-sm-12">
                        <h1 class="title-1">
                        <span>Our Media Coverage</span>
                        </h1> 
            </div>
            <div class="col-md-6 col-xs-12 col-sm-6 contents"> 
                    <div class="video">
                        <div class="flexslider">
							<div class="flex-viewport" style="overflow: hidden; position: relative;">
                                <ul class="slides" style="width: 100%;">
                                    <li class="clone" aria-hidden="true" style="margin-right: 0px; float: left; display: block;text-align:center">
                                        <a class="youtube cboxElement" href="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fornatejewelscom%2Fvideos%2F491210634336380%2F&amp;width=640&amp;show_text=false&amp;height=390&amp;appId">
                                        <img src="https://ornate-bc57.kxcdn.com/images/webp/news-video.jpg" alt="silver jewelry manufacturer">
                                        </a>
                                    </li>
                                    <li style=" margin-right: 0px; float: left; display: block;text-align:center" class="flex-active-slide">
										<a class="youtube cboxElement" href="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fornatejewelscom%2Fvideos%2F481521515305292%2F&amp;width=640&amp;show_text=0&amp;height=390&amp;appId">
										<img src="https://ornate-bc57.kxcdn.com/images/webp/news-video1.jpg" alt="silver jewellery wholesale india">
                                    </a>
                                    </li>
                                    <li style=" margin-right: 0px; float: left; display: block;text-align:center" class="flex-active-slide">
                                    <a class="youtube cboxElement" href="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fornatejewelscom%2Fvideos%2F481521515305292%2F&amp;width=640&amp;show_text=0&amp;height=390&amp;appId">
                                    <img src="https://ornate-bc57.kxcdn.com/images/new/news-video2.jpg" alt="silver jewellery wholesale india">
                                    </a>
                                    </li>
                                </ul>
                            </div>
                                <ul class="flex-direction-nav">
                                    <li class="flex-nav-prev"><a class="flex-prev" href="#">Previous</a></li>
                                    <li class="flex-nav-next"><a class="flex-next" href="#">Next</a></li>
                                </ul>
                        </div>
                    </div>        
            </div>
            <div class="col-md-6 col-xs-12 col-sm-6 contents">
                <div class="news">
                                
                    <style>
                        .flex-direction-nav a {
                        opacity: 1;
                        margin: -50px 0 0;
                        }
                        .flex-direction-nav .flex-prev {
						left: 36px
						}
                         .flex-direction-nav .flex-next {
						right: 36px
						}
                         @media (max-width:767px){
                                 .flex-direction-nav .flex-prev {
									left: 0px
							}
                         .flex-direction-nav .flex-next {
							right: 0px
							}
                         .flex-direction-nav a {
                        opacity: 1;
                        margin: -25px 0 0;
                        }
                        .flex-direction-nav .flex-prev {
                        left: 0;
                        width: 30px;
                        height: 30px;
                        
                        }

                        .flex-direction-nav .flex-next {
                                right: 0;
                                
                                width:30px;
                                height: 30px;
                        }
                        .flex-direction-nav a{
                                
                        }
                         }
					</style>
                        
					<div class="flexslider">
                        
						<div class="flex-viewport" style="overflow: hidden; position: relative;">
							<ul class="slides" style="width: 100%;">
							<li class="clone" aria-hidden="true" style=" margin-right:10px;margin-left:10px; float: left; display: block;text-align:center">
							<a rel="nofollow" href="https://www.bhaskar.com/news/MH-PUN-HMU-mothers-day-special-meet-a-mothers-who-start-india-first-silver-jewelry-online-s-5597252-.html" target="_blank">
							<img src="https://ornate-bc57.kxcdn.com/images/blog-webp/news.png" alt="sterling silver jewellry" > </a>
							</li>
							<li style=" margin-right:0; float: left; display: block;text-align:center" class="flex-active-slide">
							<a rel="nofollow" href="https://www.scoopearth.com/meet-shelly-luthra-and-know-about-her-startup-journey-for-online-silver-jewelry-ornate-jewels/" target="_blank">
							<img src="https://ornate-bc57.kxcdn.com/images/scoop-earth.jpg" alt="sterling silver designer jewelry">
							</a>
							</li>
							<li style=" margin-right:0; float: left; display: block;text-align:center" class="flex-active-slide">
							<a rel="nofollow" href="https://www.yosuccess.com/interviews/shelly-luthra-ornate-jewels-interview/" target="_blank">
							<img src="https://ornate-bc57.kxcdn.com/images/blog/yosuccess-min.jpg"  alt="sterling silver designer jewelry"> </a></li>
					
							<li style=" margin-right:0; float: left; display: block;text-align:center" class="flex-active-slide">
							<a rel="nofollow" href="https://www.bhaskar.com/lifestyle/happy-life/news/karwa-chauth-2018-women-likes-light-and-shiney-jewellery-01163778.html" target="_blank">
							<img src="https://ornate-bc57.kxcdn.com/images/news_img.jpg" alt="sterling silver designer jewelry"> </a></li>
					
							</ul>
						</div>
							<ul class="flex-direction-nav">
								<li class="flex-nav-prev"><a class="flex-prev" href="#">Previous</a></li>
								<li class="flex-nav-next"><a class="flex-next" href="#">Next</a></li>
							</ul>
					</div>
				</div>
            </div>
    </div>
	<div class="row contents">
			<div class="col-xs-12 col-md-12 ">
				<h1 class="title-1"><span>New Arrivals</span></h1> 
			</div>
		<div class="col-xs-12 col-md-12 ">
			<div class="swiper-viewport">
				<div id="carousel0" class="swiper-container">
					<div class="swiper-wrapper"> 
					
					<?php foreach($newproducts as $newproduct) { ?>
					
						
						
						<div class="swiper-slide text-center swiper-slidenew" >
						<a href="<?php echo $newproduct['href']; ?>"> 
							<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $newproduct['thumb']; ?>" alt="<?php echo $newproduct['name']; ?>" title="<?php echo $newproduct['name']; ?>"/>
							<p><?php echo $newproduct['price']; ?></p>
							
						</a>
						<br>
				<?php		 $pro_name= utf8_substr(strip_tags(html_entity_decode($newproduct['name'], ENT_QUOTES, 'UTF-8')), 0, 20) . '..'; ?>
						<a  href="<?php echo $newproduct['href']; ?>"><?php 
			 
			  echo  $pro_name; ?></a>
						<br><br>
						<a class="btn shop" href="<?php echo $newproduct['href']; ?>">
						<span class=""> SHOP NOW</span>
						</a>
						</div>

						
						
					<?php } ?>
						
					
					</div>
				</div>
				
				<div class="swiper-pagination carousel0"></div>
				<div class="swiper-pager">
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
			<script type="text/javascript">
				
					
					var swiper = new Swiper('#carousel0', {
					  slidesPerView: 1,
					  spaceBetween: 30,
					  slidesPerGroup: 3,
					  loop: true,
					  loopFillGroupWithBlank: true,
					  nextButton: '.swiper-button-next',
						prevButton: '.swiper-button-prev',
					 // navigation: {
					//	nextEl: '.swiper-button-next',
						//prevEl: '.swiper-button-prev',
					 // },
					});

					
				</script>
				 <style>
				  .swiper-slidenew img{
					border: 1px solid #dddddd;
					width: 200px;
					height: 200px;
					margin-top:10px;
				}
				a.shop {
					font-size: 12px;
					color: #fff;
					background: #6f7782;
					padding: 10px;
					font-weight:700;
				}
				  </style>

			</div>
			
		</div>
		<div class="row contents">
		<div class="col-xs-12 col-md-12 col-sm-12">
			<h1 class="title-1"><span>Necklaces</span></h1> 
		</div>
		
			<div class="col-xs-12 col-md-12 col-sm-12">
				<div id="" class="view view-tenth">
					
						<div class="banner-img">
							
							<a href="alphabet-jewelry">
							
								<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/necklaces.jpg" class="img-responsive" alt="Free 925 Silver Chain with every Pendant">
							
							</a>
						</div>
					
				</div>
			</div>
		</div>
		<div class="row contents">
		<div class="col-xs-12 col-md-12 col-sm-12">
			<h1 class="title-1"><span>Best Sellers</span></h1> 
		</div>
		<div class="col-xs-12 col-md-12 ">
		
			<div class="swiper-viewport">
				<div id="carousel2" class="swiper-container">
					<div class="swiper-wrapper"> 
						
						<?php foreach($bestseller as $best){ ?>
						<div class="swiper-slide text-center swiper-slidenew" >
                           <a href="<?php echo $best['href']; ?>">
							<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $best['thumb']; ?>"  alt="<?php echo $best['name']; ?>" title="<?php echo $best['name']; ?>"/>
							<p><?php echo $best['price']; ?></p>
                            </a>
							<br>
							<?php $pro_name1= utf8_substr(strip_tags(html_entity_decode($best['name'], ENT_QUOTES, 'UTF-8')), 0, 20) . '..'; ?>
								<a  href="<?php echo $best['href']; ?>"><?php echo  $pro_name1; ?></a>
							<br><br>
								<a class="btn shop" href="<?php echo $best['href']; ?>"><span class="">SHOP NOW</span></a>	
						</div>
						<?php } ?>
						
					</div>
				</div>
				<div class="swiper-pagination carousel2"></div>
				<div class="swiper-pager">
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
			<script type="text/javascript">
				$('#carousel2').swiper({
					mode: 'horizontal',
					slidesPerView: 1,
				
					paginationClickable: true,
					nextButton: '.swiper-button-next',
					prevButton: '.swiper-button-prev',
					autoplay: 3500,
					loop: true
				});
			</script>
		</div>
		
    </div>
	<div class="row   ">
			<div class="col-md-6 col-xs-12 contents">
				<div id="" class="view view-tenth">
					<a href="solitaire-pendants">
						
							<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/xmas/solitaire_pendents-min.jpg" class="img-responsive" alt="Kids Jewelry in Pure Silver">
						
					</a>
				</div>
			</div>
			<div class="col-md-6 col-xs-12 contents">
				<div id="" class="view view-tenth">
					<a href="engagement-rings">
						
							<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/engagement_mobile.jpg" class="img-responsive " alt="Alphabet Silver Necklaces">
						
					</a>
				</div>
			</div>
		</div>
		<div class="row contents">
			<div class="col-xs-12 col-md-12 col-sm-12">
				<h1 class="title-1"><span>Testimonials</span></h1> 
			</div>
			<div class="col-xs-12 col-md-12 ">
				<div class="swiper-viewport">
					<div id="carousel1" class="swiper-container">
						<div class="swiper-wrapper"> 
							
							<?php foreach($testimonials as $testi) { ?>
							<div class="swiper-slide text-center" >
								<div class="product-layout col-md-12 ">
									<div class="col-md-12 ">
										<div class="image text-center">
											<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $testi['image']; ?>" alt="<?php echo $testi['author']; ?>">
										</div>
									</div>
									<div class="col-md-12 ">
										<div class="paratext">
											<div class="rating text-center">
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
												<span class="vname"> Verified Purchase</span>
											</div>
											<p class="comment"><?php echo $testi['text']; ?></p>
										</div>
										<div class="paratext text-right" style="font-size:13px;" >
											<?php echo $testi['author']; ?> - <?php echo $testi['city']; ?>	
										</div>
										<div class="datetext text-right" style="font-size:13px;"><span><?php echo $testi['date_added']; ?></span></div>
									</div>
								</div>
							</div>
							<?php } ?>
							
						</div>
						</div>
					<div class="swiper-pagination carousel1"></div>
					<div class="swiper-pager">
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
					<script type="text/javascript">
					
					$(document).ready(function() {
					if ($(window).width() < 767) {
						
						var testimonial_slider=1;
					}else{
						var testimonial_slider=3;
					}
					
					
					$('#carousel1').swiper({
						mode: 'horizontal',
						slidesPerView: testimonial_slider,
						
						paginationClickable: true,
						nextButton: '.swiper-button-next',
						prevButton: '.swiper-button-prev',
						autoplay: 2500,
						loop: true
					});
					
					});
					</script>
			</div>
			
		</div>
		<div class="row contents">
			<div class="col-md-12 col-xs-12 col-sm-12">
				<div class="strip-banner">
				<a href="american-diamonds">
						<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/999_deals.jpg"  />
							
							
							
							</a>
				</div>
			</div>
		</div>
		
			<div class="row ">
				
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
						<a href="kids-jewels">
							
							<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/kids.jpg" alt="Blue Sapphire Jewelry" class="img-responsive">
							</a>
					</div>
					<div class="pdata">
						<p>Bestsellng Created Blue Sapphire Jewellery </p>
						<div class="clearfixed"></div>
					</div>
						
				</div>
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
						<a href="american-diamond-necklace">
							
							<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/m-necklace.jpg" alt="Floral Jewelry" class="img-responsive">
							</a>
					</div>
					<div class="pdata">
						<p>Flower Jewelry – The Flower That Will Last Forever</p>
						<div class="clearfixed"></div>
					</div>
						
				</div>
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
						<a href="flower-necklaces">
							
							<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/FLOWER_NECKLACES.jpg" alt="Silver Birthstone Jewelry for Girls and Women
Pearl Rings" class="img-responsive">
							</a>
					</div>
					<div class="pdata">
						<p>Give The Best Gift - Find Her Birthday Color </p>
						<div class="clearfixed"></div>
					</div>
					</div>
				<div class="col-md-6 col-xs-6 contents">
					<div class="responsively">
						<a href="halo-rings">
							
							<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/HALO_mobile.jpg" alt="Pearl Rings for Women and Girls" class="img-responsive">
							</a>
					</div>
					<div class="pdata">
						<p>Freshwater Pearls - Real Pearls Jewellery </p>
						<div class="clearfixed"></div>
					</div>
						
				</div>
				
			</div>
       
        <div class="row  hidden-lg hidden-md hidden-sm">
		<div class="col-xs-12 col-sm-12 contents">
			<div class="banner-img">
				<a href="necklaces-sets-with-earring">
					
					
					<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/necklaces-sets.jpg" alt="mothers-day" class="">
					
				</a>	
			</div>
		</div>	
		</div>
		<div class="row  contents">	
			<div class="col-xs-12 ">
			<h1 class="title-1"><span>Offers</span></h1> 
			</div>
		
		<div class="col-xs-12 ">
		<div class="swiper-viewport">
			<div id="carousel3" class="swiper-container">
				<div class="swiper-wrapper"> 
				
				
				<?php foreach($offerproducts as $offer) { //print_r($offer);?>
					<div class="swiper-slide text-center swiper-slidenew" >
                    <a href="<?php echo $offer['href']; ?>">
					
						<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="<?php echo $offer['thumb']; ?>"  alt="<?php echo $offer['name']; ?>" title="<?php echo $offer['name']; ?>"/>
						
						<?php if($offer['special']) { ?>
						
						<p class="left" style="color: #a0a0a0;text-decoration: line-through;"> <?php echo $offer['price']; ?></p>
						<p class=""><?php echo $offer['special']; ?></p>
						
						<?php }else { ?>
						<p> <?php echo $offer['price']; ?></p>
						<?php } ?>
						
						
						
						
					</a>
					<br>
					<?php $pro_name2= utf8_substr(strip_tags(html_entity_decode($offer['name'], ENT_QUOTES, 'UTF-8')), 0, 20) . '..'; ?>
					<a  href="<?php echo $offer['href']; ?>"><?php echo  $pro_name2; ?></a>
					<br><br>
					<a class="btn shop" href="<?php echo $offer['href']; ?>"><span class="">SHOP NOW</span></a>	
					</div>
				<?php } ?>
					
					
				</div>
			</div>
			<div class="swiper-pagination carousel3"></div>
			<div class="swiper-pager">
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
		<script type="text/javascript">
		$('#carousel3').swiper({
			mode: 'horizontal',
			slidesPerView: 1,
		
			paginationClickable: true,
			nextButton: '.swiper-button-next',
			prevButton: '.swiper-button-prev',
			autoplay: 2500,
			loop: true
		});
		</script>
		</div>
		</div>
		<div class="row contents">

			<div class="col-xs-12 col-md-12 ">
				<h1 class="title-1"><span>From Our Blog</span></h1> 
			</div>
			<div class="col-md-6 col-xs-12 ">
					<div class="responsively">
						<a href="https://blog.ornatejewels.com/how-to-accessorise-silver-jewellery-with-western-outfits/" target="_blank">
						
						<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/mob/mobile_what-to-wear-with-western-outfit-min.jpg" alt="blue sapphire jewelry"/>
						
						
							<!--<img src="https://ornate-bc57.kxcdn.com/images/Blog_image.jpg" alt="Blue Sapphire Jewelry" class="img-responsive lazy1" data-src="https://ornate-bc57.kxcdn.com/images/Blog_image.jpg">-->
							</a>
					</div>
					
						
				</div>
				
				<div class="col-md-6 col-xs-12 ">
					<div class="responsively">
						<a href="https://blog.ornatejewels.com/top-jewelry-metals-and-color-trends-for-2019/" target="_blank">
							<img class="lazy" src="https://ornate-bc57.kxcdn.com/images/loader.svg"  data-src="https://ornate-bc57.kxcdn.com/images/2019.jpg"  alt="pure silver earrings"/>
							
							</a>
					</div>
					
						
				</div>
				
		</div>
		
		
	<!--	<section class="categories-main" >
				<div class="container">
		
              <div id="content-1" class=" para content  mCustomScrollbar content-scroll" style="" >
		<div class=" footer_links" style="">
			<p style="font-size: 14pt">TOP CATEGORIES</p>
			<p class="footer_links_heading"></p>
			<p><span class="sub-taxonomy">
			<a href="rings">Rings</a></span>
			<span class="cap"><a href="rings">Rings</a></span><span class="cap"><a href="american-diamond-rings">American Diamond Rings</a></span><span class="cap"><a href="pearl-rings">Pearl Rings</a></span><span class="cap"><a href="solitaire-rings">Solitaire Rings</a></span><span class="cap"><a href="color-gemstone-rings">Color Gemstone Rings</a></span><span class="cap"><a href="couple-bands">Couple Bands</a></span><span class="cap"><a href="crown-rings">Crown Rings</a></span><span class="cap"><a href="/emerald-rings">Emerald Rings</a></span><span class="cap"><a href="engagement-rings">Engagement Rings</a></span><span class="cap"><a href="gold-plated-rings">Gold Plated Rings</a></span><span class="cap"><a href="heart-rings">Heart Rings</a></span><span class="cap"><a href="office-wear-rings">Office Wear Rings</a></span><span class="cap"><a href="past-present-future-rings">Past Present Future Rings</a></span><span class="cap"><a href="promise-rings">Promise Rings</a></span><span class="cap"><a href="ruby-rings">Ruby Rings</a></span><span class="cap"><a href="sapphire-rings">Sapphire Rings</a></span><span class="cap"><a href="cocktail-rings">Cocktail Rings</a></span><span class="cap"><a href="band-rings">Band Rings</a></span></p><p><span class="sub-taxonomy"><a href="earrings">Earrings</a></span><span class="cap"><a href="american-diamond-rings">American Diamond Earrings</a></span><span class="cap"><a href="hoops-earrings">Hoops Earrings</a></span><span class="cap"><a href="pearl-earrings">Pearl Earrings</a></span><span class="cap"><a href="gold-plated-earrings">18 Carat Gold Plated Earrings</a></span><span class="cap"><a href="colored-gemstone-earrings">Colored Gemstone Earrings</a></span><span class="cap"><a href="emerald-earrings">Emerald Earrings</a></span><span class="cap"><a href="heart-earrings">Heart Earrings</a></span><span class="cap"><a href="office-wear-earrings">Office Wear Earrings</a></span><span class="cap"><a href="party-earrings">Party Earrings</a></span><span class="cap"><a href="ruby-earrings">Ruby Earrings</a></span><span class="cap"><a href="sapphire-earrings">Sapphire Earrings</a></span><span class="cap"><a href="solitaire-earrings">Solitaire Earrings</a></span><span class="cap"><a href="stone-in-motion-earrings">Stone-In Motion Earrings</a></span><span class="cap"><a href="tree-of-life-earrings">Tree Of Life Earrings</a></span><span class="cap"><a href="climbers-earrings">Climbers Earrings</a></span><span class="cap"><a href="chandeliers-earrings">Chandeliers Earrings</a></span><span class="cap"><a href="studs-earrings">Studs Earrings</a></span><span class="cap"><a href="omega-back-earrings">Omega-back Earrings</a></span><span class="cap"><a href="danglers-earrings">Danglers Earrings</a></span><span class="cap"><a href="men-studs-earrings">Men Studs Earrings</a></span></p><p><span class="sub-taxonomy"><a href="necklaces">Necklaces</a></span><span class="cap"><a href="alphabet-necklace">Alphabet Necklaces</a></span><span class="cap"><a href="american-diamond-necklace">American Diamond Necklaces</a></span><span class="cap"><a href="necklaces-sets-with-earring">Necklaces Sets With Necklaces</a></span><span class="cap"><a href="pearl-necklaces">Pearl Necklaces</a></span><span class="cap"><a href="solitaire-pendants">Solitaire Necklaces</a></span><span class="cap"><a href="gold-plated-necklaces">18 Carat Gold Plated Necklaces</a></span><span class="cap"><a href="birthstone-necklaces">Birthstone Necklacess</a></span><span class="cap"><a href="emerald-necklaces">Emerald Necklaces</a></span><span class="cap"><a href="flower-necklaces">Flower Necklaces</a></span><span class="cap"><a href="gifts-for-girls">Gifts For Girls</a></span><span class="cap"><a href="heart-necklaces">Heart Necklaces</a></span><span class="cap"><a href="infinity-necklaces">Infinity Necklaces</a></span><span class="cap"><a href="kids-necklaces">Kids Necklaces</a></span><span class="cap"><a href="lariat-necklaces">Lariat Necklaces</a></span><span class="cap"><a href="office-wear-necklaces">Office Wear Necklaces</a></span><span class="cap"><a href="ruby-necklaces">Ruby Necklaces</a></span><span class="cap"><a href="sapphire-necklaces">Sapphire Necklaces</a></span><span class="cap"><a href="star-necklace">Star Necklaces</a></span><span class="cap"><a href="stone-in-motion-necklaces">Stone In Motion Necklaces</a></span><span class="cap"><a href="tree-of-life-necklaces">Tree Of Life Necklaces</a></span></p><p><span class="sub-taxonomy"><a href="bracelets">Bracelets</a></span><span class="cap"><a href="pearl-bracelet">Pearl Bracelets</a></span><span class="cap"><a href="american-diamond-bangles">American Diamond Bracelets</a></span><span class="cap"><a href="american-diamond-bracelet">American Diamond Bracelets</a></span><span class="cap"><a href="emerald-bangles">Emerald Bangles</a></span><span class="cap"><a href="heart-bracelets">Heart Bracelets</a></span><span class="cap"><a href="ruby-bangles">Ruby Bracelets</a></span><span class="cap"><a href="sapphire-bangles">Sapphire Bracelets</a></span><span class="cap"><a href="tennis-bracelet">Tennis Bracelets</a></span></p><p class="footer_links_heading"><a href="collections" style="color: #000000 ! important;">
Collections
</a></p><p><span class="cap"><a href="all-under-2000">All Under ₹2000</a></span><span class="cap"><a href="all-under-999">All Under ₹999</a></span><span class="cap"><a href="gifts-for-mom">Gifts For Mom</a></span><span class="cap"><a href="new-arrival">New Arrival</a></span><span class="cap"><a href="gifts-for-girls">Gifts For Girls</a></span><span class="cap"><a href="flower-Jewellery">Flower Jewellery</a></span><span class="cap"><a href="18k-yellow-gold-plated-jewelry">18 Carat Yellow Gold Plated Jewelry</a></span><span class="cap"><a href="alphabet-jewelry">Alphabet Jewelry</a></span><span class="cap"><a href="birthstone-color-jewelry">Birthstone Color Jewelry</a></span><span class="cap"><a href="american-diamonds">American Diamonds</a></span><span class="cap"><a href="blue-hues">Blue Hues</a></span><span class="cap"><a href="canary-yellow-safari">Canary Yellow Safari</a></span><span class="cap"><a href="colorazzi">Colorazzi</a></span><span class="cap"><a href="diamond-alternate">Diamond Alternate</a></span><span class="cap"><a href="emerald-hues">Emerald Hues</a></span><span class="cap"><a href="hearts-jewelry">Hearts Jewelry</a></span><span class="cap"><a href="infinity-jewelry">Infinity Jewelry </a></span><span class="cap"><a href="love-of-lustre">Love Of Lustre</a></span><span class="cap"><a href="pearl-jewelry">Pearl Jewelry</a></span><span class="cap"><a href="dancing-american-diamond">Dancing American Diamond</a></span><span class="cap"><a href="tree-of-life-jewelry">Tree Of Life Jewelry</a></span><span class="cap"><a href="solitaire-jewelry">Solitaire Jewelry</a></span></p><p class="footer_links_heading"><a href="kids-jewels" style="color: #000000 ! important;">
Kids Jewels
</a></p><p><span class="cap"><a href="kids-bracelets">Kids Bracelets </a></span><span class="cap"><a href="kids-earrings">Kids Earrings</a></span><span class="cap"><a href="kids-pendant-with-chain">Kids Pendant With Chain</a></span></p></div>





<h1  style="font-size: 14pt; text-transform: uppercase; color:#000" >Silver Jewellery</h1>


<p class="">Jewelry is the one accessory that adds that extra touch of glamour, of any woman’s jewel box. Jewelry is not just an accessory, it’s a memory, it’s a celebration, and it’s a promise, a keepsake, a tradition that goes a long way. A man vows to a woman with a piece of jewelry in many cultures. A new bride is welcomed with jewelry; a child’s birth is celebrated with jewelry. It’s an eternal and an important part of a woman’s journey. Indians have a special love of jewelry be it gold, silver or diamonds. Ornate jewels keep this journey sparkly with pure 925 sterling silver jewelry for women, online. The only online jewelry-shopping destination in india, which designs and manufactures all designs in house, hence the low prices jewelry and highest quality. Strict manufacturing standards are followed and each piece is inspected for quality. The highest qualities of aaa grade american diamonds that shine and sparkle so bright are studded. There is no middle man so you get to save and buy the most affordable and latest high quality jewelry. You can find more than 1000 designs in 925 silver rings for women and girls, silver 925 bracelets, real pure pearls, silver earrings for girls and women, silver necklaces, pendants and chains to name a few. Bringing to you, the latest 925 silver jewelry designs so always have a huge variety to choose from. Our online store is always stocked with the everyday wearable designs in silver jewelry so you always find something for you or your loved ones. Here jewelry starts from rs. 399, which makes it a great gifting option as well. If you are looking for gifts for her for valentine, anniversary, wedding or even a proposal, shop from the vast range of silver engagement rings. Solitaire rings are very popular bestsellers and you can be assured of the best quality. Offering lifetime guarantee on silver not turning black so you can shop with confidence .our sterling silver jewelry will be shipped in a tamper proof envelope and a designer velvet lined gift box which makes it easier for you to gift. A handwritten note can be included on your behalf as well. Get superb customer service and highest quality jewelry always. Rest assured that you will have a hassle free and memorable shopping experience. Quality and customer service is of utmost importance to us. Ornatejewels is widely known for its wearable and lightweight sterling silver jewelry in india and it’s very much appreciated all over the country. Most of its women customers love wearing ornate because of its unique designs as they are looking for everyday office wear silver jewelry, which they can afford and also should be allergy free. The jewelry is pure 925 so it’s even safe for kids. You can choose gifts for kids and newborns making your gift giving easy. All your purchases will come with a warranty and purity certificate.</p>

<h2 style="font-size: 14pt; text-transform: uppercase; color:#000"><i>PURE 925 STERLING SILVER DESIGNER JEWELLERY ONLINE SHOPPING </i>AT BEST AND LOWEST MANUFACTURER’S PRICE</h2>
<h3 >Why people are buying silver jewelry these days?</h3>
<p class="">Silver jewellery has been always the most popular metal due to its affordability and shine Ornaments have been crafted with this metal throughout the ages.  This metal dates back many hundred years ago .Its sparkling beauty and color suits every skin type and is hypoallergenic. It makes a great buy as its strong and durable metal as well as budget friendly. Silver 925 have many healing properties as well .Many Jewelry designers choose silver to craft their jewelry and sometimes they would like to gold plate it for the look of gold. The luster of this metal is great and it looks like white gold. Silver brings calm to the wearer and also has great places in astrology. It’s recommended to many people to wear it for its healing effects. Today’s woman has a distinctive taste in everything. They want to buy fashionable yet affordable accessories. More than anything women want to buy quality jewellery designs, which can last forever If you are one of those quality lovers, then silver jewellery at our online store is the perfect choice for you which can be shopped from the comfort of your home. Our jewellery set is about latest trends yet can be worn for years to come for any occasion and age. Pure silver jewellery makes a budget memorable gift as well. For those evenings out buy from our cocktail rings collections and flaunt a great piece of jewelry on your finger. Silver is a safe metal to wear, especially for those who are allergic to cheap metals. When you buy silver you can be assured that you are getting value for your money. Many celebrities and fashion enthusiasts alike sport and promote silver jewellery. Silver is the new gold. Buy with confidence, your next pair of earrings or a sparkling shiny necklace with 18-inch pure silver chain that is included in the price. </p>
<h3 style="color:#000">Why is sterling silver most bought metal?</h3>
<p>Silver jewellery has been always the most popular metal due to its affordability. Ornaments have been crafted with this metal throughout the ages. Its sparkling beauty and color suits every skin type and is hypoallergenic. It makes a great buy as its strong and durable metal as well as budget friendly. Many Jewelry designers choose silver to craft their jewelry and sometimes they would like to gold plate it for the look of gold. The luster of this metal is great and it looks like white gold. Silver brings calm to the wearer and also has great place in astrology.</p>

<h4>Silver Rings:</h4>

<p>Rings are the perfect adornment for any hand. 925 sterling Silver rings make a great buy for its look that imitates the look of white gold. 925 silver rings come in many shapes and sizes. One can choose from plain band rings, American diamond rings, big party cocktail rings, which are generally studded with big gemstones. Ruby, emerald and sapphire rings are also very popular amongst women. The three stone promise ring and Solitaire ring are a hottest trend when it comes to rings. Many men choose to buy these as a gift for her.</p>

<h4>Silver Necklace:</h4>
<p>A necklace is an essential piece of jewelry that makes any neck sparkle. In many cultures a necklace of a certain kind is worn around the neck as a promise of a wedding. Mangalsutra is an example of this in India. A pendant necklace consists of a small pendant on a delicate pure 925 silver chain. Pendants come in various styles. They could be ranging from a single solitaire to an elaborate flower necklace. Dancing Stone in motion range necklaces is a hot seller in pendants. The stone in the center moves around a woman’s neck while she wears the necklace. There are many shapes and designs in pendants and even have lovely ones for the little kids or even babies.</p>


<h4>Silver Bracelet:</h4>
<p>Bracelet is an ornament which goes around your wrist and can add a certain charm to that wrist. The tennis silver bracelet is the most bought design all over the world. It’s a bracelet design that’s studded with tiny American diamonds that go all over in a line. The bracelets come in animal motifs, floral designs and even with pure pearls and silver. Bringing to you the latest and trendiest lightweight silver bracelets that are sure to be appreciated and loved by women. Many bracelets are one size fits all kinds. There are extenders on these bracelets so sizing is not an issue.  Any wrist size can wear them.  The colored gemstone bracelets and kids bracelet are quite in demand.</p>


<h4>Silver Earrings:</h4>
<p>No occasion or attire is complete without an earring. Be it a stud, dangler, or a hoop. Earrings come in various forms, designs and lengths. They can range from big dramatic ones with tiny studs for every day. Solitaire earrings are the most loved forms or earring all over the world. It tends to suit every face shape and haircut as well. A solitaire stud can be worn from day to night look. Colored gemstone studs are also well loved by women and even make an interesting choice of gift for kids to teenagers to women any age. The danglers are the long style of earrings, which can be in any length. American diamond earrings can be easily substituted for diamond earrings and can be worn for occasions and cost much less than the real ones. They make a good option as travelling diamonds jewelry. One can travel with them for our of town occasions and look and feel like a million bucks.</p>

<h4>Necklace Sets: </h4>
<p>A necklace set consists of a pair of earring and pendant. The necklace set can even have a matching ring as well. A set would normally have a similar looking earring and necklace. Popular choices can be pendant and necklace sets in 925 sterling silver which are studded with Created Emerald, Blue Sapphire, Red Ruby Stones, Pearl sets with earrings, Solitaire sets with American diamonds, and pink color sets, Yellow color jewelry sets, Blue color Jewelry sets to name a few.</p>





<p>At ornate buy silver jewelry at the lowest prices in India. A Superb after sale service is always there for you. More than happy to answer your product queries and any questions you may have. Always provides pleasant and safe shopping experience.  The website is secured by Thawte, a leading industry expert in SSL. So you can shop with peace of mind. All forms of payments are accepted and even COD is offered. Always love to see you coming back and shopping with us again and again. Serves you with the best. We thank our lovely customers with the bottom of our heart for letting us add a little sparkle in their lives. Make memories with jewelry gifts and we would be thankful if you choose us to be your jewelry partner in those special occasions and memories. We would love to be a part of your life once and always. </p>	

<p>Top searches: 
Silver jewelry, Silver rings for girls, silver rings for women, silver earrings for girls, silver earrings for women, silver bracelet for girls and women, silver bangles for girls, silver bangles for women, silver pendants and necklace sets
</p>


</div>
</div> 
</section>-->
</div>

 
   <?php echo $footer; ?>