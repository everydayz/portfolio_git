		<script type="text/javascript">
		$(document).ready(function(){
			$('.gnb>li').hover(function(){
				$(this).addClass('on');
				$(this).children('ul').show();
			},function(){
				$(this).removeClass('on');
				$(this).children('ul').hide();
			});
		});
		</script>
		<!-- nav -->
		<div class="nav">
			<h1><a href="/"><img src="/img/common/h1.gif" alt="" /></a></h1>
			<ul class="gnb">
				<li>
					<a href="outline.asp">모종캐슬어울림<span>&gt;</span></a>
					<ul>
						<li><a href="outline.asp">사업개요</a></li>
						<li><a href="brand.asp">브랜드 소개</a></li>
						<li><a href="come.asp">찾아오시는 길</a></li>
					</ul>
				</li>
				<li><a href="schedul.asp">분양안내<span>&gt;</span></a>
                  <ul>
                    <li><a href="schedul.asp">분양일정</a></li>
                    <li><a href="adv.asp">모집공고</a></li>
                    <li><a href="chung.asp">청약안내</a></li>
                  </ul>
				</li>
				<li><a href="premium.asp">프리미엄<span>&nbsp;</span></a></li>
				<li>
					<a href="plan.asp">단지정보<span>&gt;</span></a>
					<ul>
						<li><a href="plan.asp">단지설계</a></li>
						<li><a href="arriv.asp">동,호수 배치도</a></li>
						<li><a href="cumm.asp">커뮤니티</a></li>
						<li><a href="system.asp">시스템</a></li>
					</ul>
				</li>
				<li><a href="generation.asp">세대정보<span>&nbsp;</span></a></li>
				<li>
					<a href="e-mod.asp">E-모델하우스<span>&gt;</span></a>
					<ul>
						<li><a href="e-mod.asp">E-모델하우스</a></li>
						<li><a href="e-cadal.asp">E-카다로그</a></li>
					</ul>
				</li>
				<li>
					<a href="join.asp">고객센터<span>&gt;</span></a>
					<ul>
					  <li><a href="join.asp">관심고객</a></li>
						<li><a href="list.asp">보도자료</a></li>
						<li><a href="present.asp">당첨자발표</a></li>
				  </ul>
			  </li>
			</ul>
			<ul class="quickmenu">
			  <li><a href="join.asp"><img src="/img/common/quick01.gif" alt="" />관심고객</a></li>
				<li><a href="adv.asp"><img src="/img/common/quick02.gif" alt="" />모집공고</a></li>
				<li><a href="come.asp"><img src="/img/common/quick03.gif" alt="" />오시는 길</a></li>
			</ul>
			<p class="nav_img"><img src="/img/common/nav_img.gif" alt="" /></p>
			<p class="tel"><img src="/img/common/tel.gif" alt="" /></p>
		</div>
		<!-- //nav -->