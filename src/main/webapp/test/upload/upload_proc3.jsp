<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Map<String, String> articleMap = new HashMap<String, String>();
String encoding = "UTF-8";
File currentDirPath = new File("C:\\files\\upload");
DiskFileItemFactory factory = new DiskFileItemFactory();
/*제약조건 생성*/
factory.setSizeThreshold(1024*1024*1); //업로드 메모리크기
factory.setRepository(currentDirPath); //업로드 공간
ServletFileUpload upload = new ServletFileUpload(factory); //새 파일 업로드 핸들러

try {
	upload.setHeaderEncoding(encoding);
	List<FileItem> items = upload.parseRequest(request); //요청 구문 분석
	Iterator<FileItem> iter = items.iterator();
	while(iter.hasNext()) {
		FileItem item = iter.next();
		if(item.isFormField()) {//파일이 아니라면
			String name = item.getFieldName();
			String value = item.getString(encoding);
		}else {//파일이라면?
			String fieldNameName = item.getFieldName();
			String fileName = item.getName();
			File uploadFile = new File(currentDirPath + "/" + fileName);
			articleMap.put(fieldNameName, fileName);
			item.write(uploadFile);
			
		}
	}
	
}catch (Exception e) {
	e.printStackTrace();
}		
	
%>