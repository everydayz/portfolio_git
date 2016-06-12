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

Dim strListPage : strListPage = "info_list.asp"
Dim strViewPage : strViewPage = "info_view.asp"

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)

'//페이징 변수
Dim page
Dim req_category, req_keyword
Dim nSeq

Dim strWriter, strTitle, strMemo
Dim strF_nm : strF_nm = ""
Dim strReg_ip : strReg_ip = Request.ServerVariables("REMOTE_ADDR")

'-----------------------------------------------------------
'  변수값 전달
'-----------------------------------------------------------
nSeq = getReplaceInput(fncDefault(request.form("seq"),""),"")
strTitle = getReplaceInput(fncDefault(request.form("title"),""),"")
strMemo = getReplaceInput(fncDefault(request.form("memo"),""),"")
nIsUrl = getReplaceInput(fncDefault(request.form("isUrl"),"1"),"")
strSource = getReplaceInput(fncDefault(request.form("source"),""),"")

'strFileNm = getReplaceInput(fncDefault(request.form("fileNm"),""),"")
'strFileNmOrg = getReplaceInput(fncDefault(request.form("fileNmOrg"),""),"")

'//변수 숫자 처리
If Trim(nSeq&"")<>"" Then Call f_NumericCheck(nSeq)
If Trim(nIsUrl&"")<>"" Then Call f_NumericCheck(nIsUrl)

'// Error Check
If Trim(strTitle&"")="" Or Trim(strMemo&"")="" Then
	message = "정보가 정확하지 않습니다."
	rtnString = DisplayJavaAlert(message, "1")
	response.write rtnString

	response.end
End If

If Trim(nIsUrl&"")="" Then nIsUrl = 1
If nIsUrl="2" Then strMemo = request.form("memo")

'-----------------------------------------------------------
'  데이타 등록 처리
'-----------------------------------------------------------
'-- 사용객체
Set objDb	= new cMSSQL

If Trim(nSeq&"")<>"" Then			'//수정모드

	strSQL = "ADM_INFO_Modify"
	objDb.SetAddParam "@nSeq"				,objDb.getVal("Int")				,adParamInput	,4					,nSeq
	objDb.SetAddParam "@strTitle"				,objDb.getVal("NVarChar")	,adParamInput	,200				,strTitle
	objDb.SetAddParam "@strMemo"			,objDb.getVal("NText")			,adParamInput	,2147483647	,strMemo

	'objDb.SetAddParam "@strFileNm"			,objDb.getVal("NVarChar")	,adParamInput	,200				,strFileNm
	'objDb.SetAddParam "@strFileNmOrg"	,objDb.getVal("NVarChar")	,adParamInput	,200				,strFileNmOrg
Else

	strSQL = "ADM_INFO_Write"
	objDb.SetAddParam "@strTitle"				,objDb.getVal("NVarChar")	,adParamInput	,200			,	strTitle
	objDb.SetAddParam "@strMemo"			,objDb.getVal("NText")			,adParamInput	,2147483647	,strMemo

	'objDb.SetAddParam "@strFileNm"			,objDb.getVal("NVarChar")	,adParamInput	,200				,strFileNm
	'objDb.SetAddParam "@strFileNmOrg"	,objDb.getVal("NVarChar")	,adParamInput	,200				,strFileNmOrg
	objDb.SetAddParam "@strReg_ip"			,objDb.getVal("NVarChar")	,adParamInput	,30					,strReg_ip

End If

objDb.cmmNonQuery adCmdStoredProc,strSQL

Set objDb = Nothing

If Err.number<>0 Then
	response.write Err.description
	message = "정보 저장시 문제가 생겼습니다. \n다시 확인해 주세요."
End IF

'-----------------------------------------------------------
'  리스트 페이지로 이동
'-----------------------------------------------------------
If Trim(message&"") = "" Then
	If Trim(nSeq&"") = "" Then
		message = "등록되었습니다."
	Else
		message = "수정되었습니다."
	End If 
End If

Call MoveJavaAlert(message, strListPage & "?page="&page&"&category="&req_category&"&keyword="&req_keyword)
Response.End

%>
