package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;
import net.sf.json.JSONObject;


@WebServlet("/custcontroller")
public class CustUserController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String work = req.getParameter("work");
		
		if(work.equals("move")) {
			forward("custuserlist.html", req, resp);	// 거길루 가!
		}		
		else if(work.equals("detail")) {
		//	System.out.println("CustUserController detail");
			String id = req.getParameter("id");
			
			// CustUserDao dao = CustUserDao.getInstance();
			
		 //  CustUserDto dto = dao.getCustUserDetail(id);
			
		   req.setAttribute("custdetail", id); 
		   forward("custuserdetail.jsp", req, resp);
		   
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}	
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher(link);
		dis.forward(req, resp);		
	}
	
}





