<%@page import="db.EnhancedConnect"%>
<%@page import="db.Pair" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EnhancedConnect ec = new EnhancedConnect();
	ec.insert("insert into memeber(id,pw,code) values(?,?,?)",new Pair<String>("wlals"),new Pair<String>("wlals"),new Pair<Integer>(10));
%>