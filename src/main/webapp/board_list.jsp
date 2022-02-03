<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	<% request.setCharacterEncoding("utf-8"); %>
	<% String category = request.getParameter("category");
	%>
	
	<%	
		if(category == null)
			category = "journal";  //default
	%>
	
    <%@ include file= "header.jsp" %>
    </header>
    <section>
	
	<%
	int pageNumber = 1; //페이지 기본은 1로 설정
	// 만약 파라미터로 넘어온 오브젝트 타입 'pageNumber'가 존재한다면
	// 'int'타입으로 캐스팅을 해주고 그 값을 'pageNumber'변수에 저장한다
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	BbsDAO bbsDAO = new BbsDAO(); // 인스턴스 생성
	ArrayList<Bbs> list = bbsDAO.getList(pageNumber,category);
	
	int count =bbsDAO.selectCnt("bbs"); //전체행 수
	String tempStart = request.getParameter("page");
	int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
	int onePageCnt=10; // 한페이지에 출력할 행의 갯수
	count = (int)Math.ceil((double)count/(double)onePageCnt);
	// 페이지 수 저장
	
	if(tempStart != null){ // 처음에는 실행되지 않는다.
		startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
	}
	
%>

   	<div id="board_box">
	    <h3>
	    	실습일지
		</h3>
	    <ul id="board_list">
				<li>
					<span class="col1">번호</span>
					<span class="col2">제목</span>
					<span class="col3">작성자</span>
					<span class="col5">등록일</span>
					<span class="col6">조회</span>
				</li>
						<%
							for(int i = 0; i < list.size(); i++){
						%>
				<li>
					<span class="col1"><%= list.get(i).getRownum() %></span>
					<span class="col2"><a href="board_view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;")
							.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></span>
					<span class="col3"><%= list.get(i).getUserID() %></span>
					<span class="col5"><%= list.get(i).getBbsDate().substring(0, 11) %></span>
					<span class="col6"><%= list.get(i).getHit() %></span>
				</li>
				<%}%>	
	    	</ul>
	 		
		<ul class="row" style="display: flex; justify-content: center;">
			<form method="post" name="search" action="search.jsp">
				<table>
					<tr>
						<td>
						<select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="bbsTitle">제목</option>
								<option value="userID">작성자</option>
						</select>
						</td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
		</ul>
			
	    	<!-- 페이지 처리 부분 -->
	    	<ul id="page_num"> 	
	    		<%
				if(pageNumber != 1){
				%>
				<li><a href="board_list.jsp?pageNumber=<%=pageNumber - 1 %>">◀ </a> </li>
					<li>&nbsp;</li>
				<%}%>
				
				<%
					for(int i=1; i<=count; i++){ %>
					<li><a href="board_list.jsp?pageNumber=<%=i %>">[<%=i%>]
					</a></li>
					<li>&nbsp;</li>
					<% }; %>
					
					<%
					if(bbsDAO.nextPage(pageNumber + 1)){
					%>
					<li><a href="board_list.jsp?pageNumber=<%=pageNumber + 1 %>"> ▶</a></li>
					<li>&nbsp;</li>
					<%
					}
					%>
			</ul>
			<!----------------->
			
			<ul class="buttons">
			
				<li>
					<button onclick="location.href='board_list.jsp'">목록</button>
				</li>
			<% if(session.getAttribute("rank")!=null){
					if(category.equals("notice")&&!session.getAttribute("rank").equals("Admin")){
						
					}
					else{ 
				%>	
					<li>
						<button onclick="location.href='board_form.jsp?category=<%=category%>'">글쓰기</button>
					</li>
				<% 
					}
				}
				%>
			</ul>
	
			
	</div> <!-- board_box -->
</section> 
    
    <footer>
	<%@ include file= "footer.jsp" %>
    </footer>
</body>
</html>