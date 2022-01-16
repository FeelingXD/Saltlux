/**
 * 
 */

function input_value_check(form_name){
	const inputs = document.forms[form_name].elements;
	for(let element of inputs){// 추후제작
		//inputs[].value
	}
	

}

function check_input(form_name){// login TDD;
	input_value_check(form_name);
	
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