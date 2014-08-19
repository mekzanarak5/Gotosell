<%-- 
    Document   : showProduct
    Created on : Nov 1, 2013, 9:48:04 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <%
            List<Product> cs = (List<Product>) request.getAttribute("cs");
            if (cs.size() > 0) {
        %>
        <div style="color: black; margin-top: 100px">
            <table class="table table-striped" style="text-align: center">
                <tr bgColor="#ffffff">
                    <td>Seller</td>
                    <td>Pic</td>
                    <td>Name</td>
                    <td>Price</td>
                    <td>Type</td>
                    <td>UpToDate</td>
                    <td>Up !</td>
                    <td>Delete !</td>

                </tr>
                <%
                    int i = 1;
                    for (Product c : cs) {%>
                <tr bgColor='<%= (i++ % 2 == 0 ? "#EEEEEE" : "#FFFFFF")%>'>
                    <td><%= c.getUserId()%></td>
                    <td><a href="showProductAdmin?id=<%= c.getProductid()%>"><img src="<%= c.getPic()%>" style="width: 100px; height: 100px;" class="img-rounded"/></a></td>
                    <td>
                        <a href="showProductAdmin?id=<%= c.getProductid()%>">
                            <%= c.getName()%></a></td>
                    <td><%= c.getPrice()%></td>
                    <td><%= c.getType()%></td>
                    <td><%= c.getNowDay()%></td>
                <form action="upDateAdmin" method="post">
                    <input type="hidden" name="id" value="<%= c.getProductid()%>">
                    <td><input type="submit" class="btn btn-default" value="Up !"></td>
                </form>
                <form action="deleteProductAdmin" method="post">
                    <input type="hidden" name="id" value="<%= c.getProductid()%>">
                    <td><input type="submit" class="btn btn-default" value="Delete !"></td>
                </form>
                </tr>
                <%}%>
            </table>
        </div>
        <%} else {%>
        <H3><font color="red"> 
            <%= request.getAttribute("msg")%> </font>
        </H3>
        <%}%>
    </body>
</html>
