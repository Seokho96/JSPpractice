<%@page import="dto.MemberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- forward(전진), include(불러오기) -->
<h3>index.jsp start</h3>
<jsp:include page="NewFile.jsp" flush="false"></jsp:include>
<h3>index.jsp end</h3>

<%-- <jsp:forward page="NewFile.jsp"></jsp:forward> --%>

<!-- EL, Core
Object 생성 -->

<%-- <%
     MemberDto dto = new MemberDto();
     dto.setMessage("안녕하세요");
     String msg = dto.getMessage();
     
     request.setAttribute("mem", dto);
%> --%>

<%-- ${ mem.message }
 --%>

<jsp:useBean id="dto" class="dto.MemberDto"></jsp:useBean>

<jsp:setProperty property="message" name="dto" value="안녕하세요!"/>

<jsp:getProperty property="message" name="dto" />

${ dto.message }




</body>
</html>









































