<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
      Date nowTime = new Date();
      int hour = nowTime.getHours();
      Calendar cal = Calendar.getInstance();
      int nowHour = cal.get(Calendar.HOUR_OF_DAY);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   out.println("<h1>Hello World!</h1><br><br>");
   out.println("Hello World!<br><br>");
%>

<p>현재시간은<%=nowTime %>입니다</p>
<br>

<p>현재는<%=hour%>시 입니다.</p>
<%
   if(nowHour >= 6 && nowHour <= 9){
	   out.println("<p>안녕히 주무셨어요</p>");
   }
   else if(nowHour >= 12 && nowHour <= 14){
	   out.println("<p>점심 맛있게 드셨어요?</p>");
   }
   else if(nowHour >= 20 && nowHour <= 23){
	   out.println("<p>안녕히 주무세요</p>");
   }
   else{
	   out.println("<p>안녕하세요</p>");
   }
%>
</body>
</html>