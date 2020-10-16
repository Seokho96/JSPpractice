<%@page import="dto.suggestDto"%>
<%@page import="dao.suggestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    %>
    <%
    	int seq = Integer.parseInt(request.getParameter("seq"));   // 목적: ref(그룹번호)설정
               String id = request.getParameter("id");
               String content = request.getParameter("content");
               String title = request.getParameter("title");
               
               System.out.println(seq);
               System.out.println(id);
               System.out.println(content);
               System.out.println(title);
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
   boolean isS = dao.answer(seq, new suggestDto(id, title, content));
   
   if(isS){
%>
	    <script type="text/javascript">
	    alert("답글 입력 성공");
	    location.href = "bbslist.jsp";
	    </script>   
	   <% 
   }else{
   %>
   <script type="text/javascript">
   alert("답글 입력 실패");
   location.href = "bbslist.jsp";
   </script>
   <% 
   }
   %>

</body>
</html>