<footer class="footer">
<div class="container">
<!-- Footer -->
<div class="row">
<div class="col-md-8">
<ul class="list-unstyled list-inline hidden-xs hidden-sm hidden-md">
<?php foreach ($payment_images as $image) { ?>
<?php if($image['url']){?><li><img src="<?php echo $image['url']; ?>" class="img-responsive"></li><?php }?>                        
<?php } ?>
</ul>
</div>
<div class="col-md-4  text-right" style="padding-top: 2px;">
<?php if($contact){ ?>
<a class="text-muted" href="<?php echo $contact;?>"><?php echo $text_contact; ?></a>
<?php } ?>
<?php if($email || $telephone){ ?>
<br/>
<?php if($telephone){ ?><i class="fa fa-phone text-muted bold"style="font-size:20px;"></i><span class="text-muted bold"><?php echo $telephone;?><?php if($email){ ?> / <?php } ?></span><?php } ?><?php if($email){ ?><a href="mailto:<?php echo $email;?>" class=""><?php echo $email;?></a><?php } ?>
<?php } ?>
</div>
</div>
</div>
<?php if ($informations) { ?>     
<div class="col-md-12 policy">
<p class="text-center text-muted">     
|&nbsp;<?php foreach ($informations as $information) { ?>
<a class="text-muted<?php echo $link_modal?' agree':''; ?>" href="<?php echo $link_modal?$information['modal_href']:$information['href']; ?>" target="_newtab"><?php echo $information['title']; ?></a>&nbsp;| 
<?php } ?>
</p>
</div>
<?php } ?>
</footer>
</body>
</html>