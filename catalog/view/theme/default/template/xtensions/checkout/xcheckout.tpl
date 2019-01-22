<?php echo $xheader; ?>
<!--main content starts-->
<div id="content">    
<div id="myLoader" class="loader" style="min-height: 200px;"></div>
<div id="cvc"><?php echo $xcvc; ?></div>
<div id="xlogin"></div>
<div id="address"></div>
<div id="payment"></div>
</div>
<!-- Main Content Ends -->
<!-- Script starts -->
<script type="text/javascript">
<?php if (!$logged) { ?>
		$(document).ready(function() {
            	showLoader();            	           	          	
                $.ajax({
                    url: 'index.php?route=xcheckout/xlogin',
                    dataType: 'html',
                    success: function(html) {                    	
                        $('#xlogin').html(html);                        
                        $('#xlogin').show();
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
            	showLoader();            	
                $.ajax({
                    url: 'index.php?route=xcheckout/xpayment_address',
                    dataType: 'html',
                    success: function(html) {                    	
                    	$('#step1').removeClass('disabled');
                    	$('#step1').addClass('complete');
                    	$('#step2').removeClass('disabled');                        
                        $('#step2').addClass('active');						                        
                        $('#address').html(html);                                                
                        $('#address').show();
                        hideLoader();
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }); 
           <?php } ?>
          $(document).on("click", "#button-login, #submit1, #submit2", function(event) {
            $.ajax({
                url: 'index.php?route=xcheckout/xlogin/validate',
                type: 'post',
                data: $('#xlogin input[type=\'text\'], #xlogin input[type=\'password\'], #xlogin input[type=\'checkbox\']:checked,  #xlogin input[type=\'radio\']:checked, #xlogin input[type=\'hidden\'], #xlogin select, #xlogin textarea'),
                dataType: 'json',
                beforeSend: function() {                    
                    $('#button-login').addClass('progress-bar-striped active');
                    $('#submit1').addClass('progress-bar-striped active');
                    $('#submit2').addClass('progress-bar-striped active');
                    showLoader();
                    $('.warning, .error, .alert, .alert-warning, .alert-danger,.alert-dismissible').remove();
                },
                complete: function() {
                	$('#button-login').removeClass('progress-bar-striped active');
                	$('#submit1').removeClass('progress-bar-striped active');
                	$('#submit2').removeClass('progress-bar-striped active');
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
                        $('#xlogin').hide();
                        $('html, body').animate({
                            scrollTop: $('body').offset().top
                        }, 1);                                						                        
                        $('#address').html(json['next']);                        
                        $('#address').show();                                               	
                        $('#step1 a').attr('href','#login');
                    } else if (json['error']) {
                    	for (i in json['error']) {
        					var element = $('#input-account-' + i.replace('_', '-'));
        					if ($(element).parent().hasClass('input-group')) {
        						$(element).parent().parent().addClass('has-error');
        						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
        					} else {        						
        						$(element).parent().addClass('has-error');
        						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
        					}
        				}                    	                   	
                        if (json['error']['firstname']) {
                        	$('#xlogin input[name=\'firstname\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'firstname\']').after('<span class="xerror">' + json['error']['firstname'] + '</span>');
                        }

                        if (json['error']['lastname']) {
                        	$('#xlogin input[name=\'lastname\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'lastname\']').after('<span class="xerror">' + json['error']['lastname'] + '</span>');
                        }

                        if (json['error']['email']) {
                        	$('#xlogin input[name=\'email\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'email\']').after('<span class="xerror">' + json['error']['email'] + '</span>');
                        }
                        if (json['error']['warningexists']) {
                        	$('#xlogin input[name=\'email\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'email\']').after('<span class="xerror">' + json['error']['warningexists'] + '</span>');
                        }

                        if (json['error']['telephone']) {
                        	$('#xlogin input[name=\'telephone\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'telephone\']').after('<span class="xerror">' + json['error']['telephone'] + '</span>');
                        }
                        if (json['error']['password']) {
                        	$('#xlogin input[name=\'password\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'password\']').after('<span class="xerror">' + json['error']['password'] + '</span>');
                        }

                        if (json['error']['confirm']) {
                        	$('#xlogin input[name=\'confirm\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'confirm\']').after('<span class="xerror">' + json['error']['confirm'] + '</span>');
                        }
                        if (json['error']['captcha']) {
                        	$('#captcha #input-captcha-register').parent().addClass('has-error');
                            $('#captcha #input-captcha-register').after('<span class="xerror">' + json['error']['captcha'] + '</span>');
                        }
                        if (json['error']['gcaptcha']) {
                        	$('#gcaptcha #input-captcha-guest').parent().addClass('has-error');
                            $('#gcaptcha #input-captcha-guest').after('<span class="xerror">' + json['error']['gcaptcha'] + '</span>');
                        }
                        if (json['error']['warningagree']) {                        	
                        	$('#xlogin #xagreep').addClass('has-error');
                        	$('#xlogin #xagreep').prepend('<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error']['warningagree'] + '</div>');                            
                        }
                        if (json['error']['gfirstname']) {
                        	$('#xlogin input[name=\'gfirstname\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'gfirstname\']').after('<span class="xerror">' + json['error']['gfirstname'] + '</span>');
                        }

                        if (json['error']['glastname']) {
                        	$('#xlogin input[name=\'glastname\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'glastname\']').after('<span class="xerror">' + json['error']['glastname'] + '</span>');
                        }

                        if (json['error']['gemail']) {
                        	$('#xlogin input[name=\'gemail\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'gemail\']').after('<span class="xerror">' + json['error']['gemail'] + '</span>');
                        }

                        if (json['error']['gtelephone']) {
                        	$('#xlogin input[name=\'gtelephone\']').parent().addClass('has-error');
                            $('#xlogin input[name=\'gtelephone\']').after('<span class="xerror">' + json['error']['gtelephone'] + '</span>');
                        }
                        if (json['error']['warning']) {             	
                        	
                            $('#xlogin-panel').prepend('<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['error']['warning'] + '</div>');
                        }
                        $('.warning').fadeIn('slow');
                    } if(json['gerror']){
                    	for (i in json['gerror']) {
        					var element = $('#input-guest-' + i.replace('_', '-'));
        					if ($(element).parent().hasClass('input-group')) {
        						$(element).parent().parent().addClass('has-error');
        						$(element).parent().after('<div class="text-danger">' + json['gerror'][i] + '</div>');
        					} else {
        						$(element).parent().addClass('has-error');        						
        						$(element).after('<div class="text-danger">' + json['gerror'][i] + '</div>');
        					}
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
                url: 'index.php?route=xcheckout/xpayment_address/addAddress',
                type: 'post',
                data: $('#paddfields input[type=\'text\'], #paddfields input[type=\'password\'], #paddfields input[type=\'checkbox\']:checked,  #paddfields input[type=\'radio\']:checked, #paddfields input[type=\'hidden\'], #paddfields select, #paddfields textarea'),
                dataType: 'json',
                beforeSend: function() {                    
                    $('#addAdress').addClass('progress-bar-striped active');
                    $('#modalLoader').css({
                	    height: $('#modalLoader').parent().height(), 
                	    width: $('#modalLoader').parent().width()
                	});
                	$('#modalLoader').show();
                	showBar();                    
                    $('#addressModal .warning,#addressModal .error,#addressModal .alert,#addressModal .alert-warning,#addressModal .alert-danger,#addressModal .alert-dismissible').remove();
                },
                complete: function() {                	
                	$('#addAdress').removeClass('progress-bar-striped active');                	
                },
                success: function(json) {
                    $('#addressModal .warning,#addressModal .error,#addressModal .alert,#addressModal .alert-warning,#addressModal .text-danger, #addressModal .alert-danger,#addressModal .alert-dismissible,#addressModal .xerror').remove();
					$('#paddfields .has-error').removeClass('has-error');					
                    if (json['redirect']) {
                        location = json['redirect'];
                    } else if (json['error']) {
                    	for (i in json['error']) {
        					var element = $('#input-payment-' + i.replace('_', '-'));
        					if ($(element).parent().hasClass('input-group')) {
        						$(element).parent().addClass('has-error');
        						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
        					} else {
        						$(element).parent().addClass('has-error');
        						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
        					}
        				}                    	
                    	if (json['error']['firstname']) {
                    		$('#paddfields input[name=\'firstname\']').parent().addClass('has-error');
        					$('#paddfields input[name=\'firstname\']').after('<span class="xerror">' + json['error']['firstname'] + '</span>');
        				}        				
        				if (json['error']['lastname']) {
        					$('#paddfields input[name=\'lastname\']').parent().addClass('has-error');
        					$('#paddfields input[name=\'lastname\']').after('<span class="xerror">' + json['error']['lastname'] + '</span>');
        				}       				
        				if (json['error']['telephone']) {
        					$('#paddfields input[name=\'telephone\']').parent().addClass('has-error');
        					$('#paddfields input[name=\'telephone\']').after('<span class="xerror">' + json['error']['telephone'] + '</span>');
        				}
        				if (json['error']['company_id']) {
        					$('#paddfields input[name=\'company_id\']').parent().addClass('has-error');
        					$('#paddfields input[name=\'company_id\']').after('<span class="xerror">' + json['error']['company_id'] + '</span>');
        				}
        				if (json['error']['tax_id']) {
        					$('#paddfields input[name=\'tax_id\']').parent().addClass('has-error');
        					$('#paddfields input[name=\'tax_id\']').after('<span class="xerror">' + json['error']['tax_id'] + '</span>');
        				}										
        				if (json['error']['address_1']) {
        					$('#paddfields input[name=\'address_1\']').parent().addClass('has-error');
        					$('#paddfields input[name=\'address_1\']').after('<span class="xerror">' + json['error']['address_1'] + '</span>');
        				}
        				if (json['error']['city']) {
        					$('#paddfields input[name=\'city\']').parent().addClass('has-error');
        					$('#paddfields input[name=\'city\']').after('<span class="xerror">' + json['error']['city'] + '</span>');
        				}
        				if (json['error']['postcode']) {
        					$('#paddfields input[name=\'postcode\']').parent().addClass('has-error');
        					$('#paddfields input[name=\'postcode\']').after('<span class="xerror">' + json['error']['postcode'] + '</span>');
        				}
        				if (json['error']['country']) {
        					$('#paddfields input[name=\'country_id\']').parent().addClass('has-error');
        					$('#paddfields select[name=\'country_id\']').after('<span class="xerror">' + json['error']['country'] + '</span>');
        				}
        				if (json['error']['zone']) {
        					$('#paddfields input[name=\'zone_id\']').parent().addClass('has-error');
        					$('#paddfields select[name=\'zone_id\']').after('<span class="xerror">' + json['error']['zone'] + '</span>');
        				}
        				$('#modalLoader').hide();
        				hideBar();
        			}else{
        				$('#modalLoader').hide();
        				hideBar();        				
        				$('#addressModal').modal('hide');
        				//$('.modal-open').removeClass('modal-open');	
        				$('#address').html(json['xpayment_address']);                                                       				
            		}                    
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
        				html  = '<div id="modal-agree" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
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
      		$('#modal-agree').remove();
      		var element = this;
      		$.ajax({
      			url: $(element).attr('href'),
      			type: 'get',
      			dataType: 'json',
      			beforeSend: function() {
      				$(element).append(' <i class="fa fa-circle-o-notch fa-spin"></i>');
      			},
      			success: function(json) {
          			if(json['redirect']){
              			location = json['redirect'];
              		}else{
      				html  = '<div id="modal-agree" class="modal fixed xmargin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
      				html += '  <div class="modal-dialog">';
      				html += '    <div class="modal-content">';
      				html += '      <div class="modal-header">';
      				html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
      				html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
      				html += '      </div>';
      				html += '      <div class="modal-body">' + json['editAddress'] + '</div>';
      				if($(element).hasClass('editAddress')){
          				html += '<div class="modal-footer"><div class="progress" id="progress"><div class="progress-bar progress-bar-success" role="progressbar" id="editAdress" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%"><span>'+ $(element).text() +'</span></div></div></div>';
          			}
      				html += '    </div';
      				html += '  </div>';
      				html += '</div>';
      				$('body').append(html);
      				$('#modal-agree').modal('show');
      				$('.fa-spin').remove();
              		}
      			}
      		});
      	});
        //-->
        
   $(document).on("click", "#gpaddAdress", function(event) {
    $.ajax({
        url: 'index.php?route=xcheckout/xguest/addPAddress',
        type: 'post',
        data: $('#gaddfields input[type=\'text\'], #gaddfields input[type=\'password\'], #guestPage input[type=\'hidden\'], #guestPage input[type=\'checkbox\']:checked, #gaddfields input[type=\'checkbox\']:checked,  #gaddfields input[type=\'radio\']:checked, #gaddfields input[type=\'hidden\'], #gaddfields select, #gaddfields textarea'),
        dataType: 'json',
        beforeSend: function() {                    
            $('#gpaddAdress').addClass('progress-bar-striped active');
            $('#modalLoader').css({
        	    height: $('#modalLoader').parent().height(), 
        	    width: $('#modalLoader').parent().width()
        	});
        	$('#modalLoader').show();
        	showBar();                    
            $('#gaddfields .warning, #gaddfields .error, #gaddfields .alert, #gaddfields .alert-warning, #gaddfields .text-danger, #gaddfields .alert-danger,#gaddfields .alert-dismissible, #gaddfields .xerror').remove();
        },
        complete: function() {                	
        	$('#gpaddAdress').removeClass('progress-bar-striped active');                	
        },
        success: function(json) {
        	$('#gaddfields .warning, #gaddfields .error, #gaddfields .alert, #gaddfields .alert-warning,  #gaddfields .text-danger, #gaddfields .alert-danger,#gaddfields .alert-dismissible, #gpaddAdress .xerror').remove();
			$('#gaddfields .has-error').removeClass('has-error');					
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
            	for (i in json['error']) {
					var element = $('#input-payment-' + i.replace('_', '-'));
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().addClass('has-error');
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).parent().addClass('has-error');
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}                    	
            	if (json['error']['firstname']) {
            		$('#gaddfields input[name=\'firstname\']').parent().addClass('has-error');
					$('#gaddfields input[name=\'firstname\']').after('<span class="xerror">' + json['error']['firstname'] + '</span>');
				}        				
				if (json['error']['lastname']) {
					$('#gaddfields input[name=\'lastname\']').parent().addClass('has-error');
					$('#gaddfields input[name=\'lastname\']').after('<span class="xerror">' + json['error']['lastname'] + '</span>');
				}       				
				if (json['error']['telephone']) {
					$('#gaddfields input[name=\'telephone\']').parent().addClass('has-error');
					$('#gaddfields input[name=\'telephone\']').after('<span class="xerror">' + json['error']['telephone'] + '</span>');
				}
				if (json['error']['company_id']) {
					$('#gaddfields input[name=\'company_id\']').parent().addClass('has-error');
					$('#gaddfields input[name=\'company_id\']').after('<span class="xerror">' + json['error']['company_id'] + '</span>');
				}
				if (json['error']['tax_id']) {
					$('#gaddfields input[name=\'tax_id\']').parent().addClass('has-error');
					$('#gaddfields input[name=\'tax_id\']').after('<span class="xerror">' + json['error']['tax_id'] + '</span>');
				}										
				if (json['error']['address_1']) {
					$('#gaddfields input[name=\'address_1\']').parent().addClass('has-error');
					$('#gaddfields input[name=\'address_1\']').after('<span class="xerror">' + json['error']['address_1'] + '</span>');
				}
				if (json['error']['city']) {
					$('#gaddfields input[name=\'city\']').parent().addClass('has-error');
					$('#gaddfields input[name=\'city\']').after('<span class="xerror">' + json['error']['city'] + '</span>');
				}
				if (json['error']['postcode']) {
					$('#gaddfields input[name=\'postcode\']').parent().addClass('has-error');
					$('#gaddfields input[name=\'postcode\']').after('<span class="xerror">' + json['error']['postcode'] + '</span>');
				}
				if (json['error']['country']) {
					$('#gaddfields input[name=\'country_id\']').parent().addClass('has-error');
					$('#gaddfields select[name=\'country_id\']').after('<span class="xerror">' + json['error']['country'] + '</span>');
				}
				if (json['error']['zone']) {
					$('#gaddfields input[name=\'zone_id\']').parent().addClass('has-error');
					$('#gaddfields select[name=\'zone_id\']').after('<span class="xerror">' + json['error']['zone'] + '</span>');
				}
				$('#modalLoader').hide();
				hideBar();
			}else{
				$('#modalLoader').hide();
				hideBar();        				
				$('#addressModalPayment').modal('hide');
				//$('.modal-open').removeClass('modal-open');	
				$('#address').html(json['xguest']);  
    		}                    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
$(document).on("click", "#gsaddAdress", function(event) {
    $.ajax({
        url: 'index.php?route=xcheckout/xguest/addSAddress',
        type: 'post',
        data: $('#gsaddfields input[type=\'text\'], #gsaddfields input[type=\'password\'], #guestPage input[type=\'checkbox\']:checked, #gsaddfields input[type=\'checkbox\']:checked,  #gsaddfields input[type=\'radio\']:checked, #gsaddfields input[type=\'hidden\'], #gsaddfields select, #gsaddfields textarea'),
        dataType: 'json',
        beforeSend: function() {                    
            $('#gsaddAdress').addClass('progress-bar-striped active');
            $('#modalLoaderS').css({
        	    height: $('#modalLoaderS').parent().height(), 
        	    width: $('#modalLoaderS').parent().width()
        	});
        	$('#modalLoaderS').show();
        	showBar();                    
            $('#gsaddfields .warning, #gsaddfields .error, #gsaddfields .alert, #gsaddfields .alert-warning,  #gsaddfields .text-danger, #gsaddfields .alert-danger,#gsaddfields .alert-dismissible, #gsaddfields .xerror').remove();
        },
        complete: function() {                	
        	$('#gsaddAdress').removeClass('progress-bar-striped active');                	
        },
        success: function(json) {
        	$('#gsaddfields .warning, #gsaddfields .error, #gsaddfields .alert, #gsaddfields .alert-warning, #gsaddfields .text-danger, #gsaddfields .alert-danger,#gsaddfields .alert-dismissible, #gsaddfields .xerror').remove();
			$('#gsaddfields .has-error').removeClass('has-error');					
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
            	for (i in json['error']) {
					var element = $('#input-shipping-' + i.replace('_', '-'));					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().addClass('has-error');
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).parent().addClass('has-error');
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}                    	
            	if (json['error']['sfirstname']) {
            		$('#gsaddfields input[name=\'sfirstname\']').parent().addClass('has-error');
					$('#gsaddfields input[name=\'sfirstname\']').after('<span class="xerror">' + json['error']['sfirstname'] + '</span>');
				}        				
				if (json['error']['slastname']) {
					$('#gsaddfields input[name=\'slastname\']').parent().addClass('has-error');
					$('#gsaddfields input[name=\'slastname\']').after('<span class="xerror">' + json['error']['slastname'] + '</span>');
				}				
				if (json['error']['saddress_1']) {
					$('#gsaddfields input[name=\'saddress_1\']').parent().addClass('has-error');
					$('#gsaddfields input[name=\'saddress_1\']').after('<span class="xerror">' + json['error']['saddress_1'] + '</span>');
				}
				if (json['error']['scity']) {
					$('#gsaddfields input[name=\'scity\']').parent().addClass('has-error');
					$('#gsaddfields input[name=\'scity\']').after('<span class="xerror">' + json['error']['scity'] + '</span>');
				}
				if (json['error']['spostcode']) {
					$('#gsaddfields input[name=\'spostcode\']').parent().addClass('has-error');
					$('#gsaddfields input[name=\'spostcode\']').after('<span class="xerror">' + json['error']['spostcode'] + '</span>');
				}
				if (json['error']['scountry']) {
					$('#gsaddfields input[name=\'scountry_id\']').parent().addClass('has-error');
					$('#gsaddfields select[name=\'scountry_id\']').after('<span class="xerror">' + json['error']['scountry'] + '</span>');
				}
				if (json['error']['szone']) {
					$('#gsaddfields input[name=\'szone_id\']').parent().addClass('has-error');
					$('#gsaddfields select[name=\'szone_id\']').after('<span class="xerror">' + json['error']['szone'] + '</span>');
				}
				$('#modalLoaderS').hide();
				hideBar();
			}else{
				$('#modalLoaderS').hide();
				hideBar();        				
				$('#addressModalShipping').modal('hide');
				//$('.modal-open').removeClass('modal-open');	
				$('#address').html(json['xguest']);  
    		}                    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
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
function loadShippingMethods(){
    $.ajax({
        url: 'index.php?route=xcheckout/xshipping_method/validate', 
        type: 'post',
        data: $('#shipping_method input[type=\'radio\']:checked'),
        dataType: 'json',
        beforeSend: function() {},  
        complete: function() {},            
        success: function(json) {
            if(json['redirect']){
                location = json['redirect'];
                }else{
                    $('#address #shipping_method').html(json['shipping_method']);                
                    $('#loginPage #totals, #address #totals').html(json['xtotals']);                    
                    if(json['shipping_methods']== true){
                        $('#addressRight').show();
                        $('.noshipping').remove();
                    }else{
                        $('.noshipping').remove();
                        $('#addressRight').hide();
                        $('.alert.info-back').before('<div class="alert alert-danger noshipping">'+ json['warning'] +'</div>');
                        $('input[type="hidden"][name="xshipping_address_check"]').before('<div class="alert alert-danger noshipping">'+ json['warning'] +'</div>');
                    }
                }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
};
$(document).on("click", "#couponbtn", function(event) {	 
	$.ajax({
		url: 'index.php?route=xcheckout/xcvc/validateCoupon',
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
	url: 'index.php?route=xcheckout/xcvc/validateVoucher',
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
		url: 'index.php?route=xcheckout/xcvc/validateReward',
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
	url: 'index.php?route=xcheckout/xcvc/addComment',
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
</script>
<?php if($custom_js){ ?>
<script type="text/javascript">
<?php echo $custom_js; ?>
</script>
<?php } ?>
<?php echo $xfooter; ?>
