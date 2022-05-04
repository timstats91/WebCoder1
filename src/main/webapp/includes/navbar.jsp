
            <header>
                <a href="index.jsp"><h1 class="logo">Web Coder</h1></a>
                <input type="checkbox" id="nav-toggle" class="nav-toggle">
                <nav>
                    <ul id="nav-list">
                        	<% 
                        		if(session.getAttribute("auth")!=null)
                        			{
                        				out.println("<li class=\"user-name\"><a href=\"account.jsp\" class=\"user-name-link\">" + session.getAttribute("fname") + "</a></li><li><a href=\"logout\">Logout</a></li>");
                        			}
                        	%>
							<% 
                        		if(session.getAttribute("auth")==null)
                        			{
                        				out.println("<li><a href=\"signup.jsp\">Sign Up</a></li><li><a href=\"login.jsp\">Login</a></li>");
                        			}
                        	%>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li><a href="cart.jsp">Cart<% if (cart_list != null) {%><span style="font-weight:regular;font-size:.8em;"> (${ cart_list.size() })</span><%} %></a></li>
                    </ul>
                </nav>
                <label for="nav-toggle" class="nav-toggle-label">
                    <span></span>
                </label>
            </header>