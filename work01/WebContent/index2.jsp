<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>--------입력 페이지-------</h1>
<form id="frm">
이름 : <input type="text" id="_name" name="name" placeholder="이름">
<br><br>
생년월일 : <input type="text" id="_birth" name="birth" placeholder="생년월일 ex)19980901">
<br><br>
<button type="button" id="btn">OK</button> 
 </form>
 
<script type="text/javascript">

$(document).ready(function() {
	  $("#btn").click(function() {
	  	    $("#frm").attr("action", "NewFile.jsp").submit();
		      
	  });
});

</script>
</body>



</html>