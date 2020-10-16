<%@page import="dto.suggestDto"%>
<%@page import="dao.suggestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    %>
     <%
     	int seq = Integer.parseInt(request.getParameter("seq"));
             String title = request.getParameter("title");
             String content = request.getParameter("content");
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

    if(title != null || content != null){
    
    dao.BbsUpdate(title, content, seq);
%>
    <script type="text/javascript">
    location.href = "bbslist.jsp";
    </script>
    <%
    }
    else{
    	%>
    	<script type="text/javascript">
    	alert("수정에 실패했습니다");
    	</script>
   <% }
%>


</body>
</html>