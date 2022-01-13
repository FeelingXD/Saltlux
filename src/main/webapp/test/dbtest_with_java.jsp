<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@page import="db.EnhancedConnect" %> --%>
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
 	db.select("select * from Member");
		
 	while(db.rs.next()){
 		out.println(db.rm.getColumnCount());
 		out.println(db.rs.getString(1));
 		out.println(db.rs.getString(2));
 		out.println(db.rs.getString(3));
 		out.println(db.rs.getString(4));
 		out.println(db.rs.getString(5));
 		out.println(db.rs.getString(6));
 	}
 	
%>

</body>
</html>