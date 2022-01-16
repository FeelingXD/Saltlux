<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.EnhancedConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	EnhancedConnect ec = new EnhancedConnect(); 
	ec.insert_Strings("insert into member(id,pw,name,workplace,email)values(?,?,?,?,?)","wlals3","wlals","지민","saltlux","wlals@gmail.com");
%>
