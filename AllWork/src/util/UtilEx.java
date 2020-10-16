package util;

import java.util.List;

import calendarEx.CalendarDto;

public class UtilEx {
	
	public UtilEx() {
	
	}
	// 날짜를 클릭하면, 그날의 일정이 모두 볼 수 있는 callist.jsp로 이동하는 함수
    public static String callist(int year, int month, int day) {
		String str ="";
		
		str += String.format("&nbsp;<a href='%s?year=%d&month=%d&day=%d' >", 
				               "callist.jsp", year, month, day);         // %s ="callist.jsp" (String이므로 s), %d =year (Integer이므로 d)
	    
		str += String.format("%2d", day);    //%2 앞에 빈카을  2칸 준다       달력에 일 적혀있는곳     네모 부분에 숫자
		
		
		str += "</a>";
		
		return str;
    }
    
	//일정를 기입하기 위해서 pen이미지를 클릭하면 , calwrite.jsp로 이동하는 함수
    public static String showPen(int year, int month, int day) {
		
    	String str = "";
    	
    	String image = "<img src= '../image/pen2.png' width='18px' height='18px'>";    	
    	str = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", "calwrite.jsp", year, month, day, image);
    	
    	return str;
	}
    
    // 날짜 앞에다가 0을 붙여주는 함수
    public static String two(String msg) {
		
    return msg.trim().length()<2?"0"+msg.trim():msg.trim();
	}
    
    //달력의 날짜안에 설정할 테이블
   public static String makeTable(int year, int month, int day, List<CalendarDto> list) {
	
	   String str = "";
	   
	   // 2020 7 31 -> 20200731
	   String dates = (year + "") + two(month + "") + two(day +"");
	   
	   str += "<table>";
	   str += "<col width='98'>";
	   
	   for (CalendarDto dto : list) {
		if(dto.getRdate().substring(0, 8).equals(dates)) {
			str += "<tr bgcolor='#0000ff'>";
			str += "<td style='border:hidden'>";
			str += "<a href='caldetail.jsp?seq=" + dto.getSeq() +"'>";
			str += "<font style='font-size:8px; color:red'>";
			str += dot3(dto.getTitle());
		    str += "</font>";
		    str += "</a>";
		    str += "</td>";
		    str += "<tr>";
		}
	}
	   str += "</table>";
	   return str;
}
   //일정 제목이 길때  ...으로 처리하는 함수(김사장과의 점...)
   public static String dot3(String msg) {
	String str = "";
	if(msg.length() >= 6) {
		str = msg.substring(0, 6);   // 0~5
		str += "...";
	}else {
		str = msg.trim();
	}
	
	return str;
}
}



























