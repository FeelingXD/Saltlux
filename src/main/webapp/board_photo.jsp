<%@page import="java.sql.ResultSet"%>
<%@page import="db.EnhancedConnect"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

<title>Insert title here</title>
</head>
<body>
<header>
	<%String category = "photo"; %>
	<%@ include file= "header.jsp" %>
	<%EnhancedConnect ec = new EnhancedConnect();
		String sql = "select bbsID from bbs where bbsCategory='photo' and bbsAvailable=1 order by bbsID desc;";
		ResultSet rs = ec.select(sql);
	%>
</header>

<section>   
	<div class="container">
	<h2>사진게시판</h2>
	<div class="row">

	<% 
	  while(rs.next()){
		  %>
		<div class="col-xs-6 col-md-3">
	    <a href="board_view.jsp?bbsID=<%=rs.getString("bbsID")%>" class="thumbnail">
	      <img src="./image/<%=rs.getString("bbsID")%>/Thumbnail.png" onerror="this.src='./resources/img/error.png'">
	    </a>
	  </div>
	  <% 
		}
	%>
	</div>
</div>
<div id="board_box">
			<ul class="buttons">
				<li><button onclick="location.href='board_list.jsp'">목록</button></li>
				<li>
	<% if(session.getAttribute("user_name")==null){ %>    
						
		<a href="javascript:alert('로그인 후 이용해 주세요!')"><button>글쓰기</button></a>
	<% }else{  %>
		<button onclick="location.href='board_form.jsp?category=<%=category%>'">글쓰기</button>
	<% } %>
				</li>
			</ul>
			</div>
</section> 
    
    <footer>
	<%@ include file= "footer.jsp" %>
    </footer>
</body>
</html>