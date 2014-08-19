<%-- 
    Document   : editAddress
    Created on : Nov 22, 2013, 9:25:11 PM
    Author     : Admin
--%>

<%@page import="model.Address"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <%
            Address c = (Address) request.getAttribute("address");
        %>
        <form action="editAddress" method="post">
            <div style="padding-left: 244px; color: black " ><h2>Address</h2><hr></div>
            <div style="padding-left: 244px;max-width: 70%;color: black ">
                <table style="border: none">
                    <tr>
                        <td style="border: none"><input type="hidden" name="id" value="<%=c.getAddress_id()%>"/>
                            <textarea name="address" class="form-control" rows="3"><%=c.getAddress()%></textarea>
                        <td style="border: none"><input type="submit" value="Edit Address !" class="btn btn-default"></td>
                    </tr>
                </table>
            </div>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
