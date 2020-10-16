<%@page import="dto.MemberDto"%>
<%@page import="dto.suggestDto"%>
<%@page import="dao.suggestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
        	request.setCharacterEncoding("utf-8");
        %>
    
    <%
        	int seq = Integer.parseInt(request.getParameter("seq"));
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%
	suggestDao dao = suggestDao.getInstance();
   suggestDto dto = dao.getBbs(seq);
      
   MemberDto mem = (MemberDto)session.getAttribute("login");
%>


<div align="center">
<h1>수정하기</h1>
</div>
<form action="bbsupdateAF.jsp" method="post">
<input type="hidden" value="<%=dto.getSeq()%>" name="seq">
<div align="center">
<div style="margin-left: 20px">ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="50" name="id" value="<%=dto.getId()%>" readonly="readonly"></div><br><br>
제목:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="50" name="title" value="<%=dto.getTitle()%>"><br><br>
<div style="margin-right: 420px">
내용:<br><br>
</div>
<textarea style="height: 500px; width: 500px" name="content"><%=dto.getContent() %></textarea><br><br>
<button type="button" id="list">글 목록</button>&nbsp;
<button type="submit" id="update">수정완료</button>

</div>
</form>
<script type="text/javascript">
$(document).ready(function() {
	$('#list').click(function() {
		location.href = "bbslist.jsp";
	});
	
});
</script>
</body>
</html>