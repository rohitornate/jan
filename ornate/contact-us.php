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
        <!--Start Header-->
        <?php include 'include/header.php';?>
        
        
        
        
        <!--Start Breadcrumbs -->
            <ul class="breadcrumb container">
                <li><a href="#">HOME</a></li> 
                <li class="active"><a href="#">Conatct Us</a></li>
            </ul>
            
            <div class="contactus">
                <div class="container">
                    <h1 class="heading">Contact Us</h1>
                    <p>Let’s us a discussion with us</p>
                    <!--Start Box -->
                    <div class="cous-inqury disflex-spbetween">
                        <a href="#cous-form" class="cous-support custom-scroll"><i class="my-icons-support"></i><strong>Help and Support</strong>We're here to help.</a>
                        <a href="#cous-form" class="cous-support custom-scroll"><i class="my-icons-inquriry"></i><strong>sales inquiry</strong><span>sales@ornatejewels.com</span></a>
                        <a href="tel:+91-8600718666"><i class="my-icons-call"></i><strong>call us</strong>+91-8600718666</a>
                    </div>
                    <!--Start Form -->
                    <div class="cous-form" id="cous-form">
                    <form class="disflex-wrap-spbetween clearfix">
                        <span class="close">X</span>
                        <p>Send us a Message</p>
                        <div class="box">
                            <input type="text" placeholder="Name" name="name" class="form-control">
                            <input type="email" placeholder="Email" name="email" class="form-control">
                            <input type="text" placeholder="Phone" name="phone" class="form-control">
                        </div>
                        <div class="box">
                            <textarea placeholder="Message" name="message" class="form-control"></textarea>
                            <div class="captcha">
                                <input type="text" placeholder="Captcha" name="captcha" class="form-control">
                                <img src="images/code.jpg" alt="code" class="code"> 
                                <img src="images/reload.png" alt="reload" class="reload"> 
                        </div></div>
                        <input type="submit" value="Submit" class="btn-yellow">
                    </form>
                    </div>
                </div>
            </div>
            
        
        
        
        <!--Start Footer-->
       <?php include 'include/footer.php';?> 
    
       
    </body>
</html>
