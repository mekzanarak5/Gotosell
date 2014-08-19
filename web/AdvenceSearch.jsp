<%-- 
    Document   : AdvenceSearch
    Created on : Nov 19, 2013, 3:03:57 PM
    Author     : Admin
--%>

<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advence Search</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <div style="padding-left: 244px;color: black;padding-top: 200px " ><h2>Advence Search</h2><hr></div>
        <form action="AdvenceSearch" method="get">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label" style="color: black"></label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Search by Productname and Username" name="name"><br>
                     <label for="inputEmail3" class="col-sm-2 control-label" style="color: black"></label>
                    <input type="text" class="form-control" placeholder="Price 1" name="p1"><br>
                    <input type="text" class="form-control" placeholder="Price 2" name="p2"><br>
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label" style="color: black"></label>
                <div class="col-sm-4" style="margin-right: 50px; margin-top: -6px">
                    <select class="form-control" name="type">
                        <option value="Women Wear">Women Wear</option>
                        <option value="Men Wear">Men Wear</option>
                        <option value="IT/Electronics">IT/Electronics</option>
                        <option value="Car">Car</option>
                        <option value="Home">Home</option>  
                        <option value="Musical instrument">Musical instrument</option>
                        <option value="Others">Others</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Seach !</button>
                </div>
            </div>
        </form>
        <div style="color: red">
        ${msg}
        </div>
        <br>
    </body>
</html>
