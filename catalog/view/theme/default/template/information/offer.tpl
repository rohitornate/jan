<?php
echo $header; ?>
 <style>
 .row {
    margin-right: 0;
    margin-left: 0;
}
@media (max-width: 767px){

}
.banners img{
	width:100%;
	margin-top:10px;
}

@media (max-width: 767px){
	.data{
	
	margin-top:100px !important;
}
}
.data{
	width:100%;
	
}
.products img{
	width:100%;
	height:100%;
	text-align:center;
	border:1px solid #8f979e;
}
.products img:hover{
	 -ms-transform: scale(0.99); 
    -webkit-transform: scale(0.99); 
    transform: scale(0.99); 
}
.products{
	margin:5px;
}



.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 338px;
  width: 338px;
  opacity: 0;
  transition: .5s ease;
  background-color: #2d022ad9;
  margin: 6px 0 15px 21px;
}

.products:hover .overlay {
  opacity: 1;
  
}

.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}


/*.products img:hover{
	 -ms-transform: scale(0.99); 
    -webkit-transform: scale(0.99); 
    transform: scale(0.99);
     	
}*/
@media only screen
and (max-width : 767px) {

.overlay {
  
  height: 100%;
  width: 100%;
  margin: 0;
}
}
@media only screen
and (max-width : 1024px) and (min-width : 768px){
	.overlay {
  
  height: 100%;
  width: 100%;
  margin: 0;
}
}

</style>
<div class="container">
<ul class="breadcrumb"><li><a href="https://www.ornatejewels.com/">Home</a></li><li><a href="festive-offer">Festive Offer</a></li></ul>
<div class="wholesale">
<img src="https://ornate-bc57.kxcdn.com/image/cache/catalog/new-strip/999_offer-min-1170x102.jpg" alt="ornatejewels offer">
</div>
	<div class="row data">
		<div class="col-md-4 col-sm-6">
				<div class="products">
					<a href="rings"><img src="https://ornate-bc57.kxcdn.com/image/home/offer/product1.jpg"></a>
							<a href="rings"><div class="overlay">
					<div class="text">SHOP NOW</div>
					</div>		</a>
									
									
									</div>
									
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="products">
					<a href="all-under-2000"><img src="https://ornate-bc57.kxcdn.com/image/home/999offer.jpg"></a>
							<a href="all-under-2000"><div class="overlay">
					<div class="text">SHOP NOW</div>
					</div></a>

						</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="products">
					<a href="all-under-999"><img src="https://ornate-bc57.kxcdn.com/image/home/pendant.jpg"></a>
					<a href="all-under-999"><div class="overlay">
					<div class="text">SHOP NOW</div>
					</div></a>
									</div>
			</div>
	<div class="col-md-4 col-sm-6">
				<div class="products">
					<a href="bracelets"><img src="https://ornate-bc57.kxcdn.com/image/home/offer/product3.jpg"></a>
					<a href="bracelets"><div class="overlay">
					<div class="text">SHOP NOW</div>
					</div></a>
									</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="products">
					<a href="earrings"><img src="https://ornate-bc57.kxcdn.com/image/home/offer/product4.jpg"></a>
					<a href="earrings"><div class="overlay">
					<div class="text">SHOP NOW</div>
					</div></a>
									</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="products">
					<a href="necklaces"><img src="https://ornate-bc57.kxcdn.com/image/home/offer/product5.jpg"></a>
					<a href="necklaces"><div class="overlay">
					<div class="text">SHOP NOW</div>
					</div></a>
									</div>
			</div>
		</div>
</div>
<?php echo $footer; ?>
