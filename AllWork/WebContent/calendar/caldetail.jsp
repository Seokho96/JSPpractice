<%@page import="dto.MemberDto"%>
<%@page import="calendarEx.CalendarDto"%>
<%@page import="calendarEx.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
      
      String sseq = request.getParameter("seq");
      int seq = Integer.parseInt(sseq);
      MemberDto mem = (MemberDto)session.getAttribute("login");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
  CalendarDao dao = CalendarDao.getInstance();
  CalendarDto dto = dao.calDetail(seq);

%>
<h1 align="center"><%=dto.getRdate().substring(0, 4) %>년 <%=dto.getRdate().substring(4, 6) %>월  <%=dto.getRdate().substring(6, 8) %>일  일정</h1>

<div align="center">

<form action="calUpdate.jsp" method="post">

<table border="1">
<col width="200"><col width="500">
<tr>
   <th>ID</th>
   <td>
       <%=dto.getId() %>
       <input type="hidden" name="id" value="<%=mem.getId()%>">
       <input type="hidden" name="seq" value="<%=dto.getSeq()%>">
   </td>
</tr>
<tr>
   <th>제목</th>
   <td>
       <%=dto.getTitle() %>
   </td>
</tr>
<tr>
   <th>일정</th>
    <td>    
     <%=dto.getRdate().substring(0, 4) %>년 <%=dto.getRdate().substring(4, 6) %>월  <%=dto.getRdate().substring(6, 8) %>일
    </td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="20" cols="60" name="content" readonly="readonly"><%=dto.getContent() %></textarea>
</td>
</tr>
<tr>
<td colspan="2" align="center">
    <input type="submit" value="일정수정">
    <button type="button" id="delete">일정삭제</button> 
</td>

</tr>
</table>

</form>

</div>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#delete").click(function() {
		let seq = <%=dto.getSeq()%>;
		location.href = "calDelete.jsp?seq="+seq;
	});
	
});

</script>

</body>
</html>