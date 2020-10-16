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
<div align="center">
<h1>글쓰기</h1>
</div>
<form action="bbswriteAF.jsp" method="post">
<div align="center">
<div style="margin-left: 20px">ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="50" name="id"></div><br><br>
제목:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="50" name="title"><br><br>
<div style="margin-right: 420px">
내용:<br><br>
</div>
<textarea style="height: 500px; width: 500px" name="content"></textarea><br><br>
<button type="button" id="list">글 목록</button>&nbsp;
<button type="submit" id="add">글 추가</button>

</div>
</form>
<script type="text/javascript">
$(document).ready(function() {
	$('#list').click(function() {
		location.href = "bbslist.jsp";
	});
	
});
</script>
</body>
</html>