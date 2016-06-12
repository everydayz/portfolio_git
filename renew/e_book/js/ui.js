$(window).load(function(e){
	$(document).ready(function(e){
		ebookInit();
	})
})

//pc
var pageMax = 0;//총 페이지수
var percent = 0;
var resizeW = 0;
var resizeH = 0;
var pagePadding = 10;
var zoom_is = false;

//mobile
var MpageMax = 0;//총 페이지수
var Mpercent = 0;
var MresizeW = 0;
var MresizeH = 0;
var MpagePadding = 10;
var Mzoom_is = false;

var mobile_is = false;

//페이지가 모바일환경일경우
function mobileSet(){
}

function onResize( e ){
	if( $(window).width() - pagePadding < ebookW ){		
		
		percent = ( ($(window).width() - pagePadding)/ebookW ) * 100
		//console.log( percent, (ebookW/100)*percent );
		resizeW = (ebookW/100)*percent;
		resizeH = (ebookH/100)*percent;

		//pc
		$(".pc.ebook .ebookCnt .ebookSlider").css({"width":resizeW, "height":resizeH});
		$(".pc.ebook .ebookCnt .ebookSlider .touchslider-item").css({"width":resizeW, "height":resizeH});

		$(".pc.ebook .popup").css({"width":resizeW, "height":resizeH});

		//mobile
		$(".mobile.ebook .ebookCnt .ebookSlider").css({"width":resizeW, "height":resizeH*2});
		$(".mobile.ebook .ebookCnt .ebookSlider .touchslider-item").css({"width":resizeW, "height":resizeH*2});

		$(".mobile.ebook .popup").css({"width":resizeW, "height":resizeH*2});

	} else {
		//pc
		$(".pc.ebook .ebookCnt .ebookSlider").css({"width":ebookW, "height":ebookH});
		$(".pc.ebook .ebookCnt .ebookSlider .touchslider-item").css({"width":ebookW, "height":ebookH});

		$(".pc.ebook .popup").css({"width":ebookW, "height":ebookH});

		//mobile
		$(".mobile.ebook .ebookCnt .ebookSlider").css({"width":ebookW/2, "height":ebookH});
		$(".mobile.ebook .ebookCnt .ebookSlider .touchslider-item").css({"width":ebookW/2, "height":ebookH});

		$(".mobile.ebook .popup").css({"width":ebookW, "height":ebookH});
	}
}

