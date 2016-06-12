jQuery(document).ready(function () {
	jQuery('#rolling').cycle({
		fx: 'fade', // choose your transition type, ex: scrollHorz,fade, scrollUp, shuffle, etc...
		speed: 3000,
		timeout: 4000,
		
		height: 'auto',
		next: '.next',
		prev: '.prev',
		pager: '#dot_navi_inner'
		/*
				pagerAnchorBuilder: function(idx, slide) {   
					return "<a href='#'><img src='../images/common/btn_dot.png'  onmouseover='imgOver(this);' onmouseOut='imgOut(this);'  style='padding:5px;' /></a>";
				}
				*/
	});

	var rollingDiv = jQuery("#rolling1");

	rollingDiv.bind("mouseover", function () {
		jQuery('#rolling').cycle('pause');
	});
	rollingDiv.bind("mouseout", function () {
		jQuery('#rolling').cycle('resume');
	})

	setInterval('bannerResize()',1);

});
function bannerResize(){
		clientWidth = jQuery(window).width();	//resize된 화면 width	
		if(clientWidth<1000)clientWidth=1000;
		jQuery("#rolling").width(clientWidth);
		jQuery(".slide1, .slideImg1").width(clientWidth);
		jQuery("#rolling").css("margin","0 auto");
}


jQuery(window).resize(function() {
	clientWidth = jQuery(window).width();	//resize된 화면 width	
		if(clientWidth<1000)clientWidth=1000;
	jQuery("#rolling").width(clientWidth);
	jQuery(".slide1, .slideImg1").width(clientWidth);
	jQuery("#rolling").css("margin","0 auto");
	//location.reload();

});