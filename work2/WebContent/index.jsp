<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
   int z = 0;
    
%>
<% 
  int x = 0;
%>
   
   <p> Global 변수:  <%=z%> </p>
   <p> Local 변수:  <%=x %> </p>

<%    
   z++;
   
   x++;
%>
</body>
</html>