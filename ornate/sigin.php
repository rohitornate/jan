<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Ornate</title>


    <link href="stylesheets/main.css" rel="stylesheet"> <!-- main css start-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
    <body>
        <?php include 'include/header.php';?> <!--header start here -->
            <div class="signup-main"> <!--signup-main start here -->
               <div class="container">  <!--container start here -->    
                  <ul class="breadcrumb"> <!--breadcrumb start here -->
                  <li><a href="#">HOME</a></li>  
                <li class="active"><a href="#">sign up</a></li>  
            </ul>    <!--breadcrumb end  here -->
                  <div class="heading">   <!--headin start  here -->
                    <h4 class="title">Sign in</h4>
                    <span>Don't have one? <a href="#">Create an account</a></span>
                </div>    <!--heading end  here -->
                  <div class="in sign-in clearfix">  <!--sign-in start  here -->
                <form class="form">
                   <input type="email" name="" value="" placeholder="Email Address" class="form-control">
                   <input type="password" name="" value="" placeholder="Password" class="form-control">
                   <a href="#" class="forgot">Forgot Password?</a>
                   <button class="btn-yellow">sign in</button>
                   <span class="or-tag">OR</span>
                </form>
                <div class="btngroup">
                    <a href="#" class="facebook"> <i class="fa fa-facebook" aria-hidden="true"></i> Signup With Facebook</a>
                    <a href="#" class="g-plus"> <i class="fa fa-google-plus" aria-hidden="true"></i>Signup With Googleplus</a>
                   
                </div>
            </div>   <!--sign-in end  here -->
        </div>  <!--container end here -->    
        </div><!--signup-main end here -->
       <?php include 'include/footer.php';?>  <!--footer start here -->
    
       
    </body>
</html>
