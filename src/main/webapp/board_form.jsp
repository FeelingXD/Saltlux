<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
<%request.setCharacterEncoding("utf-8");%>

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

<title>글쓰기</title>
</head>
<body>
<header>
<%@ include file= "header.jsp" %>
<% String category = request.getParameter("category");
	%>
	
	<%	
		if(category == null)
			category = "journal";  //default
	%>
</header>
<section>
	
   	<div id="board_box">
	    <h3 id="board_title">
	    		실습일지 > 글 쓰기
		</h3>

	<% if(!category.equals("notice")){ %>
	    	<form name="board_form" method="post" action="board_insert_photo.jsp?category=<%=category%>" enctype ="multipart/form-data">
	  <%}else{%>
	  	  <form name="board_form" method="post" action="board_insert.jsp?category=<%=category%>" >
	  <% }%>

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
	    				<textarea name="bbsContent"></textarea>
	    			</span>
	    		</li>

	    		<% if(!"notice".equals(category)){ 	%>
	  			<li>
	    			<span class="col1">파일 : </span>
	    			<span class="col2">
	    				<input type=file name =file/>
	    			</span>
	    		</li>
	  <%}else{%>
	  
	  <% }%>
	    		
	    	    </ul>
	    	<ul class="buttons">
				<li><button type="submit" >완료</button></li>
				<li><button type="button" onclick="location.href='board_list.jsp?category=<%=category%>'">목록</button></li>
			</ul>
		
	    </form>
	</div> <!-- board_box -->
</section> 

<footer> 
	<%@ include file= "footer.jsp" %>

</footer>
</body>
</html>