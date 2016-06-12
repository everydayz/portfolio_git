<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp" -->
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%

Dim strDepth01		: strDepth01 = "04"
Dim strDepthTitle	: strDepthTitle = "접속통계"
Dim req_seq

Dim strListPage : strListPage = "stat_list.asp"

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

startdate	= getReplaceInput(fncDefault(Request("startdate"),CStr(date)),"")
enddate		= getReplaceInput(fncDefault(Request("enddate"),CStr(date)),"")
flag		= getReplaceInput(fncDefault(Request("flag"),"1"),"")

'리스트 총 갯수
strSQL = "Exec SP_STAT_Count '"& Replace(startdate, "-", "")&"000000','"&Replace(enddate, "-", "")&"235959' "

Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL) 
nTotalCnt = cmdRs("nCnt")

nTotalPage = Int((nTotalCnt-1)/nPageSize)+1

if Cint(nPage) = Cint(nTotalPage) then
	RowPage = ( nTotalCnt - (Int(nPage)-1)*nPageSize )
else
	RowPage = nPageSize
end if

'리스트
strSQL = "Exec SP_STAT_List " & (nPage*nPageSize) &"," & RowPage & ",'"& Replace(startdate, "-", "")&"000000','"&Replace(enddate, "-", "")&"235959', "& flag &" "
'Response.write strSQL
Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)
Set List	   = objDb.GetRows(cmdRs)

objDb.CloseRs cmdRs

Set objDb = Nothing
%>
<!--#include virtual="/admin/inc/inc_top.asp" -->
			<table width="680" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="36"><table width="680" border="0" cellspacing="0" cellpadding="0">
					<form name="frmList" method="post" action="<%=strListPage%>" onSubmit="return false">
						<input type="hidden" name="page" id="page" value="<%=page%>" />
						<input type="hidden" name="seq" id="seq" />
						<input type="hidden" name="flag" id="flag"/>
					<tr> 
                      <td><input type="text" id="startdate" name="startdate" value="<%=startdate%>" class="date_input" style="width: 80px;" readonly="readonly"/>
					  ~ <input type="text" id="enddate" name="enddate" value="<%=enddate%>" class="date_input" style="width: 80px;" readonly="readonly"/></td>
                      <td width="88"><a href="#none" onClick="javascript:document.frmList.submit();"><img src="./images/03_board/search.jpg" width="44" height="18" border="0"></a></td>
                      <td width="100">&nbsp;</td>
                    </tr>
					<tr>
						<td colspan="3">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="button" value="방문자" onclick="javascript:fn_stat('1');" style="cursor:pointer;"/>&nbsp;
							<input type="button" value="디바이스" onclick="javascript:fn_stat('2');" style="cursor:pointer;"/>&nbsp;
							<input type="button" value="시간별" onclick="javascript:fn_stat('3');" style="cursor:pointer;"/>&nbsp;
							<input type="button" value="요일별" onclick="javascript:fn_stat('4');" style="cursor:pointer;"/>&nbsp;
							<input type="button" value="일별" onclick="javascript:fn_stat('5');" style="cursor:pointer;"/>&nbsp;
							<input type="button" value="월별" onclick="javascript:fn_stat('6');" style="cursor:pointer;"/>&nbsp;
							<input type="button" value="년별" onclick="javascript:fn_stat('7');" style="cursor:pointer;"/>&nbsp;
						</td>
					</tr>
					</form>
                  </table></td>
              </tr>
              <tr> 
                <td height="15">&nbsp;</td>
              </tr>
              <tr>
                <td>
          
<%
	If flag = 1 Then 
%>
				  <table width="680" border="0" cellpadding="1" cellspacing="1" bgcolor="#E4E4E4">
                    <tr bgcolor="#F0F0F0" class="event_popup"> 
                      <td width="50px" height="27" align="center">번호</td>
                      <td align="center">방문일자</td>
                      <td width="200px" align="center">접속IP</td>
                      <td width="200px" align="center">접속기기</td>
                    </tr>		<%
			isNullList = True
			'공지사항 리스트
			If IsObject(List) Then
				If List.count > 0 Then
					isNullList = False
					vnum = nTotalCnt-((nPage-1)*nPageSize)
					For i=0 to List.count-1
						Set row = List.item(i)
		%>
                    <tr bgcolor="#ffffff">
                        <td height="27" align="center"><%=vnum%></td>
                        <td align="center"><% Response.Write Mid(row("REGDATE"),1,4) & "-" & Mid(row("REGDATE"),5,2) & "-" & Mid(row("REGDATE"),7,2) & " " & Mid(row("REGDATE"),9,2) & ":" & Mid(row("REGDATE"),11,2) & ":" & Mid(row("REGDATE"),13,2) %></td>
                        <td align="center"><%=row("REMOTE_IP")%></td>
                        <td align="center"><%=row("DEVICE")%></td>
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
                      <td height="100" colspan="5"><div align="center"> 방문자가 없습니다.</div></td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="5"></td>
                    </tr>
		<%
			End If
		%>
                  </table>
				  

				  </td>
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
                      <td width="105"><div align="right">&nbsp;</div></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
