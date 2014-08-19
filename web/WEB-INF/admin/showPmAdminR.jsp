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
                    <td>Sender</td>
                    <td>Receiver</td>
                    <td>Private Message</td>
                    <td>Time</td>
                    <td>Delete</td>
                </tr>
                <%
                    int i = 1;
                    for (PrivateM c : cs) {%>
                <tr bgColor='<%= (i++ % 2 == 0 ? "#EEEEEE" : "#FFFFFF")%>'>
                    <td><a href="editAccountAdmin?id=<%= c.getSender()%>"><%= c.getSender()%></a></td>
                    <td><%= c.getReceiver()%></a></td>
                    <td><%= c.getPm()%></td>
                    <td><%= c.getTime()%></td>
                <form action="deletePM" method="post">
                    <input type="hidden" name="pmid" value="<%= c.getPm_id()%>">
                    <input type="hidden" name="userid" value="<%= c.getReceiver()%>">
                    <td><input type="submit" class="btn btn-default" value="Delete !"></td>
                </form>
                </tr>
                                    <%}%>
        <%}%>
            </table>
        </div>
    </body>
</html>
