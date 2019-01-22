<?php echo $header; ?>
 <style>
  
 /* contact us*/

.breadcrumb li a {
    color: #000;
    font-size: 14px;
    padding: 0 2px;
	text-transform:uppercase
}
.text-center .title {
    font-size: 1.875rem;
    line-height: normal;
    padding-bottom: 5px;
    font-family: "'Roboto Condensed', sans-serif";
    font-weight: 400;
}
.contactus p {
    font-size: .9375rem;
}

.cous-inqury a {
    background: #fff;
    -moz-box-shadow: 0 0 3px rgba(0,0,0,0.1);
    -webkit-box-shadow: 0 0 3px rgba(0,0,0,0.1);
    box-shadow: 0 0 3px rgba(0,0,0,0.1);
    display: block;
    width:100%;
    padding: 20px 0 40px;
    font-size: 1rem;
	border:1px solid #e6dcdc;
}
.cous-form {
    
    margin: auto;
    -moz-box-shadow: 0 0 10px rgba(0,0,0,0.1);
    -webkit-box-shadow: 0 0 10px rgba(0,0,0,0.1);
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    background: #fff;
    padding: 20px 30px;
    text-align: left;
    display: none;
    position: relative;
}
.cous-form p {
    font-size: 1.375rem;
    line-height: normal;
    padding-bottom: 10px;
    width: 100%;
}
.cous-inqury {
    margin: 50px 0 80px;
}
.cous-form .close {
    width: 28px;
    height: 28px;
    background: #f5f5f5;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
    font-size: .8125rem;
    position: absolute;
    top: 10px;
    right: 10px;
    line-height: 30px;
    text-align: center;
    cursor: pointer;
}
.cous-form .form-control {
    border: 0;
    border-bottom: 1px solid #e3e8eb;
    -moz-border-radius: 0;
    -webkit-border-radius: 0;
    border-radius: 0;
    padding: 10px;
    height: 40px;
    margin-top: 20px;
	font-size: .875rem;
    font-family: "Roboto Condensed";
}

.form-control {
    outline: 0;
    width: 100%;
    height: 36px;
    padding: 0 10px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    /* border: 1px solid #4a4a4a; */
    font-size: .8125rem;
    color: #000;
    background-color: #ededed;
    border: 0;
}
.cous-form textarea.form-control {
    height: 101px;
	padding-top:10px;
}
.cous-form .captcha .form-control {
    padding-right: 192px;
}
.cous-form .code, .cous-form .reload {
    position: absolute;
    right: 40px;
    top: 22px;
}
.cous-form .reload {
    right: 18px;
    top: 32px;
}
.form-group.required {
    margin: 0 -15px;
}
.btn-yellow {
    margin-top: 35px;
    display: inline-block;
    width: auto;
    font-size: 1rem;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    padding: 8px 30px;
	background:#6e2653 !important;
	color:#fff;
}

.cous-inqury .my-icons-support {
    background-position: 0 -959px;
	
}
.cous-inqury .my-icons-inquriry {
    background-position: 0 -524px;
}
.cous-inqury .my-icons-call {
    background-position: 0 -116px;
}

.cous-inqury strong {
    font-size: 1.125rem;
    display: block;
    padding: 20px 0 10px;
}
.cous-inqury i {
    width: 58px;
    height: 58px;
    display: block;
    margin: auto;
}

.cous-inqury a:hover{
	background:#f0f6fc;
	
}


</style>
 <script src='https://www.google.com/recaptcha/api.js'></script>
<div class="container"> 

 <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12 col-md-12'; ?>
    <?php } ?>
    
     
      <div class="container">
	
		<div class="row">
			<div class="col-md-12">
				
				<ul class="breadcrumb">
				<li><a href="https://www.ornatejewels.com/">Home</a></li> /
				<li><a href="https://www.ornatejewels.com/contact">Contact Us</a></li>
				</ul>
			</div>
		</div>
	
	<div class="contactus">
		
			<div class="row">
				<div class="col-md-12">
					<div class="text-center">
						<h1 class="title">Contact Us </h1>
						<p>524,Amanora Chambers, Hadapsar,</p>
						<p>Pune, 411028</p>
					</div>
				</div>
			
			</div>
	
		<!--<div class="container">	-->
			<div class="row">
				<div class="col-md-4 text-center">
				<div class="cous-inqury disflex-spbetween">
						
							<a href="tel:+91-8600718666">
								<i class="my-icons-call"></i>
								<p><strong>Call Us / Whats App</strong></p>
								<p>+91-8600718666</p>
							</a>
						
					</div>	
				</div>
				<div class="col-md-4 text-center">
					<div class="cous-inqury disflex-spbetween">
						<a href="#cous-form" class="cous-support custom-scroll">
							<i class="my-icons-inquriry"></i>
							<p><strong>Wholesale Inquiry</strong></p>
							<p>sales@ornatejewels.com</p>
						</a>
					</div>
				</div>
				<div class="col-md-4 text-center">
					
					<div class="cous-inqury disflex-spbetween">
						<a href="#cous-form" class="cous-support custom-scroll">
							<i class="my-icons-support"></i>
							<p><strong>Help and Support</strong></p>
							<p>We're here to help.</p>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</div><!--</div>-->
	 	
			<div class="row">
				<div class="col-md-12">
				    <div class="col-md-1">
					</div>
					<div class="col-md-10">
						<div class="col-md-12">
							<div class="cous-form" id="cous-form" style="display: none;">
								<form action="https://www.ornatejewels.com/contact" method="post" class="disflex-wrap-spbetween clearfix">
									<span class="close">X</span>
									<p>Send Us a Message</p>
									<div class="row">
										<div class="col-md-6">
											<div class="box">
												<input type="text" placeholder="Name" name="name" class="form-control">
												<input type="email" placeholder="Email" name="email" class="form-control">
												<input type="text" placeholder="Phone" name="phone" class="form-control">
											</div>
										</div>
										<div class="col-md-6">
											<div class="box">
												<textarea placeholder="Message" name="enquiry" class="form-control"></textarea>
												
											</div>
										</div>
										<div class="col-md-12" style="margin-top: 15px;">
											<div class="box">
												
												<div class="captcha">
													<fieldset>
														<div class="form-group required">
															<div class="col-sm-12">
																<div class="g-recaptcha" data-sitekey="6Lc__WUUAAAAAGAmJgREUszxoqXNLlnOkkjkv1_p"></div>

																
															</div>
														</div>
													</fieldset>
													

												</div>
											</div>
										</div>
									</div>
									<input type="submit" value="Submit" class="btn-yellow">
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-1">
					</div>
				</div>
			</div>
	 
	<script>
				$(window).load(function(){
					$(".cous-support").click(function(){
						$(".cous-form").fadeIn("fast");
						});
					$(".close").click(function(){
						$(".cous-form").hide();
					});
						$('.custom-scroll').on('click',function(event){
							var target=$($(this).attr('href'));if(target.length){event.preventDefault();}
					$('html, body').animate({scrollTop:target.offset().top},1000);}});
				});
	</script>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>
	</div>

<?php echo $footer; ?>
