<%@page import="java.util.Calendar"%>
<%@page import="calendarEx.CalendarDto"%>
<%@page import="calendarEx.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String sseq = request.getParameter("seq");
    int seq = Integer.parseInt(sseq);
  
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
  CalendarDto dto = dao.calDetail(seq);
  
  Calendar cal =  Calendar.getInstance();
  int tyear = cal.get(Calendar.YEAR);
  int tmonth =  cal.get(Calendar.MONTH);   // 0~11
  int tday = cal.get(Calendar.DATE);
  int thour = cal.get(Calendar.HOUR_OF_DAY);
  int tmin = cal.get(Calendar.MINUTE);
%>
<h1 align="center">일정 수정</h1>

<div align="center">

<form action="calUpdateAf.jsp" method="post">

<table border="1">
<col width="200"><col width="500">
<tr>
   <th>ID</th>
   <td>
       <%=dto.getId() %>
   </td>
</tr>
<tr>
   <th>제목</th>
   <td>
      <input type="text" value=" <%=dto.getTitle() %>" name="title">
   </td>
</tr>

   <tr>
   <th>일정</th>
    <td>
       <select name="year">
       <%
          
          for(int i = tyear - 5; i < tyear + 5; i++){
       %>
           <option <%=dto.getRdate().substring(0, 4).equals(i+"")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
       <% }%>
       </select>년
       
       <select name="month">
       <%
           int month = Integer.parseInt( dto.getRdate().substring(4,6));
          for(int i = 1; i <= 12; i++){
       %>
           <option <%=(month+"").equals(i+"")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
       <% }%>
       </select>월
        <select name="day">
       <%
         int day = Integer.parseInt( dto.getRdate().substring(6,8));
          for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
       %>
           <option <%=(day+"").equals(i+"")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
       <% }%>
       </select>일
       
       <select name="hour">
       <%
          for(int i = 1; i < 24; i++){
       %>
           <option <%=(thour + "").equals(i+"")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
       <% }%>
       </select>시
       <select name="min">
       <%
          for(int i = 1; i < 60; i++){
       %>
           <option <%=(tmin + "").equals(i+"")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
       <% }%>
       </select>분
       
    </td>
</tr>
    
<tr>
<th>내용</th>
<td>
<textarea rows="20" cols="60" name="content"><%=dto.getContent() %></textarea>
</td>
</tr>
<tr>
<td colspan="2" align="center">
    <input type="submit" value="일정수정">
    
</td>

</tr>
</table>

</form>

</div>


</body>
</html>