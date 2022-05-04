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
                        <h2 class="cart-title">Create A New Account</h2>
                        
                        <div class="cart-form-container">
                            <h3 class="cart-form-title">Sign up here!</h3>
                            <form method="post" action="signup" class="cart-form">
                                <label for="signup-first-name">First Name</label>
                                <input type="text" name="first-name" id="signup-first-name" class="cart-input" placeholder="Jane" required>
                                <label for="signup-last-name">Last Name</label>
                                <input type="text" name="last-name" id="signup-last-name" class="cart-input" placeholder="Doe" required>
                                <label for="signup-email">Email</label>
                                <input type="email" name="email" id="signup-email" class="cart-input" placeholder="janedoe@mail.com" required>
                                <label for="signup-password">Password</label>
                                <input type="password" name="password" id="signup-password" class="cart-input" required>
                                <input type="submit" value="Sign Up" class="post-submit">
                            </form>
                        </div>
                        <div class="alternate">
                        	<p class="alt-question">Already have an account?</p>
                        	<a href="login.jsp" class="alt-link">Click here to log in</a>
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