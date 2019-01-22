<?php echo $header; ?>

  <style>
  
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
      font-size:large;
	  text-decoration:none;
	}
	.fa{
	color: #360736;
    padding-right:10px;
	}
	.fa:hover{
	color: black;
    
	}
	.fa-pencil{
	padding:0px;
	text-align:center;
	float:none;
	}
	.fa-plus-circle {
    color: #a366a3;
	padding:0px;
	float:none;
	font-size: 5.25rem;
    text-align:center;
	margin-top:40px;
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
	.my-account__address-book-section h3{
    font-weight: 600;
    font-size: 16px;
    font-size: 1rem;
    line-height: 1.125;
    text-align: left;
    margin-top: 15px;
    margin-bottom: 15px;
    color: #474747;
	}
	.my-account__address-book-address {
    font-weight: 500;
    display: block;
    padding: 12px;
    padding: .75rem;
    height: 90%;
    min-height: 200px;
    min-height: 12.5rem;
    border: 5px solid #ccc;
    margin-bottom: 10px;
    margin-bottom: .625rem;
	}
	.my-account__address-book-address-body {
    margin-bottom: 14px;
    padding-bottom: 14px;
    margin-bottom: .875rem;
    border-bottom: .063rem solid #ccc;
	}
	.my-account__address-book-address-actions.clearfix {
    text-align: center;
    }
	.my-account__address-book-address-actions a {
    padding: 0;
    border: 0;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-left: 4px;
	}
	.my-account__address-book-address--add {
    font-size: 18px;
    line-height: 1.125;
    font-weight: bold;
    padding: 16px;
    border: .125rem solid #c4c4c4;
    border-radius: 0;
    background: #e8e8e8;
    text-align: center;
    text-transform: none;
}
</style>

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
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="my-account-header">My Account</div>
			</div>
		</div>
  <div class="row myaccount">
  
  
 <?php echo $column_left; ?>

  
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <!--<h2 class="title"><?php echo $text_address_book; ?></h2>-->
	  <div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="my-account__header addr">      
								<h1>Address Book</h1>
								<h2 class="padbottom">Add and edit your addresses to save you time during your checkout.</h2>
							</div>
						</div>
					</div> 
		

					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="my-account__address-book-section">
								<h3>Address</h3>
							</div>
						</div>
					</div>
	  
	  
     <!-- <?php if ($addresses) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <?php foreach ($addresses as $result) { ?>
          <tr>
            <td class="text-left"><?php echo $result['address']; ?></td>
            <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btnedre"><i class="fa fa-pencil" aria-hidden="true"></i></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btnedre"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
          </tr>
          <?php } ?>
        </table>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
        <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-yellow"><?php echo $button_new_address; ?></a></div>
      </div>-->
	  
	  <div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="row address-book-addresses" data-equalizer="">
			
			
							<?php if ($addresses) { ?>
								<?php foreach ($addresses as $result) { ?>
							<div class="col-md-5 col-sm-5">
								<div class="my-account__address-book-address" data-equalizer-watch>
									<div class="my-account__address-book-address-body">
										<?php echo $result['address']; ?>	
									</div>
									
									<div class="my-account__address-book-address-actions clearfix"> 
										<a class="my-account__address-book-address-action my-account__address-book-address-action--edit" href="<?php echo $result['update']; ?>">
											<i class="fa fa-pencil"></i>Edit
										</a> 
										<a href="<?php echo $result['delete']; ?>" class="btnedre"><i class="fa fa-trash-o" aria-hidden="true"></i></a>

										
									</div>
								</div>
							</div>
							
								<?php } ?>
							<?php } ?>
									<div class="col-md-5 col-sm-5">

										<div class="col-md-12 col-sm-12">
											<a href="<?php echo $add; ?>" class="my-account__address-book-address my-account__address-book-address--add text-center" data-equalizer-watch="" data-match="ship-address" data-reveal-id="myModal"> 
												
												<i class="fa fa-plus-circle"></i>
												
												
											</a>
										</div>
									</div>
								
						</div>
					</div>
		        </div>
				<div class="buttons clearfix">
					<div class="pull-right"><a href="<?php echo $back; ?>" class="btn btn-yellow">Continue</a></div>
				</div>
	  
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>