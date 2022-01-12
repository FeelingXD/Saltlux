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
<<<<<<< HEAD
<<<<<<< HEAD
        return null;
=======
>>>>>>> 3bc4212e1b03ea616efe2763a1e91e6601ba2314
=======
        return; 
>>>>>>> fce774bcc80a95b15a88d10b92a0dda4086c7185
    }
    document.login_form.submit();
}


/**
 this function is for test it is not satisfied.
**/

function sign_up_check(){


	document.sign_up_form.submit();
}