<!--

var adm_path = "/wixi_admn/";

function enterCheck(frm){
	if(event.keyCode == 13)
		CheckLogin(frm);
}

//로그인
function CheckLogin(frm) {
	if (fncTrimCheck(frm.id.value)==-1){
		alert("아이디를 입력하세요");
		frm.id.focus();
		return false;
	}
	if (fncTrimCheck(frm.pwd.value)==-1) {
		alert("비밀번호를 입력하세요");
		frm.pwd.focus();
		return false;
	}

	frm.action = adm_path+"logon.asp";
	frm.submit();
}

//관심고객 등록 체크
function fncInputCustomer(mode){
	var frm = document.frmWrite;

	if (fncTrimCheck($("#u_nm").val())==-1){
		alert("성명을 입력해 주세요.");
		$("#u_nm").focus();
		return false;
	}

	if (fncTrimCheck($("#age").val())==-1){
		alert("나이를 입력해 주세요.");
		$("#age").focus();
		return false;
	}else{
		if(onlyNumber("age")==1){
			alert("숫자만 입력가능합니다. \n다시 확인해주세요.");
			$("#age").focus();
			return false;
		}
	}

	if (fncTrimCheck($("#mobile1").val())==-1){
		alert("휴대폰을 입력해주세요.");
		$("#mobile1").focus();
		return false;
	}else{
		if(onlyNumber("mobile1")==1){
			alert("숫자만 입력가능합니다. \n다시 확인해주세요.");
			$("#mobile1").focus();
			return false;
		}
	}
	if (fncTrimCheck($("#mobile2").val())==-1){
		alert("휴대폰을 입력해주세요.");
		$("#mobile2").focus();
		return false;
	}else{
		if(onlyNumber("mobile2")==1){
			alert("숫자만 입력가능합니다. \n다시 확인해주세요.");
			$("#mobile2").focus();
			return false;
		}
	}
	if (fncTrimCheck($("#mobile3").val())==-1){
		alert("휴대폰을 입력해주세요.");
		$("#mobile3").focus();
		return false;
	}else{
		if(onlyNumber("mobile3")==1){
			alert("숫자만 입력가능합니다. \n다시 확인해주세요.");
			$("#mobile3").focus();
			return false;
		}
	}

	if (fncTrimCheck($("#addr1").val())==-1){
		alert("시도를 입력해 주세요.");
		$("#addr1").focus();
		return false;
	}
	if (fncTrimCheck($("#addr2").val())==-1){
		alert("군구를 입력해 주세요.");
		$("#addr2").focus();
		return false;
	}
	if (fncTrimCheck($("#addr3").val())==-1){
		alert("동을 입력해 주세요.");
		$("#addr3").focus();
		return false;
	}

	if(mode=="U"){
		if(confirm("수정하시겠습니까?")){
		}else{
			return false;
		}
	}

	return true;
}

//관심고객 페이지 이동
function fncMovePageCustomer(mode, no){
	var frm = document.frmWrite;
	if( mode=="I" ){
		if( no == "" ){ no = '1';}

		frm.page.value=no;
		frm.action="customer_write.asp";

	}else if( mode=="U" ){
		frm.seq.value=no;
		frm.action="customer_write.asp";

	}else if( mode == "L" ){

		if( no == "" ){ no = '1';}
		
		frm.action="customer_list.asp";
		frm.page.value = no;

	}else if( mode=="V" ){
		frm.id.value=no;
		frm.action="customer_view.asp";

	}else if( mode=="S" ){
		if( frm.keyword.value == "" ){
			alert("검색어를 입력해주세요.");
			frm.keyword.focus();
			return false;

		}else{
			no = '1';
			
			frm.page.value = no;
		}

	}else if( mode=="D" ){
		if (confirm("삭제하시겠습니까?")){
			frm.seq.value=no;
			frm.action="customer_del_ok.asp";
		}else{
			return false;
		}

	}else{
		alert("정확한 경로가 아닙니다.");
		return false;
	}

	frm.submit();
}

function xlsDown(){
	document.fXls.submit();
}

function fncMovePage(frm, mode, no){

	if( mode=="write" ){
		if( no == "" ){ no = '1';}
		frm.page.value=no;

	}else if( mode=="edit" ){
		frm.id.value=no;
	}else if( mode == "list" ){
		if( no == "" ){ no = '1';}
		frm.page.value = no;
	}else if( mode=="view" ){
		frm.id.value=no;

	}else if( mode=="search" ){
		if( frm.keyword.value == "" ){
			alert("검색어를 입력해주세요.");
			frm.keyword.focus();
			return false;
		}else{
			no = '1';
			frm.page.value = no;
		}
	}else if( mode=="delete" ){
		if (confirm("해당 정보를 삭제하시겠습니까?")){
			frm.id.value=no;
		}else{
			return false;
		}

	}else{
		alert("정확한 경로가 아닙니다.");
		return false;
	}

	frm.submit();
}



