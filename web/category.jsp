<%-- 
    Document   : category
    Created on : Nov 5, 2013, 9:50:02 PM
    Author     : Admin
--%>
<link rel="stylesheet" href="codropsmenu/css/component.css">
<script src="codropsmenu/js/modernizr.custom.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <div style="margin-top: -165px">
        <div class="main" style="text-align: center">
            <nav class="cbp-hsmenu-wrapper" id="cbp-hsmenu-wrapper">
                <div class="cbp-hsinner">
                    <ul class="cbp-hsmenu">
                        <li>
                            <a href="#" >Category</a>
                            <ul class="cbp-hssubmenu">
                                <li><a href="SearchProduct?go=GO&id=Men Wear"><img src="images/1.png" alt="img01"/><span>Delicate Wine</span></a></li>
                                <li><a href="SearchProduct?go=GO&id=Women Wear"><img src="images/2.png" alt="img02"/><span>Fine Spirit</span></a></li>
                                <li><a href="SearchProduct?go=GO&id=IT"><img src="images/3.png" alt="img03"/><span>Heavenly Ale</span></a></li>
                                <li><a href="SearchProduct?go=GO&id=Car"><img src="images/4.png" alt="img04"/><span>Juicy Lemonade</span></a></li>
                                <li><a href="SearchProduct?go=GO&id=Home"><img src="images/5.png" alt="img05"/><span>Wise Whiskey</span></a></li>
                                <li><a href="SearchProduct?go=GO&id=Musical instrument"><img src="images/6.png" alt="img06"/><span>Sweet Rum</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
        <script src="codropsmenu/js/cbpHorizontalSlideOutMenu.min.js"></script>
        <script>
			var menu = new cbpHorizontalSlideOutMenu( document.getElementById( 'cbp-hsmenu-wrapper' ) );
		</script>
    <jsp:include page="footer.jsp"/>
</body>
</html>
