
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
<h1 style="text-align: center; margin-right: 20px">회원가입</h1>
<form id="frm">
<div align="center"><div>ID :  <input type="text" size="20" id="id" name="id">
<button type="button" id="chk_id">중복체크</button></div>
<p id="idcheck" style="margin-left:10px; padding-top: 10px;"></p>
<div style="margin-right: 140px">PASSWORD: <input type="text" id="pwd" name="pwd"></div><br><br>
<div style="margin-right: 85px">이름: <input type="text" id="name" name="name"></div><br><br>
<div style="margin-right: 90px">Email: <input type="text" id="email" name="email"></div><br><br>
<div style="margin-right: 40px"><button type="button" id="btn">회원가입</button></div>
</div>
</form>

<script type="text/javascript">

$(function () {
	
	$("#chk_id").click(function () {
	//	alert("btn click");
	
		$.ajax({
			type:"post",
			url:"./idcheck.jsp",
		//	data:"id=" + $("#id").val(),
			data:{ "id":$("#id").val() },
			success:function( data ){
			//	alert("success");
			//	alert(data.trim());
				if(data.trim() == "YES"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").html('사용할 수 있는 id입니다');
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").html('사용 중인 id입니다');
					$("#id").val("");
				}			
			},
			error:function(){
				alert("error");
			}
		});
		
	});
	
});

</script>

</body>
</html>