function ebookInit(){
	
	$(window).bind("keydown",function(e) {

		if ( e.which == 37 ) {
			$(".pc .btnPrev").trigger("click");
		} else if ( e.which == 39 ) {
			$(".pc .btnNext").trigger("click");
		}
		e.preventDefault();
	});

	//불러올 페이지수
	pageMax = pageArray.length;
	MpageMax = pageMax * 2; 

	//슬라이드 리스트
	//pc
	var addList = "";
	for( var i = 0; i < pageMax; i++ ){
		addList += '<li class="touchslider-item"><img src="' + pageArray[i][0] + '" alt="page' + (i+1) + "-1" + '">';
		addList += '<img src="' + pageArray[i][1] + '" alt="page' + (i+1) + "-2" + '"></li>';
	}
	$(".pc .pageList").append(addList);

	//mobile
	var MaddList = "";
	var j = 1;
	for( i = 0; i < MpageMax; i++ ){
		if( j == 0 ) j++
			else j = 0;
		MaddList += '<li class="touchslider-item"><img src="' + pageArray[ Math.floor(i/2) ][j] + '" alt="page' + (Math.floor(i/2)+1) + j + '">';
		//j++
	}
	$(".mobile .pageList").append(MaddList);


	//줌인 팝업관련
	//pc
	var addPopupList = ""
	for( i = 0; i < pageMax; i++ ){
		addPopupList += '<li><div><img src="' + pageArray[i][0] + '" alt="page1">';
		addPopupList += '<img src="' + pageArray[i][1] + '" alt="page1"></div></li>';
	}
	$(".pc .popup .Cnt").append(addPopupList);

	$( ".pc .popup .Cnt li div" ).draggable({});
	$( ".pc .popup .Cnt li div" ).bind('drag',function( e, ui ){

		var t = 0;
		var r = $('.pc .popup').width() - $(e.target).width();
		var b = $('.pc .popup').height() - $(e.target).height();
		var l = 0;

		if(ui.position.top>0) { ui.position.top = 0; }
		if(ui.position.left<r) { ui.position.left = r; }
		if(ui.position.top<b) { ui.position.top = b; }
		if(ui.position.left>0) { ui.position.left = 0; }
	})

	//mobile
	var MaddPopupList = ""
	for( i = 0; i < MpageMax; i++ ){
		if( j == 0 ) j++
			else j = 0;
		MaddPopupList += '<li><div><img src="' + pageArray[ Math.floor(i/2) ][j] + '" alt="page' + (Math.floor(i/2)+1) + j + '">';
	}
	$(".mobile .popup .Cnt").append(MaddPopupList);

	$( ".mobile .popup .Cnt li div" ).draggable({});
	$( ".mobile .popup .Cnt li div" ).bind('drag',function( e, ui ){

		var t = 0;
		var r = $('.mobile .popup').width() - $(e.target).width();
		var b = $('.mobile .popup').height() - $(e.target).height();
		var l = 0;

		if(ui.position.top>0) { ui.position.top = 0; }
		if(ui.position.left<r) { ui.position.left = r; }
		if(ui.position.top<b) { ui.position.top = b; }
		if(ui.position.left>0) { ui.position.left = 0; }
	})

	//css set
	$(window).resize(function(e){
		onResize( e );
	})
	onResize();


	//select 셋팅
	//pc
	var htmlOption = "";
	for( i = 1; i<= pageMax; i++ ){
		htmlOption += "<option>" + i + "</option>"
	}
	$(".pc .selectCnt .select").append( htmlOption );
	
	$(".pc .select").change(function(e) {
		if( e.originalEvent ){//셀렉트 제어외에서 이벤트 케스팅일경우
			var index = $(this).val();
			$(".pc .touchslider-nav-item").eq( index - 1 ).trigger( "click" );

			if( zoom_is ){
				$(".pc .popup .Cnt li").addClass("none");
				$(".pc .popup .Cnt li").eq( getPageNum() ).removeClass("none");
			}
		}
	});

	$(".pc .selectCnt span").html( pageMax );

	//mobile
	var MhtmlOption = "";
	for( i = 1; i<= MpageMax; i++ ){
		MhtmlOption += "<option>" + i + "</option>"
	}
	$(".mobile .selectCnt .select").append( MhtmlOption );
	
	$(".mobile .select").change(function(e) {
		if( e.originalEvent ){//셀렉트 제어외에서 이벤트 케스팅일경우
			var index = $(this).val();
			$(".mobile .touchslider-nav-item").eq( index - 1 ).trigger( "click" );

			if( zoom_is ){
				$(".mobile .popup .Cnt li").addClass("none");
				$(".mobile .popup .Cnt li").eq( MgetPageNum() ).removeClass("none");
			}
		}
	});

	$(".mobile .selectCnt span").html( MpageMax );


	//페이지컨트롤버튼
	//pc
	var htmlPaging = "";
	htmlPaging += '<a class="touchslider-prev"><span class="touchslider-prev-in">prev</span></a>';
	htmlPaging += '<a class="touchslider-next"><span class="touchslider-next-in">next</span></a>';

	for( i = 1; i<= pageMax; i++ ){
		if( i == 1 ){
			htmlPaging += '<a class="touchslider-nav-item touchslider-nav-item-current"></a>';
		} else {
			htmlPaging += '<a class="touchslider-nav-item"></a>';
		}
	}	
	$(".pc .touchslider-nav").append( htmlPaging );

	//mobile
	var MhtmlPaging = "";
	MhtmlPaging += '<a class="touchslider-prev"><span class="touchslider-prev-in">prev</span></a>';
	MhtmlPaging += '<a class="touchslider-next"><span class="touchslider-next-in">next</span></a>';

	for( i = 1; i<= MpageMax; i++ ){
		if( i == 1 ){
			MhtmlPaging += '<a class="touchslider-nav-item touchslider-nav-item-current"></a>';
		} else {
			MhtmlPaging += '<a class="touchslider-nav-item"></a>';
		}
	}	
	$(".mobile .touchslider-nav").append( MhtmlPaging );


	//좌우화살표 이벤트
	//pc
	$(".pc .btnPrev").bind("click", function(e){
		if( getPageNum() != 0 ){
			$(".pc .touchslider-prev").trigger( "click" );
			endComplete();

			if( zoom_is ){
				$(".pc .popup .Cnt li").addClass("none");
				$(".pc .popup .Cnt li").eq( getPageNum() ).removeClass("none");
			}
		}
		e.preventDefault();
	})
	$(".pc .btnNext").bind("click", function(e){
		if( getPageNum() < pageMax-1 ){
			$(".pc .touchslider-next").trigger( "click" );
			endComplete();

			if( zoom_is ){
				$(".pc .popup .Cnt li").addClass("none");
				$(".pc .popup .Cnt li").eq( getPageNum() ).removeClass("none");
			}
		}
		e.preventDefault();
	})
	
	//mobile
	$(".mobile .btnPrev").bind("click", function(e){
		if( MgetPageNum() != 0 ){
			$(".mobile .touchslider-prev").trigger( "click" );
			MendComplete();

			if( zoom_is ){
				$(".mobile .popup .Cnt li").addClass("none");
				$(".mobile .popup .Cnt li").eq( MgetPageNum() ).removeClass("none");
			}
		}
		e.preventDefault();
	})
	$(".mobile .btnNext").bind("click", function(e){
		if( MgetPageNum() < MpageMax-1 ){
			$(".mobile .touchslider-next").trigger( "click" );
			MendComplete();

			if( zoom_is ){
				$(".mobile .popup .Cnt li").addClass("none");
				$(".mobile .popup .Cnt li").eq( MgetPageNum() ).removeClass("none");
			}
		}
		e.preventDefault();
	})

	//슬라이드 이벤트 http://touchslider.com/
	//pc
	$(".pc .ebookSlider").touchSlider({
		mouseTouch: true,
		margin:0,
		endComplete:endComplete
	});
	
	//mobile
	$(".mobile .ebookSlider").touchSlider({
		mouseTouch: true,
		margin:0,
		endComplete:MendComplete
	});

	
	//줌인버튼
	//pc
	$(".pc .btnZoom").bind("click", function(e){
		if( !zoom_is ) {//맵확대
			zoom_is = true;
			$(".pc .btnZoom").css({"background-image":"url(images/btn_zoomout.png)"})
			$(".pc .ebookSlider").addClass("none");
			$(".pc .popup").removeClass("none");
			
			$(".pc .popup .Cnt li").addClass("none");
			$(".pc .popup .Cnt li").eq( getPageNum() ).removeClass("none");

		} else {//맵축소
			zoom_is = false;
			$(".pc .btnZoom").css({"background-image":"url(images/btn_zoom.png)"})
			$(".pc .ebookSlider").removeClass("none");
			$(".pc .popup").addClass("none");
			$(".pc .popup .Cnt li img").css({"top":0,"left":0})
		}
		e.preventDefault();
	});

	//mobile
	$(".mobile .btnZoom").bind("click", function(e){
		if( !zoom_is ) {//맵확대
			zoom_is = true;
			$(".mobile .btnZoom").css({"background-image":"url(images/btn_zoomout.png)"})
			$(".mobile .ebookSlider").addClass("none");
			$(".mobile .popup").removeClass("none");
			
			$(".mobile .popup .Cnt li").addClass("none");
			$(".mobile .popup .Cnt li").eq( MgetPageNum() ).removeClass("none");

		} else {//맵축소
			zoom_is = false;
			$(".mobile .btnZoom").css({"background-image":"url(images/btn_zoom.png)"})
			$(".mobile .ebookSlider").removeClass("none");
			$(".mobile .popup").addClass("none");
			$(".mobile .popup .Cnt li img").css({"top":0,"left":0})
		}
		e.preventDefault();
	});

	//버튼 프린트
	$(".btnPrint").bind("click", function(e){
		$('.touchslider-viewport .touchslider-item:eq(' + getPageNum() + ') img').css({"width":"750px", "height" : "auto"})
		$('.touchslider-viewport .touchslider-item:eq(' + getPageNum() + ')').print()
		$('.touchslider-viewport .touchslider-item:eq(' + getPageNum() + ') img').css({"width":"50%", "height" : "100%"})
		e.preventDefault();
	});

	//버튼 창닫기
	$(".btnClose").bind("click", function(e){
		opener=window;
	    window.close();
		e.preventDefault();
	})

}


function endComplete(){
	$(".pc .select option").eq( getPageNum() ).prop( 'selected', true );
}

function MendComplete(){
	$(".mobile .select option").eq( MgetPageNum() ).prop( 'selected', true );
}


//현재페이지 리턴 pc
function getPageNum(){
	var index = $(".pc .touchslider-nav-item").index( $(".pc .touchslider-nav-item-current"));
	return index;
}

//현재페이지 리턴 mobile
function MgetPageNum(){
	var index = $(".mobile .touchslider-nav-item").index( $(".mobile .touchslider-nav-item-current"));
	return index;
}