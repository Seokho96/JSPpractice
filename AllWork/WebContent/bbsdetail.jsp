<%@page import="dto.MemberDto"%>
<%@page import="dto.suggestDto"%>
<%@page import="dao.suggestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
        	String seq2 = request.getParameter("seq");
                    
                     int seq = Integer.parseInt(seq2);
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<!-- 
     작성자(id)
        제목
    작성일
    조회수
    정보
    내용  textarea     -->
<body>

<%-- <h4 align="right" style="background-color: #f0f0f0">
  환영합니다<%=dto.getId() %>님
</h4> --%>
<%
	suggestDao dao = suggestDao.getInstance();
    dao.readcount(seq);
   suggestDto dto = dao.getBbs(seq);
   MemberDto mem = (MemberDto)session.getAttribute("login");
%>


<div align="center">

<table>
<tr><td><h1 align="center"><%=dto.getTitle() %></h1></td><tr>
<tr>
   <td align="center">작성자: <%=dto.getId() %></td>
</tr>
<tr> <td align="right">조회수: <%=dto.getReadcount() %></td></tr>
 <tr><td align="center">작성일: <%=dto.getWdate() %></td></tr>
  <tr><td align="center">정보: <%=dto.getRef() %>-<%=dto.getStep() %>-<%=dto.getDepth() %></td></tr>
</table>
<br>
<textarea style="height: 500px; width: 500px" name="content"><%=dto.getContent() %></textarea>
</div>
<br><br>

<div align="right"><a href="bbslist.jsp">목록으로 돌아가기</a></div>

<%
   if(dto.getId().equals(mem.getId())){
	   %>
 <div align="center">   <button type="button" onclick="updateBbs(<%=dto.getSeq()%>)">수정하기</button>
	   <button type="button" onclick="deleteBbs(<%=dto.getSeq()%>)">삭제하기</button>  
	   </div><br>
	   <%
   }
%>

<%-- <button type="button" onclick="Answer(<%=dto.getSeq()%>)">댓글</button> --%>
<form action="answer.jsp" method="get">
<div align="center">
   <input type="hidden" name="seq" value="<%=dto.getSeq()%>">
   <input type="submit" value="댓글">
</div>
</form>
<script type="text/javascript">
function updateBbs(seq) {
	location.href = "bbsupdate.jsp?seq=" + seq;
}

function deleteBbs(seq) {
	
	if("<%=dto.getId()%>" == "<%=mem.getId()%>"){
		
	location.href = "bbsdelete.jsp?seq=" + seq;
	
	}
	else{
		alert("권한이 없습니다");
	}
}
</script>

</body>
</html>






















