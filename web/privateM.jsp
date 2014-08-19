<%-- 
    Document   : privateM
    Created on : Nov 18, 2013, 9:36:24 PM
    Author     : Admin
--%>

<%@page import="model.PrivateM"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PM</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <%
            HttpSession s = request.getSession(false);
            Account a = (Account) s.getAttribute("user");
            PrivateM c = (PrivateM) request.getAttribute("pm");
            Account cc = (Account) request.getAttribute("account");
        %>
        <form action="sendPM" method="get">
            <div style="padding-left: 244px;color: black;padding-top: 200px " ><h2>PM to <%=cc.getUserId()%></h2><hr></div>
        <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label"></label>
                    <div class="col-sm-4">
                        <input type="hidden" name="sender" value="<%=a.getUserId() %>">
                        <input type="hidden" name="receiver" value="<%=cc.getUserId() %>">
                        <textarea name="pm" class="form-control" rows="3"></textarea>
                    </div>
                </div>
                <div style="padding-left: 250px">
                    <input type="submit" class="btn btn-default" value="PM !">
                </div>
            </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
