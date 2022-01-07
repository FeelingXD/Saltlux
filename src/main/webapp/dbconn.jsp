<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn=null;
	try{
		String url ="jdbc:mysql://localhost:3306/memberdb";
		String user = "root";
		String password = "root";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user ,password);
		out.println("데이터 성공");
		
		//TDD
		String sql ="select * from member";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		int colcnt = rsmd.getColumnCount();
		while(rs.next()){
			for(int i =1  ;i<colcnt;i++){
			out.println(rs.getString(i));
			}
		}
		}catch(SQLException e){
		out.println("데이터 연결실패. <br>");
		out.println(e.getMessage());
	}
%>