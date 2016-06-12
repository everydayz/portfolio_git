<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
	Server.ScriptTimeOut = 600
%>
<!--#include virtual="/_lib/cMSSQL.asp"-->
<!--#include virtual="/_lib/common.asp" -->
<%

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)

'-- 공용파라메터
Dim nPageSize, nPageBlock, nPage, strSQL, nTotalCnt, vnum

nPageSize = 30
nPageBlock = 10

'-- 파라메터
nPage		= getReplaceInput(fncDefault(Request("page"),"1"),"")
Dim keyword ,category

category	= getReplaceInput(fncDefault(Request("category"),""),"")
keyword		= getReplaceInput(fncDefault(Request("keyword"),""),"")

'//페이징 변수
Dim f_nm : f_nm = "customer_" & Year(now()) & Month(now()) & Day(now()) & Hour(now()) & Minute(now()) & Second(now())

'-- 사용객체
Set objDb	= new cMSSQL

'총 갯수
strSQL = "Exec ADM_CUSTOMER_COUNT '"  & category & "','"& keyword  & "'"

Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL) 
nTotalCnt = cmdRs("nCnt")

nTotalPage = Int((nTotalCnt-1)/nPageSize)+1

if Cint(nPage) = Cint(nTotalPage) then
	RowPage = ( nTotalCnt - (Int(nPage)-1)*nPageSize )
else
	RowPage = nPageSize
end if

'//목록정보
'strSQL = "Exec ADM_CUSTOMER_Xls " & TotalRecCount &"," & TotalRecCount & ",'" & category  & "','" & keyword  & "'"
strSQL = "Exec ADM_CUSTOMER_Xls " & (nPage*nPageSize) &"," & RowPage & ",'" & category  & "','" & keyword  & "'"

Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)
Set List	   = objDb.GetRows(cmdRs)

'//객체 연결 끊기
objDb.CloseRs cmdRs

If IsObject(List) Then
	If List.count > 0 Then
		vnum = TotalRecCount-((page-1)*pagesize) - loop_num + 1
		For i=0 to List.count-1
			Set row = List.item(i)
			strU_nm			= row("u_nm")
			strMobile			= row("mobile")
			strMobile1		= row("mobile1")
			strMobile2		= row("mobile2")
			strMobile3		= row("mobile3")
			strPost1		= row("post1")
			strPost2		= row("post2")
			strAddr1			= row("addr1")
			strAddr2			= row("addr2")
			strEmail1			= row("email1")
			strEmail2			= row("email2")
			nHits			= row("hit")
			strReg_ip		= row("reg_ip")
			strReg_dt		= row("reg_dt")
			f_ty		= row("f_ty")
			nBank_ty		= row("bank_ty")
			ci		= row("ci")
			di		= row("di")

			'strMobile = strMobile1 & "-" & strMobile2 & "-" & strMobile3
			strAddr = "[" & strPost1 & "-" & strPost2 & "]" & strAddr1 & " " & strAddr2
			strEmail = strEmail1 & "@" & strEmail2

			strF_ty = ""
			If Trim(f_ty&"")<>"" Then
				arrf_ty = Split(f_ty,",")
				For j=0 To Ubound(arrf_ty)
					If j>0 Then strF_ty = strF_ty & ", "
					strF_ty = strF_ty & arF_ty(arrf_ty(j)-1) 
				Next
			End If

			strXls = strXls & "	<tr>" & vbcrlf
			strXls = strXls & "		<td style=""mso-number-format:'\@'"">" & strU_nm & "</td>" & vbcrlf
			strXls = strXls & "		<td style=""mso-number-format:'\@'"">" & strMobile& "</td>" & vbcrlf
			strXls = strXls & "		<td style=""mso-number-format:'\@'"">" & strAddr & "</td>" & vbcrlf
			strXls = strXls & "		<td style=""mso-number-format:'\@'"">" & strEmail & "</td>" & vbcrlf
			strXls = strXls & "		<td style=""mso-number-format:'\@'"">" & strF_ty & "</td>" & vbcrlf
			strXls = strXls & "		<td style=""mso-number-format:'\@'"">" & arBank_ty(nBank_ty-1) & "</td>" & vbcrlf
			strXls = strXls & "		<td>" & strReg_dt & "</td>" & vbcrlf
			strXls = strXls & "		<td>" & strReg_ip & "</td>" & vbcrlf
			strXls = strXls & "	</tr>" & vbcrlf

			Set row = Nothing
		Next
	End If
End If


Response.Buffer = True
Response.ContentType = "appllication/vnd.ms-excel" '// 엑셀로 지정
Response.CacheControl = "public"
Response.AddHeader "Content-Disposition","attachment; filename=" & f_nm & ".xls"
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<table border="1" cellspacing="0" cellpadding="0">
	<tr>
		<th width="80">이름</th>
		<th width="100">휴대폰</th>
		<th width="300">주소</th>
		<th width="200">이메일</th>
		<th width="200">관심평형</th>
		<th width="200">청약통장</th>
		<th width="100">등록일</th>
		<th width="100">접속IP</th>
	</tr>
	<%=strXls%>
</table>
