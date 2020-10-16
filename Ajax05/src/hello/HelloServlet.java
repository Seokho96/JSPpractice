package hello;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.CustUserDto;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		String str = "hello";
		//google json
		String gson = new Gson().toJson(str);
		resp.getWriter().write(gson);
		*/
		
		List<CustUserDto> list = new ArrayList<CustUserDto>();
		
		list.add(new CustUserDto("zxc", "홍길동", "인천시"));
		list.add(new CustUserDto("peng", "펭수", "남극시"));

	    resp.setContentType("application/json");   //json 변환
	    resp.setCharacterEncoding("UTF-8");
	    
	    // gson-2.8.5.jar 추가할 것
	    String gson = new Gson().toJson(list);
	    
	    resp.getWriter().write(gson);   //return 해주는 함수
	}

}































