<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./resources/css/common.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<header>
    	<%@ include file= "header.jsp" %>
    </header>
<section>
<div id="board_box">
	    <h3 class="title">
			실습
		</h3>
  <ul id="view_content">
			<li>
				<span class="col1"><b>제목 :</b> </span>
				<span class="col2"></span>
			</li>
			<li>
				
		
			</li>		
	    </ul>
	    <ul class="buttons">
				<li><button onclick="">목록</button></li>
				<li><button onclick="">수정</button></li>
				<li><button onclick="">삭제</button></li>
				<li><button onclick="">글쓰기</button></li>
		</ul>
	</div> <!-- board_box -->
</section> 
<footer>
	<%@ include file= "footer.jsp" %>
    </footer>
</body>
</html>