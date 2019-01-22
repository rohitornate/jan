<?php echo $header; ?>

  <style>
  body {
    font-size: 14px;
    font-family: "AvenirNextLTW01-Regular";
}

  .form-only-page__form {
    padding: 0 20px;
    margin-bottom: 40px;
    max-width: 480px;
    margin: 0 auto;
}
	.form-only-page__header {
    text-align: center;
    padding-bottom: 36px;
    padding-left: 20px;
    padding-right: 20px;
    margin: 0 auto;
    float: none;
    max-width: 32.625rem;
}
  .form-only-page__header h1 {
    font-size: 28px;
    padding: 60px 0 6px;
	line-height: 1.125;
    color: #474747;
    text-align: center;
    text-transform: uppercase;
    font-weight: 600;
}
.form-only-page__header p {
    margin-bottom: 0;
    font-size: 1.125rem;
    font-weight: 700;
    line-height: 1.5;
	text-align:center;
}
	.forgot-password .form-only-page__form {
    box-shadow: 0 -0.1rem 0.3rem 0 #dcdcdc;
    background: #f1f3f6 none repeat scroll 0 0;
	padding:60px 50px;
	
}
  .form-only-page__form label {
    font-weight: 600;
    font-size: 1.125rem;
    text-align: left;
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
.columns {
    position: relative;
    padding-left: .9375rem;
    padding-right: .9375rem;
    float: left;
}
	.form-only-page__form input {
    margin-bottom: 21px;
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
    background-color: #670067;
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
	.set-new-password, .forgot-password-page {
    max-width: 640px;
    margin: 0 auto 40px;
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
  <div class="row myaccount">
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="col-sm-12"><?php //echo $content_top; ?>
     <!-- <div class="title"><?php echo $heading_title; ?></div>
      <p class="marspace"><?php echo $text_email; ?></p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <div class="inset">
       
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
            </div>
          </div>
       </div>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-yellow" />
          </div>
        </div>
              
      </form>-->
	  <div class="forgot-password" id="forgot-password-section">
			<div class="row">
				<div class="col-md-12">
					<div class="form-only-page__header">
						<h1>Forgot Password?</h1>
						<p>Please Enter Your Email</p>	
					</div>
				</div>        
			</div>
			<div class="row">
			<div id="errorMessagesJavaScript" role="alert" style="display:none;" class="form-error"></div>
			<div class="forms-only-page__form form-margin">
            
            <form class="create-account__form form-only-page__form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            	<div id="errorUserText" class="form-error" style="display: none;"><span data-icon="i"></span> Email address is wrong.</div>
            	<div id="lockedUserText" class="form-error" style="display: none;">
            		<span data-icon="i"></span>
            		Due to unsuccessful password attempts, your account is locked.  Please contact our Customer Care Team at 1-800-527-8029 to unlock your account.
            	</div>
                <div class="row">
                    <div class="col-md-12 columns">
                        <label for="email">Please Enter Your Email</label>
                        <input type="text" id="email" name="email" tabindex="1" placeholder="EMAIL ADD HERE" required="">
                        <button class="btn--primary" id="securityquestions" name="securityquestions" tabindex="1" onclick="javascript:if(PasswordHelperJS.validateUserEmail()){ PasswordHelperJS.setCommonParameters('-1', '10101', '10001');PasswordHelperJS.loadSecurityQuestions();return false;}">Reset My Password</button>
                    </div>
                </div>
            </form>  
        </div>      
		</div>
		</div>
	  
	  
	  
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>