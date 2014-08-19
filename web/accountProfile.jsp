<%-- 
    Document   : accountProfile
    Created on : Nov 18, 2013, 8:57:50 PM
    Author     : Admin
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <%
            Account c = (Account) request.getAttribute("account");
        %>
        <div style="color: black; margin-top: 200px">
            <div style="margin-left: 250px"><h1><%=c.getUserId()%> <img src="<%=c.getPic()%>" style="width: 50px; height: 50px;"/><hr></h1></div>
            <div class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                    <div class="col-sm-4" >
                        <input type="text" class="form-control" value="<%=c.getUserId()%>" disabled/>
                        <input type="hidden" name="id" value="<%=c.getUserId()%>"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-4" >
                        <input type="text" class="form-control" name="password" value="<%=c.getPassword()%>" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">E-mail</label>
                    <div class="col-sm-4" >
                        <input type="text" class="form-control" name="email" value="<%=c.getEmail()%>" />

                    </div>
                </div>

                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Fristname</label>
                    <div class="col-sm-4" >
                        <input type="text" class="form-control" name="firstname" value="<%=c.getFirstName()%>" />
                    </div>
                </div> 
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Lastname</label>
                    <div class="col-sm-4" >
                        <input type="text" class="form-control" name="lastname" value="<%=c.getLastName()%>" />
                    </div>
                </div>

                    <form action="showPM" method="post">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"></label>
                        <div class="col-sm-4">
                            <%
                                HttpSession s = request.getSession(false);
                                Account a = (Account) s.getAttribute("user");
                                if (a != null) {
                            %>
                            <input type="hidden" name="id" value="<%=c.getUserId() %>">
                            <input type="submit" class="btn btn-default" value="PM !">
                            <%} else {%>
                            <a href="Login.jsp"><input type="button" class="btn btn-default" value="Login to PM !"></a>
                                    <%}%>
                        </div>
                    </div>
                </form>
            </div>
            <jsp:include page="footer.jsp"/>
    </body>
</html>
