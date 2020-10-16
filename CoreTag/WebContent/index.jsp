<%@page import="java.util.Map"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
   jstl.jar, standard.jar
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
   EL: 표현식(값, 핀별)
   Core: 제어문(for, if) + EL     (EL tag만  사용하는건 가능하지만 Core tag만 사용하는것은 불가능하다)
 -->
<%
   request.setAttribute("data", "JSTL입니다");
%>
${ data }
<br><br>

<%-- <%
  String cdata = "core JSTL입니다";
  request.setAttribute("cdata", cdata);
%> --%>

<!-- Core tag -->
<c:set var="cdata" value="core JSTL입니다" />
${ cdata }
<br><br>

<%
  session.setAttribute("sessionData", "저장된 데이터");
%>
<c:set var="sdata" value="${ sessionData }" />
<c:out value="${sdata }"/>
<br><br>

<!-- if -->
<%
   request.setAttribute("count", "10");
%>

<%
  String scount = (String)request.getAttribute("count");
  int count = Integer.parseInt(scount);
  if(count >= 10){
	 %>
	 <p>count:<%=count %></p> 
	 <% 
  }
%>
<c:if test="${count >= 10 }">
     <p>core count:<c:out value="${count }"></c:out></p>
</c:if>
<br>
<%
   request.setAttribute("name", "홍길동");
%>
<c:if test="${ name eq '홍길동'}">
    <p>이름은 홍길동 입니다</p>
</c:if>

<%
  request.setAttribute("name", "일지매");
%>

<c:if test="${name == '일지매' }" var="flg"/>

<c:if test="${flg }" >
    <p>이름은 일지매입니다 </p>
</c:if>

<!-- for -->

<%

   for(int i = 0; i < 10; i ++){
	   %>
	   <%=i %>
    <%
   }
%>

<br>
<c:forEach begin="0" end="9" step="1" varStatus="i">
    <c:out value="${i.index }"></c:out>
</c:forEach>

<%
   List<MemberDto> list = new ArrayList<>();
   
   MemberDto mem = new MemberDto();
   mem.setMessage("안녕하세요");
   list.add(mem);

   mem = new MemberDto();
   mem.setMessage("건강하세요");
   list.add(mem);

   mem = new MemberDto();
   mem.setMessage("성공하세요");
   list.add(mem);
   
   request.setAttribute("list", list);
%>

<%
   for( int i = 0; i < list.size(); i++){
	   MemberDto m = list.get(i);
   }
   for( MemberDto m : list){
   }
%>

<c:forEach begin="0" end="2" var="m" items="${list}" varStatus="i">
  <p> index:<c:out value="${i.index }"/></p>
  <p> data:<c:out value="${m.message }"/></p>
</c:forEach>

<!-- Map -->
<%
   Map<String, String> map = new HashMap<>();
   
   map.put("apple", "사과");
   map.put("watermelon", "수박");
   map.put("orange", "오렌지");
   
   request.setAttribute("map", map);
%>
<c:forEach var="obj" items="${map }">
       key:<c:out value="${obj.key }"/>
       <c:out value="${obj.value }"></c:out>
</c:forEach>
</body>
</html>
































