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
<html lang="en">
    <head>
        <title>Web Coder</title>
        <meta http-equiv="Content-Type" charset="ISO-8859-1">
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
                        <h2 class="cart-title">Login To Your Account</h2>
                        
                        <div class="cart-form-container">
                            <h3 class="cart-form-title">Login here!</h3>
                            <form class="cart-form" method="post" action="login">
                                <label for="login-email">Email</label>
                                <input type="email" id="login-email" name="email" class="cart-input" placeholder="janedoe@mail.com" required>
                                <label for="login-password">Password</label>
                                <input type="password" id="login-password" name="password" class="cart-input" required>
                                <input type="submit" value="Login" class="post-submit">
                            </form>
                        </div>
                        <div class="alternate">
                        	<p class="alt-question">Don't have an account?</p>
                        	<a href="signup.jsp" class="alt-link">Click here to sign up</a>
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