<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form id="go_form" name="go_form" method="post" enctype="multipart/form-data" 
action="upload_proc.jsp">
    이름<input type="text" placeholder="이름을 입력하세요" name="user_name" maxlength="20" id="user_name">
    파일<input type="file" id="user_img" name="user_img">
    <button type="button" id="delFile" onclick="del_file()">파일 삭제</button>
    <button type="submit">submit</button>
</form>
