<%@page import="com.google.protobuf.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="db.EnhancedConnect"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
</head>
<body>
<div style="text-align: center"> 
<h3>* 아이디 중복체크 *</h3> 
</div> 

<%
	String id = request.getParameter("id");
	EnhancedConnect ec = new EnhancedConnect();
	String sql="Select id from member where id = ?";
	ResultSet rs = ec.select(sql,id);
	if(rs.next()){ // 결과가 있으면
		out.print("<li>"+id+"아이디는 중복됩니다."+"</li>");
		out.print("<li>"+"다른 아이디를 사용해주세요!"+"</li>");
  
	}else{ // 결과가 없으면
		out.print("<li>"+id+"아이디는 사용 가능합니다."+"</li>");
	}
	rs.close(); 	
%>

<div id="close" style="text-align: center">
	<button onclick="javascript:self.close()">닫기</button>
</div>
</body>
</html>