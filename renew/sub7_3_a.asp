<%
Dim localmenu1, localmenu2, folder, page

localmenu1 = "6"
localmenu2 = "2"
folder = "customer"
page = "interest"
%>


<!--#include file="../include/top.asp"-->
<!--#include file="../include/nav.asp"-->
<!--#include file="../include/sub_menu.asp"-->
<script type="text/javascript" src="/_lib/js/common.js"></script>
<script type="text/javascript" src="/_lib/js/site.js"></script>
<!--각페이지 컨텐츠 입력-->
<div class="content prize">
    <h3 class="mb_20"><img src="../img/customer/prize_01.gif" alt="" /></h3>
    <form name="fCust" id="fCust" method="post" action="" onsubmit="return false;">
    <div class="form_wrap clear">
        <div class="clause_box">
            <p class=""><strong>개인정보 수집 및 이용목적</strong><br />
<br />
<strong>1. 수집하는 개인정보 항목</strong><br />
회사는 관심고객등록 등을 통하여 아래와 같은 개인정보를 수집하고 있습니다.<br />
- 수집항목 : 이름, 생년월일, 휴대전화번호, 주소, 이메일 등<br />
- 수집방법 : 홈페이지 관심고객등록<br />
<br />
<strong>2. 개인정보의 수집 및 이용목적</strong>  <br />
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br />
- 분양정보 및 분양상담 등 문의 처리<br />
- 마케팅 및 광고홍보에 활용<br />
<br />
<strong>3. 개인정보의 보유 및 이용기간</strong> <br />
회사는 개인정보수집 및 이용목적이 달성된 후에는 예외 없이 해당정보를 지체없이 파기합니다.<br /><br /></p>
            <div class="rBox">
                <img src="../img/customer/prize_02.gif" alt="개인정보보호정책에 동의 하십니까?" />
                <input type="radio" id="rbtn_03_01" name="r_wrap3" checked="checked" value="1" class="ml_20" /><label for="rbtn_03_01"> <img src="../img/customer/prize_03.gif" alt="동의함" /></label>
                <input type="radio" id="rbtn_03_02" name="r_wrap3" value="0" /><label for="rbtn_03_02"> <img src="../img/customer/prize_04.gif" alt="동의하지 않음" /></label>
            </div>
        </div>
        <div class="form_box">
        	<ul>
        	    <li class="list_01"><img src="../img/customer/prize_05.gif" alt="고객생명" /><input type="text" name="cw_nm" id="cw_nm" maxlength="20" /></li>
        	    <li class="list_02"><img src="../img/customer/prize_06.gif" alt="주민번호 앞자리" /><input type="text" name="cw_jumin1" id="cw_jumin1" maxlength="6" /></li>
                <li class="list_03">* 성명은 반드시 공백없이 일렬로 입력하세요.</li>
        	</ul>
            <a href="#" class="btn" onclick="f_sViewWinnerCheck();return false;"><img src="../img/customer/prize_btn.gif" alt="당첨자조회" /></a>
        </div>
    </div>
    </form>
</div>

<!--bottom.asp-->
<!--#include file="../include/footer.asp"-->