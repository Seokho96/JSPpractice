<%@page import="dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   
   
    
   CustUserDto dto = (CustUserDto)request.getAttribute("custdetail");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>



<table border="1" style="width: 700px; height: 220px; text-align: center;" >
<col width="100"><col width="300">

<tr >
<th>ID</th>
<td id="id"><%=dto.getId() %></td>
</tr>

<tr>
<th>Name</th>
<td><%=dto.getName() %></td>
</tr>

<tr>
<th>Address</th>
<td><%=dto.getAddress() %></td>
</tr>

</table>
<br><br>


<table style="margin-left: 150px">
<tr>
<td><button type="button" id="_update" style="width: 150px; height: 50px; background-color: #FFCCFF;">수정</button></td>
</tr>
</table>


<form id="del_frm" method="post">
<input type="hidden" name="id" value="<%=dto.getId()%>">
<table style="margin-left: 150px">
<tr>
<td><button type="button" id="_delete" style=" width: 150px; height: 50px; background-color: #FFCCFF; ">삭제</button></td>
</tr>
</table>
</form>
<script type="text/javascript">
$(document).ready(function() {
	let id = $("#id").text();
	
	$('#_update').click(function() {
		
		location.href = "custuserupdate.jsp?id="+id;
		
	});
	$('#_delete').click(function() {
       
		$("#del_frm").attr("action", "deleteuser").submit();

	});
});
</script>
</body>
</html>


























