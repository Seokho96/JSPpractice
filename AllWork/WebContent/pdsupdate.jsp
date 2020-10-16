<%@page import="dto.PdsDto"%>
<%@page import="dao.PdsDao"%>
<%@page import="java.util.Date"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String sseq = request.getParameter("seq");
    int seq = Integer.parseInt(sseq);
    
       MemberDto mem = (MemberDto)session.getAttribute("login");  

    //시간을 취득
    String fname = (new Date().getTime()) + "";
    System.out.println("fname: "+ fname);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
PdsDao dao = PdsDao.getInstance();
PdsDto dto = dao.detailPds(seq);
%>
<h1>자료 수정하기</h1>
<div align="center">

<%--
     id   -> String    form field data
     title -> String 
     content -> String
     
     file  -> byte
 --%>
<form action="pdsupdateAf.jsp" method="post" enctype="multipart/form-data">   <!-- multipart 양쪽 타입을 이용할 수 있게 해줌 -->
<input type="hidden" value="<%=dto.getSeq() %>" name="seq">
<table border="1">
<col width="200"><col width="500">

<tr>  
   <th>아이디</th>
   <td><%=mem.getId() %>
       <input type="hidden" value="<%=mem.getId() %>" name="id">
  </td>
</tr>
<tr>
<th>제목</th>
<td> 
  <input type="text" name="title" size="50" value="<%=dto.getTitle()%>">
</td>
</tr>
<tr>
   <th>파일업로드</th>
   <td>
     <%=dto.getFilename() %>
    <input type="hidden" value="<%=dto.getFilename() %>" name="filename">
			<input type="file" name="fileload" style="width: 400px">
			
   </td>
</tr>
<tr>
   <th>내용</th>
   <td>
       <textarea rows="20" cols="50" name="content"><%=dto.getContent() %></textarea>
   </td>
</tr>
<tr align="center">
    <td colspan="2">
    <input type="submit" value="수정하기">
    </td>
</tr>
</table>

</form>
</div>


</body>
</html>