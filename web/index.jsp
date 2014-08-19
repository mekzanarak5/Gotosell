<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>ABEEYeah.com</title>
        <meta name="description" content="Blueprint: View Mode Switch" />
        <meta name="keywords" content="view mode, switch, css, style, grid, list, template" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
        <link rel="stylesheet" type="text/css" href="codropsindex/css/component.css" />          
        <script src="codropsindex/js/modernizr.custom.js"></script>

    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <div class="container" style="color: black;font-size: small">
            <div class="main">
                <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
                    <a href="index?id="><button type="button" class="btn btn-warning">5</button></a>
                        <a href="index10?id="><button type="button" class="btn btn-warning">10</button></a>
                        <a href="index15?id="><button type="button" class="btn btn-warning">15</button></a>
                    <div class="cbp-vm-options">
                        <a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid">Grid View</a>
                        <a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list">List View</a>
                    </div>
                    <ul>
                        <%
                            List<Product> cs = (List<Product>) request.getAttribute("cs");
                            if (cs.size() > 0) {
                                for (Product c : cs) {
                        %>

                        <li>

                            <a class="cbp-vm-image" href="SearchProductSingle?id=<%= c.getProductid()%>"><img src="<%= c.getPic()%>" style="width: 100px; height: 100px;"></a>
                            <h3 class="cbp-vm-title"><%= c.getName()%></h3>
                            <div class="cbp-vm-price"><%= c.getPrice()%> Baht</div>
                            <div class="cbp-vm-details">
                                <%=c.getDes()%>
                            </div>
                            <a class="cbp-vm-icon cbp-vm-add" href="SearchProductSingle?id=<%= c.getProductid()%>">Detail</a>
                        </li>
                        <%}%>
                        <%}%>
                    </ul>
                </div>
            </div><!-- /main -->
        </div><!-- /container -->
        <%
            if ((Integer) request.getAttribute("page") > 0) {
        %>
        <ul class="pager">
            <li><a href="index?id=${id}&page=${page - 5}">Previous</a></li>
        </ul>
        <%}%>
        <%
            if (request.getAttribute("nonext") == null) {
        %>
        <ul class="pager">
            <li><a href="index?id=${id}&page=${page + 5}">Next</a></li>
        </ul>
        <%}%>

        <jsp:include page="footer.jsp"/>
        <script src="codropsindex/js/classie.js"></script>
        <script src="codropsindex/js/cbpViewModeSwitch.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
