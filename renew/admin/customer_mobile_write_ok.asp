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

Dim strDepth01		: strDepth01 = "05"
Dim strDepthTitle	: strDepthTitle = "모바일 관심고객"
Dim req_seq

Dim strListPage : strListPage = "customer_mobile_list.asp"
Dim strViewPage : strViewPage = "customer_mobile_view.asp"
Dim strWritePage : strWritePage = "customer_mobile_write.asp"

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)

'//페이징 변수
Dim page
Dim req_category, req_keyword
Dim seq

Dim strWriter, strTitle
Dim strMemo : strMemo = ""
Dim strReg_ip : strReg_ip = Request.ServerVariables("REMOTE_ADDR")

Dim tbl_name : tbl_name = "CUSTOMER_MOBILE"									'//테이블 변수

'-----------------------------------------------------------
'  변수값 전달
'-----------------------------------------------------------
seq				= getReplaceInput(fncDefault(request.Form("seq"),""),"")
u_nm				= getReplaceInput(fncDefault(Request.Form("u_nm"),""),"")
mobile			= getReplaceInput(fncDefault(Request.Form("mobile"),""),"")
mobile1			= getReplaceInput(fncDefault(Request.Form("mobile1"),""),"")
mobile2			= getReplaceInput(fncDefault(Request.Form("mobile2"),""),"")
mobile3			= getReplaceInput(fncDefault(Request.Form("mobile3"),""),"")
post1				= getReplaceInput(fncDefault(Request.Form("post1"),""),"")
post2				= getReplaceInput(fncDefault(Request.Form("post2"),""),"")
addr1				= getReplaceInput(fncDefault(Request.Form("addr1"),""),"")
addr2				= getReplaceInput(fncDefault(Request.Form("addr2"),""),"")
email1			= getReplaceInput(fncDefault(Request.Form("email1"),""),"")
email2			= getReplaceInput(fncDefault(Request.Form("email2"),""),"")
f_ty				= getReplaceInput(fncDefault(Request.Form("f_ty"),""),"")
bank_ty			= getReplaceInput(fncDefault(Request.Form("bank_ty"),"0"),"")
strReg_ip			= Request.ServerVariables("REMOTE_ADDR")

'//변수 숫자 처리
If Trim(seq&"")<>"" Then Call f_NumericCheck(seq)
If Trim(mobile1&"")<>"" Then Call f_NumericCheck(mobile1)
If Trim(mobile2&"")<>"" Then Call f_NumericCheck(mobile2)
If Trim(mobile3&"")<>"" Then Call f_NumericCheck(mobile3)
If Trim(post1&"")<>"" Then Call f_NumericCheck(post1)
If Trim(post2&"")<>"" Then Call f_NumericCheck(post2)
'If Trim(f_ty&"")<>"" Then Call f_NumericCheck(f_ty)
If Trim(bank_ty&"")<>"" Then Call f_NumericCheck(bank_ty)

'// Error Check
If Trim(mobile&"")="" _
	Or Trim(post1&"")="" Or Trim(post2&"")="" Or Trim(addr1&"")="" Or Trim(addr2&"")="" _
	Or Trim(email1&"")="" Or Trim(email2&"")="" Then

	message = "정보가 정확하지 않습니다."
	rtnString = DisplayJavaAlert(message, "1")
	response.write rtnString

	response.End
End If

'-----------------------------------------------------------
'  데이타 등록 처리
'-----------------------------------------------------------
'-- 사용객체
Set objDb	= new cMSSQL

If Trim(seq&"")<>"" Then			'//수정모드
	strSQL = "ADM_CUSTOMER_MOBILE_Modify"
	objDb.SetAddParam "@seq"				,objDb.getVal("Int")	,adParamInput	,4					,seq
	objDb.SetAddParam "@mobile1"			,objDb.getVal("VarChar")	,adParamInput	,4					,mobile1
	objDb.SetAddParam "@mobile2"			,objDb.getVal("VarChar")	,adParamInput	,4					,mobile2
	objDb.SetAddParam "@mobile3"			,objDb.getVal("VarChar")	,adParamInput	,4					,mobile3
	objDb.SetAddParam "@post1"			,objDb.getVal("VarChar")	,adParamInput	,3					,post1
	objDb.SetAddParam "@post2"			,objDb.getVal("VarChar")	,adParamInput	,3					,post2
	objDb.SetAddParam "@addr1"			,objDb.getVal("VarChar")	,adParamInput	,200				,addr1
	objDb.SetAddParam "@addr2"			,objDb.getVal("VarChar")	,adParamInput	,200				,addr2
	objDb.SetAddParam "@email1"			,objDb.getVal("VarChar")	,adParamInput	,100				,email1
	objDb.SetAddParam "@email2"			,objDb.getVal("VarChar")	,adParamInput	,100				,email2
	objDb.SetAddParam "@f_ty"				,objDb.getVal("VarChar")	,adParamInput	,100					,f_ty
	objDb.SetAddParam "@bank_ty"			,objDb.getVal("Tinyint")	,adParamInput	,4					,bank_ty
	objDb.SetAddParam "@mobile"			,objDb.getVal("VarChar")	,adParamInput	,20					,mobile
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
	If Trim(seq&"") = "" Then
		message = "등록되었습니다."
	Else
		message = "수정되었습니다."
	End If 
End If

Call MoveJavaAlert(message, strListPage & "?page="&page&"&category="&req_category&"&keyword="&req_keyword)
Response.End

%>
