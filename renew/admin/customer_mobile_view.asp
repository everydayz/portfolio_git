<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp" -->
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%

Dim strDepth01		: strDepth01 = "05"
Dim strDepthTitle	: strDepthTitle = "모바일 관심고객"
Dim strMode			: strMode = "I"

Dim strListPage : strListPage = "customer_mobile_list.asp"
Dim strViewPage : strViewPage = "customer_mobile_view.asp"
Dim strWritePage : strWritePage = "customer_mobile_write.asp"

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)

Dim nPage
Dim req_category, req_keyword
Dim nSeq

'//전달 변수 체크
nPage = getReplaceInput(fncDefault(Request("page"),"1"),"")
req_category = getReplaceInput(fncDefault(Request("category"),""),"")
req_keyword = getReplaceInput(fncDefault(Request("keyword"),""),"")
nSeq = getReplaceInput(fncDefault(Request("seq"),""),"")

'//변수 숫자 처리
If Trim(nPage&"")<>"" Then Call f_NumericCheck(nPage)
If Trim(nSeq&"")<>"" Then Call f_NumericCheck(nSeq)

'-- 사용객체
Set objDb	= new cMSSQL


'-- 파라메터
strSQL = "Exec ADM_CUSTOMER_MOBILE_View '" & nSeq & "' "
Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)

If cmdRs.bof Or cmdRs.eof Then
	objDb.closeRs  cmdRs
	Set objDb = Nothing
	rtnString = DisplayJavaAlert("정보가 정확하지 않습니다.", "1")
	response.write rtnString
	response.End
End If

strU_nm			= cmdRs("u_nm")
strMobile1		= cmdRs("mobile1")
strMobile2		= cmdRs("mobile2")
strMobile3		= cmdRs("mobile3")
strPost1		= cmdRs("post1")
strPost2		= cmdRs("post2")
strAddr1			= cmdRs("addr1")
strAddr2			= cmdRs("addr2")
strEmail1		= cmdRs("email1")
strEmail2		= cmdRs("email2")
strF_ty			= cmdRs("f_ty")
nBank_ty			= cmdRs("bank_ty")
nHits			= cmdRs("hit")
strReg_ip		= cmdRs("reg_ip")
strReg_dt		= cmdRs("reg_dt")
ci					= cmdRs("ci")
di					= cmdRs("di")
mobile			= cmdRs("mobile")

If nS_div="1" Then strS_div="남자" Else strS_div="여자" End If

If Trim(strReg_dt&"")<>"" Then strReg_dt = f_dateFormat(strReg_dt,"-")

nHits = nHits + 1 

objDb.closeRs cmdRs

'//이전글, 다음글
strSQL = "Exec ADM_CUSTOMER_MOBILE_PrevNext " & nSeq & " ,'" & req_category & "','" & req_keyword & "'"
Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)

nPreSeq		= 0
strPreTitle	= ""
nPreVnum	= nVnum + 1
If Not (cmdRs.eof Or cmdRs.bof) Then
	nPreSeq		= cmdRs("seq")
	strPreTitle	= cmdRs("u_nm")
	'strPreRegDt	= cmdRs("reg_dt")
	nPreHit		= cmdRs("hit")
End If

Set cmdRs	   = cmdRs.nextrecordset

nNextSeq		= 0
strNextTitle	= ""
nNextVnum		= nVnum - 1

If Not (cmdRs.eof Or cmdRs.bof) Then
	nNextSeq		= cmdRs("seq")
	strNextTitle	= cmdRs("u_nm")
	'strNextRegDt	= cmdRs("reg_dt")
	nNextHit		= cmdRs("hit")
End If

objDb.closeRs cmdRs
Set objDb = Nothing

%>
<!--#include virtual="/wixi_admn/inc/inc_top.asp" -->
		  <table width="680" border="0" cellpadding="0" cellspacing="0">
			<form name="frmWrite" method="post" action="<%=strWritePage%>" onsubmit="return fncInputCustomerMobile('<%=strMode%>')">
			<input type="hidden" name="page" id="page" value="<%=nPage%>" />
			<input type="hidden" name="seq" id="seq" value="<%=nSeq%>" />
			<input type="hidden" name="category" id="category" value="<%=req_category%>" />
			<input type="hidden" name="keyword" id="keyword" value="<%=req_keyword%>" />

              <tr> 
                <td height="10"><table width="680" border="0" cellspacing="0" cellpadding="0">
                    <tr bgcolor="dbdbdb"> 
                      <td height="2" colspan="4"></td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
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
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">휴대폰</td>
                      <td colspan="3">
							<%=mobile%>
                      </td>
					 </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					 <tr>
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">주소</td>
                      <td colspan="3">
							[<%=strPost1 & "-" & strPost2%>]&nbsp;<%=strAddr1%>&nbsp;<%=strAddr2%>
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					 <tr>
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">관심평형</td>
                      <td width="187"><%

							If Trim(strF_ty&"")<>"" Then
								f_ty = Split(strF_ty,",")
								For i=0 To Ubound(f_ty)
									If i>0 Then Response.write ", "
									Response.write arF_ty(f_ty(i)-1) 
								Next
							End If
						%></td>
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">청약통장</td>
                      <td width="187"><%=arBank_ty(nBank_ty-1)%></td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					 <tr>
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">이메일</td>
                      <td colspan="3">
							<%=strEmail1%>@<%=strEmail2%>
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">등록일</td>
                      <td width="187">
							<%=strReg_dt%>
                      </td>
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">조회수</td>
                      <td width="187">
							<%=nHits%>
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
                      <td><a href="#" onclick="fncMovePageCustomerMobile('U','<%=nSeq%>')"><img src="./images/03_board/btn_modify.jpg" width="48" height="20" border="0"></a></td>
                      <td width="5">&nbsp;</td>
                      <td><a href="#" onclick="fncMovePageCustomerMobile('D','<%=nSeq%>')"><img src="./images/03_board/btn_del.jpg" width="48" height="20" border="0"></a></td>
                      <td width="5">&nbsp;</td>
                      <td><a href="#" onclick="fncMovePageCustomerMobile('L','<%=nPage%>')"><img src="./images/03_board/btn_list.jpg" width="48" height="20" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
			  </form>
            </table>
			<br /><br />
			<table width="680" border="0" cellpadding="0" cellspacing="0">
				<tr bgcolor="ebebeb"> 
					<td height="1" colspan="2"></td>
				</tr>
				<tr> 
					<td width="153" height="27" bgcolor="fbfbfb" align="center">이전글</td>
					<td width="527" height="10">
						<% If Trim(nPreSeq&"")<>"" And Trim(strPreTitle&"")<>"" Then %>
						<a href="<%=strViewPage%>?seq=<%=nPreSeq%>"><%=strPreTitle%></a>
						<% End If %>
					</td>
				</tr>
				<tr bgcolor="ebebeb"> 
					<td height="1" colspan="2"></td>
				</tr>
				<tr>
					<td width="153" height="27" bgcolor="fbfbfb" align="center">다음글</td>
					<td width="527" >
						<% If Trim(nNextSeq&"")<>"" And Trim(strNextTitle&"")<>"" Then %>
						<a href="<%=strViewPage%>?seq=<%=nNextSeq%>"><%=strNextTitle%></a>
						<% End If %>

					</td>
				</tr>
				<tr bgcolor="ebebeb"> 
					<td height="1" colspan="2"></td>
				</tr>
			</table>
<!--#include virtual="/wixi_admn/inc/inc_bottom.asp" -->
