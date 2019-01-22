<?php echo $header; ?>
<?php if(isset($end)){ ?>
<?php if($end == 'cart') { ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <section class="cart-blank"> <!--cart-blank start here -->
                      <div class="checkout">
                          <figure> <img src="images/cart-blank.png"> </figure>
                          <h3>Checkout Cart</h3>
                          <span>Your shopping cart is empty!</span>
                          <a href="" class="btn-yellow">Continue Shopping</a>
                      </div>         
                  </section>
</div>
<?php } else { ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <section class="foerror">
                <article class="text">
                    <strong class="heading">Whoopsie Daisies!</strong>
                    <span>The page is lost in the treasures</span>
                    <img src="images/404/404.png" alt="404">
                    <p>Let us help you explore your favourite Jewellery category!</p>
                </article>
                <article class="link disflex">
                    <a href="#"><img src="images/404/rings.jpg" alt="rings">Rings<small>View More</small></a>
                    <a href="#"><img src="images/404/earrings.jpg" alt="rings">Earrings<small>View More</small></a>
                    <a href="#"><img src="images/404/neckleces.jpg" alt="rings">Necklaces<small>View More</small></a>
                    <a href="#"><img src="images/404/bracelets.jpg" alt="rings">Bracelets<small>View More</small></a>
                    <a href="#"><img src="images/404/kids.jpg" alt="rings">Kids Jewels<small>View More</small></a>
                </article>
            </section>
</div>
<?php }
} else{  ?>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <section class="foerror">
                <article class="text">
                    <strong class="heading">Whoopsie Daisies!</strong>
                    <span>The page is lost in the treasures</span>
                    <img src="images/404/404.png" alt="404">
                    <p>Let us help you explore your favourite Jewellery category!</p>
                </article>
                <article class="link disflex">
                    <a href="#"><img src="images/404/rings.jpg" alt="rings">Rings<small>View More</small></a>
                    <a href="#"><img src="images/404/earrings.jpg" alt="rings">Earrings<small>View More</small></a>
                    <a href="#"><img src="images/404/neckleces.jpg" alt="rings">Necklaces<small>View More</small></a>
                    <a href="#"><img src="images/404/bracelets.jpg" alt="rings">Bracelets<small>View More</small></a>
                    <a href="#"><img src="images/404/kids.jpg" alt="rings">Kids Jewels<small>View More</small></a>
                </article>
            </section>
</div>

<?php } ?>

<?php echo $footer; ?>
