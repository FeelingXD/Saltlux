<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.EnhancedConnect"%>
<script>
<% 
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	EnhancedConnect ec = new EnhancedConnect();
	String sql="Select id,pw,name,workplace from member where id = ?";

	ResultSet rs = ec.select(sql,id);

	if(rs.next()){// 값이있고 맞을경우 
		if(id.equals(rs.getString(1))==true&&pass.equals(rs.getString(2))==true){
			//아이디 비밀번호 일치할경우  rs.close() 추후할것
			session.setAttribute("is_login", true);
			session.setAttribute("user_name", rs.getString(3));

			session.setAttribute("workplace",rs.getString(4));
			rs.close();

			%>
			alert("환영합니다."+ "<%=session.getAttribute("user_name")%>" +"님");
			location.href="index.jsp";
			</script>
			<%	
			rs.close();
			return ;
		}
	}
	%>
	alert("아이디와 비밀번호를 확인해주세요.");
	location.href="loginform.jsp";
	<%
	rs.close();
%>
</script>