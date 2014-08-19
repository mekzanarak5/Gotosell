<%-- 
    Document   : addProduct
    Created on : Oct 31, 2013, 12:56:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Up Load Picture</title>
    </head>
    <head>
        <title>File Uploading Form</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <div style="color: black; margin-top: 200px;margin-left: 250px">
            <h3>File Upload:</h3>
            Select a file to upload: <br />
            <form action="upLoad" method="post"
                  enctype="multipart/form-data">
                <input type="file" name="file" size="50" />
                <input type="hidden" name="id" value="<%=request.getAttribute("lastid")%>"/>
                <br />
                <input type="submit" class="btn btn-default" value="Upload File" />
            </form>
        </div>
    </body>
</html>

