package com.webcoder.web.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Define datasource/connection pool for Resource Injection
	@Resource(name="jdbc/webcoder")
	private DataSource dataSource;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fname = request.getParameter("first-name");
		String lname = request.getParameter("last-name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		RequestDispatcher dispatcher = null;
			
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			myConn = dataSource.getConnection();
			
			myStmt = myConn.prepareStatement("INSERT INTO users(First_Name, Last_Name, User_Email, User_Password) values(?, ?, ?, ?) ");
			myStmt.setString(1, fname);
			myStmt.setString(2, lname);
			myStmt.setString(3, email);
			myStmt.setString(4, password);
			
			int rowCount = myStmt.executeUpdate();
			dispatcher = request.getRequestDispatcher("login.jsp");
			
			if (rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
	}
}
