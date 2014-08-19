<%-- 
    Document   : addAddress
    Created on : Nov 22, 2013, 8:57:29 PM
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
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <div style="padding-left: 244px;color: black;padding-top: 200px " ><h2>Add Address</h2><hr></div>
        <form action="addAddress" method="get">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label"></label>
                <div class="col-sm-4">
                    <textarea name="address" class="form-control" rows="3" required></textarea>
                </div>
            </div>
            <div style="padding-left: 250px">
                <input type="submit" class="btn btn-default" value="Add Address !">
            </div>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
