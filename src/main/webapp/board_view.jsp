<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./resources/css/common.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="EUC-KR">
<title>게시글</title>
</head>
<body>
<header>
    	<%@ include file= "header.jsp" %>
</header>

	<% 
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다')");
		script.println("location.href='board_list.jsp'");
		script.println("</script");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
%>

<section>
<div id="board_box">
	    <h3 class="title">
			실습일지
		</h3>
  <ul id="view_content">
			<li>
				<span class="col1"><b>제목 :</b><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;")
				.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></span>
				<span class="col2"><%=bbs.getUserID() %>| <%= bbs.getBbsDate().substring(0, 11) %></span>
			</li>
			<li>
				<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;")
							.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
			</li>		
	    </ul>
	    <ul class="buttons">
				<li><button onclick="location.href='board_list.jsp'">목록</button></li>
				<li><button onclick="location.href='board_modify_form.jsp'">수정</button></li>
				<li><button onclick="location.href='board_delete.jsp' ">삭제</button></li>
		</ul>
	</div> <!-- board_box -->
</section> 
<footer>
	<%@ include file= "footer.jsp" %>
    </footer>
</body>
</html>