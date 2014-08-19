<%-- 
    Document   : showAccountAdminEdit
    Created on : Nov 15, 2013, 2:46:29 AM
    Author     : Admin
--%>

<%@page import="model.Account"%>
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
            Account c = (Account) request.getAttribute("account");
        %>
        <div style="color: black; margin-top: 100px">
            <div style="margin-left: 250px"><h1><%=c.getUserId()%> <img src="<%=c.getPic()%>" style="width: 50px; height: 50px;"/><hr></h1></div>
            <form action="editAccountAdmin" method="get">
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
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"></label>
                        <div class="col-sm-4">
                            <input type="submit" class="btn btn-default" value="Edit !"></td>
                        </div>
                    </div>
                </div>
            </form>
            <form action="showPMAdmin" method="post">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"></label>
                        <div class="col-sm-4">
                            <input type="hidden" name="id" value="<%=c.getUserId() %>">
                            <input type="submit" class="btn btn-default" value="PM !"></td>
                        </div>
                    </div>
                </form>
    </body>
</html>
