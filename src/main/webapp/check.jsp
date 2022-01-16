<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*" %>W

<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
   
	String sql = "select * from member where userid=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userid );
	rs=pstmt.executeQuery();
	
	if (rs.next()) { 
		%><center>
		<h1>중복된 아이디입니다.</h1>
		</center><%
	}else{%><center>
		<h1>사용가능한 아이디입니다.</h1>
		</center><% } %>

