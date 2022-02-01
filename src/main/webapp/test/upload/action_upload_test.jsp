<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.io.*,java.util.*"%>
<%
	String Dir= request.getRealPath("/image");
	
	File Folder = new File(Dir);
	
	if(!Folder.exists()){
		try{
			
			Folder.mkdir();
			
		}catch(Exception e)
		
		{
			out.println(e.getStackTrace());
		}
	}
	
	MultipartRequest mr = new MultipartRequest(request, request.getRealPath("/image"), 10*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	out.println(mr.getParameter("bbsContent"));
%>