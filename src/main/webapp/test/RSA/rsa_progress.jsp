
<%@page import="javax.crypto.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.security.PrivateKey"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

public String decryptRsa(PrivateKey privateKey, String value){
	String value ="";
	try{
		Cipher cipher =Cipher.getInstance("RSA");
		
		byte[] encryptedBytes = hexToByteArray(value);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		decryptedValue = new String(decryptedBytes, "utf-8");
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return decryptedValue;
}

public static byte[] hexToByteArray(String hex) {
	if (hex == null || hex.length() % 2 != 0) {
		return new byte[]{};
	}
 
	byte[] bytes = new byte[hex.length() / 2];
	for (int i = 0; i < hex.length(); i += 2) {
		byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
		bytes[(int) Math.floor(i / 2)] = value;
	}
	return bytes;
}
%>

<% 
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	out.println(id);
	out.println(pw);
	
	
	PrivateKey privateKey = (PrivateKey)session.getAttribute("__rsaPrivateKey__");
	session.removeAttribute("__rsaPrivateKey__");
	
	try{
		String real_id = decryptRsa(privateKey,id);
		String real_pw = decryptRsa(privateKey,pw);
		
		out.println(real_id);
		out.println(real_pw);
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

