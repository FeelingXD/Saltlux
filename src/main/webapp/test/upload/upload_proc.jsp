<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.io.*,java.util.*"%>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%
    // request로 들어온 데이터 저장할 변수 선언
    Map<String, String> user = new HashMap<String, String>();
 
    // 이미지는 서버에 저장
    String saveDir = application.getRealPath("/image/"); // 저장할 경로 지정
 	out.println(saveDir);
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
                    // file 형식일 때

                    fileName = new File(item.getName()).getName();
                    File storeFile = new File(saveDir + "/"  + fileName);
                    user.put("user_img",fileName);
                    // saves the file on disk
                    item.write(storeFile);
                }
            }
        }
    }
    catch ( Exception e ) { out.println(e); }
%>