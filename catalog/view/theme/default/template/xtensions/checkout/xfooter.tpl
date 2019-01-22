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
<a class="text-muted" href="<?php echo $contact;?>"><?php echo $text_contact; ?></a><br/>
<i class="fa fa-phone text-muted bold"style="font-size:20px;"></i><span class="text-muted bold"><?php echo $telephone;?> / </span><a href="mailto:<?php echo $email;?>" class=""><?php echo $email;?></a>
</div>
</div>
</div>
<div class="col-md-12 policy">
<p class="text-center text-muted">
<?php if ($informations) { ?>       
|&nbsp;<?php foreach ($informations as $information) { ?>
<a class="text-muted" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>&nbsp;| 
<?php } ?>               
<?php } ?>
</p>
</div>
</footer>
</body>
</html>