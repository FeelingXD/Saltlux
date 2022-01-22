/**
정규표현식
아이디 "/^[a-z0-9]+$/"
이메일  "/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/"
이름 "/^[가-힣]+$/"
비밀번호 "/^[a-z]+[a-z0-9]$/g"
**/
const regArray=["/^[a-z0-9]+$/","/^[a-z0-9]$/","/^[가-힣]+$/","/^[a-z0-9]+$/","/[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]+)*.[a-zA-Z]{2,3}$/"];  //정규식 배열 
function input_value_check(form_name, expression){//폼 입력값 검증 form_name 폼이름, expression 표현식
	const inputs = document.forms[form_name].elements;
	var regexp = new RegExp(expression, 'g');
	for(let element of inputs){
		if(String(element.value)!=""){// form 값이 비어있지않은경우 
			return regexp.test(element.value); // @return boolean
		}
	}
}
function about_blank(form_name){
	
	const inputs = document.forms[form_name].elements;
	for(element of inputs){
		if(element.value=="")
		{
			alert(element.getAttribute('tag')+"값은 필수입니다.");
			element.focus();
			return ;
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
		document.forms[form_name].id.asdffocus();
		return				
	}
	if(!document.forms[form_name].pass.value){
		alert("비밀번호값은 필수입니다.");
		document.forms[form_name].pass.focus();
		return
	}
	document.forms[form_name].submit();	
}

function check_input_memberform(form_name){//@only use in memberform aka sign-up

	if(input_value_check(form_name,"/'|;|--|./"))
	{
		return alert('유효하지않은 접근입니다.');
	} //inject secure
	about_blank(form_name);
	
}