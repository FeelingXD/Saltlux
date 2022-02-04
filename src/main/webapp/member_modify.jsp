<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="db.EnhancedConnect"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
    
    <!-- this -document is for sign up -->
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
<link rel ="stylesheet" href ="./resources/css/member.css" />

<% EnhancedConnect ec= new EnhancedConnect(); %>
	<%
	String n = (String)session.getAttribute("user_name");
	String sql = "select * from member where name = ?";
	ResultSet rs =ec.select(sql, n);
	if (rs.next()) {
		String[]email = rs.getString("email").split("@");
%>

<script>
function mem_delete() {
	//회원탈퇴
	document.member_form.action='member_modify_delete.jsp';
	document.member_form.submit();
	window.open("member_modify_delete.jsp?id="+document.member_form.id.value,"","width=500, height=300, resizable = no, scrollbars = no");
}
function modify(){
	document.member_form.action='member_modify_update.jsp';
	document.member_form.submit();
}

</script>
<title>회원가입</title>
</head>
<body>
<header>
    	<%@ include file= "header.jsp" %>
    </header>
       
        <div id="main_content">
      		<div id="join_box">
          	<form  name="member_form" method="post" action="#">
			    <h2>회원 정보수정</h2>
    		    	<div class="form id">
				        <div class="col1">아이디</div>
				        <div class="col2">
							<input type="text" value="<%=rs.getString("id") %>" name =id readonly> 
				        </div>                 
			       	</div>
			       	<div class="clear"></div>

			       	<div class="form">
				        <div class="col1">비밀번호</div>
				        <div class="col2">
							<input type="password" name="pass" value="<%=rs.getString("pw") %>">
				        </div>                 
			       	</div>
			       	<div class="clear"></div>
			       	<div class="form">
				        <div class="col1">비밀번호 확인</div>
				        <div class="col2">
							<input type="password" name="pass_confirm" value="<%=rs.getString("pw") %>">
				        </div>                 
			       	</div>
			       	<div class="clear"></div>
			       	<div class="form">
				        <div class="col1">이름</div>
				        <div class="col2">
							<input type="text" name="name" value="<%=rs.getString("name") %>">
				        </div>                 
			       	</div>
			       	
			       	<div class="clear"></div>
			       	<div class="form email">
				        <div class="col1">이메일</div>
				        <div class="col2">
							<input type="text" name="email1" value=<%=email[0]%>>@<input 
							       type="text" name="email2" value=<%=email[1]%>>
				        </div>                 
			       	</div>
			       	<div class="clear"></div>
			       	<div class="clear"></div>
			       	<div class="form email">
				        <div class="col1">기업선택</div>
				        <div class="col2">
							 	<%-- <input type="text" value="<%=rs.getString("workplace") %>"> --%>
							 <select name="Work" >
							 	<option value="Saltlux"> 광주인공지능센터 </option>
							 	<option value="Witches"> 위치스 </option>
							 	<option value="EglooSecurity"> 이글루시큐리티 </option>
							 </select>
				        </div>                 
			       	</div>
			       	<div class="clear"></div>
			       	<div class="bottom_line"> </div>
			       	
	           		<div class="buttons">
	           			<button onclick="mem_delete()">회원탈퇴</button>
	                	<img style="cursor:pointer" src="./resources/img/button_save.gif" onclick="modify()">&nbsp;
                  		<img id="reset_button" style="cursor:pointer" src="./resources/img/button_reset.gif"
                  			onclick="reset_form()">
	           		</div>
           	</form>
<%
		}		
%>
        	</div> <!-- join_box -->
        </div> <!-- main_content -->
	 
        <footer>
	<%@ include file= "footer.jsp" %>
    </footer>
</body>
</html>