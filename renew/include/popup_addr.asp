<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include file="./dbcon.asp" -->
<!--#include file="./common.asp" -->
<% 
	req_dong = getReplaceInput(fncDefault(request.form("dong"),""),"")
	rsCount = 0

	If Trim(req_dong & "") <> "" Then

		Set rs = Server.CreateObject("ADODB.RecordSet")
		SQL = " SELECT zipcode, sido, sigungu, dong, ri, doseo, building, bunji FROM ZIPCODE "
		SQL = SQL & "WHERE dong like '%"& req_dong &"%'"

		rs.Open SQL, dbcon
		rsCount = rs.RecordCount
	End If

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: 우편번호 확인 ::</title>
<link href="../inc/css/post_style.css" type="text/css" rel="stylesheet" charset="utf-8" media="screen" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--[if lt IE 9]> <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script> <![endif]-->
<script type="text/javascript">

	function find_post_done(zipcode, addr){
		opener.document.frm.post1.value = zipcode.substring(0, 3);
		opener.document.frm.post2.value = zipcode.substring(4, 7);
		opener.document.frm.addr1.value = addr;
		opener.document.frm.addr2.focus();
		parent.window.close();
	}

</script>
</head>

<body class="post">
	<form name="frmWrite" method="post" action="popup_addr.asp">
    <div class="page">
        <img src="../img/post_box/post_top.gif" alt="우편번호 확인 - 찾고자하는 주소의 동(읍/면/리)를 입력하세요." />
        <div class="search">
        	<img src="../img/post_box/post_01.gif"  alt="지역명" class="img" />
            <input type="text" maxlength="30" name="dong" id="dong" value="<%=req_dong%>" class="textbar" />
            <span>예)압구정, 태평로2가</span>
            <input type="image" src="../img/post_box/post_02.gif" id="submit" name="submit" class="btn" />
        </div>
        <div class="t">
            <table>
        	<colgroup>
            	<col width="65px" />
                <col width="294px" />
            </colgroup>
            <thead>
            	<tr>
            		<th colspan="2" class="top">- 조회 후 검색결과 중 해당 주소를 클릭하시면 자동입력됩니다. -</th>
            	</tr>
            </thead>
            <tbody>
			<%
			'리스트
			If rsCount = 0 Then
			%>
			<tr>
                <td class="address" colspan="2" align="center">검색결과가 없습니다.</td>
			</tr>
			<%
			Else
			
				Do Until rs.EOF
					prt_zipcode	= Left(rs("zipcode")&"",3) & "-" & Right(rs("zipcode")&"",3)
					prt_sido	= Trim(rs("sido")&"")
					prt_gugun	= Trim(rs("sigungu")&"")
					prt_dong	= Trim(rs("dong")&"")
					prt_ri	= Trim(rs("ri")&"")
					prt_doseo = Trim(rs("doseo")&"")
					prt_building	= Trim(rs("building")&"")
					prt_bunji	= Trim(rs("bunji")&"")

					return_addr = prt_sido & " " & prt_gugun
					prt_addr = prt_sido & " " & prt_gugun & " " & prt_dong
					if Trim(prt_ri&"")<>"" Then prt_addr = prt_addr & " " & prt_ri
					if Trim(prt_doseo&"")<>"" Then prt_addr = prt_addr & " " & prt_doseo
					if Trim(prt_building&"")<>"" Then prt_addr = prt_addr & " " & prt_building
					if Trim(prt_bunji&"")<>"" Then prt_addr = prt_addr & " " & prt_bunji
			%>
                <tr>
                    <td class="postcode"><font size="2"><%=prt_zipcode%></font></td>
                    <td class="address"><a href="#none" onClick="find_post_done('<%=prt_zipcode%>','<%=prt_addr%>')" class="post_list"><font size="2"><%=prt_addr%></font></a></td>
                </tr>
			<%
				rs.MoveNext
				Loop

			End If
			%>
			
            </tbody>
            </table>
        </div>
    </div>
	</form>
</body>
</html>
