<%-- 
    Document   : AddAccount
    Created on : Oct 25, 2013, 10:30:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div style="color: black; margin-top: 100px">
        <div style="margin-left: 250px"><h1>Add Account</h1><hr></div>
        <form class="form-horizontal" role="form" action="AddAccountAdmin" method="post">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Username" name="userid" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" placeholder="Password" name="password" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Confirm Password</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" placeholder="Confirm Password" name="confirmpassword" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">First Name</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="First Name" name="firstname" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Last Name</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Last Name" name="lastname" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">E-mail</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="E-mail" name="email" required>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Add Account</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                </div>
            </div>
            </div>
            ${msg}
            </form>
    </body>
</html>
