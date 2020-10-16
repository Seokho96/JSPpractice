package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;

@WebServlet("/deleteuser")
public class CustUserDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		CustUserDao dao = CustUserDao.getInstance();
		String id = req.getParameter("id");
		boolean isS = dao.deleteCustUser(id);
		if(isS) {
		resp.sendRedirect("list");
		}
		else {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
             out.println("<script>alert('삭제에 실패했습니다.'); location.href='list';</script>");

             out.flush();
		}
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher(link);
		dis.forward(req, resp);		
	}

}
