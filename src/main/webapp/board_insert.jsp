<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("user_name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");



	String sql = "insert into board (id,title,content) values(?,?,?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, name );
	pstmt.setString(2, title);
	pstmt.setString(3, content);

	
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("board_list.jsp");
	
%>