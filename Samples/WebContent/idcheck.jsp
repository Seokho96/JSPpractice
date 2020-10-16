<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
  String id = request.getParameter("id");
     
    MemberDao dao = MemberDao.getInstance();
    
    boolean check = dao.getId(id);
    
    if(check == true){
    	out.println("YES");
    }else{
    	out.println("NO");
    }
%>

</body>
</html>