<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="com.webcoder.web.jdbc.*" %>
<%
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
    	<title>Web Coder</title>
    	<meta charset="ISO-8859-1">
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
                        <h2 class="cart-title">Login Failed</h2>
                        <p>Your email or password was incorrect</p>
                        <img src="img/cancel.png" class="login-img">
                        <div class="options">
                            <a href="login.jsp"><p class="option">Try Again</p></a>
                            <a href="signup.jsp"><p class="option">Create An Account</p></a>
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