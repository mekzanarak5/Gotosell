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
                <h1><a href="indextest?id=&x=0&y=3"><img src="image/ABEE.png" style="width: 350px;height: 100px;margin-left: -100px"></a></h1>
                <div id="topnav">
                    <ul>
                        <li><a class="active" href="indextest?id=&x=0&y=3">Home</a></li>
                        <li><a href="Login.jsp">Login</a></li>
                        <li><a href="AddAccount.jsp">Register</a></li>
                        <li><a href="AdvenceSearch.jsp">Search</a></li>
                    </ul>
                </div>
                <div style="margin-right: 300px; padding-top: 15px" align="right" >Welcome <%=username%> <%=loginAndOut%></div>
                <div id="search">
                    <form action="SearchProduct" method="get">
                        <input type="submit" name="go" id="go" value="GO" />
                        <input type="text" placeholder="Seller/Product/Price" name="id" value="${id}" onfocus="this.value = (this.value == 'Search the site&hellip;') ? '' : this.value;" />
                    </form>
                </div>
            </div>
        </div>
    <div class="container">
        <nav id="bt-menu" class="bt-menu">
            <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
            <ul>
                <li><a href="indextest?id=&x=0&y=3">Home</a></li>
                <li><a href="Login.jsp">Login</a></li>
                <li><a href="AddAccount.jsp">Register</a></li>
                <li><a href="AdvenceSearch.jsp">Search</a></li>
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
        if (user.getUserId().equalsIgnoreCase("admin")) {
            username = "<a href='ToAdmin?url=/WEB-INF/admin/AdminProfile.jsp' title='View Profile'>" + user.getUserId() + "</a>";
        } else {
            username = "<a href='profile?userid=" + user.getUserId() + "'>" + user.getUserId() + "</a>";
        }
        loginAndOut = "<a href='Logout'>Logout</a>";
    %>
    <div class="wrapper col1">
        <div id="head">
            <h1><a href="indextest?id=&x=0&y=3"><img src="image/ABEE.png" style="width: 350px;height: 100px;margin-left: -100px"></a></h1>
            <div id="topnav">
                <ul>
                    <li><a class="active" href="indextest?id=&x=0&y=3">Home</a></li>
                    <li><a href="AddAccount.jsp">Register</a></li>
                    <li><a href="addProduct.jsp">Add Your Product</a></li>
                    <li><a href="AdvenceSearch.jsp">Search</a></li>
                </ul>
            </div>
            <div style="margin-right: 300px; padding-top: 15px" align="right" >Welcome <%=username%> <%=loginAndOut%> <a href="showUserPM?id=<%=user.getUserId() %> "><img src="image/mailbox.png" style="width: 50px;height: 50px"><span class="badge"><%=PrivateM.findCount(user.getUserId())%> </span></a></div>
            <div id="search">
                <form action="SearchProduct" method="post">
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
                <li><a href="indextest?id=&x=0&y=3">Home</a></li>
                <li><a href="AddAccount.jsp">Register</a></li>
                <li><a href="addProduct.jsp">+Product</a></li>
                <li><a href="AdvenceSearch.jsp">Search</a></li>
            </ul>
            <ul>
                <li><a href="http://www.twitter.com/codrops" class="bt-icon icon-twitter">Twitter</a></li>
                <li><a href="https://plus.google.com/101095823814290637419" class="bt-icon icon-gplus">Google+</a></li>
                <li><a href="http://www.facebook.com/pages/Codrops/159107397912" class="bt-icon icon-facebook">Facebook</a></li>
                <li><a href="https://github.com/codrops" class="bt-icon icon-github">icon-github</a></li>
            </ul>
        </nav>
    </div><!-- /container -->
    <% }%>
</body>
<script src="temp/js/classie.js"></script>
<script src="temp/js/borderMenu.js"></script>
</html>