<%@page import="java.security.spec.RSAPublicKeySpec"%>
<%@page import="java.security.KeyPair"%>
<%@page import="java.security.Key"%>
<%@page import="java.security.KeyFactory"%>
<%@page import="java.security.PublicKey"%>
<%@page import="java.security.PrivateKey"%>
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
KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
generator.initialize(1024);

KeyPair keyPair = generator.genKeyPair();
KeyFactory keyFactory = KeyFactory.getInstance("RSA");

PublicKey publicKey = keyPair.getPublic();
PrivateKey privateKey = keyPair.getPrivate();
// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
session.setAttribute("__rsaPrivateKey__", privateKey);

// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

String publicKeyModulus = publicSpec.getModulus().toString(16);
String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

request.setAttribute("publicKeyModulus", publicKeyModulus);
request.setAttribute("publicKeyExponent", publicKeyExponent);
%>
<script type="text/javascript" src="../../resources/js/rsa/rsa.js"></script>
<script type="text/javascript" src="../../resources/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="../../resources/js/rsa/prng4.js"></script>
<script type="text/javascript" src="../../resources/js/rsa/rng.js"></script>
</head>
<body>
    <form name="frm" method="post" action="rsa_progress2.jsp" onsubmit="return login()">
        <input type="hidden" id="RSAModulus" value="${RSAModulus}"/>
        <input type="hidden" id="RSAExponent" value="${RSAExponent}"/>    
        <input type="text" placeholder="아이디" id="USER_ID_TEXT" name="USER_ID_TEXT" />
        <input type="password" placeholder="비밀번호" id="USER_PW_TEXT" name="USER_PW_TEXT" />
        <input type="hidden" id="USER_ID" name="USER_ID">
        <input type="hidden" id="USER_PW" name="USER_PW">
        <input type="submit" value="로그인" />
    </form>
</body>
</html>
