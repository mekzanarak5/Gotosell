<%-- 
    Document   : AddAccount
    Created on : Oct 25, 2013, 10:30:45 PM
    Author     : Admin
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <%
            if (request.getAttribute("msg") != null) {
                out.print(request.getAttribute("msg"));
            }%>
            <div style="color: black; margin-top: 100px">
        <div style="margin-left: 250px"><h1>Add Product</h1><hr></div>
        <form class="form-horizontal" role="form" action="AddProductAdmin" method="post">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" value="${user.userId}" disabled>
                    <input type="hidden" class="form-control" value="${user.userId}" name="userid">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Product</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Name of product" name="name" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Price</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Price" name="price" required> *Bahts
                     <input type="text" class="form-control" placeholder="Sub Price" name="text" required> * ตัวหนังสือ
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                <div class="col-sm-4">
                    <textarea class="form-control" name="des" rows="3" required></textarea> 
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Type</label>
                <div class="col-sm-4">
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
                <label for="inputEmail3" class="col-sm-2 control-label">Phone</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Phone" name="phone" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Address</label>
                <div class="col-sm-4">
                    <textarea class="form-control" name="address" rows="3" required></textarea> 
                </div>
            </div>  
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Sell It !</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                </div>
            </div>
                </div>
            ${msg}
    </body>
</html>
