<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

<%-- 
 
       JSP : html, JavaScript, CSS, Java
       
       <%! 선언부(class, function, variable(global))  %>
       <%  코드부(제어문)    %>
       <%=value   %>
       : front end에서 Java를 사용하지 않기 위해서
       
       EL(Expression language) 
                    표현
       EL tag -> value
       core tag  -> 제어문. jar가 필요
       
       JSTL(Java server page Standard Tag Language)       
       
     . 형식
       $( 값, 연산식 }      
 --%>
 
 <%
    String str = "hello";
    request.setAttribute("str",	str);
 %>
 
 <% 
    String s = (String)request.getAttribute("str"); 
 %>
 
 <%
    out.print(s);
 %>
 <br><br>
 
s = <%=s %>
<br><br>

s = ${str } 
<br><br>

<%='값' %>
<br>

${'값' }
<br>

${2 + 3 }
<br><br>

${ 3>2?100:200 }
<br><br>

<% 
  request.setAttribute("data", "안녕하세요");
%>

${ data }
<br><br>

Object가 할당 되어 있는지?
<%
  Object obj = new String("hello");
  obj = null;
  if(obj == null){}
%>
<br><br>

object = ${ empty data }   <!-- true or false 옆 예제 같은 경우에는 데이터가 비어있으면 true 있으면 flase -->
<br>
object = ${ not empty data }
<br><br>

1 < 9 : ${ 1 < 9 }   <!-- 판별식(true/false) -->
<br>
2 + 3 : ${ 2 + 3 }    <!-- 연산식 value -->
<br><br>

<% 
   Integer a, b;
   a = 10;
   b = 3;
// $ { a } 이런식으로 바로 쓰지 못한다  setAttribute로 설정해줘야한다.

    request.setAttribute("a", a);
    request.setAttribute("b", b);
    
    Boolean c;
    c = false;
    
    request.setAttribute("c", c);
%>

<pre>

a: ${ a }
b: ${ b }
c: ${ c }

a+b:${a + b }

eq:${ a eq b } == ${ a == b }

ne:${ a ne b }
<%-- ne:${ a ! b } --%>

gt:${ a gt b }
gt:${ a > b }

lt:${ a lt b }
lt:${ a < b }

le:${ a le b } <!-- <= -->
ge:${ a ge b }  <!-- => -->

div:${ a div b }  <!-- a / b -->
div:${ a / b}

mod:${ a mod b}
mod:${ a % b }

c:${ !c }

${ a == 10 && !c }

<br>
</pre>

<% 
   MemberDto dto = new MemberDto(); 
   dto.setMessage("Hello EL");
%>

<%= dto.getMessage() %>
<br>
<%-- message:${dto.getmessage() } 접근불가 --%>

<%
  request.setAttribute("dto", dto);
%>

message:${ dto.message }
<br><br>

<%
String array[] = {"hello", "EL"};

request.setAttribute("array", array);

%>

<%= array[0] %>

${ array[1] }
<br><br>

<%
    List<String> list = new ArrayList<>();
    list.add("world");
    list.add("el");
    
    request.setAttribute("list", list);
%>

<%= list.get(0) %>
<br>

${ list[0] }
<br><br>

<%
   List<MemberDto> memlist = new ArrayList<>();

   MemberDto mem = new MemberDto();
   mem.setMessage("안녕하세요");
   memlist.add(mem);
    
   mem = new MemberDto();
   mem.setMessage("건강하세요");
   memlist.add(mem);

   request.setAttribute("memlist", memlist);
%>

<%= memlist.get(1).getMessage() %>
<br>
${ memlist[1].message }
<br><br>

<%
    HashMap<String, String> map = new HashMap<>();
     map.put("apple", "사과");
     map.put("grape", "포도");
     
     request.setAttribute("map", map);
%>

<%= map.get("apple") %>
<br>
${ map.apple }
<br>
${ map["apple"] }
</body>
</html>












































