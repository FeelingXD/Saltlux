<%@page import="imgResize.ImageResizer"%>
<%@page import="db.EnhancedConnect"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.io.*,java.util.*"%>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<% String category= request.getParameter("category");// category %>
<% String bbsID=request.getParameter("bbsID"); // String id %>
<% int id= Integer.parseInt(bbsID);  // int id%> 
<%
	String user_name =(String)session.getAttribute("user_name");
	EnhancedConnect ec= new EnhancedConnect();
%>
<%

    // request로 들어온 데이터 저장할 변수 선언
    Map<String, String> user = new HashMap<String, String>();

    // 이미지는 서버에 저장
    String saveDir = application.getRealPath("/image/"+id+"/"); // 저장할 경로 지정
    File pathDir = new File(saveDir);
    
 
    
    
    // 유효한 request인지 확인
    boolean isMultipart = FileUpload.isMultipartContent(request);
    String fileName = ""; // 업로드한 파일의 이름을 저장할 변수 설정
 
    try {
        if(isMultipart) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
 
            // 파일 업로드 핸들러 생성
            ServletFileUpload upload = new ServletFileUpload(factory);
 
            // 한글 인코딩
            upload.setHeaderEncoding("UTF-8");
 
            // request parsing
            List<FileItem> items = upload.parseRequest(request);
            Iterator<FileItem> iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = iter.next();
 
                // 한글 인코딩
                item.getString("UTF-8");
 
                if (item.isFormField()) {
                    // file 형식이 아닐 때
                    String name = item.getFieldName(); // 필드 이름
                    String value = new String((item.getString()).getBytes("8859_1"),"utf-8"); // 필드 값, 한글 인코딩
                    user.put(name,value);
                    
                } else {
                	 if(!pathDir.exists()){
                	    	pathDir.mkdirs();
                	  }
                	// file 형식일 때
                    fileName = new File(item.getName()).getName();
                	if(fileName.isEmpty()){
                		break ;
                	}
                    File storeFile = new File(saveDir + "/"  + fileName);
                    user.put("image", fileName);
                   	user.put("path", saveDir + "/"  + fileName);
                    
                   	// saves the file on disk
                   	if(!storeFile.exists()){ // if file not excists then save file .
                   		item.write(storeFile);
                    }
                   	ImageResizer ir = new ImageResizer(saveDir,storeFile,975,650);
                }
                
            }
          
            	// enhanced connect
            out.println("id ="+id);
            	
			ec.alter_hash(id, user);
            out.println(user_name + category);
			out.println("이미지가 있는지 =?"+user.get("image")!=null);
			
            for(String item : user.values()){
            	out.println(item);	
            }
            
            for(String item : user.keySet()){
            	out.println(item);
            }
            
            ec.close();
        }
    }
    catch ( Exception e ) { out.println(e); }
    finally
%>
<script type="text/javascript">location.replace('board_view.jsp?bbsID=<%=bbsID%>')</script>

