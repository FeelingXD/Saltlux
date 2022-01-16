<%@page import="db.EnhancedConnect"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%
	Connection conn=null;
	try{
		String url ="jdbc:mysql://localhost:3307/Saltlux"; // 뒤에 테이블 명 붙힐것
		String user = "root"; // mysql user
		String password = "root"; // mysql pw 
		Class.forName("com.mysql.jdbc.Driver"); 
		conn = DriverManager.getConnection(url, user ,password);
		out.println("연결성공 ");
	}catch(SQLException e){
		out.println("데이터 연결실패. <br>");
		out.println(e.getMessage());
	}
%>