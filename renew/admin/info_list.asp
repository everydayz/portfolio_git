<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp" -->
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%

Dim strDepth01		: strDepth01 = "03"
Dim strDepthTitle	: strDepthTitle = "공지사항"
Dim req_seq

Dim strListPage : strListPage = "info_list.asp"
Dim strViewPage : strViewPage = "info_view.asp"
Dim strWritePage : strWritePage = "info_write.asp"

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)

'-- 사용객체
Set objDb	= new cMSSQL

'-- 공용파라메터
Dim nPageSize, nPageBlock, nPage, strSQL, nTotalCnt, vnum

nPageSize = 10
nPageBlock = 10

'-- 파라메터
nPage		= getReplaceInput(fncDefault(Request("page"),"1"),"")
Dim keyword ,category
category	= getReplaceInput(fncDefault(Request("category"),""),"")
keyword		= getReplaceInput(fncDefault(Request("keyword"),""),"")

'--검색
Dim arKeyField : arKeyField = Array("","","")
Select Case category
	Case ""	: arKeyField(0) = " selected=""selected"""
	Case "01"	: arKeyField(1) = " selected=""selected"""
	Case "02"	: arKeyField(2) = " selected=""selected"""
End Select

'리스트 총 갯수
strSQL = "Exec ADM_INFO_Count '"  & category & "','"& keyword & "'"

Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL) 
nTotalCnt = cmdRs("nCnt")

nTotalPage = Int((nTotalCnt-1)/nPageSize)+1

if Cint(nPage) = Cint(nTotalPage) then
	RowPage = ( nTotalCnt - (Int(nPage)-1)*nPageSize )
else
	RowPage = nPageSize
end if

'리스트
strSQL = "Exec ADM_INFO_List " & (nPage*nPageSize) &"," & RowPage & ",'" & category  & "','" & keyword & "'"

Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)
Set List	   = objDb.GetRows(cmdRs)

objDb.CloseRs cmdRs

Set objDb = Nothing
%>
<!--#include virtual="/admin/inc/inc_top.asp" -->
			<table width="680" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="36" background="./images/03_board/search_bar.jpg"><table width="680" border="0" cellspacing="0" cellpadding="0">
					<form name="frmList" method="post" action="<%=strListPage%>" onSubmit="return false">
						<input type="hidden" name="page" id="page" value="<%=page%>" />
						<input type="hidden" name="seq" id="seq" />
					<tr> 
                      <td width="136">&nbsp;</td>
                      <td width="60">&nbsp;</td>
                      <td width="55"><select name="category" id="category">
							<option value="" <%=arKeyField(0)%>>전체</option>
							<option value="01" <%=arKeyField(1)%>>제목</option>
							<option value="02" <%=arKeyField(2)%>>내용</option>
                        </select></td>
                      <td width="241"><input name="keyword" id="keyword" type="text" class="input_normal" size="37" value="<%=keyword%>"></td>
                      <td width="88"><a href="#none" onClick="fncMovePage(document.frmList, 'search', '');"><img src="./images/03_board/search.jpg" width="44" height="18" border="0"></a></td>
                      <td width="100">&nbsp;</td>
                    </tr>
					</form>
                  </table></td>
              </tr>
              <tr> 
                <td height="15">&nbsp;</td>
              </tr>
              <tr>
                <td>
                  <table width="680" border="0" cellpadding="1" cellspacing="1" bgcolor="#E4E4E4">
                    <tr bgcolor="#F0F0F0" class="event_popup"> 
                      <td width="50px" height="27" align="center">번호</td>
                      <td align="center">제목</td>
                      <td width="120px" align="center">등록일</td>
                      <td width="50px" align="center">조회수</td>
                    </tr>		<%
			isNullList = True
			'공지사항 리스트
			If IsObject(List) Then
				If List.count > 0 Then
					isNullList = False
					vnum = nTotalCnt-((nPage-1)*nPageSize)
					For i=0 to List.count-1
						Set row = List.item(i)

						If row("isUrl")=1 Then strNotice="공지사항" Else strNotice="언론보도" End If
						strSource = ""
						if row("isUrl")="2" And Trim(row("source")&"")<>"" Then
							strSource = "["&row("source")&"]" 
						End If
		%>
                    <tr bgcolor="#ffffff">
                        <td height="27" align="center"><%=vnum%></td>
                        <td><%=strSource%><a href="<%=strViewPage%>?page=<%=nPage%><%=strParam%>&amp;seq=<%=row("seq")%>"><%=f_stringCut(row("title"),68)%></a><%=img_new%></td>
                        <td align="center"><%=f_dateFormat(row("reg_dt"),"")%></td>
                        <td align="center"><%=row("hit")%></td>
                    </tr>
		<%
						Set row = Nothing
						vnum = vnum-1
					Next
				End If
			End If
		%>
		<%
			If isNullList=True Then
		%>	
                    <tr> 
                      <td height="100" colspan="5"><div align="center"> 등록된 데이타가 없습니다.</div></td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="5"></td>
                    </tr>
		<%
			End If
		%>
                  </table></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td><table width="680" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="105">
					  <!--
					  <a href="admin01_down.asp"><img src="./images/03_board/btn_down.jpg" width="105" height="20" border="0"></a>
					  -->
					  </td>
                      <td width="470"><table width="470" border="0" align="center" cellpadding="0" cellspacing="0" class="td_small">
					  <tr><td align="center"><% Call pagingUser(nPage, nTotalPage, "document.frmList", "list") %></td></tr>
					  </table></td>
                      <td width="105"><div align="right"><a href="<%=strWritePage%>"><img src="./images/03_board/btn_write.jpg" width="48" height="20" border="0"></a></div></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
<!--#include virtual="/admin/inc/inc_bottom.asp" -->


