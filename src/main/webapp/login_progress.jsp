
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.EnhancedConnect"%>
<script>
<% 
	ResultSet rs = null;
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	EnhancedConnect ec = new EnhancedConnect();
	String sql="Select id,pw,name from member where id = ?";
	rs = ec.select(sql,id);
	if(rs.next()){// 값이있고 맞을경우 
		if(id.equals(rs.getString(1))==true&&pass.equals(rs.getString(2))==true){
			//아이디 비밀번호 일치할경우  rs.close() 추후할것
			session.setAttribute("is_login", true);
			System.out.println(rs.getString(3));
			session.setAttribute("user_name", rs.getString(3));
			rs.close();
			%>
			alert("환영합니다."+ "<%=session.getAttribute("user_name")%>" +"님");
			location.href="index.jsp";
			<%	
		}
	
	}else{ // 값이있지만 다를경우
		rs.close();
		}
	rs.close();
%>
</script>