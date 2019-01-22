<?php echo $xheader; ?>
<!--main content starts-->
<div id="content">    
<div id="myLoader" class="loader">
<!-- <div class="innerloader"><i class="fa fa-spinner fa-spin" aria-hidden="true"></i></div> -->
</div>
<div id="cvc"><?php echo $xcvc; ?></div>
<div id="step_login_panel" class="bottom"></div>
<div id="step_address_panel" class="bottom"></div>
<div id="step_payment_panel" class="bottom"></div>
</div>
<script type="text/javascript">
var address_block = false;
var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';  
<?php if (!$logged) { ?>
		$(document).ready(function() {				
            	showLoader();
                $.ajax({
                    url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xlogin',
                    dataType: 'html',
                    success: function(html) {                    	
                        $('#step_login_panel').html(html);                        
                        $('#step_login_panel').show();                        
						$('#step1').addClass('active');
						$('#step1').removeClass('disabled');						
						hideLoader();
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            });
             <?php }else { ?>
            $(document).ready(function() {
            	$('footer').addClass('hidden');
            	showLoader();
                $.ajax({
                    url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xpayment_address',
                    dataType: 'html',
                    success: function(html) {                    	
                    	$('#step1').removeClass('disabled');
                    	$('#step1').addClass('complete');
                    	$('#step2').removeClass('disabled');                        
                        $('#step2').addClass('active');						                        
                        $('#step_address_panel').html(html);                                                
                        $('#step_address_panel').show();
                        $('footer').removeClass('hidden');
                        hideLoader();                        
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            });
           <?php } ?>       	
          $(document).on("click", "#button-login, #button-register, #button-guest", function(event) {       	 
        	  if($('#account').val() == 'login'){
            	  form_tab = 'form_login';
              } else {
            	  form_tab = 'form_register';
              }    	     
             $.ajax({
                url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xlogin/validate',
                type: 'post',
                data: $("#"+form_tab).serialize(),
                dataType: 'json',
                beforeSend: function() {
            	$('#button-login').addClass('progress-bar-striped active');
                $('#button-register').addClass('progress-bar-striped active');
                    showLoader();
                    $('.warning, .error, .alert, .alert-warning, .alert-danger,.alert-dismissible').remove();
                },
                complete: function() {
                	$('#button-login').removeClass('progress-bar-striped active');
                	$('#button-register').removeClass('progress-bar-striped active');        	
                },
                success: function(json) {
                    $('.warning, .error, .alert, .alert-warning, .alert-danger,.alert-dismissible, .xerror, .text-danger').remove();
					$('.has-error').removeClass('has-error');					
					if (json['redirect']) {
		                location = json['redirect'];
		            }else if (json['next']) {
                    	$('#step1').removeClass('active');
                    	$('#step1').addClass('complete');
                    	$('#click1').addClass('clickable');
                    	$('#undo1').show();
                    	$('#step2').removeClass('disabled');                            	                        
                        $('#step2').addClass('active');
                        $('#step_login_panel').hide();
                        $('html, body').animate({
                            scrollTop: $('body').offset().top
                        }, 1);                                						                        
                        $('#step_address_panel').html(json['next']);                        
                        $('#step_address_panel').show();                                               	
                        $('#step1 a').attr('href','#login');
                        $('footer').removeClass('hidden');
                    } else if (json['error']) {
                    	for (i in json['error']) {     
                    		if ($('#step_login_panel #input-'+i).parent().hasClass('input-group')) {
                    			$('#step_login_panel #input-'+i).parent().parent().addClass('has-error');
            					$('#step_login_panel #input-'+i).parent().after('<span class="xerror">' + json['error'][i] + '</span>');
        					} else if ($('#step_login_panel #input-'+i).parent().hasClass('isradio') || $('#step_login_panel #input-'+i).parent().hasClass('ischeckbox') || $('#step_login_panel #input-'+i).parent().hasClass('isfile')){       						
                                $('#step_login_panel #input-'+i).after('<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error'][i] + '</div>');                                
            				}else {
        						$('#step_login_panel #input-'+i).parent().addClass('has-error');
            					$('#step_login_panel #input-'+i).after('<span class="xerror">' + json['error'][i] + '</span>');
        					}       					
        				}    
                        if (json['error']['captcha']) {
                        	$('#captcha input[name=\'captcha\']').parent().addClass('has-error');
                            $('#captcha input[name=\'captcha\']').parent().after('<span class="xerror">' + json['error']['captcha'] + '</span>');
                        }                        
                        if (json['error']['warningagree']) {                        	
                        	$('#step_login_panel #xagreep').addClass('has-error');
                        	$('#step_login_panel #xagreep').prepend('<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error']['warningagree'] + '</div>');                            
                        }                                               
                        if (json['error']['warning']) {
                            $('#xlogin-panel .is_first').before('<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error']['warning'] + '</div>');
                        }
                        $('.warning').fadeIn('slow');
                    } 
					hideLoader();
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });  
        $(document).on("click", "#button-social-register", function(event) {
             $.ajax({
                url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xsocial/validate',
                type: 'post',
                data: $("#sociallogin").serialize(),
                dataType: 'json',
                beforeSend: function() {
            	$('#button-social-register').addClass('progress-bar-striped active');
                    showLoader();
                    $('.warning, .error, .alert-warning, .alert-danger').remove();
                },
                complete: function() {
                	$('#button-social-register').removeClass('progress-bar-striped active');      	
                },
                success: function(json) {
                    $('.warning, .error, .alert-warning, .alert-danger, .xerror, .text-danger').remove();
					$('.has-error').removeClass('has-error');					
					if (json['redirect']) {
		                location = json['redirect'];
		            } else if (json['error']) {
                    	for (i in json['error']) {     
                    		if ($('#socialloginField #input-'+i).parent().hasClass('input-group')) {
                    			$('#socialloginField #input-'+i).parent().parent().addClass('has-error');
            					$('#socialloginField #input-'+i).parent().after('<span class="xerror">' + json['error'][i] + '</span>');
        					} else if ($('#socialloginField #input-'+i).parent().hasClass('isradio') || $('#step_login_panel #input-'+i).parent().hasClass('ischeckbox') || $('#step_login_panel #input-'+i).parent().hasClass('isfile')){       						
                                $('#socialloginField #input-'+i).after('<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error'][i] + '</div>');                                
            				}else {
        						$('#socialloginField #input-'+i).parent().addClass('has-error');
            					$('#socialloginField #input-'+i).after('<span class="xerror">' + json['error'][i] + '</span>');
        					}
        				}                     
                        if (json['error']['warningagree']) {                        	
                        	$('#socialloginField #agreesocialouter').addClass('has-error');
                        	$('#socialloginField #agreesocialouter').prepend('<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error']['warningagree'] + '</div>');                            
                        }
                    } 
					hideLoader();
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });                 
        $(document).on("click", "#addAdress", function(event) {
            $.ajax({
                url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xpayment_address/addAddress',
                type: 'post',
                data: $("#form_add_address").serialize(),
                dataType: 'json',
                beforeSend: function() {                    
                    $('#addAdress').addClass('progress-bar-striped active');
                    $('#addLoader').css({
                	    height: $('#addLoader').parent().height(), 
                	    width: $('#addLoader').parent().width()
                	});
                	$('#addLoader').show();
                	showBar();
                    $('#address_fields .warning,#address_fields .xerror,#address_fields .error,#address_fields .alert,#address_fields .alert-warning,#address_fields .alert-danger,#address_fields .alert-dismissible').remove();
                    $('#address_fields .has-error').removeClass('has-error');
                },
                complete: function() {                	
                	$('#addAdress').removeClass('progress-bar-striped active');                	
                },
                success: function(json) {
                    $('#addressfields .warning,#addressfields .error,#addressfields .alert,#addressfields .alert-warning,#addressfields .text-danger, #addressfields .alert-danger,#addressModal .alert-dismissible,#addressfields .xerror').remove();					
                    if (json['redirect']) {
                        location = json['redirect'];
                    } else if (json['xpayment_address']) {                    	                            						                        
                        $('#step_address_panel').html(json['xpayment_address']);
                        hideBar();                        
                    } else if (json['error']) {
                    	for (i in json['error']) {     
                    		if ($('#address_fields #input-'+i).parent().hasClass('input-group')) {
                    			$('#address_fields #input-'+i).parent().parent().addClass('has-error animated shake').one(animationEnd, function() {
        							$('#address_fields #input-'+i).parent().parent().removeClass('animated shake');  
        	    		        });   
            					$('#address_fields #input-'+i).parent().after('<span class="xerror">' + json['error'][i] + '</span>');
        					} else if ($('#address_fields #input-'+i).parent().hasClass('isradio') || $('#address_fields #input-'+i).parent().hasClass('ischeckbox') || $('#address_fields #input-'+i).parent().hasClass('isfile')){       						
                                $('#address_fields #input-'+i).after('<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error'][i] + '</div>');                                
            				}else {
        						$('#address_fields #input-'+i).parent().addClass('has-error animated shake').one(animationEnd, function() {
        							$('#address_fields .has-error').removeClass('animated shake');  							 
        	    		        });   
            					$('#address_fields #input-'+i).after('<span class="xerror">' + json['error'][i] + '</span>');
        					}      					
        				}
        				$('#addLoader').hide();
        				hideBar();
        			}                   
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
        $(document).on("click", "#editAdress", function(event) {
            $.ajax({
                url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xpayment_address/editAddress',
                type: 'post',
                data: $("#form_edit_address").serialize(),
                dataType: 'json',
                beforeSend: function() {                    
                    $('#editAdress').addClass('progress-bar-striped active');
                    $('#editLoader').css({
                      height: $('#editLoader').parent().height(), 
                      width: $('#editLoader').parent().width()
                  });
                  $('#editLoader').show();
                  showBar();                    
                    $('#address_fields_edit .warning,#address_fields_edit .error,#address_fields_edit .alert,#address_fields_edit .alert-warning,#address_fields_edit .alert-danger,#address_fields_edit .alert-dismissible, #address_fields_edit .xerror').remove();
                    $('#address_fields_edit .has-error').removeClass('has-error');      
                },
                complete: function() {                  
                  $('#editAdress').removeClass('progress-bar-striped active');                  
                },
                success: function(json) {                    
              		$('#addressModal_edit .has-error').removeClass('has-error');          
                    if (json['redirect']) {
                        location = json['redirect'];
                    } else if (json['xpayment_address']) {                                        	                            						                        
                        $('#step_address_panel').html(json['xpayment_address']);
                        $('#addressModal_edit').modal('hide');
                        $('#editLoader').hide();
        		        hideBar();                        
                    } else if (json['error']) {
                    	for (i in json['error']) {     
                    		if ($('#address_fields_edit #input-'+i).parent().hasClass('input-group')) {
                    			$('#address_fields_edit #input-'+i).parent().parent().addClass('has-error');
            					$('#address_fields_edit #input-'+i).parent().after('<span class="xerror">' + json['error'][i] + '</span>');
        					} else if ($('#address_fields_edit #input-'+i).parent().hasClass('isradio') || $('#address_fields_edit #input-'+i).parent().hasClass('ischeckbox') || $('#address_fields_edit #input-'+i).parent().hasClass('isfile')){       						
                                $('#address_fields_edit #input-'+i).after('<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error'][i] + '</div>');                                
            				}else {
        						$('#address_fields_edit #input-'+i).parent().addClass('has-error');
            					$('#address_fields_edit #input-'+i).after('<span class="xerror">' + json['error'][i] + '</span>');
        					}      					
        				}
        		        $('#editLoader').hide();
        		        hideBar();
              		}                
              },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
        $(document).on("click", "#saveGuestAddress", function(event) {
        	var element = this;
        	var section = $(element).attr('section');
            $.ajax({
                url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xguest/addAddress',
                type: 'post',
                data: $("#form_guest_address_"+section).serialize(),
                dataType: 'json',
                beforeSend: function() {                    
                    $(element).addClass('progress-bar-striped active');
                    $('#guestLoader'+section).css({
                	    height: $('#addLoader').parent().height(), 
                	    width: $('#addLoader').parent().width()
                	});
                    $('#guestLoader'+section).show();
                	showBar();
                	$('#guestfields'+section+' .warning,#guestfields'+section+' .error,#guestfields'+section+' .alert,#guestfields'+section+' .alert-warning,#guestfields'+section+' .text-danger, #guestfields'+section+' .alert-danger,#addressModal .alert-dismissible,#guestfields'+section+' .xerror').remove();                    
                },
                complete: function() {                	
                	$(element).removeClass('progress-bar-striped active');                	
                },
                success: function(json) {
					$('#guestfields'+section+' .has-error').removeClass('has-error');
                    if (json['redirect']) {
                        location = json['redirect'];
                    } else if (json['xguest']) {                    	                            						                        
                        $('#step_address_panel').html(json['xguest']);
                        hideBar();                       
                    } else if (json['error']) {
                    	for (i in json['error']) {     
                    		if ($('#guestfields'+section+' #input-'+i).parent().hasClass('input-group')) {
                    			$('#guestfields'+section+' #input-'+i).parent().parent().addClass('has-error');
            					$('#guestfields'+section+' #input-'+i).parent().after('<span class="xerror">' + json['error'][i] + '</span>');
        					} else if ($('#guestfields'+section+' #input-'+i).parent().hasClass('isradio') || $('#guestfields'+section+' #input-'+i).parent().hasClass('ischeckbox') || $('#guestfields'+section+' #input-'+i).parent().hasClass('isfile')){       						
                                $('#guestfields'+section+' #input-'+i).after('<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error'][i] + '</div>');                                
            				}else {
        						$('#guestfields'+section+' #input-'+i).parent().addClass('has-error');
            					$('#guestfields'+section+' #input-'+i).after('<span class="xerror">' + json['error'][i] + '</span>');
        					}      					
        				}
                    	$('#guestLoader'+section).hide();
        				hideBar();
        			}                   
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });    
        $(document).on("click", ".removeAddress", function(event) {
        	  event.preventDefault();
        	  var element = this;
        	  $.ajax({     
        	    url: $(element).attr('link'),
        	    type: 'get',
        	    dataType: 'json',
        	    beforeSend: function() {      
        	      $('.fa-spin').remove();
        	      $(element).append(' <i class="fa fa-circle-o-notch fa-spin"></i>');
        	      showBar();
        	    },      
        	    success: function(json) {     
        	      if(json['redirect']){
        	        location = json['redirect'];
        	      } else if (json['xpayment_address']) {
            	      $(element).closest('.col-sm-6.col-md-4,label').addClass('animated fadeOut').one(animationEnd, function() {
	    		        	$('#step_address_panel').html(json['xpayment_address']);    
	    		        });                          						                        
            	      $('#step_address_panel').html(json['xpayment_address']);                     
                  }    
        	      $('.fa-spin').remove();
        	      hideBar(); 
        	    },
        	    error: function(xhr, ajaxOptions, thrownError) {
        	      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        	    }
        	  });
          });
          $(document).delegate('.agree', 'click', function(e) {
        		e.preventDefault();
        		$('#modal-agree').remove();
        		var element = this;
        		$.ajax({
        			url: $(element).attr('href'),
        			type: 'get',
        			dataType: 'html',
        			beforeSend: function() {
        				$(element).append(' <i class="fa fa-circle-o-notch fa-spin"></i>');
        			},
        			success: function(data) {
        				html  = '<div id="modal-agree" class="modal xmargin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
        				html += '  <div class="modal-dialog">';
        				html += '    <div class="modal-content">';
        				html += '      <div class="modal-header">';
        				html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
        				html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
        				html += '      </div>';
        				html += '      <div class="modal-body">' + data + '</div>';
        				html += '    </div';
        				html += '  </div>';
        				html += '</div>';
        				$('body').append(html);
        				$('#modal-agree').modal('show');
        				$('.fa-spin').remove();
        			}
        		});
        	});
          $(document).delegate('.editAddress', 'click', function(e) {
      		e.preventDefault();
      		var element = this;
      		if($(element).attr('inline')=='yes'){
	      		$('#editAddressFields').html('');      		
	      		$.ajax({
	      			url: $(element).attr('link'),
	      			type: 'get',
	      			dataType: 'json',
	      			beforeSend: function() {
	      				$(element).append(' <i class="fa fa-circle-o-notch fa-spin"></i>');
	      				showBar();
	      			},
	      			success: function(json) {
	          			if(json['redirect']){
	              			location = json['redirect'];
	              		}else{              
	              			$('.col-md-3.lborder').addClass('xblur');			
	      					$('#editAddressFields').html(json['editAddress']);
	      					toggleElement('#existingAddressPanel, #editAddressFields');
	      					$('.fa-spin').remove();
	      					hideBar();
	              		}
	      			}
	      		});
      		}else{
      			$('#addressModal_edit').remove();
          		var element = this;
          		$.ajax({
          			url: $(element).attr('link'),
          			type: 'get',
          			dataType: 'json',
          			beforeSend: function() {
          				$(element).append(' <i class="fa fa-circle-o-notch fa-spin"></i>');
          				showBar();
          			},
          			success: function(json) {
              			if(json['redirect']){
                  			location = json['redirect'];
                  		}else{      				
    	      				$('body').append(json['editAddress']);
    	      				$('#addressModal_edit').modal('show');
    	      				$('.fa-spin').remove();
    	      				hideBar();
                  		}
          			}
          		});
          	}
      	}); 
function toggleElement(element){
	var elements = element.split(",");
		$.each(elements,function(i){	
		if($(elements[i]).is(":visible")){
			$(elements[i]).hide();
		}else{
			$(elements[i]).fadeIn(1000);
		}
	});
}
$(function () {
    $('[data-toggle="tooltip"]').tooltip()
  });
function showLoader(){
	$('#myLoader').css({
    	height: $('#myLoader').parent().height(), 
    	width: $('#myLoader').parent().width()
	});
	$('#myLoader').show();
	showBar();	
};
function hideLoader(){
	$('#myLoader').hide();
	hideBar();	
};
function showBar(){
	NProgress.start();
	NProgress.set(0.6); 
};
function hideBar(){
	NProgress.inc();
	NProgress.done();	
};
$(document).on("change", "input[name='shipping_method']", function(event) {
  	loadShippingMethods();	
});
function loadShippingMethods(){
    $.ajax({
        url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xshipping_method/validate', 
        type: 'post',
        data: $('#shipping_method input[type=\'radio\']:checked, textarea'),
        dataType: 'json',
        beforeSend: function() {},  
        complete: function() {},            
        success: function(json) {
            if(json['redirect']){
                location = json['redirect'];
                }else{
                    $('#step_address_panel #shipping_method .shipping-table').html(json['shipping_method']);
                    $('#loginPage #totals , #addressPage #totals , .footer_totals .totals , #guestPage #totals, #step_payment_panel #totals').html(json['xtotals']);
                    if(json['shipping_methods']== true){
                        $('#agree-panel').show();
                        $('.noshipping').remove();
                    }else{
                        $('.noshipping').remove();
                        $('#agree-panel').hide();
                        $('#existingAddressPanel').prepend('<div class="alert alert-danger noshipping margintop20 marginbottom0">'+ json['warning'] +'</div>');
                        $('#step_address_panel #shipping_method .shipping-table').html('<span class="xerror noshipping marginbottom0">'+ json['warning'] +'</span>');   
                    }
                }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
};
$(document).on("click", "#couponbtn1", function(event) {
	$.ajax({
		url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcvc/validateCoupon',
		type: 'post',
		data: $('#coupon-panel input[type=\'text\']'),
		dataType: 'json',
		beforeSend: function() {
			 $('#coupon-panel .xerror, #coupon-panel .coupon').remove();
			 $('#couponbtn1').attr('disabled', true);
			 $('#couponbtn1').html('<i class="cvcapply fa fa-circle-o-notch fa-spin"></i>');
			 showBar();
		},
		success: function(json) {
			 if (json['error']) {
         		 $('input[name=\'coupon\']').parent().after('<div class="couponapplied cvcapplied coupon alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error']['error'] + '</div>');
			 } else if (json['applied']){
				 $('#coupon-panel input[name=\'coupon\']').parent().after('<div class="couponapplied cvcapplied coupon alert alert-success alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['applied'] + '</div>');
				 $('#loginPage #totals , #addressPage #totals , .footer_totals .totals , #guestPage #totals, #step_payment_panel #totals').html(json['xtotals']);
			 }
			 hideBar();
			 $('#couponbtn1').attr('disabled', false);
			 setTimeout(function(){
				 $('.cvcapplied').fadeOut();
			 }, 10000);
			 $('#couponbtn1').html('<i class="cvcapply fa fa-check"></i>');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$(document).on("click", "#voucherbtn1", function(event) {
	$.ajax({
		url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcvc/validateVoucher',
		type: 'post',
		data: $('#voucher-panel input[type=\'text\']'),
		dataType: 'json',
		beforeSend: function() {
			 $('#voucher-panel .xerror, #voucher-panel .voucher').remove();
			 $('#voucherbtn1').attr('disabled', true);
			 $('#voucherbtn1').html('<i class="cvcapply fa fa-circle-o-notch fa-spin"></i>');
			showBar();
		},
		success: function(json) {
			 if (json['error']) {
         		$('input[name=\'voucher\']').parent().after('<div class="voucherapplied cvcapplied voucher alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error']['error'] + '</div>');
			 } else if (json['applied']){
				$('#voucher-panel input[name=\'voucher\']').parent().after('<div class="voucherapplied cvcapplied voucher alert alert-success alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['applied'] + '</div>');
				$('#loginPage #totals , #addressPage #totals , .footer_totals .totals , #guestPage #totals, #step_payment_panel #totals').html(json['xtotals']);
			 }
			 hideBar();
			 $('#voucherbtn1').attr('disabled', false);
			 setTimeout(function(){
				 $('.cvcapplied').fadeOut();
			 }, 10000);
			 $('#voucherbtn1').html('<i class="cvcapply fa fa-check"></i>');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$(document).on("click", "#rewardbtn1", function(event) {
	$.ajax({
		url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcvc/validateReward',
		type: 'post',
		data: $('#reward-panel input[type=\'text\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#reward-panel .xerror, #reward-panel .reward').remove();
			$('#rewardbtn1').attr('disabled', true);
			$('#rewardbtn1').html('<i class="cvcapply fa fa-circle-o-notch fa-spin"></i>');
			showBar();
		},
		success: function(json) {
			 if (json['error']) {
         		$('input[name=\'reward\']').parent().after('<div class="rewardapplied cvcapplied reward alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error']['error'] + '</div>');
			 } else if (json['applied']){
				$('#reward-panel input[name=\'reward\']').parent().after('<div class="rewardapplied cvcapplied reward alert alert-success alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['applied'] + '</div>');
				$('#loginPage #totals , #addressPage #totals , .footer_totals .totals , #guestPage #totals, #step_payment_panel #totals').html(json['xtotals']);
			 }
			 hideBar();
			 $('#rewardbtn1').attr('disabled', false);
			 setTimeout(function(){
				 $('#reward-panel .xerror, #reward-panel .reward').fadeOut();
			 }, 10000);
			 $('#rewardbtn1').html('<i class="cvcapply fa fa-check"></i>');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$(document).on("click", "#couponbtn", function(event) {	 
	$.ajax({
		url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcvc/validateCoupon',
		type: 'post',
		data: $('#couponModal input[type=\'text\']'),
		dataType: 'json',
		beforeSend: function() {
			 $('#couponModal .xerror, #couponModal .coupon').remove();
			 $('#couponModal .has-error').removeClass('has-error');
			$('#couponbtn').attr('disabled', true);
			showBar();				
		},			
		success: function(json) {							
			 if (json['error']) {
				 $('#couponModal input[name=\'coupon\']').parent().addClass('has-error');
                 $('#couponModal input[name=\'coupon\']').after('<span class="xerror">' + json['error']['error'] + '</span>');
			} else if (json['applied']){				 
				 $('#couponModal input[name=\'coupon\']').after('<span class="coupon" style="color:green">' + json['applied'] + '</span>');
				 $('#loginPage #totals , #addressPage #totals , #guestPage #totals').html(json['xtotals']);					
			}           	
			 hideBar();
			 $('#couponbtn').attr('disabled', false);	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
	
});
$(document).on("click", "#voucherbtn", function(event) {	 
$.ajax({
	url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcvc/validateVoucher',
	type: 'post',
	data: $('#voucherModal input[type=\'text\']'),
	dataType: 'json',
	beforeSend: function() {
		 $('.xerror, .voucher').remove();
		 $('.has-error').removeClass('has-error');
		$('#voucherbtn').attr('disabled', true);
		showBar();				
	},					
	success: function(json) {							
		 if (json['error']) {
			 $('#voucherModal input[name=\'voucher\']').parent().addClass('has-error');
             $('#voucherModal input[name=\'voucher\']').after('<span class="xerror">' + json['error']['error'] + '</span>');
		} else if (json['applied']){				 
			 $('#voucherModal input[name=\'voucher\']').after('<span class="voucher" style="color:green">' + json['applied'] + '</span>');
			 $('#loginPage #totals , #addressPage #totals , #guestPage #totals').html(json['xtotals']);					
		}
		 hideBar();
		 $('#voucherbtn').attr('disabled', false);	 
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});
});
$(document).on("click", "#rewardbtn", function(event) {	 
	$.ajax({
		url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcvc/validateReward',
		type: 'post',
		data: $('#rewardModal input[type=\'text\']'),
		dataType: 'json',
		beforeSend: function() {
			 $('#rewardModal .xerror, #rewardModal .reward').remove();
			 $('#rewardModal .has-error').removeClass('has-error');
			$('#rewardbtn').attr('disabled', true);
			showBar();				
		},			
		success: function(json) {							
			 if (json['error']) {
				 $('#rewardModal input[name=\'reward\']').parent().addClass('has-error');
                 $('#rewardModal input[name=\'reward\']').after('<span class="xerror">' + json['error']['error'] + '</span>');
			} else if (json['applied']){				 
				 $('#rewardModal input[name=\'reward\']').after('<span class="reward" style="color:green">' + json['applied'] + '</span>');
				 $('#loginPage #totals , #addressPage #totals , #guestPage #totals').html(json['xtotals']);					
			}           	
			 hideBar();
			 $('#rewardbtn').attr('disabled', false);	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
	
});
$(document).on("click", "#commentbtn", function(event) {	 
$.ajax({
	url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcvc/addComment',
	type: 'post',
	data: $('#commentModal textarea'),
	dataType: 'json',
	beforeSend: function() {
		$('.comment').remove();			 
		$('#commentbtn').attr('disabled', true);
		showBar();				
	},					
	success: function(json) {							
		 if (json['applied']){				 
			 $('#commentModal textarea[name=\'comment\']').after('<span class="comment" style="color:green">' + json['applied'] + '</span>');					
		}			 
		 $('#commentbtn').attr('disabled', false);
		 hideBar();	 
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});	

});
// Currency
$(document).on("click", "#currency .currency-select", function(event) {
	event.preventDefault();
	$('#currency input[name=\'currency_code\']').attr('value', $(this).attr('name'));
	$('#currency').submit();
});
// Language
$('#language a').on('click', function(e) {
	e.preventDefault();
	$('#language input[name=\'language_code\']').attr('value', $(this).attr('href'));
	$('#language').submit();
});
$(document).on("submit", "#sociallogin, #form_login, #form_guest_address_payment, #form_guest_address_shipping, #form_guest, #form_edit_address, #form_add_address, #form_register, #form_add_reward, #form_add_coupon, #form_add_voucher, #form_add_comment, #form_add_address, #form_edit_address,#form_add_guest_payment_address, #form_add_guest_shipping_address", function(event) {	
	event.preventDefault();
});
function same_guest_shipping(element,psaddress,paddress,payment_address){	
    if($(element).prop("checked") == true) {
      $('.xshipping').css('display','none');
      $('.padd').html(psaddress);
      $('.payment-address-panel').addClass('col-md-12');
      $('.payment-address-panel').removeClass('col-md-6');
      if(payment_address){
      showLoader();  
      $.ajax({
            url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xguest/sameAddress',
            type: 'post',
            data: $('#guestPage input[type=\'checkbox\']:checked, textarea'),
            dataType: 'json',
            success: function(json) {              
                if (json['redirect']) {
                    location = json['redirect'];
                }else{
            		$('#step_address_panel').html(json['xguest']);
                    $('#step_address_panel').show();
                    hideLoader();
            	}                    
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
      }
    }else{
    	$('.payment-address-panel').addClass('col-md-6');
        $('.payment-address-panel').removeClass('col-md-12');
    	$('.xshipping').css('display','block');
        $('.padd').html(paddress);
        showLoader(); 
    	$.ajax({
            url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xguest/notSameAddress',
            type: 'get',
            dataType: 'json',
            success: function(json) {              
                if (json['redirect']) {
                    location = json['redirect'];
                } else{
                	$('#step_address_panel').html(json['xguest']);
                    $('#step_address_panel').show();
                	hideLoader();
                }                  
            },
        });
    }
}
function loadZone(element,country_id, zone_id,text_select,text_none){		
		  if (country_id == '') return;
		  $.ajax({
		    url: 'index.php?route=<?php echo $xtensions_controller_path; ?>checkout/country&country_id=' + country_id,
		    dataType: 'json',
		    beforeSend: function() {
		      $('#'+element+' select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		    },
		    complete: function() {
		      $('.fa-spin').remove();
		    },      
		    success: function(json) {
		      if (json['postcode_required'] == '1') {
		        $('#payment-postcode-required').show();
		      } else {
		        $('#payment-postcode-required').hide();
		      }		      
		      html = '<option value="">'+text_select+'</option>';		      
		      if (json['zone'] != '') {
		        for (i = 0; i < json['zone'].length; i++) {
		          html += '<option value="' + json['zone'][i]['zone_id'] + '"';		            
		          if (json['zone'][i]['zone_id'] == zone_id) {
		               html += ' selected="selected"';
		          }		  
		          html += '>' + json['zone'][i]['name'] + '</option>';
		        }
		      } else {
		        html += '<option value="0" selected="selected">'+text_none+'</option>';
		      }
		      
		      $('#'+element+' select[name=\'zone_id\']').html(html);   
		      $('#'+element+' select[name=\'zone_id\']').trigger('change');   
		    },
		    error: function(xhr, ajaxOptions, thrownError) {
		      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		    }
		  });	
}
$(document).on("change", "input[name='address_id'], input[name='saddress_id'], #addressPage input[type='checkbox'][name='xshipping_address_check']", function(event) {
	  $.ajax({
	    url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xpayment_address/validate', 
	    type: 'post',
	    data: $('#existingAddress input[type=\'radio\']:checked, #existingAddress input[type=\'hidden\'], #agreeText input[type=\'checkbox\']:checked, #existingAddress input[type=\'checkbox\']:checked, #existingAddress textarea'),
	    dataType: 'json',
	    beforeSend: function() {      
	      $('#sLoader').css({
	              height: $('#sLoader').parent().height(), 
	              width: $('#sLoader').parent().width()
	          });         
	          $('#sLoader').show();
	          showBar();
	    },  
	    complete: function() {
	      
	    },      
	    success: function(json) {   
	      <?php if($shipping_required){?>
	      $('#step_address_panel #shipping_method').html(json['xshipping_method']);
	      loadShippingMethods();
	     <?php }?>
	     $('#sLoader').hide();
	     hideBar();         
	    },
	    error: function(xhr, ajaxOptions, thrownError) {
	      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	    }
	  }); 
	});
$(document).on("click", "#payment-accordion a.heading-panel", function(event) {	
	if($(this).parents('.panel').children('.panel-collapse').hasClass('in')){
        event.stopPropagation();
        event.preventDefault();
    }
	if(payment_method_code!=$(this).attr('payment_method')){
		payment_method_code=$(this).attr('payment_method');     
		loadPaymentMethodAccordion(payment_method_code);   
	}	        
});
$(document).on("click", "#step_payment_panel #paymentMethodTab [data-toggle='tab']", function(event) {
	if(payment_method_code != $(this).attr('payment_method')){
		payment_method_code = $(this).attr('payment_method');   
		loadPaymentMethodTab(payment_method_code);
	}	        
});
function loadPaymentMethodAccordion(payment_method){
	$('#panel-body'+payment_method).html('<div class="text-center"><i style="margin:60px auto;font-size:24px;" class="fa fa-spinner fa-spin fa-lg fa-fw"></i></div>');	
	$.ajax({
		url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xpayment_method/validate', 
		type: 'post',
		data: ({payment_method:payment_method}),
		dataType: 'json',
		beforeSend: function() {			
			showBar();
			$('#pLoader').css({
        	    height: $('#pLoader').parent().height(), 
        	    width: $('#pLoader').parent().width()
        	});
			$('#pLoader').show();					
		},		
		success: function(json) {
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning_shipping']) {
					$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning_shipping'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');						
					$('.warning').fadeIn('slow');
				}
				if (json['error']['warning_payment']) {
					$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning_payment'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');						
					$('.warning').fadeIn('slow');
				}				
				hideBar();
				$('#pLoader').hide();			
			} else {
				$('#loginPage #totals , #addressPage #totals , .footer_totals .totals , #guestPage #totals, #step_payment_panel #totals').html(json['xtotals']);
				$('.youpay').html(json['totals']);
				$('#step_payment_panel .panel-collapse .panel-body').html('');						
				$('#step_payment_panel #panel-body'+payment_method).html(json['confirm']);					
				hideBar();
				$('#pLoader').hide();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}
function loadPaymentMethodTab(payment_method){
	$.ajax({
		url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xpayment_method/validate', 
		type: 'post',
		data: ({payment_method:payment_method_code}),
		dataType: 'json',
		beforeSend: function() {	
			$('li.payment_method_list').addClass('disabled');	
			showBar();
			$('#pLoader').show();				
		},	
		complete: function() {				
		},			
		success: function(json) {				
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning_shipping']) {
					$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning_shipping'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');						
					$('.warning').fadeIn('slow');
				}
				if (json['error']['warning_payment']) {
					$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning_payment'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');						
					$('.warning').fadeIn('slow');
				}	
				$('li.payment_method_list').removeClass('disabled');
				hideBar();
				$('#pLoader').hide();												
			} else {
				$('#loginPage #totals , #addressPage #totals , .footer_totals .totals , #guestPage #totals, #step_payment_panel #totals').html(json['xtotals']);
				$('.youpay').html(json['totals']);
				$('#step_payment_panel #spayment-method-content').html(json['confirm']);
				$('li.payment_method_list').removeClass('disabled');
				hideBar();
				$('#pLoader').hide();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}
function callPaymentFromAddress(){
  $.ajax({
        url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xpayment_address/validate&showpayment=1',
        type: 'post',
	    data: $('#existingAddress input[type=\'radio\']:checked, #existingAddress input[type=\'hidden\'], #agreeText input[type=\'checkbox\']:checked, #existingAddress input[type=\'checkbox\']:checked, #existingAddress textarea'),
	    dataType: 'json',           
        beforeSend: function() {
          	showLoader();                       
            $('#button-payment, #head-progress').addClass('progress-bar-striped active');            
        },
        success: function(json) {
            if(json['redirect']){
              location = json['redirect'];
            }else if(json['xpayment_method']){
            	$('#step_payment_panel').html(json['xpayment_method']);
            	showStepPayment();            	
            }                       
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
function callPaymentFromGuest(){	
  $.ajax({
        url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xpayment_method&direct=1',
        type: 'post',
		data: $('textarea'),
		dataType: 'json',
        beforeSend: function() {                    
          $('#button-payment').addClass('progress-bar-striped active'); 
          showLoader();       
        },        
        success: function(json) {
        	 $('#step_payment_panel').html(json['xpayment_method']);
        	 showStepPayment();             
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
function showStepPayment(){
	$('#step_login_panel').hide();
    $('#step_address_panel').hide();
    $('html, body').animate({
          scrollTop: $('body').offset().top
      }, 1);
      
      $('#step_payment_panel').show();            
      $('#step2').removeClass('active');
		$('#step2').addClass('complete');
		$('#step2 a').attr('href','#step_address_panel');
		$('#click2').addClass('clickable');
		$('#undo2').show(); 
		$('#step3').removeClass('disabled');
		$('#step3').addClass('active');
		$('#button-payment').removeClass('progress-bar-striped active');
		hideLoader();
}
$(document).on("change", '#addressPage input[type="radio"][name="address_id"]', function(event) {
    var $this = $(this);
    if(address_block){
	    $this.closest('.row').find('div.panel-heading.selected').removeClass('selected');
	    $this.closest('.panel-heading').addClass('selected');
	} else {
    	$this.closest('.payment-address').find('.address-label.selected').removeClass('selected');
    	$this.closest('.address-label').addClass('selected');
	}
});
$(document).on("change", '#addressPage input[type="radio"][name="saddress_id"]', function(event) {
    var $this = $(this);
	if(address_block){
    	$this.closest('.row').find('div.panel-footer.selected').removeClass('selected');
    	$this.closest('.panel-footer').addClass('selected');
	} else {
    	$this.closest('.shipping-address').find('.address-label.selected').removeClass('selected');
    	$this.closest('.address-label').addClass('selected');
	}
});
$(document).on("change", '#addressPage input[type="checkbox"][name="xshipping_address_check"]', function(event) {
	if(address_block){
	  	if(this.checked) {
	      	$('.panel-footer').hide();
	      	$('.padd').html('<?php echo $text_psaddress;?>');
      	}else{
	      	$('.panel-footer').show();
	      	$('.padd').html('<?php echo $text_paddress;?>');
      	}
	} else {
    	if(this.checked) {
        	$('.payment-address-panel').removeClass('col-md-6');
        	$('.payment-address-panel').addClass('col-md-12');
        	$('.shipping-address-panel').hide();
        	$('.address-type span.padd').html('<?php echo $text_psaddress;?>');
    	}else{
    		$('.payment-address-panel').removeClass('col-md-12');
        	$('.payment-address-panel').addClass('col-md-6');
        	$('.shipping-address-panel').show();
        	$('.address-type span.padd').html('<?php echo $text_paddress;?>');
    	}
	}
});
$(document).on("change", '#addressPage input[type="checkbox"][name="agree"]', function(event) {
  if(this.checked) {
      $('#progress-continue').css('display','block');
      $('#progress-continue-disabled').css('display','none');
  }else{
      $('#progress-continue').css('display','none');
      $('#progress-continue-disabled').css('display','block');        
   }
});
$(document).on("click", 'button[id^=\'button-custom-field\']', function(event) {	
	  var node = this;
	  $('#form-upload').remove();
	  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	  $('#form-upload input[name=\'file\']').trigger('click');

	  if (typeof timer != 'undefined') {
	      clearInterval(timer);
	  }
	  timer = setInterval(function() {
	    if ($('#form-upload input[name=\'file\']').val() != '') {
	      clearInterval(timer);
	      $.ajax({
	        url: 'index.php?route=tool/upload',
	        type: 'post',
	        dataType: 'json',
	        data: new FormData($('#form-upload')[0]),
	        cache: false,
	        contentType: false,
	        processData: false,
	        beforeSend: function() {
	          $(node).button('loading');
	        },
	        complete: function() {
	          $(node).button('reset');
	        },
	        success: function(json) {
	          $(node).parent().find('.text-danger').remove();
	          if (json['error']) {
	            $(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
	          }
	          if (json['success']) {
	            alert(json['success']);
	            $(node).parent().find('input[name^=\'custom_field\']').val(json['code']);
	          }
	        },
	        error: function(xhr, ajaxOptions, thrownError) {
	          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
	      });
	    }
	  }, 500);
	});
var xcart = {		
		'xupdate': function(key, quantity,section) {
			if(quantity < 1){
				xcart.xremove(key,section);
			}else{			
				$.ajax({
					url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcart/edit',
					type: 'post',
					data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1) + '&section=' + section,
					dataType: 'json',
					beforeSend: function() {
						showBar();
					},
					success: function(json) {
						if(section == 'address'){
							$('#step_address_panel').html(json['xpayment_address']);
						}
						$('#step_login_panel #xcart').html(json['xcart']);
						$('#step_login_panel #totals').html(json['xtotals']);
						hideBar();
					}
				});
			}
		},
		'xremove': function(key,section) {
			$.ajax({
				url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcart/remove',
				type: 'post',
				data: 'key=' + key + '&section=' + section,
				dataType: 'json',
				beforeSend: function() {
					showBar();
				},
				success: function(json) {
					if(section == 'address'){
						$('#step_address_panel').html(json['xpayment_address']);
					}
					$('#step_login_panel #xcart').html(json['xcart']);
					$('#step_login_panel #totals').html(json['xtotals']);
					hideBar();
				}
			});
		},
		'wishlist': function(product_id,key,section) {
			$.ajax({
				url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcart/wishlist',
				type: 'post',
				data: 'product_id=' + product_id + '&key=' + key + '&section=' + section,
				dataType: 'json',
				beforeSend: function() {
					showBar();
				},
				success: function(json) {
					if(section == 'address'){
						$('#step_address_panel').html(json['xpayment_address']);
					}
					$('#step_login_panel #xcart').html(json['xcart']);
					$('#step_login_panel #totals').html(json['xtotals']);
					hideBar();
				}
			});
		}
}
var xvoucher = {
		'xremove': function(key,section) {
			$.ajax({
				url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xcart/removeVoucher',
				type: 'post',
				data: 'key=' + key + '&section=' + section,
				dataType: 'json',
				beforeSend: function() {
					showBar();
				},
				success: function(json) {
					if(section == 'address'){
						$('#step_address_panel').html(json['xpayment_address']);
					}
					$('#step_login_panel #xcart').html(json['xcart']);
					$('#step_login_panel #totals').html(json['xtotals']);
					hideBar();
				}
			});
		}
}
function toggleOptions(id){
	$('#'+id).toggle();	
}
$(document).on("cut copy paste",".dependent",function(e) {
    e.preventDefault();
    alert('<?php echo $text_paste_not_allowed; ?>');
});
</script>
<?php if($custom_js){ ?>
<script type="text/javascript">
<?php echo $custom_js; ?>
</script>
<?php } ?>
<?php echo $xfooter; ?>
