package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;
import net.sf.json.JSONObject;

@WebServlet("/custData")
public class CustUserData extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String work = req.getParameter("work");
		
		if(work.equals("data")) {
			CustUserDao dao = CustUserDao.getInstance();			
			List<CustUserDto> list = dao.getCustUserList();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("custlist", list);
			
			// 전송할 데이터를 추가
			JSONObject jobj = new JSONObject();
			jobj.put("map", map);			
			
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(jobj);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	
	
}
