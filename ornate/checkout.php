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
            <header class="cart-header"> <!-- header start here -->  
                       <div class="clearfix container"> <!-- container  start here --> 
                            <div class="logo">
                            <a href="#"><img src="images/header/logo.png"></a>
                        </div>
                            <div class="cart-logo">
                                <i class="my-icons-cart-shoping"></i>SHOPPING Cart
                          </div>
                            <div class="contact-us">
                              <small>Call us</small>
                              +91-8600718666 
                          </div>
                        </div> <!-- container end here -->               
        </header> <!-- header end here --> 
            <div class="checkout-main"> <!--signup-main start here -->
               <div class="container">  <!--container start here -->    
                  <ul class="breadcrumb"> <!--breadcrumb start here -->
                  <li><a href="#">HOME</a></li>  
                <li class="active"><a href="#">Shopping Cart</a></li>  
            </ul>    <!--breadcrumb end  here --> 
            
            <form id="msform">
                   <ul class="step-list" id="progressbar" ><!--step-list start  here -->
                               <li class="active"><span class="number">1</span>SHIPPING ADDRESS</li>
                               <li><span class="number">2</span>PAYMENT OPTIONS</li>
                               <li><span class="number">3</span>ORDER SUMMARY</li>   
                         </ul>    <!--step-list end  here -->   
                   <fieldset>
                     <div class="step-info"> <!--step-info start  here --> 
                      <div class="step-name">  
                      <div class="title">Shipping Address</div>
                     
                      <div class="form-group">
                        <label>First Name *</label>
                        <input type="text" name="firstname"  class="form-control">
                    </div>
                      <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" name="lastname"  class="form-control">
                    </div>
                      <div class="form-group">
                        <label>Mobile No * </label>
                        <input type="text" name="mobile"  class="form-control">
                    </div>
                      <div class="form-group">
                        <label>Post Code: * </label>
                        <input type="text" name="post"  class="form-control">
                    </div>
                      <div class="form-group">
                        <label>Address: *</label>
                        <textarea class="form-control  textarea"> </textarea>
                    </div>
                      <div class="form-group">
                        <label>Address: *</label>
                        <textarea class="form-control  textarea"> </textarea>
                        
                    </div>
                      <div class="form-group">
                        <label>City: *</label>
                       <input type="text" name="" value="" placeholder="" class="form-control">
                        
                    </div>
                      <div class="form-group">
                        <label>State *</label>
                        <select class="form-control select">
                            <option>Rajasthan</option>
                        </select>                        
                    </div>
            
                      </div> 
                      <div class="step-detail">   
                    <div class="title">Order Summary<a href="#">Edit</a></div>
                    <div class="clearfix in">
                        <div class="step-product">
                            <img src="images/product-checkou.jpg">
                            <p>18K Yellow Gold Plated Knotty</p>
                        </div>
                        <div class="price">
                            <strike>Rs 3,461</strike>
                             Rs 2,287
                        </div>
                    </div>
                     <p class="step-descraption clearfix">Sub-Total:<span class="pull-right">Rs 699</span></p>
                    <p class="step-descraption green-text clearfix">Coupon(SUM17)<span class="pull-right green-text">Rs -20,750</span></p>
                    <p class="step-descraption clearfix">Total:<span class="pull-right"> Rs 699</span></p>
            </div>
                    </div>  <!--step-info end  here --> 
                    <a href="#" class="next action-button btn-yellow pull-right">Save & Continue<i class="my-icons-arrow-right"></i></a>
                  </fieldset>
                   <fieldset>
    <div class="step-info"> <!--step-info start  here -->
                     <div class="step-name">  
                              <div class="title">Payment Options</div>
                            <p>Please select the preferred payment method to use on this order.</p>
               
                    <div class="form-group">
                          <label class="radio-group"><input type="radio" name="radio" >Credit Card / Debit Card (Paytm PG) </label>
                    </div>
                    <div class="form-group">
                          <label class="radio-group"> <input type="radio" name="radio" >PayUMoney Checkout</label>
               </div>
                        
            </div> 
                     <div class="step-detail">   
                    <div class="title">Order Summary<a href="#">Edit</a></div>
                    <div class="clearfix in">
                        <div class="step-product">
                            <img src="images/product-checkou.jpg">
                            <p>18K Yellow Gold Plated Knotty</p>
                        </div>
                        <div class="price">
                            <strike>Rs 3,461</strike>
                             Rs 2,287
                        </div>
                    </div>
                     <p class="step-descraption clearfix">Sub-Total:<span class="pull-right">Rs 699</span></p>
                    <p class="step-descraption green-text clearfix">Coupon(SUM17)<span class="pull-right green-text">Rs -20,750</span></p>
                    <p class="step-descraption clearfix">Total:<span class="pull-right"> Rs 699</span></p>
            </div>
                 </div> <!--step-info end  here -->   
                  <a href="#" class="previous action-button btn-yellow pull-left btn-yellow-small">Previous<i class="my-icons-arrow-right"></i></a>
                  <a href="#" class="next action-button btn-yellow pull-right">Proceed To Pay<i class="my-icons-arrow-right"></i></a>
                 
   
   
  </fieldset>      
                   <fieldset>
        <div class="step-info"> <!--step-info start  here -->
                     <div class="step-name">  
                              <div class="title">Address</div>
                              <span class="summary"> User Tester</span>
                              <span class="summary">Rajasthan,Rajasthan, Bangalore, Karnataka</span>
                              <span class="summary">Pin : 560002</span>
                              <span class="summary">Mobile : +91 9556890015</span>
                              <span class="summary">Email : usertester@gmail.com</span>
                             <div class="title">Paymemt</div>
                             <span class="summary">Credit Card / Debit Card / Net Banking</span>
                         </div> 
                     <div class="step-detail">   
                    <div class="title">Order Summary<a href="#">Edit</a></div>
                    <div class="clearfix in">
                        <div class="step-product">
                            <img src="images/product-checkou.jpg">
                            <p>18K Yellow Gold Plated Knotty</p>
                        </div>
                        <div class="price">
                            <strike>Rs 3,461</strike>
                             Rs 2,287
                        </div>
                    </div>
                     <p class="step-descraption clearfix">Sub-Total:<span class="pull-right">Rs 699</span></p>
                    <p class="step-descraption green-text clearfix">Coupon(SUM17)<span class="pull-right green-text">Rs -20,750</span></p>
                    <p class="step-descraption clearfix">Total:<span class="pull-right"> Rs 699</span></p>
            </div>
                 </div> <!--step-info end  here -->      
                 
                  <a href="#" class="previous action-button btn-yellow pull-left btn-yellow-small">Previous<i class="my-icons-arrow-right"></i></a>
                  <a href="#" class="submit action-button btn-yellow pull-right">Confirm Order<i class="my-icons-arrow-right"></i></a>
    
  </fieldset>
             </form>
            
            <!-- multistep form -->

            
        </div>  <!--container end here -->    
        </div><!--signup-main end here -->
            <footer class="cart-footer"> <!-- footer start here -->
                 <div class="container">
                     <div class="clearfix">
                      <div class="payement-service">
                         <small>payement</small>
                         <img src="images/payatm.png">
                     </div>
                      <div class="payement-col">
                        <i class="my-icons-guranted"></i>
                        <p class="content"> Quality guaranteed<small>Payments are safe &amp; secure</small></p>
                     </div>
                      <div class="payement-col">
                        <i class=" my-icons-payement"></i>
                        <p class="content"> 100% Secure Payments<small>Payments are safe &amp; secure</small></p>
                     </div>
               </div>
                     <div class="copyright">2017 ornatejewels.com. All rights reserved</div>  <!--copyright end here --> 
                 </div>
        </footer> <!-- footer end here -->  
    
       
        
        
          <script src="js/jquery.min.js" type="text/javascript"></script>
         <script src="js/jquery.flexslider.js"></script>
         <script src="js/jquery.sticky-kit.min.js"></script>
          <script src="js/jquery.easing.min.js"></script>
          <script src="js/common.js"></script>
        
        
    </body>
</html>
