<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">정보<span class="caret"></span></a>
          <ul class="dropdown-menu">
             <li><a href="game_form.php">소개</a></li>
            <li><a href="agent_form.php">소개</a></li>
            <li><a href="map_form.php">소개</a></li>
            
          </ul>
        </li>
       
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="admin_board_list.php">공지사항</a></li>
            <li><a href="board_list.jsp">실습일지</a></li>
          </ul>
        </li>
         <li><a href=""target="no_blank">사진첩</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
<?php
    if(!$userid) {
?>         
        <li><a href="memberform.jsp"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
        <li><a href="loginform.jsp"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        <?php
    } else {
                $logged = $username."(".$userid.")님";
?>
     </ul>
    </div>
  </div>
</nav>
