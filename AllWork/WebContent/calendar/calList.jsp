<%@page import="util.UtilEx"%>
<%@page import="calendarEx.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="calendarEx.CalendarDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
      //nvl 함수
      public boolean nvl(String msg){
    	return msg == null ||msg.trim().equals("")?true:false;
    }
    %>
   <%
    Object ologin = session.getAttribute("login");
   MemberDto mem = null;
   if(ologin == null){
	   response.sendRedirect("goCheck.jsp?proc=login");
   }
   
   mem = (MemberDto)ologin;
   %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 번호 제목 일정삭제 이렇게만 테이블로 만들기 누르면 디테일로 가기 -->

<div>
<table border="1">
<col width="100"><col width="300">
<tr>
<td colspan="2">일별 일정</td>
</tr>
<tr>

</tr>
<tr>

</tr>



</table>


</div>


</body>
</html>



























