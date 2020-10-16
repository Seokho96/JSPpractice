<%@page import="dao.suggestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
        	int seq = Integer.parseInt(request.getParameter("seq"));
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	suggestDao dao = suggestDao.getInstance();
   boolean isS = dao.deletebbs(seq);
   
   if(isS){
%>
       <script type="text/javascript">
       alert("삭제완료되었습니다");
       location.href = "bbslist.jsp";
       </script>
  
  <% }else{
	 %>
	    <script type="text/javascript">
	    alert("삭제를 실패했습니다");
	    location.href = "bbslist.jsp";
	    </script> 
 <% }
%>
</body>
</html>