<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
       String str = "Hello JSP";
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- HTML 주석문 -->

<%-- JSP 주석문  --%>

<%-- 
   JSP : Java Server Page
   
                                        Web Application Server    
                      request           |                    |
   Client(Html...)     ---- >       Web Server    ---- >  Container    ---- > DB(Server)
                                        |                    |       
                       request들어오기 전까지 대기(Thread로 돌면서)
 
 Client                 request가 들어오면 "내가 찾아줄게!" -->   Servlet(Get, Post)  
 html                                                       java(html)
 Java Script                                                 Jsp(--)
 CSS                                   해석                
 JQuery(Ajax)              < ------                               
                              response
--(Ajax만 사용!)--                       
|- Vue(인기 좋음),                                                                           
|- React
( 많이 사용(오래됨))                                       
                   
  --%> 

<h1>Hello JSP</h1>

<%
     //java 영역
     //Scriptlet = script + applet
     System.out.println("console 출력");


  /* 
           내장(암시)객체 : new를 통해서 생성하지 않고 바로 사용할 수 있는 class
      
      out         -> Scriptlet(java)에서 Web으로 출력해 주는 객체
      request     -> 매개변수의 값을 취득하는 경우 사용하는 객체, 객체를 저장시에도 사용
      response    -> 이동을 실시하는 객체. sendRedirect
      session     -> 객체를 저장시에도 사용
      pageContext -> forward
  
  
  */

%>
<%
  out.println("<h3>Hello Jsp</h3>");
%>

<%
System.out.println("str = " + str);
out.println("str = " + str);
%>
<br>
<%=str %>
<% 
for(int i = 0; i< 10; i++){
%>
<p class="demo">p tag <%=i %></p>
<%
}
%>

<%
for(int i = 0; i< 10; i++){
	out.println("<p class='demo'>p tag "+ i + "</p>");
}
%>

<%-- 
     jsp, html 차이점
     jsp = java코드와 html코드를 같이 사용할 수 있고 스크립트 문법을 쓸 수 있다
     html은 입력박고 넘겨주는 처리가 가능. 넘겨받은 값을 출력해 주는 것은 어렵다.  -> 가능하게 하는것이 Ajax 
  
 --%>
 
 str: <input type="text" value="<%=str %>">
 <br>
 <p><%=str %></p>
 <textarea rows="10" cols="20"><%=str %></textarea>
</body>
</html>













































