<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/common.js">
	
</script>
</head>
<body>
	 <form name= "login_form" action="login_progress.jps">
	 	<input type="text" name ="id" placeholder ="id"/>	
	 	<input type="password" name = "pw" placeholder = "pw"/>
	 	<input type="button" onclick="login_check()" value="로그인"/>
	 </form>
</body>
</html>