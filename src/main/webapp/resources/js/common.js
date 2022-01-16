/**
 * 
 */
function check_input(form_name){
	
	if(!document.forms[form_name].id.value){
		alert("아이디값은 필수입니다.");
		document.forms[form_name].id.focus();
		return				
	}
	if(!document.forms[form_name].pass.value){
		alert("비밀번호값은 필수입니다.");
		document.forms[form_name].pass.focus();
		return
	}
	document.forms[form_name].submit();	
}