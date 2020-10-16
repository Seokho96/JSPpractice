<%@page import="dao.PdsDao"%>
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
  PdsDao dao = PdsDao.getInstance();
  boolean isS = dao.deletePds(seq);
   
  if(isS){
%>
    <script type="text/javascript">
    alert("삭제 되었습니다");
    location.href = "pdslist.jsp";
    </script>

<%} else{%>

<script type="text/javascript">
   alert("삭제 실패");
   location.href = "pdsdetail.jsp?seq=<%=seq%>";

</script>
<%} %>
</body>
</html>