

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>custuserdetail</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<h1>고객정보</h1>

<table style="width: 600">
<col width="200"><col width="400">

<tr>
	<td height="2" bgcolor="#00ff00" colspan="3"></td>
</tr>

<tr bgcolor="#f6f6f6">
	<th id="titleAfid">ID</th>
	
</tr>

<tr>
	<td height="2" bgcolor="#00ff00" colspan="3"></td>
</tr>

<tr bgcolor="#f6f6f6">
	<th id="titleAfName">이름</th>
	 	
</tr>

<tr>
	<td height="2" bgcolor="#00ff00" colspan="3"></td>
</tr>

<tr bgcolor="#f6f6f6">
	<th id="titleAfAddress">주소</th>
		
</tr>

<tr>
	<td height="2" bgcolor="#00ff00" colspan="3"></td>
</tr>

<tr>
	<td colspan="2" align="center">
		<button type="button" id="updateBtn">수정</button>
		
		<%-- 
		<form action="custuserupdate.jsp">
			<input type="hidden" name="id" value="<%=dto.getId() %>">			
			<input type="submit" value="수정">
		</form>
		 --%>
		
		<button type="button" id="deleteBtn">삭제</button>
	</td>
</tr>

<tr>
	<td height="2" bgcolor="#00ff00" colspan="3"></td>
</tr>

</table>



<script type="text/javascript">
$(document).ready(function () {
	alert(<%=request.getAttribute("id")%>);
	$.ajax({
		
		url:'detail',
		type:'get',
		data:<%=request.getAttribute("id") %>,
		success: function (datas) {
			
			/* let custdetail = datas.map.custdetail; */
			alert(datas);
			
			
		},
		error: function () {
			alert('error');
		}
		
		
	});
	
	
	
	
	$("#updateBtn").click(function () {		
		location.href = "update?work=updateView&id=" + $("#id").text();
	
	//	let id = $("#id").text();
	//	alert(id);
	
	//	let id = "<%=request.getAttribute("id") %>";
	//	alert(id);
		
	});
	
	$("#deleteBtn").click(function () {		
		location.href = "update?work=del&id=" + $("#id").text();
	});
	
});

</script>



</body>
</html>


