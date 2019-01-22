<div id="wowslider-container1" class="wowslider-container<?php echo $module; ?> banner">  
    <div class="flexslider ">
        <ul class="slides">
             <?php foreach ($banners as $banner) { ?>
            <li>
                 <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>"  alt="<?php echo $banner['title']; ?>" class="" /></a>
            <?php } else { ?>
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"  class="" />
            <?php } ?>
            </li>
             <?php } ?>
        </ul>
    </div>
</div> 


<!--

<div id="wowslider-container1" class="wowslider-container<?php echo $module; ?>">
	<div class="ws_images">
		<ul class="slides">
			<?php foreach ($banners as $banner) { ?>
			<li>
				<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" id=""/></a>
			</li>
			<?php } ?>
		</ul>
	</div>
</div>-->	
<script type="text/javascript" src="catalog/view/javascript/jquery/responsive-slider/wowslider.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/responsive-slider/script.js"></script>	
<script>
jQuery(".wowslider-container<?php echo $module; ?>").wowSlider({effect:"<?php echo $effect; ?>",duration:<?php echo $duration; ?>*<?php echo $duration1; ?>,delay:<?php echo $delay; ?>*<?php echo $delay1; ?>,autoPlay:<?php echo $autoplay; ?>,playPause:<?php echo $playpause; ?>,stopOnHover:<?php echo $stoponhover; ?>,loop:<?php echo $loop; ?>,caption:<?php echo $caption; ?>,captionEffect:"parallax",controls:<?php echo $controls; ?>,controlsThumb:<?php echo $controlsthumb; ?>});
</script>