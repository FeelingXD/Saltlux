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
   
	<div class="container">
	<h2>사진게시판</h2>
	<div class="row">
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div><div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div><div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div><div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div><div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div><div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_B82B358EA7E731FAD5D46023641D939A.jpg">
	    </a>
	  </div>
	</div>
</div>
<div id="board_box">
			<ul class="buttons">
				<li><button onclick="location.href='board_list.jsp'">목록</button></li>
				<li>
<% if(session.getAttribute("user_name")==null){ %>    
					
					<a href="javascript:alert('로그인 후 이용해 주세요!')"><button>글쓰기</button></a>
<% }else{  %>
					<button onclick="location.href='board_form.jsp'">글쓰기</button>
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