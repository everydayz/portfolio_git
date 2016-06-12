<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp" -->
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)

Dim strDepth01		: strDepth01 = "03"
Dim strDepthTitle	: strDepthTitle = "공지사항"
Dim strMode			: strMode = "I"

Dim strListPage : strListPage = "info_list.asp"
Dim strViewPage : strViewPage = "info_view.asp"

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
strSQL = "Exec ADM_INFO_View '" & nSeq & "' "
Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)

If cmdRs.bof Or cmdRs.eof Then
	objDb.closeRs  cmdRs
	Set objDb = Nothing
	rtnString = DisplayJavaAlert("정보가 정확하지 않습니다.", "1")
	response.write rtnString
	response.End
End If

strTitle		= cmdRs("title")
strMemo			= cmdRs("memo")
nHits			= cmdRs("hit")
strReg_dt		= cmdRs("reg_dt")

If nIsUrl="1" Then
	strMemo = "<a href="""&strMemo&""" target=""_blank"">기사 바로가기</a>"
else
	If Trim(strMemo&"")<>"" Then strMemo = ReplaceHtmlText(2, strMemo)
End IF
If Trim(strReg_dt&"")<>"" Then strReg_dt = f_dateFormat(strReg_dt,"")

objDb.closeRs cmdRs

'//이전글, 다음글
strSQL = "Exec ADM_INFO_PrevNext " & nSeq & " ,'" & req_category & "','" & req_keyword & "'"
Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)

nPreSeq		= 0
strPreTitle	= ""
nPreVnum	= nVnum + 1
If Not (cmdRs.eof Or cmdRs.bof) Then
	nPreSeq		= cmdRs("seq")
	strPreTitle	= cmdRs("title")
	'strPreRegDt	= cmdRs("reg_dt")
	nPreHit		= cmdRs("hit")
End If

Set cmdRs	   = cmdRs.nextrecordset

nNextSeq		= 0
strNextTitle	= ""
nNextVnum		= nVnum - 1

If Not (cmdRs.eof Or cmdRs.bof) Then
	nNextSeq		= cmdRs("seq")
	strNextTitle	= cmdRs("title")
	'strNextRegDt	= cmdRs("reg_dt")
	nNextHit		= cmdRs("hit")
End If

objDb.closeRs cmdRs
Set objDb = Nothing

%>
<!--#include virtual="/admin/inc/inc_top.asp" -->
		  <table width="680" border="0" cellpadding="0" cellspacing="0">
			<form name="frmWrite" method="post" action="info_write.asp" onsubmit="return fncInputNOTICE('<%=strMode%>')">
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
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">제목</td>
                      <td width="527" colspan="3">
							<% if nIsUrl="1" Then %>[<%=strSource%>]<% End If %>
							<%=strTitle%>
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
                    <tr> 
                      <td width="153" height="27" bgcolor="fbfbfb" align="center">내용</td>
                      <td width="527" colspan="3">
						<%=strMemo%>
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
                      <td><a href="#" onclick="fncMovePageInfo('U','<%=nSeq%>')"><img src="./images/03_board/btn_modify.jpg" width="48" height="20" border="0"></a></td>
                      <td width="5">&nbsp;</td>
                      <td><a href="#" onclick="fncMovePageInfo('D','<%=nSeq%>')"><img src="./images/03_board/btn_del.jpg" width="48" height="20" border="0"></a></td>
                      <td width="5">&nbsp;</td>
                      <td><a href="#" onclick="fncMovePageInfo('L','<%=nPage%>')"><img src="./images/03_board/btn_list.jpg" width="48" height="20" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
			  </form>
            </table>
			<br /><br />
			<table width="680" border="0" cellpadding="0" cellspacing="0">
				<tr bgcolor="ebebeb"> 
					<td height="1" colspan="4"></td>
				</tr>
				<tr> 
					<td width="153" height="27" bgcolor="fbfbfb" align="center">이전글</td>
					<td height="10">
						<% If Trim(nPreSeq&"")<>"" And Trim(strPreTitle&"")<>"" Then %>
						<a href="<%=strViewPage%>?seq=<%=nPreSeq%>"><%=strPreTitle%></a>
						<% End If %>
					&nbsp;</td>
				</tr>
				<tr bgcolor="ebebeb"> 
					<td height="1" colspan="2"></td>
				</tr>
				<tr>
					<td width="153" height="27" bgcolor="fbfbfb" align="center">다음글</td>
					<td>
						<% If Trim(nNextSeq&"")<>"" And Trim(strNextTitle&"")<>"" Then %>
						<a href="<%=strViewPage%>?seq=<%=nNextSeq%>"><%=strNextTitle%></a>
						<% End If %>

					&nbsp;</td>
				</tr>
				<tr bgcolor="ebebeb"> 
					<td height="1" colspan="4"></td>
				</tr>
			</table>
<!--#include virtual="/admin/inc/inc_bottom.asp" -->
