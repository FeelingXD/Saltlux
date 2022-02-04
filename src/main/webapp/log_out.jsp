<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.invalidate();
%>
<%
	String status = null;
%>
<% 
	status =request.getParameter("status"); 

	if(status==null){
	
%>
<script type="text/javascript">
	alert("로그아웃하셧습니다.");
	location.href="index.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("탈퇴하셨습니다.");
	location.href="index.jsp";
</script>
<%
	}
%>