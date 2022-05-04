<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="com.webcoder.web.jdbc.*" %>
<%
	ProductDao pd = new ProductDao(DbCon.getConnection());
	List<Product> products = pd.getAllProducts();
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
                
                <div class="hero">
                    <div class="hero-content">
                        <div class="hero-text">
                            <h2 class="hero-tagline">Learn to Code, </br>From Anywhere.</h2>
                            <div class="hero-choices">
                                <a href="signup.jsp"><p class="hero-choice choice1"><strong>Sign Up</strong></p></a>
                                <a href="#modules-section"><p class="hero-choice choice2"><strong>View Courses</strong></p></a>
                            </div>
                        </div>
                        <img src="img/coding1.png" class="hero-image">
                    </div>
                </div> 

                <div class="modules-section" id="modules-section">
                    <div class="modules-content">
                        <h2 class="modules-tagline">Web Coder Courses</h2>
                        <div class="search-container">
                            <form action="" class="search-bar">
                                <div class="inner-search-container">
                                    <input type="search" class="search" placeholder="search courses..." name="search" pattern=".*\S.*" required>
                                </div>
                                <button class="search-btn" type="submit">
                                    <span><img src="img/search.png" class="search-icon"></span>
                                </button>
                            </form>
                        </div>
                        <div class="courses">
                            <div class="courses-left">
                                <div class="modules-container">
                                    <div class="modules-category">
                                        <h3 class="mod-name">Frontend</h3>
                                        <a href="AddToCart?id=1" class="add-to-cart">Add To Cart</a> 
                                    </div>
                                    <div class="accordion">
                                        <div class="accordion-item" id="module1">
                                            <a class="accordion-link free-a" href="#module1">
                                                <p class="free-p">HTML Basics</p>
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <a href="frontend.jsp" class="mod-preview">Preview This Module</a>
                                                    <p>HTML stands for Hyper-Text Markup Language. This module covers the very basics of HTML including web page structure and the tags you'll use in most websites.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="module2">
                                            <a class="accordion-link" href="#module2">
                                                CSS Basics
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>CSS stands for Cascading Style Sheets. This module covers the very basics of HTML including web page structure and the tags you'll use in most websites.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="module3">
                                            <a class="accordion-link" href="#module3">
                                                Developer Tools
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the Development Tools used for web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="module4">
                                            <a class="accordion-link" href="#module4">
                                                Git/Github Basics
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>Git and Github are version control tools for web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="module5">
                                            <a class="accordion-link" href="#module5">
                                                Mobile-First Design
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="module6">
                                            <a class="accordion-link curved-bottom" href="#module6">
                                                Flexbox & Grid
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer curved-bottom">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modules-container">
                                    <div class="modules-category">
                                        <h3 class="mod-name">Backend</h3>
                                        <a href="AddToCart?id=2" class="add-to-cart">Add To Cart</a> 
                                    </div>
                                    <div class="accordion">
                                        <div class="accordion-item" id="c2m1">
                                            <a class="accordion-link free-a" href="#c2m1">
                                                <p class="free-p">Java Basics</p>
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <a href="backend.jsp" class="mod-preview">Preview This Module</a>
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c2m2">
                                            <a class="accordion-link" href="#c2m2">
                                                OOP Concepts
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c2m3">
                                            <a class="accordion-link" href="#c2m3">
                                                Advanced Algorithms
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c2m4">
                                            <a class="accordion-link curved-bottom" href="#c2m4">
                                                Servlets & JSP
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="courses-right">
                                <div class="modules-container">
                                    <div class="modules-category">
                                        <h3 class="mod-name">Database</h3>
                                        <a href="AddToCart?id=3" class="add-to-cart">Add To Cart</a> 
                                    </div>
                                    <div class="accordion">
                                        <div class="accordion-item" id="c3m1">
                                            <a class="accordion-link free-a" href="#c3m1">
                                                <p class="free-p">MySQL Server Basics</p>
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <a href="database.jsp" class="mod-preview">Preview This Module</a>
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c3m2">
                                            <a class="accordion-link" href="#c3m2">
                                                Query Basics
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c3m3">
                                            <a class="accordion-link" href="#c3m3">
                                                Advanced Queries
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c3m4">
                                            <a class="accordion-link curved-bottom" href="#c3m4">
                                                Database Design
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer curved-bottom">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modules-container">
                                    <div class="modules-category">
                                        <h3 class="mod-name">eCom App</h3>
                                        <a href="AddToCart?id=4" class="add-to-cart">
                                        	<%
                                        		
                                        	%>
                                        	Add To Cart
                                        </a> 
                                    </div>
                                    <div class="accordion">
                                        <div class="accordion-item" id="c4m1">
                                            <a class="accordion-link free-a" href="#c4m1">
                                                <p class="free-p">Outline & Wireframe</p>
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <a href="ecomapp.jsp" class="mod-preview">Preview This Module</a>
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c4m2">
                                            <a class="accordion-link" href="#c4m2">
                                                System Design
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c4m3">
                                            <a class="accordion-link" href="#c4m3">
                                                Frontend Code
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c4m4">
                                            <a class="accordion-link" href="#c4m4">
                                                Backend Servlets
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c4m5">
                                            <a class="accordion-link" href="#c4m5">
                                                MySQL Database
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item" id="c4m6">
                                            <a class="accordion-link curved-bottom" href="#c4m6">
                                                Debugging & Optimization
                                                <img src="img/plus.png" class="module-icon add">
                                                <img src="img/minus.png" class="module-icon remove">
                                            </a>
                                            <div class="answer">
                                                <div class="answer-content">
                                                    <p>This module covers the very basics of HTML including web page structure and the tags you'll use in most websites. This is the description of this module. It covers topic A, topic B, topic C, and topic D. After this module, you will know how to X.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- <a href="start.html"><p class="get-started"><strong>Get Started</strong></p></a> -->
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