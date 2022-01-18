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
    	<%@ include file= "header.jsp" %>
    </header>
    <section>
	
   	<div id="board_box">
	    <h3>
	    	실습
		</h3>
	    <ul id="board_list">
				<li>
					<span class="col1">번호</span>
					<span class="col2">제목</span>
					<span class="col3">글쓴이</span>
					<span class="col4">첨부</span>
					<span class="col5">등록일</span>
					<span class="col6">조회</span>
				</li>

				<li>
					<span class="col1"><?=$number?></span>
					<span class="col2"><a href="board_view.php?num=<?=$num?>&page=<?=$page?>"><?=$subject?></a></span>
					<span class="col3"><?=$name?></span>
					<span class="col4"><?=$file_image?></span>
					<span class="col5"><?=$regist_day?></span>
					<span class="col6"><?=$hit?></span>
				</li>	
	    	</ul>
			<ul id="page_num"> 	

			</ul> <!-- page -->	    	
			<ul class="buttons">
				<li><button onclick="location.href='board_list.php'">목록</button></li>
				<li>
<?php 
    if($userid) {
?>
					<button onclick="location.href='board_form.php'">글쓰기</button>
<?php
	} else {
?>
					<a href="javascript:alert('로그인 후 이용해 주세요!')"><button>글쓰기</button></a>
<?php
	}
?>
				</li>
			</ul>
	</div> <!-- board_box -->
</section> 
    
    <footer>
	<%@ include file= "footer.jsp" %>
    </footer>
</body>
</html>