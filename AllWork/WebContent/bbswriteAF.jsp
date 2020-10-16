<%@page import="dto.suggestDto"%>
<%@page import="dao.suggestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
        	request.setCharacterEncoding("utf-8");
        %>
    <%
    	String id = request.getParameter("id");
              String title = request.getParameter("title");
              String content = request.getParameter("content");

              System.out.println(id);
              System.out.println(title);
              System.out.println(content);
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
      
        boolean isS = dao.writeBbs(new suggestDto(id, title, content));
      
        if(isS){
 %>
  <script type="text/javascript">
	alert("글쓰기 성공!");
	location.href = "bbslist.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("글쓰기 실패! 다시 작성바랍니다");
	location.href = "bbswrite.jsp";
	</script>
<%
}
%> 

</body>
</html>