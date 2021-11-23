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
import com.entity.Business;

@WebServlet("/addBusiness")
public class AddBusiness extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userid"));
		String bname =req.getParameter("bname");
		String oname =req.getParameter("oname");
		String phone_no =req.getParameter("phone_no");
		String btype =req.getParameter("btype");
		String b_address =req.getParameter("b_address");
		String city =req.getParameter("city");
		String pin =req.getParameter("pin");
		
		//System.out.println(userId+""+name);
		
		Business b= new Business(bname,oname,phone_no,btype,b_address,city,pin,userId);
		BusinessDAO dao = new BusinessDAO(DbConnect.getConn());
		
		HttpSession session = req.getSession();
		boolean f= dao.saveBusiness(b);
		if(f)
		{
		  session.setAttribute("succMsg", "Your Business Details Saved..");	
		  resp.sendRedirect("addBusiness.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something wrong on server..");	
			resp.sendRedirect("addBusiness.jsp");
		}
	}
	

}
