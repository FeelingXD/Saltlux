<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.EnhancedConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	EnhancedConnect db = new EnhancedConnect();
 	db.select("select * from member");
 	
 	while(db.rs.next()){
 		out.println(db.rs.getString(""));
 	}
	
%>
</body>
</html>