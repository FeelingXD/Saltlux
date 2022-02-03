<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@ page import="java.util.Enumeration" %>

<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<title>JSP 게시판 웹 사이트</title>
</head>
<body>

	<%

		String category= request.getParameter("category");

		// 현재 세션 상태 체크
		String userID = null;
		if(session.getAttribute("user_name") != null){
			userID = (String)session.getAttribute("user_name");
		}
		// 로그인한 유저만 글쓰기 가능
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='loginform.jsp'");
			script.println("</script>");
		}else{
			// 입력이 안 된 부분이 있는지 체크한다
			if(multi.getParameter("bbsTitle") == null || multi.getParameter("bbsContent") == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
				
				BbsDAO bbsDAO = new BbsDAO();

				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				

				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공')");
					script.println("location.href='board_list.jsp'");
					script.println("</script>");
				}
			}
		}
	
	%>
	</body>
</html>