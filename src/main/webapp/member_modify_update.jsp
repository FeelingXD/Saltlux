<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ include file="dbconn.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pass");

	String name = request.getParameter("name");
	String workplace = request.getParameter("Work");
	String email = request.getParameter("email1")+"@"+request.getParameter("email2");
	
	
	String sql="Update member set pw=?, name=?, workplace=?, email=? where id=?";
	pstmt = conn.prepareStatement(sql);
	
 	pstmt.setString(5, id);
	pstmt.setString(1, pw);
	pstmt.setString(2, name);
	pstmt.setString(3, workplace);
	pstmt.setString(4, email);
	pstmt.execute();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	session.setAttribute("user_name", name);
%>
<script type="text/javascript">
	alert("수정되었습니다.");
	location.href="index.jsp";
</script>