$(function(){
	var currURL = window.location.pathname;
	$('.nav-tabs li a').each( function(index, item){
		if($(this).attr('href').replace('localhost', '') == currURL){
			$(this).parent().addClass('active').siblings().removeClass('active');
		}
	})
})