<?php echo $header; ?>

<style>

	.row{
     margin-right: 0; 
     margin-left: 0; 
	 }
  .pageheader h1 {
    font-size: 28px;
    
	}
	p.infolabel {
    padding-left: 13px;
}
	
   .page-header  {
    font-size: 1.375rem;
    font-weight: 700;
    line-height: 1.5;
	color:#474747;
	}
	pageheader {
    text-align: center;
    padding-bottom: 36px;
    padding-left: 20px;
    padding-right: 20px;
    margin: 0 auto;
    float: none;
    max-width: 32.625rem;
	}
	.create-an-account-page {
    max-width: 640px;
    max-width: 40rem;
    margin: 0 auto 40px;
	}
	.form-only-page__form {
    box-shadow: 0 -0.1rem 0.3rem 0 #dcdcdc;
    background: #f1f3f6 none repeat scroll 0 0;
    padding: 60px 50px;
	}
	.form-only-page__form1 {
    box-shadow: 0 -0.1rem 0.3rem 0 #dcdcdc;
    background: #f1f3f6 none repeat scroll 0 0;
    padding: 60px 50px;
	}
  .columns {
    position: relative;
    padding-left: .9375rem;
    padding-right: .9375rem;
   
	}
	.form-only-page__form input {
    margin-bottom: 21px;
	}
	.form-only-page__form label {
    font-weight: 600;
    font-size: 1.125rem;
    text-align: left;
	}
	.columns+.columns:last-child {
    float: right;
	}
	.lname {
    padding-left: 5px;
    padding-right: 15px;
	}
	input[type="text"], input[type="password"], input[type="date"], input[type="datetime"], input[type="datetime-local"], input[type="month"], input[type="week"], input[type="email"], input[type="number"], input[type="search"], input[type="tel"], input[type="time"], input[type="url"], input[type="color"] {
    border: .666667px solid #ccc;
    border-radius: .188rem;
    box-shadow: 0 0.063rem 0.188rem 0.125rem rgba(0,0,0,0.024) inset;
    height: 2.188rem;
    line-height: 1;
    max-width: 100%;
    padding: 0 .625rem;
    font-size: 1rem;
    font-weight: normal;
	}
	input[type="text"], input[type="password"], input[type="date"], input[type="datetime"], input[type="datetime-local"], input[type="month"], input[type="week"], input[type="email"], input[type="number"], input[type="search"], input[type="tel"], input[type="time"], input[type="url"], input[type="color"], textarea {
    -webkit-appearance: none;
    -moz-appearance: none;
    border-radius: 0;
    background-color: #fff;
    border-style: solid;
    border-width: 1px;
    border-color: #ccc;
    box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
    color: rgba(0,0,0,0.75);
    display: block;
    font-family: inherit;
    font-size: .875rem;
    height: 2.3125rem;
    margin: 0 0 1rem 0;
    padding: .5rem;
    width: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-transition: border-color .15s linear,background .15s linear;
    -moz-transition: border-color .15s linear,background .15s linear;
    -ms-transition: border-color .15s linear,background .15s linear;
    -o-transition: border-color .15s linear,background .15s linear;
    transition: border-color .15s linear,background .15s linear;
	}
	.btn--primary {
    border: 0;
    background-color: #000;
    color: #fff;
	}
	.btn--primary, .btn--secondary, .btn--tertiary {
    font-size: 15px;
    font-size: .9375rem;
    line-height: 1;
    font-weight: 700;
    border-radius: .250rem;
    box-shadow: none;
    letter-spacing: .15em;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    -webkit-transition: background-color .15s ease-in-out;
    transition: background-color .15s ease-in-out;
    display: block;
    margin: 0 0 20px;
    width: 100%;
    padding: 18px 7.5px;
    height: auto;
    text-transform: uppercase;
    text-align: center;
	}
	.or-tag {
    margin-top:130px; 
	padding:10px;
    box-shadow: 0 -0.1rem 0.3rem 0 #dcdcdc;
	background: #f1f3f6 none repeat scroll 0 0;
	
	}

	@media (max-width: 767px){
   .or-tag {
    margin-top: 2px;
	}
	.or-tag {
   
    padding: 10px;
     box-shadow: none;
     background: none;
}
	.form-only-page__form {
    
    padding: 20px 0px 70px;
	}
	.form-only-page__form1 {
    
    padding: 10px 0px;
	}
	p.infolabel{
		padding:10px 15px 10px 17px;
	}
	
	.page-header {
    font-size: 1rem;
	margin: 15px 0 20px;

	}
	
	#d_social_login .dsl-button{
    margin:0px;
    }
	.columns {
    position: relative;
    padding-left: 20px; 
    padding-right: .9375rem;
	}
	}
	
	@media (max-width: 767px){
	.my-account__header.addr h1{
	font-size:unset;
	}
	.my-account__header.addr {
	padding-top:10px;
	}
	
	.col-md-9, .col-md-3, .col-sm-9, .col-sm-3, .col-md-12 .col-sm-12{
	padding-right: 0px !important;
    padding-left: 0px !important;
	}
	}
  </style>
  <div class="container">
  
	<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
		<div class="row">
			
				<div class="pageheader text-center">
					<h1>Create an Account</h1>
					<p class="page-header">Already have an account? <a href="login">Sign in now.</a>
					</p>
				</div>
			
		
			
				   <div class="col-md-5">
					<div class="form-only-page__form form-margin">                  
						<form name="Register" method="post" action="<?php echo $action; ?>" id="Register">
								<div class="row">
									<div class="col-md-6 col-sm-6 col-xs-12 columns"> 
										<label for="RQD_firstName">First Name</label>
										<input type="text" placeholder="Enter first name" required="" maxlength="12" name="firstname" id="RQD_firstName" value="<?php echo $firstname; ?>">
										
										 <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              
              <?php } ?>
										
									</div>
									<div class="col-md-6 col-sm-6 col-xs-12 columns"> 
										<label for="RQD_lastName">Last Name</label>
										<input type="text" placeholder="Enter last name" required="" maxlength="15" name="lastname" id="RQD_lastName" value="<?php echo $lastname; ?>">
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12 columns">
										<label id="TD_email" for="RQD_email1" style="display:inline-block;">Email Address</label>
										
										<input  type="email" placeholder="Enter email address" required="" maxlength="50" name="email" id="RQD_email1" value="<?php echo $email; ?>">
										<?php if ($error_email) { ?>
										<div class="text-danger"><?php echo $error_email; ?></div>
              
										<?php } ?>
										
										
									</div>
								</div>
						
								<div class="row">
									<div class="col-md-12 col-sm-12 columns">
										<label for="RQD_phone1" style="display:inline-block;">Phone Number</label>
										
										<input type="text" placeholder="XXX-XXXXXXX" name="telephone" id="RQD_phone1" value="<?php echo $telephone; ?>">
										<?php if ($error_telephone) { ?>
										<div class="text-danger"><?php echo $error_telephone; ?></div> <?php } ?>
									</div>
								</div>
						
							<div class="pwdcontainer">
								<div class="row">
									<div class="col-md-12 col-sm-12 columns">
										<label for="RQD_passwordId">Create Password</label>
										<input type="password" required="" maxlength="50" name="password" id="RQD_logonPassword" placeholder="Enter password" value="<?php echo $password; ?>" class="cobrowse-hide">
										<?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
             
              <?php } ?>
										
									</div>
								</div>
								<p class="infolabel">* Must be at least 6 characters</p>
							</div>
							<div class="row">
								<div class="col-md-12 col-sm-12 columns">
									<label for="RQD_verifyPasswordId">Confirm Password</label> 
									<input type="password" required="" maxlength="50" name="confirm" id="RQD_logonPasswordVerify" placeholder="Enter password" value="<?php echo $confirm; ?>" class="cobrowse-hide">
									<?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
             
              <?php } ?>
								</div>
							</div>
						
						
							
								<div class="col-md-12 col-sm-12 columns">
									
												<button type="submit" class="btn--primary">Create Account</button>
											
		   
								</div>
							
						</form>
					

					


				</div>
				</div>
				<div class="col-md-1 col-sm-1 text-center">
					
				<div class="or-tag">OR</div>
				</div>
				<div class="col-md-5 col-sm-5">
				
						<div class="form-only-page__form1 form-margin">
						
							<div class="btngroup">
								<style>
								
									#dsl_google_button{
									background:  }
									#dsl_google_button:active{
									background: #be3e2e;
									}
									#dsl_facebook_button{
									background:  #4864b4}
									#dsl_google_button:active{
									background: #3a5192;
									}
									#dsl_linkedin_button{
									background:  #2a72b6}
									#dsl_google_button:active{
									background: #21588d;
									}
									#dsl_yahoo_button{
									background:  #500095}
									#dsl_google_button:active{
									background: #3d026f;
									}


									#dsl_google_button{
									background: #dd4b39;


									}

									#d_social_login .dsl-button{
									font-size: 16px;
									text-decoration: none;
									color: #fff;
									display: inline-block;
									box-sizing: border-box;
									-webkit-border-radius: 3px;
									-moz-border-radius: 3px;
									border-radius: 3px;
									box-shadow: 0 1px 0 rgba(0,0,0,0.10);
									margin: 2px;
									margin-bottom: 10px;
									margin-top: 22px;
									padding:0px;
									width:100%;
									text-align:center;
									}
									#d_social_login  .dsl-button:hover{
									text-decoration: none;
									box-shadow: inset 0 -2px 0 rgba(0,0,0,0.20);
									}
									#d_social_login .dsl-button:active{
									box-shadow: inset 0 2px 0 rgba(0,0,0,0.20);
									}
									#d_social_login .dsl-button.dsl-button-medium .l-side,
									#d_social_login .dsl-button .l-side{
									padding: 5px 5px 0px 5px;
									border-right: 1px solid rgba(255,255,255,0.3);
									color: #fff;
									display: inline-block;
									font-size: 17px;
									vertical-align: middle;
									box-sizing: border-box;
									text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
									position: relative;
									}
									#d_social_login .dsl-button.dsl-button-medium .r-side,
									#d_social_login .dsl-button .r-side{
									padding: 6px 10px 6px 10px;
									color: #fff;
									display: inline-block;
									font-size: 12px;
									vertical-align: middle;
									box-sizing: border-box;
									text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
									}
									#d_social_login .dsl-button.dsl-button-huge .l-side {
									font-size: 26px;
									padding: 8px 10px 8px 8px;
									}
									#d_social_login .dsl-button.dsl-button-huge .r-side {
									font-size: 15px;
									padding: 12px 20px 11px 20px;
									}
									#d_social_login .dsl-button.dsl-button-large .l-side {
									font-size: 20px;
									padding: 6px 6px 0px 6px;
									}
									#d_social_login .dsl-button.dsl-button-large .r-side {
									font-size: 13px;
									padding: 8px 16px 7px 16px;
									}
									#d_social_login .dsl-button.dsl-button-small .l-side {
									font-size: 14px;
									padding: 4px 4px 0px 4px;
									}
									#d_social_login .dsl-button.dsl-button-small .r-side {
									font-size: 10px;
									padding: 4px 5px 3px 5px;
									}

									#d_social_login .dsl-button.dsl-button-icons .l-side {
									font-size: 17px;
									padding: 5px 5px 0px 5px;
									border: none;
									}
									#d_social_login .dsl-button.dsl-button-icons .r-side {
									display: none;
									}
									a [class*="dsl-icon-"],
									[class*="dsl-icon-"],
									[class*="dsl-icon-"]:before{
									margin:0px !important;
									background-image:none !important;
									}
									.dsl-label {
									display: none;
									vertical-align: middle;
									}
									.dsl-label-icons{
									display: inline-block;
									}
									.dsl-hide-icon{
									opacity: 0
									}
								</style>
								
									<div id="d_social_login">
										
										<!--<div>
											<a id="dsl_google_button" class="dsl-button dsl-button-huge" href="index.php?route=module/d_social_login/login&amp;provider=Google">
												<span class="r-side text-center">Sign in With Google</span>
											</a>
										</div>-->
										
										<div>
											<a id="dsl_facebook_button" class="dsl-button dsl-button-huge" href="index.php?route=module/d_social_login/login&amp;provider=Facebook">
												<span class="r-side text-center">Sign in With Facebook</span>
											</a>
										</div>	
									</div>
									<script>
										$( document ).ready(function() {
										$('.dsl-button').on('click', function(){
										//  $('.dsl-button').find('.l-side').spin(false);
										// $(this).find('.l-side').spin('huge', '#fff');

										$('.dsl-button').find('.dsl-icon').removeClass('dsl-hide-icon');
										$(this).find('.dsl-icon').addClass('dsl-hide-icon');
										})
										})
									</script>
							</div>
						</div>
					
				</div>
				</div>
			</div>
	
<?php echo $footer; ?>
