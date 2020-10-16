<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
       public String setColorHTML(String str, String color){
    	   return "<font color=\""+ color + "\">" + str + "</font>";
    }
       
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<font color="#ff0000">빨강 텍스트</font>

<%
String green = setColorHTML("녹색테스트", "#00ff00");
String blue = setColorHTML("파랑테스트", "#0000ff");
%>

<%=green%>
<%=blue%>


</body>
</html>