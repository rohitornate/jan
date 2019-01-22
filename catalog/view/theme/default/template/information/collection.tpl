<?php

echo $header; ?>
  
   
  
 <style>
    .texthead h2{
	 
	  font-family: "AvenirNextLTW01-Regular";
	  display: inline-block;
      vertical-align: middle;
	  font-weight:100;
	  font-size: 24px;
	}
	 .texthead h4{
	     color: #2f7ec0;
    font-family: "AvenirNextLTW01-Regular";
    display: inline-block;
    vertical-align: middle;
    font-weight: 100;
    font-size: 20px;
    padding: 20px;
	}
    .templatle{
	 padding-bottom:20px;
	}
    .rating .fa {
	 color:#7b325f;
	 font-size:22px;
	 width: 1em;
     height: 1em !important;
     line-height: 0em;
	}
	.product-layout{
	 border:1px solid #ddd;
	 padding:20px;
	 background:#7fc4ff14
	}
	.image{
	  margin:20px 0;
	}
	.image img{
	 width:120px;
	 height:120px;
	 font-family: "AvenirNextLTW01-Regular";
	 display: inline-block;
     vertical-align: middle;
	}
	.datetext{
	padding-top: 20px;
    font-size: 14px;
    font-family: "AvenirNextLTW01-Regular";
	line-height:20px;
	font-weight:100;
	}
	.paratext{
	 padding-top:10px;
	}
	.paratext .comment{
	text-align:justify;
	font-family: "AvenirNextLTW01-Regular";
	font-size:14px;
	line-height:20px;
	font-weight:100;
	}
	.comment span{
	float:right;
	}
	
	.comment span a {
    text-decoration: none;
    color: #000;
    font-weight: bold;
	}
	.comment span a:hover{
	color:#2f7ec0;
	}
  </style>

<div class="container">
    <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
    </ul>


