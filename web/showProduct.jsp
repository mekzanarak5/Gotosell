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
        <title>Product</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <%
            List<Product> cs = (List<Product>) request.getAttribute("cs");
            if (cs.size() > 0) {
        %>
        <div style="color: black; margin-top: 200px">
            <table class="table table-striped" style="text-align: center">
                <tr bgColor="#ffffff">
                    <td>Seller</td>
                    <td>Pic</td>
                    <td>Name</td>
                    <td>Price</td>
                    <td>More</td>
                    <td>Type</td>
                    <td>UpToDate</td>
                </tr>
                <%
                    int i = 1;
                    for (Product c : cs) {%>
                <tr bgColor='<%= (i++ % 2 == 0 ? "#EEEEEE" : "#FFFFFF")%>'>
                    <td><a href="showAccount?id=<%= c.getUserId()%>"><%= c.getUserId()%></a></td>
                    <td><a href="SearchProductSingle?id=<%= c.getProductid()%>"><img src="<%= c.getPic()%>" style="width: 100px; height: 100px;" class="img-rounded"/></a></td>
                    <td>
                        <a href="SearchProductSingle?id=<%= c.getProductid()%>">
                            <%= c.getName()%></a></td>
                           
                    <td><%= c.getPrice()%></td>
                    <td><%= c.getText()%></td>
                    <td><%= c.getType()%></td>
                    <td><%= c.getNowDay()%></td>
                </tr>
                <%}%>
            </table>
        </div>
        <%}
        else {%>
        <H3><font color="red"> 
            <%= request.getAttribute("msg")%> </font>
        </H3>
        <%}%>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
