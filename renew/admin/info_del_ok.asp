<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp" -->
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%
On Error Resume Next

Dim strDepth01		: strDepth01 = "03"
Dim strDepthTitle	: strDepthTitle = "공지사항"
Dim req_seq

Dim strListPage : strListPage = "info_list.asp"
Dim strViewPage : strViewPage = "info_view.asp"
Dim strWritePage : strWritePage = "info_write.asp"

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)

Dim use_path

Dim nSeq

'//페이징 변수
Dim page
Dim req_category, req_keyword

Dim mode, id

'-----------------------------------------------------------
'  변수값 전달
'-----------------------------------------------------------
nSeq = getReplaceInput(fncDefault(request.Form("seq"),""),"")
page = getReplaceInput(fncDefault(request.Form("page"),""),"")
req_category = getReplaceInput(fncDefault(Request.Form("category"),""),"")
req_keyword = getReplaceInput(fncDefault(Request.Form("keyword"),""),"")

'// Error Check
If Trim(nSeq&"") = "" Then
	Call SubObjClose(DbCon)

	message = "정보가 정확하지 않습니다."
	rtnString = DisplayJavaAlert(message, "1")
	response.write rtnString

	response.end
End If

'//숫자 변수 처리
If Trim(page&"")<>"" Then page = Int(page)
If Trim(nSeq&"")<>"" Then nSeq = Int(nSeq)

'-- 사용객체
Set objDb	= new cMSSQL


'//삭제
strSQL = "ADM_INFO_Delete"
objDb.SetAddParam "@nSeq"				,objDb.getVal("Int")	,adParamInput	,4			,nSeq
objDb.cmmNonQuery adCmdStoredProc,strSQL

Set objDb = Nothing


If Err.number<>0 Then
	message = "정보 삭제시 문제가 생겼습니다. \n다시 확인해 주세요."
	'response.write Err.description
End If

'-----------------------------------------------------------
'  리스트 페이지로 이동
'-----------------------------------------------------------
If Trim(message&"") = "" Then
	message = "삭제가 완료되었습니다."
End If


Call MoveJavaAlert(message, strListPage & "?page="&page&"&category="&req_category&"&keyword="&req_keyword)
Response.End


%>
