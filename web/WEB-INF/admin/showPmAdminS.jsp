<%-- 
    Document   : showUserPM
    Created on : Nov 18, 2013, 11:39:54 PM
    Author     : Admin
--%>

<%@page import="model.Account"%>
<%@page import="model.PrivateM"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PM Box</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <%
            Account a = (Account) session.getAttribute("user");
            List<PrivateM> cs = (List<PrivateM>) request.getAttribute("cs");
            %>
           
        <div style="color: black; margin-top: 200px">
            <div style="padding-left: 100px " ><h2>PM Box</h2><a href="showPmAdminR?id=<%=a.getUserId() %>"><button type="button" class="btn btn-warning">Inbox</button></a><a href="showPmAdminS?id=<%=a.getUserId() %>"><button type="button" class="btn btn-info">Sent</button></a><hr></div>
             <%
            if (cs.size() > 0) {
        %>
            <table class="table table-striped" style="text-align: center">
                <tr bgColor="#ffffff">
                    <td>Receiver</td>
                    <td>Sender</td>
                    <td>Private Message</td>
                    <td>Time</td>
                </tr>
                <%
                    int i = 1;
                    for (PrivateM c : cs) {%>
                <tr bgColor='<%= (i++ % 2 == 0 ? "#EEEEEE" : "#FFFFFF")%>'>
                    <td><a href="editAccountAdmin?id=<%= c.getReceiver()%>"><%= c.getReceiver()%></a></td>
                    <td><%= c.getSender()%></a></td>
                    <td><%= c.getPm()%></td>
                    <td><%= c.getTime()%></td>
                </tr>
                <%}%>
                <%}%>
            </table>
        </div>
    </body>
</html>
