<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.jsp"><img src="./resources/img/logo.png" style="width:30px;margin-top: -6px;"></a>
    </div>

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">기업정보<span class="caret"></span></a>
          <ul class="dropdown-menu">
             <li><a href="">소개</a></li>
            <li><a href="">소개</a></li>
            <li><a href="">소개</a></li>    
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="">공지사항</a></li><!-- 만들것 -->
            <li><a href="board_list.jsp">실습일지</a></li>
          </ul>
        </li>
         <li><a href=""target="no_blank">사진첩</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <% if(session.getAttribute("user_name")==null){ %>    
        <li><a href="memberform.jsp"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
        <li><a href="loginform.jsp"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
     	<% }else{  %>
     	<li><a href="memberform.jsp"><span class="glyphicon glyphicon-user"></span><%=session.getAttribute("user_name")%> 님</a></li>
        <li><a href="log_out.jsp"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
     	<% } %>
     </ul>
    </div>
  </div>
</nav>
