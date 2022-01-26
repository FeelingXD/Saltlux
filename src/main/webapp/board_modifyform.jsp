<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs"%>
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
<section>
<% request.setCharacterEncoding("utf-8"); %>
	<%
		// 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("user_name") != null){
			userID = (String)session.getAttribute("user_name");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='loginform.jsp'");
			script.println("</script>");
		}
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
		//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='board_list.jsp'");
			script.println("</script>");
		}
	%>
   	<div id="board_box">
	    <h3 id="board_title">
	    		실습일지 > 글 수정
		</h3>
	    <form name="board_form" method="post" action="board_modify.jsp?bbsID=<%= bbsID %>" >
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
	    			<span class="col2"><input name="bbsTitle" type="text" value="<%=bbs.getBbsTitle() %>"></span>
	    		</li>	    	
	    		<li id="text_area">	
	    			<span class="col1">내용 : </span>
	    			<span class="col2">
	    				<textarea name="bbsContent"><%=bbs.getBbsContent() %></textarea>
	    			</span>
	    		</li>
	    		
	    	    </ul>
	    	<ul class="buttons">
				<li><button type="submit" >완료</button></li>
				<li><button type="button" onclick="location.href='board_list.jsp'">목록</button></li>
			</ul>
		
	    </form>
	</div> <!-- board_box -->
</section> 
</header>
<footer> 
	<%@ include file= "footer.jsp" %>

</footer>
</header>
</body>
</html>