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
		int total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total", total);
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
                        <h2 class="cart-title">Your Cart</h2>
                        <div class="cart-container">
                            <div class="cart-header">
                                <h3>Course(s)</h3>
                                <h3>Price</h3>
                            </div>
                            <%
                            	if (cart_list != null) {
                            		for (Cart c:cartProduct) {%>
                            			<a href="Remove?id=<%= c.getId() %>" class="ac-item"><div class="ac-item-inner">
                                        	<p class="cart-item-name" style="font-weight:bold;"><%= c.getName() %></p>
                                        	<p class="cart-item-click">Remove</p>
                                        	<p class="cart-item-price">$<%= c.getPrice() %>.00</p>
                                    	</div></a>
                                    	<form action="OrderOne" method="post">
                                    		<input type="hidden" name="id" value="<%= c.getId() %>">
                                    		<button type="submit" class="buy-now">Buy Now</button>
                                    	</form>
                            		<%}
                            	}
                            %>
                            <div class="cart-item rounded-bottom">
                                <p class="cart-total-name">
                                	<% 
                        				if (cart_list==null) {
                        					out.println("Your cart is empty");
                        				} else {
                        					out.println("Total cost before tax...");
                        				}
                        			%>
                                </p>
                                <p class="cart-total-price">$${ (total>0)?total:0 }.00</p>
                            </div>
                        </div>
                        <div class="cart-form-container">
                            <h3 class="cart-form-title">Ready to checkout, Tim?</h3>
                            <form class="cart-form">
                                <label for="card-name">Cardholder Name</label>
                                <input type="text" id="card-name" class="cart-input" placeholder="John Doe">
                                <label for="card-number">Card Number</label>
                                <input type="text" id="card-number" class="cart-input" placeholder="xxxx-xxxx-xxxx-xxxx">
                                <div class="cart-form-bottom">
                                    <div class="cart-form-bottom-input card-date">
                                        <label for="card-date">Expiration</label>
                                        <input type="date" id="card-date" class="cart-input-bottom">
                                    </div>
                                    <div class="cart-form-bottom-input">
                                        <label for="card-cvv">CVV</label>
                                        <input type="text" id="card-cvv" class="cart-input-bottom">
                                    </div>
                                </div>
                                <div class="checkout-style">
                                	<a href="CheckOut"><p class="checkout-style-text">Checkout</p></a>
                            	</div>
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