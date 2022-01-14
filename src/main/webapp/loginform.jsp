<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./resources/css/common.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<link rel="stylesheet" type="text/css" href="./resources/css/login.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<header>
    	<%@ include file= "header.jsp" %>
    </header>
    	<section>
	
        <div id="main_content">
      		<div id="login_box">
	    		<div id="login_title">
		    		<span>로그인</span>
	    	    </div>
        <div id="login_form">
          <form  name="login_form" method="post" action="login.php">
            <ul>
              <li><input type="text" name="id" placeholder="아이디"></li>
              <li><input type="password" id="pass" name="pass" placeholder="비밀번호" ></li>
              <li><a href="#"><img src="./resources/img/login.png" onclick="check_input()"></a></li> <!-- pass -->
              
               <a href="member_form.php"><img src="./img/member_button.png"></a>
              <a href="./index.php"><img src="./img/mainpage_button.png"></a>
            </ul>
          </form>

        		</div> <!-- login_form -->
    		</div> <!-- login_box -->
        </div> <!-- main_content -->
	</section
</body>
</html>