<?php if($isFacebook || $isGoogle || $isLinkedin) { ?>
<div class="login-third-party-login text-center hide_guest">
<p class="login-button-info-text login-info-text"><?php echo $text_social_heading; ?></p>
<div class="login-button-container">
<?php if($isFacebook){ ?>
<div class="social-container">
<div class="social-container-box" onclick="xfbLogin();">
<a href="javascript:void(0);" class="login-facebook login-button"><span class="header-sprite login-fb-logo"></span><?php echo $text_facebook; ?></a>
</div>
</div>
<?php } ?>
<?php if($isGoogle){ ?>
<div class="social-container">
<div class="social-container-box" id="googleLogin">
<a href="javascript:void(0);" class="login-google login-button" id="gPlusLogin"><span class="header-sprite login-gplus-logo"></span><?php echo $text_google; ?></a>
</div>
</div>
<?php } ?>
<?php if($isLinkedin){ ?>
<div class="social-container">
<div class="social-container-box" onclick="liLogin();">
<a href="javascript:void(0);" class="login-linkedin login-button" id="linkedinLogin"><span class="header-sprite login-linkedin-logo"></span><?php echo $text_linkedin; ?></a>
</div>
</div>
<?php } ?>
</div>
</div>
<p class="login-info-text text-center hide_guest"><?php echo $text_using_email; ?></p>
<?php if($isFacebook){ ?>
<script>
window.fbAsyncInit = function() {
    // FB JavaScript SDK configuration and setup
    FB.init({
      appId      : '<?php echo $fb_appId; ?>', // FB App ID
      cookie     : true,  // enable cookies to allow the server to access the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });   
};
// Load the JavaScript SDK asynchronously
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
// Facebook login with JavaScript SDK
function xfbLogin() {
    FB.login(function (response) {
        if (response.authResponse) {		
            getFbUserData();
        } else {
        	autherror();
        }
    }, {scope: 'email'});
}
// Fetch the user profile data from facebook
function getFbUserData(){
    FB.api('/me', {locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
    function (response) {
        if(response.email != null){
	  	  	var id= response.id;
	  	  	var email = response.email;
	  	  	var firstname = response.first_name;
	  	  	var lastname = response.last_name;
	  	  	if(response.picture == null){
	      		var pictureUrl = 'blank';
	      	}else{        	
	      		var pictureUrl = response.picture;
	     	}  	  	
	  	    var profileurl = response.link;
	  	  	var platform = 'facebook';
	  	  	var facebook_data = {id,firstname,lastname,email,pictureUrl,profileurl,platform};
	    	update_user_data(facebook_data);
        }else{
        	autherror();
        }
    });
}
</script>
<?php } ?>
<?php if($isGoogle){ ?>
<script src="https://apis.google.com/js/platform.js?onload=startGoogleApp" async defer></script>
<script>
  var googleUser = {};
  var startGoogleApp = function() {
    gapi.load('auth2', function(){
      // Retrieve the singleton for the GoogleAuth library and set up the client.
      auth2 = gapi.auth2.init({
        client_id: '<?php echo $google_client_id; ?>',
        cookiepolicy: 'none',
        // Request scopes in addition to 'profile' and 'email'
        //scope: 'additional_scope'
      });
      attachSignin(document.getElementById('googleLogin'));
    });
  };
  function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
    	  var profile = googleUser.getBasicProfile();
    	  var id= profile.getId();
    	  var email = profile.getEmail();
    	  var firstname = profile.getGivenName();
    	  var lastname = profile.getFamilyName();  
    	  var pictureUrl = profile.getImageUrl();
    	  var platform = 'google';
    	  var google_data = {id,firstname,lastname,email,pictureUrl,platform};    	 
    	  update_user_data(google_data); 
        }, function(error) {
            //alert(JSON.stringify(error));
        	autherror();
        });
  }
</script>
<?php } ?>
<?php if($isLinkedin){ ?>
<script type="text/javascript" src="//platform.linkedin.com/in.js">
    api_key: <?php echo $linkedin_api_key; ?>
</script>  
<script type="text/javascript">
var liLogin = function() {
    IN.UI.Authorize().params({"scope":["r_basicprofile", "r_emailaddress"]}).place();
    IN.Event.on(IN, 'auth', getProfileData);
}
var getProfileData = function() { // Use the API call wrapper to request the member's basic profile data
    IN.API.Profile("me").fields("id,firstName,lastName,email-address,picture-urls::(original),public-profile-url,location:(name)").result(function (me) {
        var profile = me.values[0];
        var id = profile.id;
        var firstname = profile.firstName;
        var lastname = profile.lastName;
        var email = profile.emailAddress;
        if(profile.pictureUrls.values == null){
        	var pictureUrl = 'blank';
        }else{        	
        	var pictureUrl = profile.pictureUrls.values[0];
        }
        var profileUrl = profile.publicProfileUrl;
        var country = profile.location.name;
        var platform = 'linkedin';
        var linkedindata = {id,firstname,lastname,email,profileUrl,pictureUrl,country,platform};        
        update_user_data(linkedindata); 
    });
}
</script>
<?php } ?>
<script>
  function autherror(){
	  $('#autherror').remove();
	  $('.login-third-party-login').before('<div id="autherror" class="alert alert-danger alert-dismissible margintop20"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">x</span></button><?php echo $error_auth; ?></div>');
  } 
  function update_user_data(response) {
	  $.ajax({
	        url: 'index.php?route=<?php echo $xtensions_controller_path; ?>xsocial/validateSocialUser',
	        type: 'post',
	        data: response,
	        dataType: 'json',
	        beforeSend: function() {                    
	        	showLoader();
	        },
	        success: function(json) {        				
	            if (json['redirect']) {
	                location = json['redirect'];
	            }else if(json['additionalform']){
					<?php if($clean_login){ ?>
					$('#xlogin2').remove();
					$('#loginPage').hide();
					$('#xlogin').append('<div id="xlogin2" class="login-panel-bg">'+json.additionalform+'</div>');
					<?php } else { ?>
					$('#xlogin2').remove();
					$('#step_login_panel').append('<div id="xlogin2" class="login-panel-bg">'+json.additionalform+'</div>');
					$('#loginPage').hide();
					<?php } ?>
					
	            }  
	            hideLoader();             
	        },
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
	    });
  }
</script>
<?php } ?>
