<%@page import="dto.MemberDto"%>
<%@page import="dao.suggestDao"%>
<%@page import="dto.suggestDto"%>
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
<style type="text/css">
td {

  text-align: center;

}
</style>
</head>
<body>
<%
	suggestDao dao = suggestDao.getInstance();
   suggestDto parentBbs = dao.getBbs(seq);
   MemberDto mem = (MemberDto)session.getAttribute("login");
%>
<!-- 
  기본글
  작성자
  제목
  작성일
  조회수
  정보 
  내용
 
답글 
   아이디 login id  <- session id  
  제목
  내용
 -->
 
 
<h1>기본글</h1>
<div align="center">
<table border="1">
<col width="70"><col width="180">
<tr><td>제목</td>
     <td><%=parentBbs.getTitle() %></td><tr>
<tr>
   <td align="center">작성자</td><td><%=parentBbs.getId() %></td>
</tr>
<tr> <td align="right">조회수</td><td> <%=parentBbs.getReadcount() %></td></tr>
 <tr><td align="center">작성일</td><td><%=parentBbs.getWdate() %></td></tr>
 <tr><td align="center">정보</td><td></td></tr>
 <tr><td>내용</<td><td><textarea style="height: 150px; width: 700px"><%=parentBbs.getContent() %></textarea></td></tr>
</table>
<br>

</div>
<br>

<h1>답글</h1>
<form action="answerAF.jsp" method="post">
<input type="hidden" name="seq" value="<%=parentBbs.getSeq()%>">
<div align="center">
<table border="1">
<col width="200"><col width="500">

<tr>
   <td align="center">아이디</td><td><input type="text" name="id" readonly="readonly" size="50"
			value="<%=mem.getId() %>"></td>
</tr>
   <tr><td>제목</td>
     <td><input type="text" name="title" size="50"></textarea></td><tr>
  <tr><td>내용</<td><td><textarea rows="10" cols="70" name="content"></textarea></td></tr>
 <tr>
	<td colspan="2" align="center">
		<input type="submit" value="답글추가">
	</td>
</tr>
 
 
</table>
<div align="right"><a href="bbslist.jsp">목록으로 돌아가기</a></div>
</div>
</form>
<%-- <button type="button" onclick="Answer(<%=dto.getSeq()%>)">댓글</button> --%>
<%-- <form action="answer.jsp" method="get">
<div align="center">
   <input type="hidden" name="seq" value="<%=parentBbs.getSeq()%>">
   <input type="submit" value="댓글">
</div> --%>
</form>
</body>
</html>