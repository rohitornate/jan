<?php if ($title) { ?>
<h3><?php echo $title; ?></h3>
<?php } ?>
<div id="tltslideshow<?php echo $slideshow; ?>" class="owl-carousel" style="opacity: 1;">
<?php foreach ($slides as $slide) { ?>
    <div class="tltslide">
    <?php if ($slide['link']) { ?>
    <a href="<?php echo $slide['link']; ?>">
    	<?php if ($slide['image']) { ?>
        	<img src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['title']; ?>" class="img-responsive" />
        <?php } else { ?>
        	<div style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px; margin: 0; padding: 0;">&nbsp;</div>
        <?php } ?>
        <?php if ($slide['textbox']) { ?>
        <?php if ($slide['override']) { ?>
        <div class="<?php echo $slide['css']; ?>" style="background: <?php echo $slide['background']; ?>; opacity: <?php echo $slide['opacity']; ?>;">
        <?php } else { ?>
        <div class="<?php echo $slide['css']; ?>">
        <?php } ?>
        <?php if ($slide['use_html']) { ?>
            <?php echo $slide['html']; ?>
        <?php } else { ?>
        	<h1><?php echo $slide['header']; ?></h1>
            <span><?php echo $slide['description']; ?></span>
        <?php } ?>
        </div>
        <?php } ?>
    </a>
    <?php } else { ?>
    	<?php if ($slide['image']) { ?>
        	<img src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['title']; ?>" class="img-responsive" />
        <?php } else { ?>
        	<div style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px; margin: 0; padding: 0;">&nbsp;</div>
        <?php } ?>
        <?php if ($slide['textbox']) { ?>
        <?php if ($slide['override']) { ?>
        <div class="<?php echo $slide['css']; ?>" style="background: <?php echo $slide['background']; ?>; opacity: <?php echo $slide['opacity']; ?>;">
        <?php } else { ?>
        <div class="<?php echo $slide['css']; ?>">
        <?php } ?>
        <?php if ($slide['use_html']) { ?>
            <?php echo $slide['html']; ?>
        <?php } else { ?>
        	<h1><?php echo $slide['header']; ?></h1>
            <span><?php echo $slide['description']; ?></span>
        <?php } ?>
        </div>
        <?php } ?>
    <?php } ?>
    </div>
<?php } ?>
</div>
<script type="text/javascript"><!--
$('#tltslideshow<?php echo $slideshow; ?>').owlCarousel({
<?php echo $options; ?>
});
--></script>