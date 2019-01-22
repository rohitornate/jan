<?php

echo $header; ?>
  <link rel="stylesheet" href="css/bootstrap-custom.css">

 <style>
    .texthead h2{
	 
	  font-family: "AvenirNextLTW01-Regular";
	  display: inline-block;
      vertical-align: middle;
	  font-weight:100;
	  font-size: 24px;
	}
	 .texthead h4{
	     color: #2f7ec0;
    font-family: "AvenirNextLTW01-Regular";
    display: inline-block;
    vertical-align: middle;
    font-weight: 100;
    font-size: 20px;
    padding: 20px;
	}
    .templatle{
	 padding-bottom:20px;
	}
    .rating .fa {
	 color:#7b325f;
	 font-size:22px;
	 width: 1em;
     height: 1em !important;
     line-height: 0em;
	  vertical-align: baseline;

	}
	.product-layout{
	 border:1px solid #ddd;
	 padding:20px;
	 background:#7fc4ff14
	}
	.image{
	  margin:20px 0;
	}
	.image img{
	 width:120px;
	 height:120px;
	 font-family: "AvenirNextLTW01-Regular";
	 display: inline-block;
     vertical-align: middle;
	}
	.datetext{
	padding-top: 20px;
    font-size: 14px;
    font-family: "AvenirNextLTW01-Regular";
	line-height:20px;
	font-weight:100;
	}
	.paratext{
	 padding-top:10px;
	}
	.paratext .comment{
	text-align:justify;
	font-family: "AvenirNextLTW01-Regular";
	font-size:14px;
	line-height:20px;
	font-weight:100;
	}
	.comment span{
	float:right;
	}
	
	.comment span a {
    text-decoration: none;
    color: #000;
    font-weight: bold;
	}
	.comment span a:hover{
	color:#2f7ec0;
	}
	
	.vname{
	 color:#7b325f;
	 font-size:14px;
	 padding-left:20px;
	}
	
  </style>

<div class="container">
    <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
    </ul>
</div>

<div class="container">
			<div class="row">
				<div class="col-md-12 col-xs-12">
					<div class="texthead text-center">
					   <h2> 	CUSTOMER SHARES</h2><br/>
					   <h4>WE ADD A LITTLE SPARKLE IN YOUR LIVES EVERDAY</h4>
					</div>
				</div>
			</div>
			
			
			<?php foreach($testimonials as $testimonial){ ?>
			
			<div class="row templatle">
				<div class="product-layout col-md-12 ">
					<div class="col-md-3 ">
					
						<div class="image text-center">
								<img src="image/<?php echo $testimonial['image'];?>" width="120px;" height="120px;">
							
						</div>
					</div>
					<div class="col-md-9 ">
						
							<div class="paratext">
								<div class="rating text-center">
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="vname"> Verified Purchase</span>
								</div>
								<p class="comment"><?php echo $testimonial['text']; ?>
								</p>
								
							</div>
							
							<div class="paratext" style="text-align:center;">
							
							<?php echo $testimonial['author'].'  -  '.$testimonial['city']; ?>
							</div>
							
							<div class="datetext text-right">
								  <span><?php echo $testimonial['date_added']; ?></span>
							</div>
					</div>
						
				</div>
			</div>
			
			<?php } ?>
			<!--<div class="row templatle">
				<div class="product-layout col-md-12 col-xs-12">
					<div class="col-md-3 col-xs-3">
					
						<div class="image text-center">
							<a href="http://localhost/op/upload/index.php?route=product/product&amp;path=20&amp;product_id=42">
								<img src="C:/xampp/htdocs/dev/upload/catalog/view/theme/default/images/categorie9.png">
							</a>
						</div>
					</div>
					<div class="col-md-9 col-xs-9">
						
							<div class="paratext">
								<div class="rating text-center">
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
								</div>
								<p class="comment">The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								</p>
								
							</div>
							<div class="datetext text-right">
								  <span>14 July 2018</span>
							</div>
					</div>
						
				</div>
			</div>
			<div class="row templatle">
				<div class="product-layout col-md-12 col-xs-12">
					<div class="col-md-3 col-xs-3">
					
						<div class="image text-center">
							<a href="http://localhost/op/upload/index.php?route=product/product&amp;path=20&amp;product_id=42">
								<img src="C:/xampp/htdocs/dev/upload/catalog/view/theme/default/images/customer.jpg">
							</a>
						</div>
					</div>
					<div class="col-md-9 col-xs-9">
						
							<div class="paratext">
								<div class="rating text-center">
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
								</div>
								<p class="comment">The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								</p>
								
							</div>
							<div class="datetext text-right">
								  <span>14 July 2018</span>
							</div>
					</div>
						
				</div>
			</div>
			<div class="row templatle">
				<div class="product-layout col-md-12 col-xs-12">
					<div class="col-md-3 col-xs-3">
					
						<div class="image text-center">
							<a href="http://localhost/op/upload/index.php?route=product/product&amp;path=20&amp;product_id=42">
								<img src="C:/xampp/htdocs/dev/upload/catalog/view/theme/default/images/customer2.jpg">
							</a>
						</div>
					</div>
					<div class="col-md-9 col-xs-9">
						
							<div class="paratext">
								<div class="rating text-center">
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
								</div>
								<p class="comment">The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								</p>
								
							</div>
							<div class="datetext text-right">
								  <span>14 July 2018</span>
							</div>
					</div>
						
				</div>
			</div>
			<div class="row templatle">
				<div class="product-layout col-md-12 col-xs-12">
					<div class="col-md-3 col-xs-3">
					
						<div class="image text-center">
							<a href="http://localhost/op/upload/index.php?route=product/product&amp;path=20&amp;product_id=42">
								<img src="C:/xampp/htdocs/dev/upload/catalog/view/theme/default/images/customer3.jpg">
							</a>
						</div>
					</div>
					<div class="col-md-9 col-xs-9">
						
							<div class="paratext">
								<div class="rating text-center">
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
								</div>
								<p class="comment">The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								</p>
								
							</div>
							<div class="datetext text-right">
								  <span>14 July 2018</span>
							</div>
					</div>
						
				</div>
			</div>
			<div class="row templatle">
				<div class="product-layout col-md-12 col-xs-12">
					<div class="col-md-3 col-xs-3">
					
						<div class="image text-center">
							<a href="http://localhost/op/upload/index.php?route=product/product&amp;path=20&amp;product_id=42">
								<img src="C:/xampp/htdocs/dev/upload/catalog/view/theme/default/images/product-related.jpg">
							</a>
						</div>
					</div>
					<div class="col-md-9 col-xs-9">
						
							<div class="paratext">
								<div class="rating text-center">
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span>
								</div>
								<p class="comment">The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp
								</p>
								
							</div>
							<div class="datetext text-right">
								  <span>14 July 2018</span>
							</div>
					</div>
						
				</div>
			</div>-->
		</div>


    
    
 <script type="text/javascript"><!--
$( document ).ready(function() {

//$('#cous-form').show();
//$("html body").animate({ scrollTop: $('#cous-form').offset().top}, 100);
//$('#cous-form').focus();
});
--></script>

   

</script>
	
	
<?php echo $footer; ?>
