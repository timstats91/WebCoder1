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
                        <h2 class="cart-title">Contact Us</h2>
                        <p></p>
                        <div class="cart-form-container">
                            <h3 class="cart-form-title">Have a question?</h3>
                            <form class="cart-form">
                                <label for="contact-name">Name</label>
                                <input type="text" id="contact-name" class="cart-input" placeholder="John Doe" required>
                                <label for="contact-email">Email</label>
                                <input type="text" id="contact-email" class="cart-input" placeholder="johndoe@mail.com" required>
                                <label for="contact-text">Message</label>
                                <textarea id="contact-text" placeholder="Enter your message here..." class="cart-input" required></textarea>
                                <input type="submit" value="Submit" class="post-submit">
                            </form>
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