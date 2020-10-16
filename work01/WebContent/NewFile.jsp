<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String name = request.getParameter("name");
   String birth = request.getParameter("birth");
%>
<h1>-----사용자의 입력을 출력한다-----</h1>
● 이름: <%=name %> <br>
● 생년월일: <%=birth %>





</body>
</html>