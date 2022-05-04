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
 * Servlet implementation class OrderOneServlet
 */
@WebServlet("/OrderOne")
public class OrderOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {
			User auth = (User) request.getSession().getAttribute("auth");
			if (auth != null) {
				
				String productId = request.getParameter("id");
				
				CoursesOwned orderModel = new CoursesOwned();
				orderModel.setCid(Integer.parseInt(productId));
				orderModel.setUid(auth.getId());
				orderModel.setOwned_check(true);
				
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);
				
				if (result) {
					response.sendRedirect("account.jsp");
				} else {
					out.print("order failed");
				}
				
			} else {
				response.sendRedirect("login.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
