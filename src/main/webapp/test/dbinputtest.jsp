<%@page import="db.EnhancedConnect"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%
	Connection conn=null;
	try{
		String url ="jdbc:mysql://localhost:3306/Saltlux"; // 뒤에 테이블 명 붙힐것
		String user = "root"; // mysql user
		String password = "root"; // mysql pw 
		Class.forName("com.mysql.jdbc.Driver"); 
		conn = DriverManager.getConnection(url, user ,password);
		try{
		PreparedStatement pstmt = conn.prepareStatement("insert into Member (id, pw,name,workplace,email) values(?,?,?,?,?) ");
		pstmt.setString(1,"wlals4253");
		pstmt.setString(2,"wlals");
		pstmt.setString(3,"지민");
		pstmt.setString(4,"Saltlux");
		pstmt.setString(5,"wlals4253@naver.com");
		pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			out.println(e.getMessage());
		}
	}catch(SQLException e){
		out.println("데이터 연결실패. <br>");
		out.println(e.getMessage());
	}
