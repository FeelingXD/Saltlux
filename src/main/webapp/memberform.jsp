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
<script src="./resources/js/common.js"></script>
<link rel ="stylesheet" href ="./resources/css/member.css" />
<meta charset="EUC-KR">
<title>회원가입</title>

<script type="text/javascript">

//아이디 중복 체크 화면 open
	function check_id() {	
		if(document.member_form.id.value =="" || document.member_form.id.value.length < 0){
			alert("아이디를 먼저 입력해주세요")
			document.member_form.id.focus();
		}else{
			window.open("check_id.jsp?id="+document.member_form.id.value,"","width=500, height=300, resizable = no, scrollbars = no");
		}
	}

</script>

</head>
<body>
<header>
    	<%@ include file= "header.jsp" %>
</header>
        <div id="main_content">
      		<div id="join_box">
          	<form  name="member_form" method="post" action="member_insert.jsp">
			    <h2>회원 가입</h2>
    		    	<div class="form id">
				        <div class="col1">아이디</div>
				        <div class="col2">
							<input type="text" name="id" placeholder ="영문+숫자만 가능합니다."tag="아이디">
				        </div>  
				        <div class="col3">
				        	<a href="#"><img src="./resources/img/check_id.gif"
				        		onclick="check_id()"></a>
				        </div>                 
			       	</div>
			       	<div class="clear"></div>

			       	<div class="form">
				        <div class="col1">비밀번호</div>
				        <div class="col2">
							<input type="password" name="pass" placeholder="영문+숫자만 가능합니다." tag="비밀번호">
				        </div>                 
			       	</div>
			       	<div class="clear"></div>
			       	<div class="form">
				        <div class="col1">비밀번호 확인</div>
				        <div class="col2">
							<input type="password" name="pass_confirm" tag="비밀번호 확인">
				        </div>                 
			       	</div>
			       	<div class="clear"></div>
			       	<div class="form">
				        <div class="col1">이름</div>
				        <div class="col2">
							<input type="text" name="name" tag="이름">
				        </div>                 
			       	</div>
			       	<div class="clear"></div>
			       	<div class="form email">
				        <div class="col1">이메일</div>
				        <div class="col2">
							<input type="text" name="email1" tag="이메일">@<input type="text" name="email2" tag="이메일">
				        </div>                 
			       	</div>
			       	<div class="clear"></div>
			       	<div class="clear"></div>
			       	<div class="form email">
				        <div class="col1">기업선택</div>
				        <div class="col2">
							 <select name="Work">
							 	<option value="Saltlux"> 광주인공지능센터 </option>
							 	<option value="Witches"> 위치스 </option>
							 	<option value="EglooSecurity"> 이글루시큐리티 </option>
							 </select>
				        </div>                 
			       	</div>
			       	<div class="clear"></div>
			       	<div class="bottom_line"> </div>
			       	<div class="buttons">
	                	<img style="cursor:pointer" src="./resources/img/button_save.gif" onclick="check_input_memberform('member_form')">&nbsp;
                  		<img id="reset_button" style="cursor:pointer" src="./resources/img/button_reset.gif"
                  			onclick="document.member_form.reset()"/>
	           		</div>
           	</form>
        	</div> <!-- join_box -->
        </div> <!-- main_content -->
<footer>
	<%@ include file= "footer.jsp" %>
</footer>
</body>
</html>