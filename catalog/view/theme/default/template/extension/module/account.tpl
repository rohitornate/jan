

<style>
  a {
    
    color: #337ab7;
}
 
  .my-account-header {
    margin-bottom: .781rem;
    font-size: 28px;
    font-size: 1.75rem;
    line-height: 2.125;
    padding-bottom: .500rem;
    letter-spacing: .1em;
    border-bottom: .1rem solid #ccc;
    text-transform: uppercase;
    font-weight: 700;
    
	}
	
	.my-account-welcome__hello {
    font-weight: 700;
    padding: 0px;
    font-size: 1.25rem;
    padding-bottom:1.25em;
    }
	ul.my-account-welcome__links {
    margin-left: 0px;
	list-style:none;
	font-size:1.1rem;
	}
	ul.my-account-nav-list {
    margin-left: 0px;
    
	}
	
	.my-account-nav-list>li {
    list-style: none;
    position: relative;
    padding:15px 0px;
	}
	.my-account-nav-list>li>a {
      font-size:medium;
	  text-decoration:none;
	}
	.fa{
	color: #360736;
    /*padding-right:10px;*/
	
	}
	.fa:hover{
	color: black;
    
	}
    .myaccount .inset {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
	}
	.my-account__header {
    margin-bottom: 36px;
    border-bottom: 5px solid #ccc;
	}
	.my-account__header.addr h1 {
    font-weight: 600;
    color: #474747;
    line-height: 1;
    font-size: 24px;
    font-size: 1.375rem;
    text-transform: uppercase;
    margin-top: 0;
	}
	.my-account__header h2 {
    font-size: 1rem;
    font-weight: 600;
    color: #474747;
    padding: 0;
    margin-top: 24px;
    margin-bottom: 15px;
	}
	.myaccount .form-group {
    
    margin: 0 0 20px;
	}
	
	.form-horizontal .control-label {
    
    text-align: left;
	}
	.required .form-control {
    outline: 0;
    width: 100%;
    height: 36px;
    padding: 0 10px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: 1px solid #4a4a4a; 
    font-size: .8125rem;
    color: #000;
    background-color: #ededed;
    border: 0;
	}
	
	.btn-default {
    background: #e6e7e8;
    font-size: .9375rem;
    color: #000;
    padding: 11px 10px;
    display: block;
    border: 0;
    cursor: pointer;
    width: 90%;
    text-transform: uppercase;
    float: left;
    margin-right: 17px;
	}

	.btn-default {
    background: #e9c21d !important;
	}
	.myaccount .btn-yellow {
    font-size: .9375rem;
    color: #fff;
}
.btn {
    font-size: .9375rem;
    padding: 11px 10px;
    display: inline-block;
}
.btn-yellow {
    background: #000;
    font-size: 1.125rem;
    color: #fff;
    padding: 10px;
    display: block;
    border: 0;
    cursor: pointer;
    width: 100%;
    text-transform: uppercase;
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


<div class="col-md-12 col-sm-12">
					<div id="left-panel" class="columns">
						<div class="my-account-welcome__hello">Hello, <span id="displayName"><?php echo $first_name; ?></span></div>
							<ul class="my-account-welcome__links">
								<li>
									<a href="index.php?route=account/edit">My Account</a>
								</li>
							  
							</ul>
							<ul class="my-account-nav-list">
								<li>
									<a href="index.php?route=account/edit">
										<i class="fa fa-user"></i>
										Edit Profile 
									</a>
								</li>
								
								<li>
									<a href="index.php?route=account/password">
										<i class="fa fa-key"></i>
										Edit Password 
									</a>
								</li>
						  
								<li>
								  <a href="index.php?route=account/order">
									 <i class="fa fa-truck"></i>
									  Orders History
								  </a>
								</li>
								<li>
								  <a href="index.php?route=account/address">
									  <i class="fa fa-book"></i>
									  Address Book
								</li>
								 <li>
								  <a href="index.php?route=account/wishlist">
									 <i class="fa fa-heart"></i>
									  Wish List
								  </a>
								</li>
								   
								<li>
									<a  href="index.php?route=account/return">
										<i class="fa fa-undo"></i>
										Return Status
									</a>
								</li>   
							
								<li>
								  <a href="index.php?route=account/transaction">
									  <i class="fa fa-gift"></i>
									  Ornate Wallet
								  </a>
								</li>
								<li>
								  <a href="index.php?route=account/logout">
									  <i class="fa fa-sign-out"></i>
									  Sign Out
								  </a>
								</li>
							</ul>
							<!--<ul class="my-account-welcome__links">
								<li><a href="#">Sign Out</a></li>
							</ul>-->
					</div>
				</div>
