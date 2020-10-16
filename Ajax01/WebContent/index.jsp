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

<!-- 
      AJAX : Asynchronous JavaScript And XML(Json)  (자바스크립트와 xml 을 비동기통신을 할 수 있게한다) (필요한 부분만 리프레쉬 하기 때문에 훨씬 가볍다.)
            목적 : 비동기 상태로 데이터의 송수신을 처리하는 목적
            
      a, form, location.href  -> link 이동
      synchronous :동기
      
      JQuery 소속 
 -->
 
 <p id="demo"></p>
<br>
<button type="button">click</button>

<script type="text/javascript">
$(function () {
	
	$("button").click(function() {
		
		// $('#demo').load('data.html');
		   
		// $('#demo').load("data.html #data1");
		   
		//  $("#demo").load("data.jsp", "t1=abc&t2=가나다");
	
	    //  $("#demo").load("data.jsp", {t1:"ABC", t2:"라마바"});
	
	        $("#demo").load(
	        		"data.jsp",
	        		{t1:"DEF", t2:"사아자"},
	        		function (data, status, xhr)  {// (d, s, x) 매겨변수라 암거나 상관x
						// alert("success");
	        		    // alert(data);
	        		    
	        		    $("#demo").append("data =" + data + "<br>");
	        		    $("#demo").append("satatus = " + status + "<br>");
	        		    $("#demo").append("xhr = " + xhr + "<br>");
					}
	        		
	                   );
	        
	        
	});
	
});
</script>

</body>
</html>






























