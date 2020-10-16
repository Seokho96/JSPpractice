<%@page import="dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%
  String id = request.getParameter("id");
    
  CustUserDao dao = CustUserDao.getInstance();

  CustUserDto dto = dao.getCustUserDetail(id);
    
  
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<h1>고객 정보 수정</h1>

<form id="frm" method="post">
<input type="hidden" name="id" value="<%=dto.getId() %>">
<table>
<col width="100px"><col width="300px">
 <tr>
    <td height="2" bgcolor="#ff0000" colspan="3">
    </td>
      </tr>
      
<tr bgcolor="#f6f6f6">
     <th>아이디</th>
      <td>
      <input type="text" name="_id" size="20" value="<%=dto.getId()%>">
      
      </td>
      </tr>
      <tr>
    <td height="2" bgcolor="#ff0000" colspan="3">
    </td>
      </tr>
      
      <tr bgcolor="#f6f6f6">
     <th>이름</th>
      <td>
      <input type="text" name="name" size="20" value="<%=dto.getName()%>">
      </td>
      </tr>
       <tr>
    <td height="2" bgcolor="#ff0000" colspan="3">
    </td>
      </tr>
      
      <tr bgcolor="#f6f6f6">
     <th>주소</th>
      <td>
      <input type="text" name="address" size="20" value="<%=dto.getAddress()%>">
      </td>
      </tr>
       <tr>
    <td height="2" bgcolor="#ff0000" colspan="3">
    </td>
      </tr>
      
      <tr bgcolor="#f6f6f6">
      <td align="center" colspan="2">
        <input type="submit" value="수정 완료" id="complete">
        <input type="reset" value="취소">
      </td>
      </tr>
</table>
</form>
<script type="text/javascript">
$(document).ready(function() {
	    
	$('#complete').click(function() {
		
		$('#frm').attr('action', "userupdate").submit(); 
		
	});
	
	
});
</script>
</body>
</html>
















