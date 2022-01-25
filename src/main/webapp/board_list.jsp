<%@page import="db.EnhancedConnect"%>
<%@page import="bbs.Bbs"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="java.util.ArrayList"%>
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

<title>실습일지</title>
</head>
<body>
<header>
	
    <%@ include file= "header.jsp" %>
    </header>
    <section>
	<% EnhancedConnect ec= new EnhancedConnect(); %>
	<%
	String sql = "select * from board";
	int count =ec.selectCnt("board"); //전체행 수
	String tempStart = request.getParameter("page");
	int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
	int onePageCnt=10; // 한페이지에 출력할 행의 갯수
	count = (int)Math.ceil((double)count/(double)onePageCnt);
	// 페이지 수 저장
	
	if(tempStart != null){ // 처음에는 실행되지 않는다.
		startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
	}
	
	/*Vector<TestDTO> v = dao.selectPage("board", startPage, onePageCnt);*/


	ResultSet rs =ec.select(sql);
%>
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
					<% while(rs.next()){%>
				<li>
					<span class="col1"><%=rs.getString("num") %></span>
					<span class="col2"><a href="board_view.php?num=<%=rs.getString("num") %>"><%=rs.getString("title") %></a></span>
					<span class="col3"><%=rs.getString("id")%></span>
					<span class="col4"><?=$file_image?></span>
					<span class="col5"><?=$regist_day?></span>
					<span class="col6"><%=rs.getString("hit")%><?=$hit?></span>
				</li>
				<%}%>	
	    	</ul>
	    	
			<ul id="page_num"> 	
<%
		for(int i=1; i<=count; i++){ %>
			
			<a href="board_list.jsp?page=<%=i %>">[<%=i%>]
			</a>
		<% }; %>


			</ul> <!-- page -->	    	
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
	</div> <!-- board_box -->
</section> 
    
    <footer>
	<%@ include file= "footer.jsp" %>
    </footer>
</body>
</html>