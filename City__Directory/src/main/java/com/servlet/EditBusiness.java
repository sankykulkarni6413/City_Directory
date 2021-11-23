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

@WebServlet("/update")
public class EditBusiness extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid=Integer.parseInt(req.getParameter("bid"));
		String bname = req.getParameter("bname");
		String oname = req.getParameter("oname");
		String phone_no = req.getParameter("phone_no");
		String btype = req.getParameter("btype");
		String b_address = req.getParameter("b_address");
		String city = req.getParameter("city");
		String pin = req.getParameter("pin");
		
		Business b = new Business();
		b.setId(bid);
		b.setBname("bname");
		b.setOname("oname");
		b.setPhone("phone_no");
		b.setB_type("btype");
		b.setAddress("b_address");
		b.setCity("city");
		b.setPin("pin");
		
		BusinessDAO dao = new BusinessDAO(DbConnect.getConn());
		HttpSession session = req.getSession();
		boolean f = dao.updateDetails(b);
		if (f) {
			session.setAttribute("succMsg", "Your Business Details Updated..");
			resp.sendRedirect("viewBusiness.jsp");
		} else {
			session.setAttribute("failedMsg", "Something wrong on server..");
			resp.sendRedirect("editBusiness.jsp?bid="+bid);
		}
		
	}
	

}