<!--collection-->
<style>
.c-banner{
	box-shadow: 0 2px 4px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);
	margin-bottom:30px;
}
.c-content{
	padding-bottom:30px;
}
.imgeffect{ padding-bottom:12px !important;}
/*.myside{padding-left:0px;}
.myside1{padding-right:0px; padding-left:0px;}*/
.banners > div.banner-1 {
    margin-right: 195px;
}
.c-banners > div {
    display: inline-block;
    vertical-align: top;
	width: 470px;
    font-size: 16px;
    line-height: 26px;
    color: #8f8180;
    margin-bottom: 30px;
}
.c-banners > div .c-banner-box {
    position: relative;
}
.c-banners > div .c-banner-box > a {
    display: block;
}
.c-banners > div.banner-1 .s-desc-c {
    background: #f4eae9;
    background: -moz-linear-gradient(-45deg, #f4eae9 0%, #f8f1f0 47%, #fafaf8 100%);
    background: -webkit-linear-gradient(-45deg, #f4eae9 0%, #f8f1f0 47%, #fafaf8 100%);
   
}

.c-banners > div .c-banner-box > a img {
    position: absolute;
    top: -10px;
    left: 43.5%;
    pointer-events: none;
    -moz-transition: 1s all ease;
    -o-transition: 1s all ease;
    -webkit-transition: 1s all ease;
    transition: 1s all ease;
}

.c-banners > div .s-desc-c:before {
    border-color: rgba(225, 218, 207, 0.5);
}
.c-banners > div a:hover .s-desc-c:before {
    border-color: #c33751;
}

.c-banners > div .s-desc-c:before {
    position: absolute;
    display: inline-block;
    top: 50px;
    left: 42.8%;
    width: 370px;
    height: 244px;
    content: '';
    border: 3px solid rgba(227, 220, 209, 0.5);
    -moz-transition: 0.7s all ease;
    -o-transition: 0.7s all ease;
    -webkit-transition: 0.7s all ease;
    transition: 0.7s all ease;
}


.c-banners > div.banners-1 .s-desc-c {
    padding-right: 40%;
    background: #f5ebea;
    background: -moz-linear-gradient(-45deg, #f5ebea 0%, #f9f4f3 47%, #fbfbf9 100%);
    background: -webkit-linear-gradient(-45deg, #f5ebea 0%, #f9f4f3 47%, #fbfbf9 100%);
    background: linear-gradient(135deg, #f5ebea 0%, #f9f4f3 47%, #fbfbf9 100%);
}

.c-banners > div .s-desc-c {
    background: #f5ebea;
    padding: 85px 40px 30px 47px;
    min-height: 325px;
}

.c-banners > div .s-desc-c:before {
    border-color: rgba(225, 218, 207, 0.5);
}
.c-banners > div .s-desc-c:before {
    position: absolute;
    display: inline-block;
    top: 50px;
    left: 42.8%;
    width: 370px;
    height: 244px;
    content: '';
    border: 3px solid rgba(227, 220, 209, 0.5);
    -moz-transition: 0.7s all ease;
    -o-transition: 0.7s all ease;
    -webkit-transition: 0.7s all ease;
    transition: 0.7s all ease;
}
.c-banners > div .s-desc h3, .c-banners > div .s-desc-c p {
    position: relative;
}
.c-banners > div .s-desc-c h3 {
    font-size: 46px;
    line-height: 46px;
    margin-bottom: 26px;
    display: inline-block;
	font-weight: 500;
}
h3{
    color: #322f2f;
	text-transform: uppercase;
	font-family: "Oranienbaum", serif;
    margin: 0 0 20px;
	
}
.c-banners > div .s-desc-c h3:before {
    /*position: absolute;
    display: inline-block;*/
    bottom: 2px;
    left: 0;
    width: 100%;
    height: 1px;
    content: '';
    background: #d9cac9;
    -moz-transition: 0.5s all ease;
    -o-transition: 0.5s all ease;
    -webkit-transition: 0.5s all ease;
    transition: 0.5s all ease;
}

.c-banners > div .s-desc-c p {
    position: relative;
	font: 400 16px/26px "Raleway", sans-serif;
    color: #322f2f;;
}
p {
    margin: 0 0 10px;
	
}

.c-banners p {
    font: 400 16px/30px "Raleway", sans-serif;
    color: #a5a3a3;
}

.c-banners > div.banners-1:hover{
    transition: 1s all ease;
}
.c-banners > div .c-banner-box > img {}

.c-banners > div .c-banner-box > a img {
    position: absolute;
    top: -10px;
    left: 43.5%;
    pointer-events: none;
    -moz-transition: 1s all ease;
    -o-transition: 1s all ease;
    -webkit-transition: 1s all ease;
    transition: 1s all ease;
}
img {
    vertical-align: middle;
	    border: 0;
}

.c-banners > div.banners-2 {
   margin-top: 123px;
   margin-left: 170px;
}
.c-banners > div.banners-2 .s-desc-c {
    background: #fbf9f7;
    background: -moz-linear-gradient(-45deg, #fbf9f7 0%, #f8f0f0 48%, #f4eae9 100%);
    background: -webkit-linear-gradient(-45deg, #fbf9f7 0%, #f8f0f0 48%, #f4eae9 100%);
    background: linear-gradient(135deg, #fbf9f7 0%, #f8f0f0 48%, #f4eae9 100%);
}

.c-banners > div.banners-2 .s-desc-c {
    padding-left: 60px;
    padding-right: 55px;
    min-height: 428px;
    background: #fcfaf8;
    background: -moz-linear-gradient(-45deg, #fcfaf8 0%, #f8f1f1 48%, #f5ebea 100%);
    background: -webkit-linear-gradient(-45deg, #fcfaf8 0%, #f8f1f1 48%, #f5ebea 100%);
    background: linear-gradient(135deg, #fcfaf8 0%, #f8f1f1 48%, #f5ebea 100%);
}
.c-banners > div.banners-2 .s-desc-c:before {
    top: auto;
    bottom: -188px;
    left: 60px;
    width: 350px;
    height: 330px;
}

.c-banners > div.banners-2 .c-banner-box > a img {
    top: auto;
    bottom: -220px;
    left: 10px;
}
.c-banners > div.banners-3 {
    margin: -168px 30px 85px 135px;
}
.c-banners > div.banner-3 .s-desc-c {
    background: #f9f5f4;
    background: -moz-linear-gradient(45deg, #f9f5f4 0%, #fbfaf7 47%, #f5eae9 100%);
    background: -webkit-linear-gradient(45deg, #f9f5f4 0%, #fbfaf7 47%, #f5eae9 100%);
    background: linear-gradient(45deg, #f9f5f4 0%, #fbfaf7 47%, #f5eae9 100%);
}
.c-banners > div.banners-3 .s-desc-c {
    padding-left: 42%;
    background: #faf6f5;
    background: -moz-linear-gradient(45deg, #faf6f5 0%, #fbfaf8 47%, #f6eceb 100%);
    background: -webkit-linear-gradient(45deg, #faf6f5 0%, #fbfaf8 47%, #f6eceb 100%);
    background: linear-gradient(45deg, #faf6f5 0%, #fbfaf8 47%, #f6eceb 100%);
}

.c-banners > div.banners-3 .s-desc-c:before {
    top: 40px;
    left: -100px;
    width: 270px;
    height: 245px;
}

.c-banners > div.banners-3 .c-banner-box > a img {
    top: -65px;
    left: -248px;
}
.c-banners > div.banners-4 {
   /* margin-right: 195px;*/
    margin-right: 170px;
}



.c-banners > div.banners-4 .s-desc-c p {
    margin-bottom: 25px;
}

.c-banners > div.banners-4 .s-desc-c {
    background: #f4eae9;
    background: -moz-linear-gradient(45deg, #f4eae9 0%, #f8f1f0 47%, #fafaf8 100%);
    background: -webkit-linear-gradient(45deg, #f4eae9 0%, #f8f1f0 47%, #fafaf8 100%);
    background: linear-gradient(45deg, #f4eae9 0%, #f8f1f0 47%, #fafaf8 100%);
}

.c-banners > div.banners-4 .s-desc-c:before {
    top: 52px;
    left: auto;
    right: -170px;
    width: 335px;
    height: 340px;
}

.c-banners > div.banners-4 .s-desc-c {
    min-height: 444px;
    padding-left: 62px;
    padding-right: 35%;
    background: #f0f6fc;
    background: -moz-linear-gradient(45deg, #f5ebea 0%, #f9f3f2 47%, #fbfbf9 100%);
    background: -webkit-linear-gradient(45deg, #f5ebea 0%, #f9f3f2 47%, #fbfbf9 100%);
    background: linear-gradient(45deg, #f5ebea 0%, #f9f3f2 47%, #fbfbf9 100%);
}
.c-banners > div.banners-4 .c-banner-box > a img {
    top: 12px;
    left: auto;
    right: -275px;
}
.c-banners > div.banners-5 .s-desc-c {
    background: #fbf9f7;
    background: -moz-linear-gradient(-45deg, #fbf9f7 0%, #f8f1f0 47%, #f4eae9 100%);
    background: -webkit-linear-gradient(-45deg, #fbf9f7 0%, #f8f1f0 47%, #f4eae9 100%);
    background: linear-gradient(135deg, #fbf9f7 0%, #f8f1f0 47%, #f4eae9 100%);
}

.c-banners > div.banners-5 .s-desc-c {
    padding-left: 60px;
    padding-right: 34%;
    min-height: 314px;
    background: #fcfaf8;
    background: -moz-linear-gradient(-45deg, #fcfaf8 0%, #f9f4f3 47%, #f5ebea 100%);
    background: -webkit-linear-gradient(-45deg, #fcfaf8 0%, #f9f4f3 47%, #f5ebea 100%);
    background: linear-gradient(135deg, #fcfaf8 0%, #f9f4f3 47%, #f5ebea 100%);
}
.c-banners > div.banners-5 .c-banner-box > a img {
    top: auto;
    bottom: -250px;
    left: 0;
}
.c-banners > div.banners-4 .s-desc-c p {
    margin-bottom: 25px;
}
.c-banners > div.banners-5 .s-desc-c:before {
    top: 50px;
    left: 122px;
    width: 300px;
    height: 222px;
}
@media (max-width: 480px){
.c-banners > div.banners-1 .s-desc-c, .c-banners > div.banners-2 .s-desc-c, .c-banners > div.banners-3 .s-desc-c, .c-banners > div.banners-4 .s-desc-c, .c-banners > div.banners-5 .s-desc-c {
    padding: 40px 15px;
    min-height: 0;
	
}
.c-banners > div.banners-1, .c-banners > div.banners-2, .c-banners > div.banners-3, .c-banners > div.banners-4, .c-banners > div.banners-5 {
    margin: 0 0 210px;
}
.c-banners > div.banners-1 .s-desc-c h3, .c-banners > div.banners-2 .s-desc-c h3, .c-banners > div.banners-3 .s-desc-c h3, .c-banners > div.banners-4 .s-desc-c h3, .c-banners > div.banners-5 .s-desc-c h3 {
    font-size: 36px;
    line-height: 36px;
    margin-bottom: 20px;
}

.c-banners > div.banners-1 .s-desc-c:before, .c-banners > div.banners-2 .s-desc-c:before, .banners > div.banners-3 .s-desc-c:before, .c-banners > div.banners-4 .s-desc-c:before, .c-banners > div.banners-5 .s-desc-c:before {
    top: auto;
    bottom: -160px;
    left: 10%;
    width: 80%;
    height: 200px;
}
.c-banners > div {
    text-align: center;
    max-width: 100%;
}
.c-banners > div.banners-1 .c-banner-box > a img, .c-banners > div.banners-2 .c-banner-box > a img, .c-banners > div.banners-3 .c-banner-box > a img, .c-banners > div.banners-4 .c-banner-box > a img, .c-banners > div.banners-5 .c-banner-box > a img {
    top: 100%;
   /* margin-top: -60px;*/
	margin-top: -40px;
    bottom: auto;
    left: 15%;
    width: 70%;
}
}
@media (max-width: 767px){
/*.c-banners > div.banners-3 .s-desc-c:before {
    top: 50px;
    left: -40px;
    width: 215px;
    height: 230px;
}*/
.c-banners > div.banners-3 .s-desc-c:before {
    top: 160px;
    left: 0;
    width: 270px;
    height: 245px;
}
.c-banners > div .s-desc-c:before {
    width: 300px;
    height: 240px;
}
/*.c-banners > div.banners-4 .s-desc-c:before {
    top: 40px;
    right: -40px;
    width: 270px;
    height: 270px;
}*/
.c-banners {
    text-align: center;
}
}
</style>





	<div class="row">
		<div class="col-md-4 col-sm-4 col-xs-12">
		<div class="c-banner">
		<a href="" id="1" target="_self">
		<img src="images/collection/tree1.jpg" alt="jaipur">
		</a>
		</div>
		<div class="col-md-12 col-sm-12 col-xs-12 c-banner">
		<a  href="" id="2" target="_self">
		<img   src="images/collection/KIDS_JEWELRY.jpg" alt="Lanatural">
		</a>
		</div>
		</div>
		<div class="col-md-8 col-sm-8">
			<div class="col-md-12 col-sm-12 col-xs-12 c-banner">
				<a  href="" id="3" target="_self">
					<img src="images/collection/pearl1.jpg" alt="peacock">
				</a>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 c-banner myside">
				<a class="" href="" id="4" target="_self">
					<img class="imgeffect" src="images/collection/heart_hbanner_pink.jpg" alt="Aaranya">
				</a>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 c-banner myside1">
			    
				<a  href="" id="4" target="_self">
					<img  class="imgeffect" src="images/collection/AMERICAND1.jpg" alt="Aaranya">
				</a>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 c-banner myside1">
				<a  href="" id="4" target="_self">
					<img  src="images/collection/dancing-diamond.gif" alt="Aaranya">
				</a>
			</div>
		</div>
		
		
		
		</div>
	







    <div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div id="banner0" class="c-banners">
				
					<div class="banner-block banners-1">
						<div class="c-banner-box">
							<a class="clearfix" href="">					
								<div class="s-desc-c">
									<h3>Rings</h3>	
									<p>Rings are a lasting promise of love.Find your perfect style from classic to modern. </p>										
								</div>
								<img src="images/collection/banner_ring.png" alt="banner-1" class="img-responsive">
							</a>
						</div>
					</div>
				
			
				<div class="banner-block banners-2">
					<div class="c-banner-box">
						<a class="clearfix" href="">					
							<div class="s-desc-c">												
								<h3>Necklaces</h3>	
									<p>Make that neck sparkle.Unlock romance with our chic modern elegant pendant necklaces.</p>										
							</div>
							<img src="images/collection/banner_pendent.png" alt="banner-2" class="img-responsive">
						</a>
					</div>
				</div>
				
					<div class="banner-block banners-3">
						<div class="c-banner-box">
							<a class="clearfix" href="">					
								<div class="s-desc-c">												
									<h3>Earrings</h3>	
									<p>Good things come in pairs.Browse the latest earring designs.</p>											
								</div>
								<img src="images/collection/banner_earing.png" alt="banner-3" class="img-responsive">
							</a>
						</div>
					</div>
				
					<div class="banner-block banners-4">
						<div class="c-banner-box">
							<a class="clearfix" href="">					
								<div class="s-desc-c">												
									<h3>Bracelets</h3>	
									<p>Wrap your wrist in luxury. One size fits all.Dig deep into designer styles.</p>									
								</div>
								<img src="images/collection/banner_bracelate.png" alt="banner-4" class="img-responsive">
							</a>
						</div>
					</div>
				
					<div class="banner-block banners-5 c-content">
						<div class="c-banner-box">
							<a class="clearfix" href="">					
								<div class="s-desc-c">												
									<h3>KIDS JEWELRY</h3>	
									<p>Gifts for your little love.Allergy free pure silver jewelry.Safe for babies.</p>					
								</div>
								<img src="images/collection/banner_kids1.png" alt="banner-5" class="img-responsive">
							</a>
						</div>
					</div>
				
			</div>
        </div>
	</div>	

			
		
			
		</div>


    
    
 <script type="text/javascript"><!--
$( document ).ready(function() {

//$('#cous-form').show();
//$("html body").animate({ scrollTop: $('#cous-form').offset().top}, 100);
//$('#cous-form').focus();
});
--></script>

    <script>
	(function($) {
    $.fn.shorten = function(settings) {
        "use strict";

        var config = {
            showChars: 570,
            minHideChars: 10,
            ellipsesText: "...",
            moreText: "Read More",
            lessText: "Less",
            onLess: function() {},
            onMore: function() {},
            errMsg: null,
            force: false
        };

        if (settings) {
            $.extend(config, settings);
        }

        if ($(this).data('jquery.shorten') && !config.force) {
            return false;
        }
        $(this).data('jquery.shorten', true);

        $(document).off("click", '.morelink');

        $(document).on({
            click: function() {

                var $this = $(this);
                if ($this.hasClass('less')) {
                    $this.removeClass('less');
                    $this.html(config.moreText);
                    $this.parent().prev().animate({'height':'0'+'%'}, function () { $this.parent().prev().prev().show(); }).hide('fast', function() {
                        config.onLess();
                      });

                } else {
                    $this.addClass('less');
                    $this.html(config.lessText);
                    $this.parent().prev().animate({'height':'100'+'%'}, function () { $this.parent().prev().prev().hide(); }).show('fast', function() {
                        config.onMore();
                      });
                }
                return false;
            }
        }, '.morelink');

        return this.each(function() {
            var $this = $(this);

            var content = $this.html();
            var contentlen = $this.text().length;
            if (contentlen > config.showChars + config.minHideChars) {
                var c = content.substr(0, config.showChars);
                if (c.indexOf('<') >= 0) // If there's HTML don't want to cut it
                {
                    var inTag = false; // I'm in a tag?
                    var bag = ''; // Put the characters to be shown here
                    var countChars = 0; // Current bag size
                    var openTags = []; // Stack for opened tags, so I can close them later
                    var tagName = null;

                    for (var i = 0, r = 0; r <= config.showChars; i++) {
                        if (content[i] == '<' && !inTag) {
                            inTag = true;

                            // This could be "tag" or "/tag"
                            tagName = content.substring(i + 1, content.indexOf('>', i));

                            // If its a closing tag
                            if (tagName[0] == '/') {


                                if (tagName != '/' + openTags[0]) {
                                    config.errMsg = 'ERROR en HTML: the top of the stack should be the tag that closes';
                                } else {
                                    openTags.shift(); // Pops the last tag from the open tag stack (the tag is closed in the retult HTML!)
                                }

                            } else {
                                // There are some nasty tags that don't have a close tag like <br/>
                                if (tagName.toLowerCase() != 'br') {
                                    openTags.unshift(tagName); // Add to start the name of the tag that opens
                                }
                            }
                        }
                        if (inTag && content[i] == '>') {
                            inTag = false;
                        }

                        if (inTag) { bag += content.charAt(i); } // Add tag name chars to the result
                        else {
                            r++;
                            if (countChars <= config.showChars) {
                                bag += content.charAt(i); // Fix to ie 7 not allowing you to reference string characters using the []
                                countChars++;
                            } else // Now I have the characters needed
                            {
                                if (openTags.length > 0) // I have unclosed tags
                                {
                                    //console.log('They were open tags');
                                    //console.log(openTags);
                                    for (j = 0; j < openTags.length; j++) {
                                        //console.log('Cierro tag ' + openTags[j]);
                                        bag += '</' + openTags[j] + '>'; // Close all tags that were opened

                                        // You could shift the tag from the stack to check if you end with an empty stack, that means you have closed all open tags
                                    }
                                    break;
                                }
                            }
                        }
                    }
                    c = $('<div/>').html(bag + '<span class="ellip">' + config.ellipsesText + '</span>').html();
                }else{
                    c+=config.ellipsesText;
                }

                var html = '<div class="shortcontent">' + c +
                    '</div><div class="allcontent">' + content +
                    '</div><span><a href="javascript://nop/" class="morelink">' + config.moreText + '</a></span>';

                $this.html(html);
                $this.find(".allcontent").hide(); // Hide all text
                $('.shortcontent p:last', $this).css('margin-bottom', 0); //Remove bottom margin on last paragraph as it's likely shortened
            }
        });

    };

})(jQuery);

</script>
	
	
<?php echo $footer; ?>
