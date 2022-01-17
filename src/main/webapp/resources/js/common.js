/**
정규표현식
이메일  "/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/"
휴대폰 "/^(010|011|016|017|018|019)-\d{3,4}-\d{4}$/u"
**/

function input_value_check(form_name, expression){//폼 입력값 검증 form_name 폼이름, expression 표현식
	const inputs = document.forms[form_name].elements;
	var regexp = new RegExp(expression, 'g');
	for(let element of inputs){
		if(String(element.value)!=""){// form 값이 비어있지않은경우 
			return regexp.test(element.value); // @return boolean
		}
	}
}

function check_input(form_name){// login TDD
	
	if(input_value_check(form_name,"/'|;|--|./"))
	{
		return alert('유효하지않은 접근입니다.');
	} //inject secure
	
	
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