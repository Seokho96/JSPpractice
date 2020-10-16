<%@page import="java.util.List"%>
<%@page import="dto.suggestDto"%>
<%@page import="dao.suggestDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%!// 댓글의 depth 와 image를 추가하는 함수 
    public String arrow(int depth){
	 
	 String rs = "<img src='./image/arrow.png' width='20px' height='20px'/> ";
	 String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	 
	 String ts = "";
	 for(int i = 0; i < depth; i++){
		 ts += nbsp; 
	 }
	 
	 return depth==0?"":ts + rs;
 }%>   
    
     <%
            	request.setCharacterEncoding("utf-8");
            %>
<%
	Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
%>
	<script type="text/javascript">
	alert("로그인 해주십시오");
	location.href = "login.jsp";
	</script>
	<%
		}
			mem = (MemberDto)ologin;
			
			String sel = request.getParameter("sel");
		    String select = request.getParameter("select");
		    
		    
		    
		    if(sel== null||sel.equals("")){
		    	sel = "all";
		    }
		 // 검색어를 지정하지 않고 Choice가 넘어 왔을 때
		   
		    if(select == null||select.equals("")){
		    	select = "";
		    	sel = "all";
		    }
			suggestDao dao = suggestDao.getInstance();
			
			String spageNumber = request.getParameter("pageNumber");
			
			int pageNumber = 0; // 현재 페이지
			if(spageNumber != null && !spageNumber.equals("")){
		pageNumber = Integer.parseInt(spageNumber);
			}
			
			//List<BbsDto> list = dao.getBbsList();
			//List<BbsDto> list = dao.getBbsList(sel, select);
			List<suggestDto> list = dao.getBbsPagingList(sel, select, pageNumber);
			
			
			int len = dao.getALllBbs(sel, select);
			System.out.println("글의 갯수: " + len);
			System.out.println("panum : " + pageNumber);
			int bbsPage = len / 10 ;    //예: 12개  -> 2페이지
			 if(len% 10> 0){
		 bbsPage = bbsPage +1;     // -> 2  페이지 플러그인 넣기
			 }
	%>


	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {
	$(".<%=sel%>").attr("selected", "selected");
});
</script>	
	
</head>
<body>

<h4 align="right" style="background-color: #f0f0f0">
  환영합니다<%=mem.getId()%>님
</h4>

<h1 align="center">게시판</h1>

<a href="./calendar/calendar.jsp">일정관리</a>
<a href="pdslist.jsp">자료실</a>
<a href="index.jsp">로그아웃</a>

<div align="center">

<table border="1">
<col width="70"><col width="600"><col width="150">
<tr>
   <th>번호</th><th>제목</th><th>작성자</th>
</tr>

<%
	if(list == null || list.size() == 0){
%>
	<tr>
	  <td colspan="3" align="center">작성된 글이 없습니다</td>
	</tr>
	
<%
		}else{
	      
		for(int i = 0;i < list.size(); i++){
			suggestDto bbs = list.get(i);
	%>
	<tr>
		<th><%=i+1 %></th>
		<%-- 
		<td>
			<%=arrow(bbs.getDepth()) %>	<!-- 여백  + 이미지 -->
			<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
				<%=bbs.getTitle() %>
			</a>
		</td>
		 --%>
		<td>
			<%
			if(bbs.getDel() == 0){
				%>
				<%=arrow( bbs.getDepth() ) %>			
				<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
					<%=bbs.getTitle() %>
				</a>	
				<%
			}else{
				%>		
				<font color="#CC0000">관리자에 의해서 삭제되었습니다</font> 
				<%
			}
			%>
		</td>  
		<td align="center"><%=bbs.getId() %></td>
	</tr>
	<%
	}
}
%>

</table>
<br>
<%
for(int i = 0; i < bbsPage; i++){
   if(pageNumber == i){   
	   %>
   <span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
        <%=i+1 %>   
   </span>&nbsp;
   <% }
   else{// 그외 페이지
	%>
	<a href="#none" title="<%=i+1%>페이지" onclick="goPage(<%=i %>)" style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none" id="gopage">
	[<%=i+1 %>]
	</a>&nbsp;
	
<%
}
}
%>
</div>
<br>
<div align="center">
<a href="bbswrite.jsp">글쓰기</a>
</div>
<br>
<form action="bbslist.jsp">
<div align="center">
<select name="sel">
<option value="all" class="all" s>전체</option>
<option value="title" class="title">제목</option>
<option value="id" class="id">작성자</option>
<option value="content" class="content">내용</option>
</select>

<input type="text" name="select" placeholder="검색" value="<%=select%>">&nbsp;<button type="submit" id="search_btn" >검색</button>
</div>
</form>
<script type="text/javascript">

function goPage( pageNum ) {
	
	location.href = "bbslist.jsp?pageNumber="+ pageNum +"&sel=<%=sel%>"+"&select=<%=select%>";
}

</script>

</body>
</html>




































