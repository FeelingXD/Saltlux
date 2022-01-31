<%@page import="java.util.Iterator"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="java.util.Collection"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%
	
	Collection<Part> parts = request.getParts();	
	out.println(parts);
%>