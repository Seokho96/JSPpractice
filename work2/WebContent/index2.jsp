<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! 
    int a = 0; 
     
%>

<table border="2">
   
   <%
      a++;
   for(int j = 0; j < a; j++){
      %>
      <tr>
       
      <% if(j == 10){
      for(int i = 0; i< 11; i++){%>
       <td> <%=j %> * <%=i%> = <%= j*i %></td>   
      <%
      }
      } 
      else{
      for(int i = 0; i < 10; i++){ 
       %>      
       <td> <%=j %> * <%=i%> = <%= j*i %></td>   
  <%
      }
      }
   %>
   </tr>
    
    <%      
   }

   %>
   
   
   
   


</table>


</body>
</html>