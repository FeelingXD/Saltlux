/**
 common.js
**/
function login_check(){
    if(!document.login_form.id.value){
        alert("id는 필수입력값입니다.");
        document.login_form.id.focus();
        return null;
        return;
    }
    if(!document.login_form.pw.value){
        alert("pw은 필수입력값입니다.");
        document.login_form.pw.focus();
        return 
    }
    document.login_form.submit();
}


/**
 this function is for test it is not satisfied.
**/

function sign_up_check(){


	document.sign_up_form.submit();
}