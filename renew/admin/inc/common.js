<!--
	// 메일 체크
	function check_email(str){
		var t = 0;

		if(str != "") {
			var emailPat=/^(.+)@(.+)$/
			var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
			var validChars="\[^\\s" + specialChars + "\]"
			var firstChars=validChars
			var quotedUser="(\"[^\"]*\")"
			var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
			var atom="(" + firstChars + validChars + "*" + ")"
			var word="(" + atom + "|" + quotedUser + ")"
			var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
			var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")
			var matchArray=str.match(emailPat)
			if (matchArray==null) {
				t = 1;
			}
		}
		return t;
	}

	function getCookie(name) { 
		var Found = false 
		var start, end 
		var i = 0 

		while(i <= document.cookie.length) { 
			start = i 
			end = start + name.length 

			if(document.cookie.substring(start, end) == name) { 
			Found = true 
			break 
			} 
			i++ 
		} 

		if(Found == true) { 
			start = end + 1 
			end = document.cookie.indexOf(";", start) 
			if(end < start) 
			end = document.cookie.length 
			return document.cookie.substring(start, end) 
		} 

		return "" 
	}

	function setCookie( name, value, expiredays){
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}

	function closeLayer(obj) {
		obj.style.display='none';
	}
	
	function closeWin(obj,cookieName) {
		setCookie( cookieName, "done" , 1);
		obj.style.display='none';
	}


	// 빈공백 없애기
	function trim(s){
		var t = "";
		var from_pos = to_pos = 0;

		for (i=0; i<s.length; i++){

			if (s.charAt(i) == ' '){
				continue;
			}else{
				from_pos = i;
				break;
			}
		}

		for (i=s.length; i>=0; i--){

			if (s.charAt(i-1) == ' '){
				continue;
			}else{
				to_pos = i;
				break;
			}
		}	

		t = s.substring(from_pos, to_pos);
		return t;
	}
	// 공백 체크
	function fncTrimCheck(str){
		if(str==null) return -1;

		for(var i=0;i<str.length;i++){
			var digit = str.charAt(i)
			if ( digit == " ")	continue; 
			else return 1;
		}
		return -1;
	}

	// 글자 byte 체크
	function strlenByte(obj) {
		var t = 0;
		var limit = obj.maxLength;
		var str = obj.value;
		var i, tmpStr, nbyte = max = 0;

		for(i=0; i<str.length; i++) {
			if (escape(str.charAt(i)).length > 4) nbyte = nbyte+2;
			else nbyte++;
			if(nbyte <= limit) max = i + 1;
		}
		if(nbyte > limit) {
			t = 1;
			tmpStr = str.substr(0, max);
			obj.value = tmpStr;
		}

		return t;
	}

	// 숫자만 입력 가능
	function onlyNum(obj){
		var t = 0;
		var t_str = obj.value;
		var ret;

		for (var i = 0; i < t_str.length; i++) {
			ret = t_str.charCodeAt(i);
			if (!((ret > 47) && (ret < 58))){
				obj.value = "";
				t = 1;
			}
		}
		return t;
	}


	//공지사항  페이지 이동 체크
	function f_MovePage(frm, mode, no){

		if( mode == "list" ){

			if( no == "" ){ no = '1';}
			
			frm.page.value = no;
			frm.action = "/03_board/list.asp";

		}else if( mode=="view" ){
			frm.id.value=no;
			frm.action="/03_board/view.asp";

		}else if( mode=="search" ){
			if( frm.keyword.value == "" ){
				alert("검색어를 입력해주세요.");
				frm.keyword.focus();
				return false;

			}else{
				no = '1';
				
				frm.page.value = no;
				frm.action = "/03_board/list.asp";
			}

		}else{
			alert("정확한 경로가 아닙니다.");
			return false;
		}

		frm.submit();
	}

	//새창
	function new_win(filename,p_name,s_width,s_height,s_scrol){
		var x = screen.width;
		var y = screen.height;
		var wid = (x / 2) - (s_width / 2);
		var hei = (y / 2) - (s_height / 2);

		window.open(filename, p_name, "toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=0,scrollbars=" + s_scrol + ",width=" + s_width + ",height=" + s_height + ",top=" + hei + ",left=" + wid + ",scrolbar=no"); 
	}

	//우편번호 찾기
	//function find_post(str1, str2, str3, str4, str5){
	function find_post(str1, str2, str3, str4, str5){
		find_post_url = "/_lib/popup_addr.asp?action=find_post&s1=" + str1 + "&s2=" + str2 + "&s3=" + str3 + "&s4=" + str4 + "&s5=" + str5;
		window.open(find_post_url,'displayWindow','toolbar=no,scrollbars=yes,width=470,height=500');
	}

	function enterPost(frm){
		if(event.keyCode == 13)
			fncInputPost(frm);
	}

	//우편번호 검색 체크
	function fncInputPost(frm){
		if (fncTrimCheck(frm.dong.value)==-1){
			alert("동명을 입력하세요.");
			frm.dong.focus();
			return false;
		}

		return true;
	}

	function onlyNumber(obj){
		var t = 0;
		//var t_str = obj.value;
		var t_str = $("#"+obj).val();
		var ret;

		for (var i = 0; i < t_str.length; i++) {
			ret = t_str.charCodeAt(i);
			if (!((ret > 47) && (ret < 58))){
				$("#"+obj).val("");
				t = 1;
			}
		}
		return t;
	}


	//이메일 도메인 선택
	function selectMailDomain(){
		if($.trim($("#domain").val())==""){
			$("#email_domain").val("");
		}else{
			$("#email_domain").val($("#domain").val());
		}
	}
//-->