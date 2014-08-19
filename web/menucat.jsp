<%-- 
    Document   : category
    Created on : Nov 5, 2013, 9:80:02 PM
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
        <div style="margin-top: -165px">
        <div class="main" style="text-align: center">
            <nav class="cbp-hsmenu-wrapper" id="cbp-hsmenu-wrapper">
                <div class="cbp-hsinner">
                    <ul class="cbp-hsmenu">
                        <li>
                            <a href="#" >Category</a>
                            <ul class="cbp-hssubmenu" >
                                <li style="width: 10%"><a href="SearchProduct?go=GO&id=Men Wear"><img src="image/face1.png" alt="img01" style="height: 80px;width: 80px"/><span>Men Wears</span></a></li>
                                <li style="width: 10%"><a href="SearchProduct?go=GO&id=Women Wear"><img src="image/face2.png" alt="img02" style="height: 80px;width: 80px"/><span>Women Wears</span></a></li>
                                <li style="width: 10%"><a href="SearchProduct?go=GO&id=IT/Electronics"><img src="image/it1.png" alt="img03" style="height: 80px;width: 80px"/><span>IT/Electronics</span></a></li>
                                <li style="width: 10%"><a href="SearchProduct?go=GO&id=Car"><img src="image/car.png" alt="img04" style="height: 80px;width: 80px"/><span>Car</span></a></li>
                                <li style="width: 10%"><a href="SearchProduct?go=GO&id=Home"><img src="image/home.png" alt="img05" style="height: 80px;width: 80px"/><span>Home</span></a></li>
                                <li style="width: 10%"><a href="SearchProduct?go=GO&id=Musical instrument"><img src="image/guitar.png" alt="img06" style="height: 80px;width: 100px"/><span>Musical Instrument</span></a></li>
                                <li style="width: 10%"><a href="SearchProduct?go=GO&id=Others"><img src="image/others.png" alt="img07" style="height: 80px;width: 80px"/><span>Others</span></a></li>
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
</body>
</html>
