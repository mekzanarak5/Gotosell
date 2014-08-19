<%-- 
    Document   : indextest
    Created on : Nov 22, 2013, 11:48:23 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                    <form action="indextest" method="get" style="text-align: right">
                        <input type="hidden" name="id" value="${id}">
                        <input type="hidden" name="x" value="${x}">
                        <select name="y">
                            <option value="3" ${y==3?"selected":""}>3</option>
                            <option value="5" ${y==5?"selected":""}>5</option>
                            <option value="10" ${y==10?"selected":""}>10</option>
                            <option value="15" ${y==15?"selected":""}>15</option>
                        </select>
                        <input type="submit" value="Go" >
                    </form>
                    <br>
                    <div class="cbp-vm-options">
                        <a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid">Grid View</a>
                        <a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list">List View</a>
                    </div>
                    <ul>
                        <c:forEach items="${products}" var="pro">
                            <li>

                                <a class="cbp-vm-image" href="SearchProductSingle?id=${pro.productid}"><img src="${pro.pic}" style="width: 100px; height: 100px;"></a>
                                <h3 class="cbp-vm-title">${pro.name}</h3>
                                <div class="cbp-vm-price">${pro.price} Baht</div>
                                <div class="cbp-vm-details">
                                    ${pro.des}
                                </div>
                                <a class="cbp-vm-icon cbp-vm-add" href="SearchProductSingle?id=${pro.productid}">Detail</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div><!-- /main -->
        </div><!-- /container -->
        <table style="width: 30%" align="center">
            <tr>
                <c:choose>
                    <c:when test="${x-y>=0}">
                        <td style="width: 50px;height: 20px;text-align: center ">
                            <a href="indextest?id=${id}&x=${x-y}&y=${y}">Prev</a></td> 
                        </c:when>
                        <c:otherwise>
                            <td style="width: 50px;height: 20px;text-align: center;color: #02639d ">
                            Prev</td> 
                        </c:otherwise>
                    </c:choose>
                
                <c:set var="i" value="1"/>
                <c:forEach begin="1" end="${totalPage}">
                    <c:choose>
                        <c:when test="${y*(i-1)==x}">
                            <td style="background-color: #02639d;width: 50px;height: 20px;text-align: center ">
                                ${i} 
                            </td>
                        </c:when>

                        <c:otherwise>
                            <td style="width: 50px;height: 20px;text-align: center ">
                                <a href="indextest?id=${id}&x=${y*(i-1)}&y=${y}">${i}</a>
                            </td>
                        </c:otherwise>
                    </c:choose>
                    <c:set var="i" value="${i+1}"/>
                </c:forEach>
                            
                <c:choose>
                    <c:when test="${currentPage<totalPage}">
                        <td style="width: 50px;height: 20px;text-align: center ">
                            <a href="indextest?id=${id}&x=${x+y}&y=${y}">Next</a></td> 
                        </c:when>
                        <c:otherwise>
                            <td style="width: 50px;height: 20px;text-align: center;color: #02639d ">
                            Next</td> 
                        </c:otherwise>
                    </c:choose> 
            </tr>
        </table>
        <jsp:include page="footer.jsp"/>
        <script src="codropsindex/js/classie.js"></script>
        <script src="codropsindex/js/cbpViewModeSwitch.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
