<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
	<form action="sign_up_progress.jsp" name="sign_up_form" METHOD="POST">
		<input type ="text" name = "id" placeholder="id">
		<input type = "password" name = "pw" placeholder="pw">
		<input type = "text" name = "name" placeholder="이름">
		<select name ="workplace">
			<option value="Saltlux">인공지능센터</option>
			<option value="Witches">위치스</option>
		</select>
		<input type = "text" name = "email1" placeholder="email">@<input type = "text" name ="email2" placeholder="email2">	
		<input type="button" onclick="sign_up_check()" value="제출">
	</form>
</body>
</html>