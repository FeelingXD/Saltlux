<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/board.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>글쓰기</title>
</head>
<body>
<header>
<%@ include file= "../../header.jsp" %>
</header>
<section>
	
   	<div id="board_box">
	    <h3 id="board_title">
	    		실습일지 > 글 쓰기
		</h3>
	    <form name="board_form" method="post" action="action_upload_test2.jsp" enctype="multipart/form-data"  >
	    <ul id="board_form">
				<li>
					<span class="col1">이름 : </span>
					<span class="col2"><%=session.getAttribute("user_name")%></span>
				</li>	
				<li>
					<span class="col1">기업 : </span>
					<span class="col2"><%=session.getAttribute("workplace")%></span>
				</li>		
	    		<li>
	    			<span class="col1">제목 : </span>
	    			<span class="col2"><input name="bbsTitle" type="text"></span>
	    		</li>	    	
	    		<li id="text_area">	
	    			<span class="col1">내용 : </span>
	    			<span class="col2">
	    				<textarea name="bbsContent" placeholder="내용을 입력해주세요."></textarea>
	    			</span>
	    		</li>
				
				<li>
					<input type="file" name="imagefile"/>
				</li>
	    	    </ul>
	    	<ul class="buttons">
				<li><button type="submit" >완료</button></li>
				<li><button type="button" onclick="location.href='board_list.jsp'">목록</button></li>
			</ul>
		
	    </form>
	</div> <!-- board_box -->
</section> 

<footer> 
	<%@ include file= "../../footer.jsp" %>

</footer>

</body>
</html>