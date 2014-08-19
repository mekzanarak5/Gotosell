<%@page import="model.PrivateM"%>
<%@page import="model.Account"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>index</title>
        <meta name="description" content="Responsive Animated Border Menus with CSS Transitions" />
        <meta name="keywords" content="navigation, menu, responsive, border, overlay, css transition" />
        <meta name="author" content="Codrops" />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="imagetoolbar" content="no" />
        <link rel="stylesheet" href="headertemp/styles/layout.css" type="text/css" />
        <link rel="shortcut icon" href="../favicon.ico">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="temp/css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="temp/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="temp/css/icons.css" />
        <link rel="stylesheet" type="text/css" href="temp/css/style5.css" />
        <script src="js/modernizr.custom.js"></script>
    </head>
    <body>
        <%
            Account user = (Account) session.getAttribute("user");
            String username = null;
            String loginAndOut = null;
            if (user == null) {
                username = "Guest";
                loginAndOut = "";
                
        %>

        <div class="wrapper col1">
            <div id="head">
                <h1><a href="#"><img src="image/ABEE.png"></a></h1>
                <div id="topnav">
                    <ul>
                        <li><a class="active" href="index.jsp">Home</a></li>
                        <li><a href="Login.jsp">Login</a></li>
                        <li><a href="AddAccount.jsp">Register</a></li>
                    </ul>
                </div>
                <div style="margin-right: 300px; padding-top: 15px" align="right" >Welcome <%=username%> <%=loginAndOut%></div>
                <div id="search">
                    <form action="SearchProduct" method="get">
                            <input type="submit" name="go" id="go" value="GO" />
                            <input type="text" placeholder="Seller/Product/Price" name="id" onfocus="this.value = (this.value == 'Search the site&hellip;') ? '' : this.value;" />
                    </form>
                </div>
            </div>
        </div>
    <div class="container">
        <nav id="bt-menu" class="bt-menu">
            <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
            <ul>
                <li><a href="ToAdmin?url=/WEB-INF/admin/AdminPage.jsp">Home</a></li>
                <li><a href="ToAdmin?url=/WEB-INF/admin/AddAccountAdmin.jsp">Register</a></li>
                <li><a href="category.jsp">Category</a></li>

            </ul>
            <ul>
                <li><a href="http://www.twitter.com/" class="bt-icon icon-twitter">Twitter</a></li>
                <li><a href="https://plus.google.com/" class="bt-icon icon-gplus">Google+</a></li>
                <li><a href="http://www.facebook.com/" class="bt-icon icon-facebook">Facebook</a></li>
                <li><a href="https://github.com/" class="bt-icon icon-github">icon-github</a></li>
            </ul>
        </nav>
    </div><!-- /container -->
    <% } else {
                if(user.getUserId().equalsIgnoreCase("admin")){
                    username="<a href='AdminProfile?userid="+user.getUserId()+"' title='View Profile'>"+user.getUserId()+"</a>";
                }else{
        username = "<a href='profile?userid="+user.getUserId()+"+'>" + user.getUserId() + "</a>";
                }
        loginAndOut = "<a href='Logout'>Logout</a>";
    %>
    <div class="wrapper col1">
            <div id="head">
                <h1><a href="ToAdmin?url=/WEB-INF/admin/AdminPage.jsp"><img src="image/ABEE.png" style="width: 300px;height: 90px;margin-left: -200px"></a></h1>
                <div id="topnav">
                    <ul>
                        <li><a class="active" href="ToAdmin?url=/WEB-INF/admin/AdminPage.jsp">Home</a></li>
                        <li><a href="ToAdmin?url=/WEB-INF/admin/AddAccountAdmin.jsp">Add Account</a></li>
                        <li><a href="ToAdmin?url=/WEB-INF/admin/AddProductAdmin.jsp">Add Product</a></li>
                        <li><a href="AllAccountAdmin?go=GO&id=">Show All Account</a></li>
                        <li><a href="AllProductAdmin?go=GO&id=">Show All Product</a></li>
                    </ul>
                </div>
                <div style="margin-right: 300px; padding-top: 15px" align="right" >Welcome <%=username%> <%=loginAndOut%> <a href="showPmAdminR?id=<%=user.getUserId() %> "><img src="image/mailbox.png" style="width: 50px;height: 50px"><span class="badge"><%=PrivateM.findCount(user.getUserId())%> </span></a></div>
                <div id="search">
                    <form action="AllProductAdmin" method="post">
                            <input type="submit" name="go" id="go" value="GO" />
                            <input type="text" placeholder="Seller/Product/Price" name="id" onfocus="this.value = (this.value == 'Search the site&hellip;') ? '' : this.value;" />
                    </form>
                </div>
            </div>
        </div>
    <% }%>
</body>
<script src="temp/js/classie.js"></script>
<script src="temp/js/borderMenu.js"></script>
</html>