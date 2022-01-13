<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	ResultSet rs2 = conn.getMetaData().getTables(null, null, null, new String[]{"TABLE"});
	while(rs2.next()) {
	    // 테이블명 조회
	    String table = rs2.getString("TABLE_NAME");
	    out.println("Table Name : " + table+"<br>");
	}
%>
