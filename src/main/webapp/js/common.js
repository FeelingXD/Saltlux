/**
 common.js
**/
function login_check(){
    if(!document.login_form.id.value){
        alert("id는 필수입력값입니다.");
        document.login_form.id.focus();
        return null;
    }
    if(!document.login_form.pw.value){
        alert("pw은 필수입력값입니다.");
        document.login_form.pw.focus();
        return null;
    }
    document.login_form.submit();
}