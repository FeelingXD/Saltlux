<%@page import="db.EnhancedConnect"%>
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
<title>Insert title here</title>
</head>
<body>
<header>
    	<%@ include file= "header.jsp" %>
</header>

	<% 
	// bbsID를 초기화 시키고
	// 'bbsID'라는 데이터가 넘어온 것이 존재한다면 캐스팅을 하여 변수에 담는다
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	// 만약 넘어온 데이터가 없다면
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다')");
		script.println("location.href='bbs.jsp'");
		script.println("</script");
	}
	
	// 유효한 글이라면 구체적인 정보를 'bbs'라는 인스턴스에 담는다
	Bbs bbs = new BbsDAO().getBbs(bbsID);
%>

<section>
<div id="board_box">
	    <h3 class="title">
			실습
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
				<li><button onclick="location.href='board_list2.jsp'">목록</button></li>
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