<%@page import="java.nio.channels.CancelledKeyException"%>
<%@page import="java.security.interfaces.RSAPublicKey"%>
<%@page import="java.security.spec.RSAPublicKeySpec"%>
<%@page import="java.security.PrivateKey"%>
<%@page import="java.security.PublicKey"%>
<%@page import="java.security.KeyFactory"%>
<%@page import="java.security.KeyPair"%>
<%@page import="java.security.KeyPairGenerator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../resources/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="../../resources/js/rsa/rsa.js"></script>
<script type="text/javascript" src="../../resources/js/rsa/prng4.js"></script>
<script type="text/javascript" src="../../resources/js/rsa/rng.js"></script>
</head>
<%
	HttpSession rsa_session = request.getSession();
	
	KeyPairGenerator generator= KeyPairGenerator.getInstance("RSA");
	generator.initialize(2048);
	
	KeyPair keyPair = generator.genKeyPair();
	KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	
	PublicKey publickey = keyPair.getPublic();
	PrivateKey privateKey = keyPair.getPrivate();
	
	RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publickey, RSAPublicKeySpec.class);
	String publicKeymodulus = publicSpec.getModulus().toString(16);
	String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
	
	request.setAttribute("publicKeyModulus" , publicKeymodulus);
	request.setAttribute("publicKeyExponent" , publicKeyExponent);
	session.setAttribute("__rsaPrivateKey__" , privateKey);
%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
function validateEncryptedForm(){	
	var login_id = $("#id").val();
	var login_pw = $("#pw").val();
	if(!login_id||!login_pw){
		alert('아이디 비밀번호를 입력해주세요');
		return
	}
	try{
		var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
		var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
		submitEncryptedForm(login_id,login_pw,rsaPublicKeyModulus,rsaPublicKeyExponent);
	}catch(err){
		alert(err);
	}
	return ;
}
function submitEncryptedForm(id,pw,rspkM,rspkE){
	var rsa = new RSAKey();
	rsa.setPublic(rspkM,rspkE)
	
	var login_id =rsa.encrypt(id);
	var login_pw =rsa.encrypt(pw);
	
	$("#id").val(login_id);
	$("#pw").val(login_pw);
	
	document.forms[0].submit();
	
}

	
</script>
<body>
	<form action="rsa_progress.jsp" name="login" method="post">
		<input type="text" name="id" id="id"/>
		<input type="password" name="pw" id="pw"/> 
		<input type="button"  onclick="validateEncryptedForm()" value="제출">
	</form>
	<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}">
	<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}">
</body>
</html>