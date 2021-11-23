package com.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.userDAO;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User u = new User(name,email,password);
		
		userDAO dao = new userDAO(DbConnect.getConn());
		boolean f = dao.userRegister(u);
		HttpSession session = request.getSession();
		
		
		if(f)
		{
			session.setAttribute("sucssMsg", "User Register Sucessfully...");
			response.sendRedirect("register.jsp");
			//System.out.println("User Register Successfully...");
		}
		else
		{
			session.setAttribute("errorMsg", "Something wrong on Server...");
			response.sendRedirect("register.jsp");
			//System.out.println("Something wrong on Server...");
		}
	}
}
