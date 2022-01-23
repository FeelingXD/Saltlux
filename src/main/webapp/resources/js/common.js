/**
정규표현식
아이디 "/^[a-z0-9]+$/"
이메일  "/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/"
이름 "/^[가-힣]+$/"
비밀번호 "/^[a-z]+[a-z0-9]$/g"
**/
const regArray=[/^[a-z]+[a-z0-9]$/,/^[a-z0-9]+$/,/^[가-힣]{2,4}$/,/^[a-z0-9]+$/,/[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]+)*.[a-zA-Z]{2,3}$/];  //정규식 배열 
function input_value_check(form_name, expression="/'|;|--|./"){//폼 입력값 검증 form_name 폼이름, expression 표현식
	const inputs = document.forms[form_name].elements;
	var regexp = new RegExp(expression, 'g');
	for(let element of inputs){
		if(String(element.value)!=""){// form 값이 비어있지않은경우 
			return regexp.test(element.value); // @return boolean
		}
	}
}
function about_blank(form_name){ //raw
	
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

	if(input_value_check(form_name))
	{
		return alert('유효하지않은 접근입니다.');
	} //inject secure
	
	if(!document.forms[form_name].id.value){
		
		alert("아이디값은 필수입니다.");
		document.forms[form_name].id.focus();
		return	;			
		
	}
	if(!document.forms[form_name].pass.value){
		
		alert("비밀번호값은 필수입니다.");
		document.forms[form_name].pass.focus();
		return ;
		
	}
	document.forms[form_name].submit();	
}

function check_input_memberform(form_name){//@only use in memberform aka sign-up

	if(input_value_check(form_name))
	{
		
		return alert('유효하지않은 접근입니다.');
		
	} //inject secure
	
	(function(form_name){
		let i = 0;
		let j = i;
		const inputs = document.forms[form_name].elements;
		
		for(element of inputs){// blankfield check.
			
			if(element.value=="")
			{
				
				alert(element.getAttribute('tag')+"값은 필수입니다.");
				element.focus();
				return ;
				
			}
		}
		
		for(i =0 ; i < (inputs.length-1) ; i++,j++){ //value reg check.
			
			
			if(i==2){
				j= i-1;
				continue;
			}
				
			if(!regArray[j].test(inputs[i].value)){

				return alert(inputs[i].getAttribute('tag')+'값을 확인해주세요');
				
			}
			
		}
		
		if(input.pass.value!=input.passconfirm.value){
				
				return alert('비밀번호가 일치하지않습니다.');
				
			}
			
	document.forms[form_name].submit();
	})(form_name);
}