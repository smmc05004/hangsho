$(function() {

	$(".util_menu1>li>a").mouseover(function() {		
		$(this).next().show();
	});	
	$(".util_menu1>li:first-child+li").mouseleave(function() {
		$(".util_menu1 ul").hide();									
	});
	
	$(".gnb>li>a").mouseover(function() {
		$(".gnb ul:visible").hide();	
		$(this).next().show();
	});	
	$(".gnb").mouseleave(function() {
		$(".gnb ul:visible").hide();									
	});	

    $(".categorylist>li>a").mouseover(function() {
		$(this).next('div').removeClass().addClass("triangle_up");		
		$(".categorylist ul:visible").hide();	
		$(this).parents("li").find("ul").show();
	});
	$(".categorylist>li").mouseleave(function() {
		$(this).find('div').removeClass().addClass("triangle_down");		
	});	
	$(".categorylist>li").mouseleave(function() {
		$(".categorylist ul:visible").hide();									
	});

    $(window).scroll(function() {
        
        var height = $(document).scrollTop();
        
        if(height > 712) {
            $("#flow-bar").addClass("flow");
        } else {
            $("#flow-bar").removeClass("flow");
        }
         
    });
	
});