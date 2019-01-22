<?php echo $header; ?>
 

  <style>
 
	.columns {
    position: relative;
    padding-left: .9375rem;
    padding-right: .9375rem;
    
	}
  .pageheader h1 {
    font-size: 28px;
    
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
#d_social_login .dsl-button{
margin-top:11%;
}
.remember {
    padding-bottom: 20px;
    padding-left: 5px;
}

.form-only-page__form label {
    font-weight: 600;
    font-size: 1.125rem;
    text-align: left;
	padding:10px;
}
.form-only-page__form {
    box-shadow: 0 -0.1rem 0.3rem 0 #dcdcdc;
    background: #f1f3f6 none repeat scroll 0 0;
    padding: 60px 50px;
}
page__form {
    margin-bottom: 31.2rem;
    border: 9px solid #FFF;
    margin: 0 auto 4rem;
    max-width: 522px;
}

 .form-only-page__form label+div {
    margin-bottom: 10px;
	line-height:20px;
}
.form-only-page__form input {
    margin-bottom: 21px;
	}
	
	
input[type="checkbox"], input[type="radio"] {
    margin: 0;
}

input[type="text"], input[type="password"], input[type="date"], input[type="datetime"], input[type="datetime-local"], input[type="month"], input[type="week"], input[type="email"], input[type="number"], input[type="search"], input[type="tel"], input[type="time"], input[type="url"], input[type="color"] {
    border: .666667px solid #ccc;
    border-radius: .188rem;
    box-shadow: 0 0.063rem 0.188rem 0.125rem rgba(0,0,0,0.024) inset;
    height: 2.188rem;
    line-height: 1;
    /*max-width: 100%;*/
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
  /*  width: 100%;*/
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
.btn--primary:hover{
color:#fff;
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
.form-error {
    font-size: 12px;
    font-weight: 700;
    line-height: 1;
    text-transform: uppercase;
    color: #ec524f;
    margin-bottom: 15px;
    margin-top: 15px;
}
.has-tip {
    border-bottom: dotted 1px #ccc;
    color: #333;
    cursor: help;
    font-weight: bold;
}
.has-tip:hover, .has-tip:focus {
    border-bottom: dotted 1px #003f54;
    color: #008cba;
}
.or-tag {
    margin-top:130px; 
	padding:10px;
    box-shadow: 0 -0.1rem 0.3rem 0 #dcdcdc;
	background: #f1f3f6 none repeat scroll 0 0;
	
}

.remember {
    padding-bottom: 20px;
    padding-left: 15px;
   
}
.columns {
    position: relative;
    padding-left: 25px;
    padding-right: 25px;
}
div#d_social_login {
    padding: 0 15px;
}

.page-header {
    font-size: 1.5rem;
	 margin: 15px 0 20px;

	}


@media (max-width: 767px){
	.or-tag {
    margin-top: 0px;
	box-shadow: none;
}
.form-only-page__form {
    
    padding: 10px 30px;
}
.my-account__header.addr h1{
	font-size:unset;
	}
.my-account__header.addr {
	padding-top:10px;
	}

.page-header {
    font-size: 1rem;
}
.form-only-page__form {
    padding: 0px; 
}
#d_social_login .dsl-button{
margin:0px;
}
}

  </style>


<div class="signup-main"> 
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
        
            <!--  <div class="heading">   
                    <h1 class="title">Sign in</h1>
                    <span>Don't have one? <a href="<?php echo $register; ?>">Create an account</a></span>
                </div>     -->

        <!--<div class="in sign-in clearfix">  
            <form class="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="form-group">
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" class="form-control">
                </div>
                <div class="form-group">
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" class="form-control">
                </div>
                <a href="<?php echo $forgotten; ?>" class="forgot">Forgot Password?</a>
                <button type="submit" class="btn-yellow">sign in</button>
                <span class="or-tag">OR</span>
                <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
            <div class="btngroup"><?php echo $content_top; ?>
           
            </div>
        </div>  -->
		
		<div class="row">
		
			<div class="pageheader text-center">
				<h1>Sign In</h1>
				<p class="page-header">Don't have an account? 
					<a href="<?php echo $register; ?>">Create one now.</a>
				</p>
				<!--<div class="social-container-box" id="googleLogin">
<a href="javascript:void(0);" class="login-google login-button" id="gPlusLogin"><span class="header-sprite login-gplus-logo"></span><?php echo 'Google Login'; ?></a>
</div>-->
			</div>
		
	</div>
		
		<div class="row">
		<div class="col-md-12 col-sm-12 ">
			<div class="col-md-6 col-sm-6">
			<div id="errorMessages" class="form-error" style="display: none;">
					<span data-icon="i"></span>All required fields must be completed. Please review and complete these fields.
				</div>
				
				
					<div class="form-only-page__form form-margin">
						<!--<form method="post" name="Logon" action="<?php echo $action; ?>" id="Logon">-->
						<form class="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
							
							
							<div class="row">
								<div class="columns">
									<label for="logonId">Email</label>
									
									
											<!--<input type="email" placeholder="Enter username" required="" value="<?php echo $email; ?>" tabindex="1" name="logonId" id="logonId" title="username" class="cobrowse-hide" style="width:100%;">-->
											
											 <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" class="form-control">
											
									
									
								</div>
							</div>
							<div class="row">
								<div class="columns">
									<label for="logonPassword">Password</label>
									<!--<input  value="<?php echo $password; ?>" name="password" placeholder="<?php echo $entry_password; ?>" type="password" title="password" required="" tabindex="2" id="logonPassword" class="cobrowse-hide">-->
									
									<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" class="form-control">
									
									
								</div>
							</div>
					
							<div class="remember">
							<input type="checkbox" name="rememberMe" value="true" tabindex="3" checked="checked"> 
							Remember Me&nbsp;
							<!--<span data-tooltip="" aria-haspopup="true" class="has-tip" data-selector="tooltip-jjpib52x0" aria-describedby="tooltip-jjpib52x0" title="">
							<span><i class="fa fa-question-circle"></i></span>
							</span>-->
							</div>
					
							<div class="row">
								<div class="columns">
									<button class="btn--primary" type="submit"   id="btn_signin">Sign In</button>
									<a href="<?php echo $forgotten; ?>" style="color:#2f7ec0;">Forgot your password?</a>
								</div>
							</div>
						</form>
				

						
					</div>
				
			</div>
			<div class="col-md-1 col-sm-1 text-center">
				
			<div class="or-tag">OR</div>
			</div>
			<div class="col-md-5 col-sm-5">
			
					<div class="form-only-page__form form-margin">
					
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
									
									
										<a id="dsl_facebook_button" class="dsl-button dsl-button-huge" href="index.php?route=module/d_social_login/login&amp;provider=Facebook">
											<span class="r-side text-center">Sign in With Facebook</span>
										</a>
										
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

       



	


		
      <?php echo $content_bottom; ?>
    <?php echo $column_right; ?>
</div>
</div>
<?php echo $footer; ?>
