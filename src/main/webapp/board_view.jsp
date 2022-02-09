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

<title>게시글</title>
</head>
<body>
<header>
    	<%@ include file= "header.jsp" %>
</header>
<% request.setCharacterEncoding("utf-8"); %>
<% 
	String category = request.getParameter("category");
		if(category==null)
			category ="journal";
	
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다')");
		script.println("location.href='board_list.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	
	EnhancedConnect ec = new EnhancedConnect();
	
	ResultSet rs = ec.select("select * from bbs as b left join image as i on b.bbsID=i.id where b.bbsID = "+bbsID);
	String file = "";
	if(rs.next()){
		file = rs.getString("file");
	}
%>

<section>
<div id="board_box">
	    <h3 class="title">
			실습일지
		</h3>
  <ul id="view_content">
  			
			<li>
				<span class="col1"><b>제목 :</b> <%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;")
				.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></span>
				<span class="col2"><%=bbs.getUserID() %> | <%= bbs.getBbsDate().substring(0, 11) %> | <%=bbs.getHit() %></span>
				
			</li>
			
			<li>
			<%if(file!=null){ %>	
				<img alt="" src="./image/<%=bbsID%>/<%=file %> " onerror="this.src='./resources/img/error.png'" style="width: 100%; height: 50%"/>
				<%} %>
				<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;")
							.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
									 "<br>") %>
			</li>
					
	    </ul>
	    <ul class="buttons">
				<li><button onclick="location.href='board_list.jsp'">목록</button></li>
				<li><button onclick="location.href='board_modifyform.jsp?bbsID=<%= bbsID %>&category=<%=category%>'">수정</button></li>
				<li><button onclick="location.href='board_delete.jsp?bbsID=<%= bbsID %>'">삭제</button></li>
		</ul>
	</div> <!-- board_box -->
</section> 
<footer>
	<%@ include file= "footer.jsp" %>
    </footer>
</body>
</html>