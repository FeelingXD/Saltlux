<%@page import="java.util.Iterator"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="java.util.Collection"%>

<%
	Collection<Part> parts = request.getParts();	
	for (Part part: parts){
			
		String field = part.getName();
		out.println(field);
		
	}
%>