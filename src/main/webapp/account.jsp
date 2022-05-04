<%
	
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="com.webcoder.web.jdbc.*" %>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if(session.getAttribute("auth")==null){
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if(cart_list != null) {
		ProductDao pDao = new ProductDao(DbCon.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Web Coder</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Web Coder is an online learning platform that teaches web development using HTML, CSS, SQL, and Java in three months.">
    <link rel="stylesheet" href="style.css">
</head>
<body>
        <div id="wrapper">

            <%@include file="includes/navbar.jsp"%>

            <main>
                <div class="wrapper">

                    <div class="cart-page-container">

                        <h2 class="cart-title">Your Account Details</h2>
                        <div class="account-details">
                            <div class="ad-name">
                                <p class="ad-title">Name: </p>
                                <p>
                                	<% 
                                		if(session.getAttribute("fname")!=null)
                                			{
                                				out.println(session.getAttribute("fname") + " " + session.getAttribute("lname"));
                                			}
                                	%>
                                </p>
                            </div>
                            <div class="ad-email">
                                <p class="ad-title">Email: </p>
                                <p>
									<% 
                                		if(session.getAttribute("fname")!=null)
                                			{
                                				out.println(session.getAttribute("email"));
                                			}
                                	%>
								</p>
                            </div>
                            <a href="logout" class="alt-link">Logout</a>
                        </div>

                        <div class="account-courses">
                            <div class="ac-header">
                                <h3>Your Course(s)</h3>
                                <h3>Completed</h3>
                            </div>
                            <a href="frontend.jsp" class="ac-item"><div class="ac-item-inner">
                                <p class="cart-item-name">Frontend</p>
                                <p class="cart-item-click">Continue</p>
                                <p class="cart-item-percent">33%</p>
                            </div></a>
                            <a href="backend.jsp" class="ac-item"><div class="ac-item-inner">
                                <p class="cart-item-name">Backend</p>
                                <p class="cart-item-click">Continue</p>
                                <p class="cart-item-percent">25%</p>
                            </div></a>
                        </div>

                        <div class="account-comments">
                            <div class="ac-header">
                                <h3>Your Comment(s)</h3>
                            </div>
                            <div class="acc-item">
                                <h5 class="acc-item-title">Seems like a great course!</h5>
                                <p class="acc-item-content">I've always wanted to learn how to make websites but I never knew where to start! I can't wait to finish the course!</p>
                                <a href="frontend.jsp" class="mod-link">
                                    <p class="acc-item-course">Frontend</p>
                                    <p class="acc-item-module">(Module 1)</p>
                                </a>
                            </div>
                            <div class="acc-item">
                                <h5 class="acc-item-title">Seems like a great course!</h5>
                                <p class="acc-item-content">I've always wanted to learn how to make websites but I never knew where to start! I can't wait to finish the course!</p>
                                <a href="frontend.jsp" class="mod-link">
                                    <p class="acc-item-course">Frontend</p>
                                    <p class="acc-item-module">(Module 1)</p>
                                </a>
                            </div>
                        </div>

                    </div>

                </div>
            </main>

            <footer>
                <p>Email: <a href="mailto:contact@webcoder.com">contact@webcoder.com</a></p>
                <p>Copyright &copy; 2022 Web Coder</p>
            </footer>

        </div>
    </body>
</html>