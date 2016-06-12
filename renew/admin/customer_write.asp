<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp"-->
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%

Dim strDepth01		: strDepth01 = "01"
Dim strDepthTitle	: strDepthTitle = "관심고객"
Dim strMode			: strMode = "I"

Dim strListPage : strListPage = "customer_list.asp"
Dim strViewPage : strViewPage = "customer_view.asp"
Dim strWritePage : strWritePage = "customer_write.asp"

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)


Dim nSeq
Dim keyword ,category

Dim arS_div : arS_div = Array("","")
Dim arVote : arVote = Array("","","","","","")

'-- 파라메터
nPage		= getReplaceInput(fncDefault(Request("page"),"1"),"")
category	= getReplaceInput(fncDefault(Request("category"),""),"")
keyword		= getReplaceInput(fncDefault(Request("keyword"),""),"")

nVnum		= getReplaceInput(fncDefault(Request("vnum"),""),"")
nSeq		= getReplaceInput(fncDefault(Request("seq"),""),"")

'//변수 숫자 처리
If Trim(nPage&"")<>"" Then Call f_NumericCheck(nPage)
If Trim(nSeq&"")<>"" Then Call f_NumericCheck(nSeq)

'-- 사용객체
Set objDb	= new cMSSQL

'// Error Check
If Trim(nSeq&"")<>"" Then

	strSQL = "Exec ADM_CUSTOMER_View '" & nSeq & "' "
	Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)

	If cmdRs.bof Or cmdRs.eof Then
		objDb.closeRs  cmdRs
		Set objDb = Nothing
		rtnString = DisplayJavaAlert("정보가 정확하지 않습니다.", "1")
		response.write rtnString
		response.End
	End If

	strU_nm			= cmdRs("username")

	strPost1		= cmdRs("post1")
	strPost2		= cmdRs("post2")
	strAddr1			= cmdRs("addr1")
	strAddr2			= cmdRs("addr2")
	strEmail1		= cmdRs("email1")
	strEmail2		= cmdRs("email2")

	strReg_dt		= cmdRs("regdate")
	strF_ty			= cmdRs("f_type")

	mobile			= cmdRs("mobile")


	If nS_div="1" Then 
		arS_div(0) = " checked=""checked"""
	Else
		arS_div(1) = " checked=""checked"""
	End If

	strMode = "U"

	objDb.closeRs cmdRs

End If

' // 객체 연결 끊기
Set objDb	= Nothing

%>
<!--#include virtual="/admin/inc/inc_top.asp" -->
<script type="text/javascript">
$(document).ready(function(){
	$("#domain").val("<%=strEmail2%>");
	$("#domain").change(function(){
		$("#email2").val($(this).val());
	});

		$("#imgFindPost").click(function() {
			find_post_url = "../include/popup_addr.asp";
			window.open(find_post_url,'displayWindow','toolbar=no,scrollbars=yes,width=470,height=500');
		});
});
</script>
		  <table width="680" border="0" cellpadding="0" cellspacing="0">
			<form name="frm" method="post" action="customer_write_ok.asp" onsubmit="return fncInputCustomer('<%=strMode%>')">
			<input type="hidden" name="page" id="page" value="<%=nPage%>" />
			<input type="hidden" name="seq" id="seq" value="<%=nSeq%>" />
			<input type="hidden" name="category" id="category" value="<%=req_category%>" />
			<input type="hidden" name="keyword" id="keyword" value="<%=req_keyword%>" />

              <tr> 
                <td height="10"><table width="680" border="0" cellspacing="0" cellpadding="0">
                    <tr bgcolor="dbdbdb"> 
                      <td height="2" colspan="4"></td>
                    </tr>
					<tr> 
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">이름</td>
                      <td colspan="3">
							<%=strU_nm%>
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					<tr>
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">연락처</td>
                      <td width="527" colspan="3">
						<input type="text" name="mobile" id="mobile" value="<%=mobile%>" size="20" maxlength="20" class="input_t" />
						<!--
							<input type="text" name="mobile1" id="mobile1" value="<%=strMobile1%>" size="10" maxlength="4" class="input_t" />
							-<input type="text" name="mobile2" id="mobile2" value="<%=strMobile2%>" size="10" maxlength="4" class="input_t" />
							-<input type="text" name="mobile3" id="mobile3" value="<%=strMobile3%>" size="10" maxlength="4" class="input_t" />
						-->
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					<tr> 
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">주소</td>
                      <td colspan="3">
							<input type="text" name="post1" id="post1" value="<%=strPost1%>" size="5" maxlength="3" class="input_t" />
							- <input type="text" name="post2" id="post2" value="<%=strPost2%>" size="5" maxlength="3" class="input_t" />
							<br />
							<input type="text" class="input_t" name="addr1" id="addr1" size="60" maxlength="200" value="<%=strAddr1%>" />
							<br />
							<input type="text" class="input_t" name="addr2" id="addr2" size="60" maxlength="200" value="<%=strAddr2%>" />
							<img src="./images/02_customer/add_sear.jpg" width="60" height="16" border="0" id="imgFindPost" style="cursor:pointer">
							
                     </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					<tr>
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">이메일</td>
                      <td width="527" colspan="3">
							<input type="text" name="email1" id="email1" value="<%=strEmail1%>" size="20" maxlength="100" class="input_t" />
							@ <input type="text" name="email2" id="email2" value="<%=strEmail2%>" size="20" maxlength="100" class="input_t" />
							<!--
                                    <select name="domain" id="domain" class="domain">
                                        <option value="">직접입력</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="hanmail.net">hanmail.net</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="empal.com">empal.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="paran.com">paran.com</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                                        <option value="dreamwiz.com">dreamwiz.com</option>
                                        <option value="freechal.com">freechal.com</option>
                                        <option value="korea.com">korea.com</option>
                                        <option value="lycos.co.kr">lycos.co.kr</option>
                                        <option value="shinbiro.com">shinbiro.com</option>
                                        <option value="simmani.com">simmani.com</option>
                                        <option value="chollian.net">chollian.net</option>
                                    </select>
							-->
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					<tr>
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">관심평형</td>
                      <td width="527" colspan="3">
							<% Call f_array2Checkox(arF_ty, "f_ty", strF_ty, ",") %>
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					
                  </table></td>
              </tr>
              <tr> 
                <td height="15">&nbsp;</td>
              </tr>
              <tr> 
                <td><table width="101" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td><input type="image" src="./images/03_board/btn_ok.jpg" width="48" height="20" border="0"></td>
                      <td width="5">&nbsp;</td>
                      <td><a href="#" onclick="fncMovePageCustomer('L','<%=nPage%>')"><img src="./images/03_board/btn_cancle.jpg" width="48" height="20" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
			  </form>
            </table>
<!--#include virtual="/admin/inc/inc_bottom.asp" -->
