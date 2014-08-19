<%-- 
    Document   : showProduct
    Created on : Nov 1, 2013, 9:48:04 PM
    Author     : Admin
--%>

<%@page import="model.Account"%>
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
            List<Account> cs = (List<Account>) request.getAttribute("cs");
            if (cs.size() > 0) {
        %>
        <div style="color: black; margin-top: 100px">
            <table class="table table-striped" style="text-align: center">
                <tr bgColor="#ffffff">
                    <td>Username</td>
                    <td>Pic</td>
                    <td>Firstname</td>
                    <td>Lastname</td>
                    <td>AccountID</td>
                    <td>E-mail</td>
                    <td>Delete !</td>

                </tr>
                <%
                    int i = 1;
                    for (Account c : cs) {%>
                <tr bgColor='<%= (i++ % 2 == 0 ? "#EEEEEE" : "#FFFFFF")%>'>
                    <td><%= c.getUserId()%></td>
                    <td><a href="ShowAccountAdmin?id=<%= c.getUserId()%>"><img src="<%= c.getPic()%>" style="width: 100px; height: 100px;" class="img-rounded"/></a></td>
                    <td><a href="ShowAccountAdmin?id=<%= c.getUserId() %>">
                           <%= c.getFirstName()%></a></td>
                    <td><%= c.getLastName()%></td>
                    <td><%= c.getAccountid()%></td>
                    <td><%=c.getEmail() %></td>
                <form action="deleteAccountAdmin" method="post">
                    <input type="hidden" name="id" value="<%= c.getAccountid()%>">
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
