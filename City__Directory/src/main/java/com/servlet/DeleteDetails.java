package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.BusinessDAO;


@WebServlet("/delete")
public class DeleteDetails extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid = Integer.parseInt(req.getParameter("bid"));
		
	BusinessDAO dao=new BusinessDAO(DbConnect.getConn());
	boolean f=dao.deleteDetailsById(bid);
	HttpSession session=req.getSession();
	if(f)
	{
		session.setAttribute("succMsg", "Business Details Deleted");
		resp.sendRedirect("viewBusiness.jsp");
	}
	else {
		session.setAttribute("failedMsg", "Something Wrong on server..");
		resp.sendRedirect("viewBusiness.jsp");
		
	}
	}
	
}
