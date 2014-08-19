<%-- 
    Document   : deletePic
    Created on : Nov 13, 2013, 3:54:06 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.Pic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Picture</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <%
            Pic p = (Pic) request.getAttribute("pic");
            List<Pic> cs = (List<Pic>) request.getAttribute("cs");
        %>
        <form action="deletePic" method="get">
            <div style="padding-left: 250px;padding-top: 200px">
        
        <% if (cs.size() > 0) {
                int i = 1;
                for (Pic c : cs) {%>
                <input type="hidden" value="<%=c.getProductid()%>" name="productid">
                <input type="radio" value="<%=c.getPic_id()%>" name="picid"><img src="<%=c.getPic()%>" style="width: 100px; height: 100px; "/>
        <%}%>
        <%}%>
        <br>
        <br>
        <br>
        <br>
        <input type="submit" value="Delete Pic !" class="btn btn-default">
        </div>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
