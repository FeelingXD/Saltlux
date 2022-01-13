<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String workplace = request.getParameter("workplace");
	String email = request.getParameter("email1")+"@"+request.getParameter("email2");

 	Enumeration params = request.getParameterNames();
 	while(params.hasMoreElements()){
 		String param = (String)params.nextElement();
 		out.println("값 : " +param+"<br/>");	
 	}
 	out.println(id);
		out.println(pw);
		out.println(name);
		out.println(workplace);
		out.println(email);
%>
<script> // TDD 용 디버그코드 
	//location.href="sign_up_test.jsp";
</script>