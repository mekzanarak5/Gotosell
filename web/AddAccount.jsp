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
        <title>Register</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <script language="javascript">
            function fncSubmit()

            {
                if (confirm('Register ?') == true)
                {
                    document.form1.submit();
                }
            }
        </script>
        <div style="color: black; margin-top: 200px">
            <div style="margin-left: 250px"><h1>Register</h1><hr></div>
            <form class="form-horizontal" role="form" action="AddAccount" method="post">
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
                        <input type="email" class="form-control" placeholder="E-mail" name="email" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default" OnClick="JavaScript:fncSubmit();">Register</button>
                        <button type="reset" class="btn btn-default">Reset</button>
                    </div>
                </div>
        </div>
        ${msg}
    </form>
    <jsp:include page="footer.jsp"/>
</body>
</html>
