<%@page import="util.UtilEx"%>
<%@page import="calendarEx.CalendarDto"%>
<%@page import="calendarEx.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String sseq = request.getParameter("seq");
    int seq = Integer.parseInt(sseq);
    String content = request.getParameter("content");
    String title = request.getParameter("title");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String hour = request.getParameter("hour");
    String min = request.getParameter("min");
    String id = request.getParameter("id");
    String rdate = year + UtilEx.two(month) + UtilEx.two(day) + UtilEx.two(hour) + UtilEx.two(min);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
   CalendarDao dao = CalendarDao.getInstance();
  if(content == null || title == null){
%>
<script type="text/javascript">
alert("일정의 제목과 내용을 모두 입력해주세요");
location.href = "calendar.jsp";
</script>
	  <%
  }else{
	  boolean isS = dao.updateCalendar(new CalendarDto( id, title, content, rdate), seq);
	  if(isS){
		  %>
	 <script type="text/javascript">
	 alert("수정완료");
	 location.href = "calendar.jsp";
	 </script>
	 <% }else{
		 %>
		 <script type="text/javascript">
alert("일정의 제목과 내용을 모두 입력해주세요");
location.href = "calendar.jsp";
</script>
		 <% 
	 }
%>
    
<%} %>
</body>
</html>









