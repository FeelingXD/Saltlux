/**
 common.js
**/
function login_check(){
    if(!document.login_form.id.value){
        alert("id는 필수입력값입니다.");
        document.login_form.id.focus();
<<<<<<< HEAD
        return null;
=======
        return;
>>>>>>> 3bc4212e1b03ea616efe2763a1e91e6601ba2314
    }
    if(!document.login_form.pw.value){
        alert("pw은 필수입력값입니다.");
        document.login_form.pw.focus();
<<<<<<< HEAD
        return null;
=======
>>>>>>> 3bc4212e1b03ea616efe2763a1e91e6601ba2314
    }
    document.login_form.submit();
}