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
                    <div class="mod-nav">
                        <ul>
                            <a href="frontend.jsp" class="mod-nav-item-link"><li class="current-item">1</li></a>
                            <a href="frontend2.jsp" class="mod-nav-item-link"><li class="mod-nav-item">2</li></a>
                            <a href="frontend3.jsp" class="mod-nav-item-link"><li class="mod-nav-item">3</li></a>
                            <a href="frontend4.jsp" class="mod-nav-item-link"><li class="mod-nav-item">4</li></a>
                            <a href="frontend5.jsp" class="mod-nav-item-link"><li class="mod-nav-item">5</li></a>
                            <a href="frontend6.jsp" class="mod-nav-item-link"><li class="mod-nav-item">6</li></a>
                        </ul>
                    </div>

                    <div class="mod-dash">
                        <div class="mod-info-top">
                            <h2>Frontend:</h2>
                            <h3 class="mod-heading">HTML Basics</h3>
                            <p>(Module 1)</p>
                            <div class="vid-container">
                                <video controls>
                                    <source src="img/video.mp4" type="video/mp4">
                                </video>
                            </div>
                            <form class="mod-check">
                                <input type="checkbox" id="mod-complete">
                                <label for="mod-complete">(Check here when completed)</label>
                            </form>
                        </div>
                        <div class="mod-info-bottom">
                            <p><strong>Description:</p></strong>
                            <p>HTML stands for Hyper-Text Markup Language. This module covers the very basics of HTML including web page structure and the tags you'll use in most websites.</p>
                        </div>
                        <div class="mod-post-section">
                            <h3 class="post-heading">Post your comments!</h3>
                            <div class="post-container">
                                <div class="post-new">
                                    <form>
                                        <input type="text" class="post-text" placeholder="Title/Question..." required>
                                        <textarea class="post-text post-details" placeholder="Details... (optional)"></textarea>
                                        <input type="submit" class="post-submit" placeholder="Submit">
                                    </form>
                                </div>
                                <div class="post-all">
                                    <div class="post-comment">
                                        <h4>Tim S.</h4>
                                        <h5>Seems like a great course!</h5>
                                        <p>I've always wanted to learn how to make websites but I never knew where to start! I can't wait to finish the course!</p>
                                    </div>
                                    <div class="post-comment">
                                        <h4>Gio F.</h4>
                                        <h5>How long does this course take to complete?</h5>
                                        <p>Hey this seems like a cool course. How long will it take to complete?</p>
                                    </div>
                                    <div class="post-comment">
                                        <h4>Stef V.</h4>
                                        <h5>@Gio - Totally depends!</h5>
                                        <p>Hey Gio! I just finished this course and it took me about 6 weeks at about an hour or two a day. However, I think it depends on the person and how much time they devote to it every day. Good luck!</p>
                                    </div>
                                </div>
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