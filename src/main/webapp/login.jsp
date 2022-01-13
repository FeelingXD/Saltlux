<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">로그인</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">아이디</label> 
					<input	type="text" class="form-control" placeholder="ID"	name='j_username' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label> 
					<input 	type="password" class="form-control" placeholder="Password" name='j_password' required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
				<button class="btn btn btn-jm btn-success btn-block" type="submit">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>