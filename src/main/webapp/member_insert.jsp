<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="db.EnhancedConnect"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pass");

	String name = request.getParameter("name");
	String workplace = request.getParameter("Work");
	String mail1 = request.getParameter("email1");
	String mail2 = request.getParameterValues("email2")[0];
	String email = mail1 + "@" + mail2;
	
	EnhancedConnect ec = new EnhancedConnect();
	
	String sql="Insert into member(id,pw,name,workplace,email) values (?, ?, ?, ?, ?)";
	ec.insert_Strings(sql,id,pw,name,workplace,email);
	
	if (ec != null) {
%>
<script>
    location.href = "index.jsp"; 
	alert('정상적으로 가입되었습니다.');
</script>
<%
	} else { 
%>
<script>
	alert('빈 부분이 있습니다.');
</script>
<%
	}
	ec.close();
%>