// Can also be used with $(document).ready()
// banner slider 
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav:false
  });
  //customer  slider
   $('.flexslider-carousel').flexslider({
    animation: "slide",
    animationLoop: false,
    itemWidth: 324,
    itemMargin: 38,
     controlNav:false
  });
  //pro d
  $('.flexslider-car').flexslider({
    animation: "slide",
    animationLoop: false,
    itemWidth: 289,
    itemMargin: 5,
     controlNav:false
  });
  
  //thump slider
  $('.product-slider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
  
//popup start here
$(".inline").colorbox({inline:true, width:"710px"});
  $(".inline").colorbox({fixed: true});
           
});



//$("").stick_in_parent();
$("#header").stick_in_parent({recalc_every: 1});
//$("#header").trigger("sticky_kit:detach");




//jQuery  step start
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({
        'transform': 'scale('+scale+')',
        'position': 'absolute'
      });
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(){
	return false;
})

//contact us click to open form
$(".cous-support").click(function(){
    $(".cous-form").fadeIn("fast");
});
$(".close").click(function(){
    $(".cous-form").hide();
});

//click to scroll div
$('.custom-scroll').on('click', function(event) {
    var target = $( $(this).attr('href') );
    if( target.length ) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: target.offset().top
        }, 1000);
    }
});

//Drop Down Menu
var api;
$(document).ready(function() {
    api = $(".smartmenu").smartMenu({
        responsive:"switch-margin"
    });
});

//back to top
$(window).scroll(function(){
   if($(this).scrollTop() > 500) {
       $(".go-top").fadeIn();
   }else{
       $(".go-top").fadeOut();
   }
});
$(".go-top").click(function(){
    $("html, body").animate({scrollTop:0});
});