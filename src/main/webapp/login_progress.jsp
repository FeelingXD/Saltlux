<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.EnhancedConnect"%>
<% 
	ResultSet rs = null;
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	EnhancedConnect ec = new EnhancedConnect();
	String sql="Select id,pw from member where id = ?";
	rs = ec.select(sql,id);
	if(rs.next()){// 값이있는경우
		if(id.equals(rs.getString(1))==true&&pass.equals(rs.getString(2))==true){
			//아이디 비밀번호 일치할경우 
			rs.close();
			out.println("<script>alert('성공')</script>");
		}
	}
%>