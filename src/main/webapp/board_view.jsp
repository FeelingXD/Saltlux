<%@page import="db.EnhancedConnect"%>

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

	<% EnhancedConnect ec= new EnhancedConnect(); %>
	<%
	String sql = "select * from board";
	ResultSet rs =ec.select(sql);

	if (rs.next()) {
		%>

<section>
<div id="board_box">
	    <h3 class="title">
			실습
		</h3>
  <ul id="view_content">
			<li>
				<span class="col1"><b>제목 :</b><%=rs.getString("title") %></span>
				<span class="col2"><%=rs.getString("id") %>| <?=$regist_day?></span>
			</li>
			<li>
				<%=rs.getString("content") %>
			</li>		
	    </ul>
	    <ul class="buttons">
				<li><button onclick="location.href='board_list.php?page=<?=$page?>'">목록</button></li>
				<li><button onclick="location.href='board_modify_form.php?num=<?=$num?>&page=<?=$page?>'">수정</button></li>
				<li><button onclick="location.href='board_delete.php?num=<?=$num?>&page=<?=$page?>'">삭제</button></li>
				<li><button onclick="location.href='board_form.php'">글쓰기</button></li>
		</ul>
	</div> <!-- board_box -->
</section> 
<footer>
	<%@ include file= "footer.jsp" %>
    </footer>
    	<%
		}
		
%>
</body>
</html>