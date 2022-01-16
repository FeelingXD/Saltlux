<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.invalidate();
%>
<script type="text/javascript">
alert("로그아웃하셧습니다.");
location.href="index.jsp";
</script>

