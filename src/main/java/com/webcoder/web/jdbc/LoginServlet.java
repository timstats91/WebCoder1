package com.webcoder.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			UserDao udao;
			
			try {
				udao = new UserDao(DbCon.getConnection());
				User user = udao.userLogin(email, password);
				
				if (user != null) {
					request.getSession().setAttribute("auth", user);
					request.getSession().setAttribute("uid", user.getId());
					request.getSession().setAttribute("fname", user.getFname());
					request.getSession().setAttribute("lname", user.getLname());
					request.getSession().setAttribute("email", user.getEmail());
					response.sendRedirect("login-succeeded.jsp");
				} else {
					response.sendRedirect("login-failed.jsp");
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
	}
}
