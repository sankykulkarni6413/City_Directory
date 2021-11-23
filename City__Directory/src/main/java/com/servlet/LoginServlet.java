package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.userDAO;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		
		userDAO dao = new userDAO(DbConnect.getConn());
		User u = dao.loginUser(email, pass);
		HttpSession session = req.getSession();
		
		if(u!=null)
		{
			session.setAttribute("user", u);
			resp.sendRedirect("index.jsp");
			//System.out.println("user is available"+u);
		}
		else {
			session.setAttribute("invalidMsg", "Invalid email & password");
			resp.sendRedirect("index.jsp");
			//System.out.println("user is not available"+u);

		}
		
		
	}
	
}
