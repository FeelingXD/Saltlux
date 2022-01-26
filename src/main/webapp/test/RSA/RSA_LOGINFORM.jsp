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
</head>
<%
	HttpSession rsa_session = request.getSession();
	
	KeyPairGenerator generator= KeyPairGenerator.getInstance("RSA");
	generator.initialize(1024);
	
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
<script type="text/javascript" src="../../resources/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="../../resources/js/rsa/rsa.js"></script>
<script type="text/javascript" src="../../resources/js/rsa/prng4.js"></script>
<script type="text/javascript" src="../../resources/js/rsa/rng.js"></script>
<script type="text/javascript">
	var login_id = $("#")
</script>
<body>
	<form action="rsa_progress.jsp">
		<input type="text" id="id"/>
		<input type="password" id="pw"/> 
		
		<input type="submit" value="제출">	
	</form>
</body>
</html>