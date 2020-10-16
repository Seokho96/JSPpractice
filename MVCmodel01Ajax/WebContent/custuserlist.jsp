<%@page import="dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

CustUserDao dao = CustUserDao.getInstance();
List<CustUserDto> list = dao.getCustUserList();

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>custuserlist</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<h1>고객 목록</h1>

<form action="mulde.jsp" method="post">

<table style="width: 700">
<col width="100"><col width="300"><col width="300">
<tr>
    
    <td height="2" bgcolor="#0000ff" colspan="3">
    </td>
</tr>
<tr>
   <th bgcolor="#ffff00">
     <input type="checkbox" name="alldel" onclick="deletechecks(this.checked)">
     </th>
     <th>ID</th>
     <th>NAME</th>
</tr>
<tr>
    <td height="2" bgcolor="#0000ff" colspan="3">
    </td>
</tr>
<tbody>

</tbody>

<tr>
   <td align="center" height="1" bgcolor="#c0c0c0" colspan="3">
        <!-- 다중 삭제 버튼 -->
        <input type="submit" value="고객정보 삭제">
   </td>
   </tr>
      <tr>
    <td height="2" bgcolor="#0000ff" colspan="3">
    </td>
      </tr>
      <tr bgcolor="#f6f6f6">
         <td colspan="3">
            <a href="custuseradd.jsp">고객정보 추가</a>
         </td>
      
      </tr>
</table>

</form>

<script type="text/javascript">

$(document).ready(function() {
	
	$.ajax({
		
		type: "get",
		datatype: "json",
		success: function( json ) {
			
			<%-- <%
		    if(list.size() == 0){%>

			$("table tbody:first").append("<tr bgcolor='#f6f6f6'><td colspan='3' align='center'>고객리스트가 존재하지 않습니다</td> </tr><tr><td height='2' bgcolor='#0000ff' colspan='3'> </td></tr>"); 
 
			<%}  --%>     
		      //있다
			 <%
		      for(int i = 0; i < list.size(); i++){
				  CustUserDto cust = list.get(i);
				  %>
$("table tbody").append("<tr bgcolor='#f6f6f6'><td align='center' bgcolor='yellow'><input type='checkbox' name='delck' value='<%=cust.getId()%>'></td><td> <%=cust.getId() %></td> <td><a href='custuserdetail.jsp?id=<%=cust.getId()%>'> <%=cust.getName() %></a></td> </tr> <tr <td height='2' bgcolor='#0000ff' colspan='3'></td></tr>");	  
				  
				  <%
			 }%>
<%--
	  <tr bgcolor="#f6f6f6">
	    <td colspan="3" align="center">고객리스트가 존재하지 않습니다</td>
	  </tr>
	<tr>
    <td height="2" bgcolor="#0000ff" colspan="3">
    </td>
</tr>
	
		  <tr bgcolor="#f6f6f6">
		      <td align="center" bgcolor="yellow">
		      <input type="checkbox" name="delck" value="<%=cust.getId()%>">
		      </td>
		  <td>
		     <%=cust.getId() %>
		  </td>
		  <td>
		     <a href="custuserdetail.jsp?id=<%=cust.getId()%>">
		       <%=cust.getName() %></a>
		  </td>
		   </tr>
		   <tr>
    <td height="2" bgcolor="#0000ff" colspan="3">
    </td>
      </tr>
		  <%
	  }
   }
			 %> --%>
		},
		error: function () {
			alert("error");
		}
		
		
	});
	
	
	
	
});


function deletechecks(ch) {
	let arrCheck = document.getElementsByName("delck");
	
	for (i = 0; i < arrCheck.length; i++) {
		arrCheck[i].checked = ch;
	}
}

</script>
</body>
</html>




















