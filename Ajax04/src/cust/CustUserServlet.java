package cust;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CustUserDto;
import net.sf.json.JSONObject;

@WebServlet("/custuser")
public class CustUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// System.out.println("CustUserServlet doGet");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		System.out.println("id :" + id + "pwd :" + pwd);
		
		
		
		JSONObject jobj = new JSONObject();
		
		//jobj.put("str", "hello"); // 단순 문자열 일 때
	
		//전송 Data
	/*	HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", "사과");   
		
		jobj.put("map", map);
		*/                                  // HashMap 전송
		
		List<CustUserDto> list = new ArrayList<CustUserDto>();
		
		list.add(new CustUserDto("aaa", "홍길동", "서울시"));
		list.add(new CustUserDto("bbb", "장화", "인천시"));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		jobj.put("map", map);  
		
		resp.setContentType("application/x-json; charset=UTF-8");
		resp.getWriter().print(jobj);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("CustUserServlet doPost");
	}

}


















