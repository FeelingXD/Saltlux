/**
 * 
 */
function check_input(){
	if(!document.login_form1.id.value){
		alert("아이디값은 필수입니다.");
		document.login_form1.id.focus();
		return				
	}
	if(!document.login_form1.pass.value){
		alert("비밀번호값은 필수입니다.");
		return
	}
	
	document.login_form1.submit();
	
}