//공지사항 등록 체크
function fncInputNotice(mode){
	var frm = document.frmWrite;

	var chkIsUrl= "Y";
	//var thMemoNm = "내용";
	var thMemoNm = "기사 URL";
	/*
	if( $("#isUrl").prop("checked")==true ){
		chkIsUrl = "Y";
		thMemoNm = "기사 URL";
	}
	*/
	if (fncTrimCheck($("#title").val())==-1){
		alert("제목을 입력하세요.");
		$("#title").focus();
		return false;
	}
	if( chkIsUrl=="Y" ){
		if (fncTrimCheck($("#source").val())==-1){
			alert("출처를 입력하세요.");
			$("#source").focus();
			return false;
		}
	}

	if (fncTrimCheck($("#memo").val())==-1){
		alert(thMemoNm+"을 입력하세요.");
		$("#memo").focus();
		return false;
	}

	if(mode=="U"){
		if(confirm("수정하시겠습니까?")){
		}else{
			return false;
		}
	}

	return true;
}

//공지사항 페이지 이동
function fncMovePageNotice(mode, no){
	var frm = document.frmWrite;
	if( mode=="I" ){
		if( no == "" ){ no = '1';}

		frm.page.value=no;
		frm.action="notice_write.asp";

	}else if( mode=="U" ){
		frm.seq.value=no;
		frm.action="notice_write.asp";

	}else if( mode == "L" ){

		if( no == "" ){ no = '1';}
		
		frm.action="notice_list.asp";
		frm.page.value = no;

	}else if( mode=="V" ){
		frm.id.value=no;
		frm.action="notice_view.asp";

	}else if( mode=="S" ){
		if( frm.keyword.value == "" ){
			alert("검색어를 입력해주세요.");
			frm.keyword.focus();
			return false;

		}else{
			no = '1';
			
			frm.page.value = no;
			//frm.action = "admin02.asp";
		}

	}else if( mode=="D" ){
		if (confirm("삭제하시겠습니까?")){
			frm.seq.value=no;
			frm.action="notice_del_ok.asp";
		}else{
			return false;
		}

	}else{
		alert("정확한 경로가 아닙니다.");
		return false;
	}

	frm.submit();
}




//블로그 등록 체크
function fncInputBlog(mode){
	var frm = document.frmWrite;

	var chkIsUrl= "Y";
	if (fncTrimCheck($("#title").val())==-1){
		alert("제목을 입력하세요.");
		$("#title").focus();
		return false;
	}

	if (fncTrimCheck($("#memo").val())==-1){
		alert("블로그URL을 입력하세요.");
		$("#memo").focus();
		return false;
	}

	if(mode!="U" || (mode=="U" && $("#delFileNm").is(":checked")==true) ){
		if( jQuery.trim( $("#fileNm").val() )=="" ){
			alert("이미지 첨부파일을 입력해 주세요.");
			return false;
		}else{
			if( chkUploadFile("fileNm")==false ){
				alert("첨부파일은 이미지만 가능합니다.");
				$("#fileNm").val("");
				return false;
			}
		}
	}

	if(mode=="U"){
		if(confirm("수정하시겠습니까?")){
		}else{
			return false;
		}
	}

	return true;
}

//블로그 페이지 이동
function fncMovePageBlog(mode, no){
	var frm = document.frmWrite;
	if( mode=="I" ){
		if( no == "" ){ no = '1';}

		frm.page.value=no;
		frm.action="blog_write.asp";

	}else if( mode=="U" ){
		frm.seq.value=no;
		frm.action="blog_write.asp";

	}else if( mode == "L" ){

		if( no == "" ){ no = '1';}
		
		frm.action="blog_list.asp";
		frm.page.value = no;

	}else if( mode=="V" ){
		frm.id.value=no;
		frm.action="blog_view.asp";

	}else if( mode=="S" ){
		if( frm.keyword.value == "" ){
			alert("검색어를 입력해주세요.");
			frm.keyword.focus();
			return false;

		}else{
			no = '1';
			
			frm.page.value = no;
			//frm.action = "admin02.asp";
		}

	}else if( mode=="D" ){
		if (confirm("삭제하시겠습니까?")){
			frm.seq.value=no;
			frm.action="blog_del_ok.asp";
		}else{
			return false;
		}

	}else{
		alert("정확한 경로가 아닙니다.");
		return false;
	}

	frm.submit();
}
//-->

