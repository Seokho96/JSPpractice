
<%@page import="movie.MovieManager"%>
<%@page import="dto.MovieVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>



<%

List<MovieVo> list = MovieManager.getCGVdata();

for(int i = 0;i < list.size(); i++){
	System.out.println(list.get(i).toString());
}

// list  -> json
String jsonlike = "[";

for(MovieVo m : list){
	jsonlike += "{name:'"+m.getTitle() + "', y:" + m.getLike() + "},";
}

jsonlike = jsonlike.substring(0, jsonlike.lastIndexOf(","));  // 0번찌 부터 ,마지막 인덴스의 ','전까지 가져와라

jsonlike += "]";

System.out.println(jsonlike);

request.setAttribute("jsonlike", jsonlike);
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" >

</style>
</head>
<body>

<!-- <figure class="highcharts-figure"> -->
  <div id="container"></div>
<!-- </figure> -->

<script type="text/javascript">

Highcharts.chart('container', {
	  chart: {
	    plotBackgroundColor: null,
	    plotBorderWidth: null,
	    plotShadow: false,
	    type: 'pie'
	  },
	  title: {
	    text: '영화가 좋아요, 2020'
	  },
	  tooltip: {
	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	  },
	  accessibility: {
	    point: {
	      valueSuffix: '%'
	    }
	  },
	  plotOptions: {
	    pie: {
	      allowPointSelect: true,
	      cursor: 'pointer',
	      dataLabels: {
	        enabled: true,
	        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	      }
	    }
	  },
	  series: [{
	    name: 'Brands',
	    colorByPoint: true,
	    data: <%=request.getAttribute("jsonlike") %>
	  }]
	});
</script>
</body>
</html>