if($(window).width()<767){$(".hecall").appendTo("header .bottom-header > .container");$(".search-header").appendTo("header");$('.hocu-carousel, .flexslider-car').flexslider({animation:"slide",animationLoop:false,itemWidth:250,itemMargin:5,slideshow:false,controlNav:false,directionNav:false});$(".m-menu").click(function(){$(".menu").animate({width:'toggle'},400);$(".menu-overlay").toggleClass("active");$("body, html").toggleClass("bohidden");});$(".menu-overlay").click(function(){$(".menu").animate({width:'toggle'},400);$(".menu-overlay").toggleClass("active");$("body, html").toggleClass("bohidden");});$(".product-info .title").click(function(){$(".product-info .title").not(this).next(".proinset").hide();$(this).next(".proinset").toggle();});$("footer nav .title").click(function(){$(this).toggleClass("active");$("footer nav .title").not(this).removeClass("active");$("footer nav .title").not(this).next("footer nav ul").slideUp();$(this).next("ul").animate({height:'toggle'});});$(".filter-option .title").click(function(){$(".filter-option .title").not(this).next(".filter-option ul").hide();$(this).next(".filter-option ul").slideToggle();});$(window).load(function(){$(".youtube").colorbox({innerWidth:280});$(".inline").colorbox({width:"98%"});});}