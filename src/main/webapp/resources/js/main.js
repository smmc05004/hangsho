$(function() {
	var main = $('.main_visual_li').bxSlider({    
	    maxSlides: 4,
	    minSlides: 4,
	    slideWidth: 322,		   
	    pager: false,
	    moveSlides: 2,
	    slideMargin: 10,
	    auto: true,
	    autoStart: true,
	    pause: 5000,
	    autoHover:true	   		        
	});
	$("#main_visual .bx-controls-direction a").click(function(){
		setTimeout(function(){
			main.startAuto();
		},1000);
	});

	$(".main_product h4 a").click(function(event) {	
		event.preventDefault();
		$(".main_product div:visible").hide();
		$(this).parent().next().show();
		$(".main_product .on").removeClass("on");
		$(this).addClass("on");		
	});
});