<%
	Else
%>
			<table width="680" border="0" cellpadding="1" cellspacing="1" bgcolor="#E4E4E4">
                    <tr bgcolor="#F0F0F0" class="event_popup"> 
                      <td height="27" align="center">방문일시</td>
                      <td width="100px" align="center">신규방문자</td>
                      <td width="100px" align="center">기존방문자</td>
					  <td width="100px" align="center">전체방문자</td>
					  <%
							If flag = 2 Then 
								Response.write "<td width='100px' align='center'>접속기기</td>"
							End If 
					  %>
					  <td align="center">비율</td>
                    </tr>		<%
			isNullList = True
			'공지사항 리스트
			If IsObject(List) Then
				If List.count > 0 Then
					isNullList = False
					For i=0 to List.count-1
						Set row = List.item(i)
		%>
                    <tr bgcolor="#ffffff">
                        <% If flag = 2 Or flag = 5 Then %>
						<td height="27" align="center"><% Response.Write Mid(row("REGDATE"),1,4) & "-" & Mid(row("REGDATE"),5,2) & "-" & Mid(row("REGDATE"),7,2) %></td>
						<% ElseIf flag = 6 Then %>
						<td height="27" align="center"><% Response.Write Mid(row("REGDATE"),1,4) & "-" & Mid(row("REGDATE"),5,2)%></td>
						<% ElseIf flag = 7 Then %>
						<td height="27" align="center"><% Response.Write Mid(row("REGDATE"),1,4)%></td>
						<% ElseIf flag = 4 Then %>
						<%
							If row("REGDATE") = "1" Then 
								weekSTR = "일요일"
							ElseIf row("REGDATE") = "2" Then 
								weekSTR = "월요일" 
							ElseIf row("REGDATE") = "3" Then 
								weekSTR = "화요일" 
							ElseIf row("REGDATE") = "4" Then 
								weekSTR = "수요일" 
							ElseIf row("REGDATE") = "5" Then 
								weekSTR = "목요일" 
							ElseIf row("REGDATE") = "6" Then 
								weekSTR = "금요일" 
							ElseIf row("REGDATE") = "7" Then 
								weekSTR = "토요일" 
							End If 
						%>
						<td height="27" align="center"><% Response.Write weekSTR%></td>
						<% Else %>
						<td height="27" align="center"><% Response.Write row("REGDATE")%></td>
						<% End If %>
                        <td align="center"><%=row("NEW_VISIT")%></td>
                        <td align="center"><%=row("RE_VISIT")%></td>
						<td align="center"><%=row("TOTAL_VISIT")%></td>
					  <%
							If flag = 2 Then 
								Response.write "<td align='center'>"& row("DEVICE") &"</td>"
							End If 
					  %>
						<td align="center"><%=FormatNumber(row("TOTAL_VISIT") / nTotalCnt * 100, 0)%> %</td>
                    </tr>
		<%
						Set row = Nothing
					Next
				End If
			End If
		%>
		<%
			If isNullList=True Then
		%>	
                    <tr> 
                      <td height="100" colspan="6"><div align="center"> 방문자가 없습니다.</div></td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="6"></td>
                    </tr>
		<%
			End If
		%>
			</table>
				  

				  </td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
             
                  </table></td>
              </tr>
            </table>
<%
	End If 
%>

<script type="text/javascript">
$(document).ready(function() {
		
	$("#startdate").datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd', showOn: "both"});
	$("#enddate").datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd', showOn: "both"});

});

function fn_stat(flag) {
	$("#flag").val(flag);
	document.frmList.submit();	
}
</script>
<!--#include virtual="/admin/inc/inc_bottom.asp" -->


