<%-- 
    Document   : showProductSingleEdit
    Created on : Nov 8, 2013, 7:38:29 PM
    Author     : Admin
--%>

<%@page import="model.Comment"%>
<%@page import="model.Pic"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <%
            Product c = (Product) request.getAttribute("product");
            List<Pic> cs = (List<Pic>) request.getAttribute("cs");
            List<Comment> css = (List<Comment>) request.getAttribute("css");

        %>
        <div style="color: black; margin-top: 200px">
            <form class="form-horizontal" role="form" action="editProduct" method="get">
                <div style="margin-left: 250px"><h1><%=c.getName()%> by <%=c.getUserId()%></h1><hr></div>
                <div style="margin-left: 250px">
                    <img src="<%= c.getPic()%>" style="width: 200px; height: 200px;" class="img-rounded"/>
                    <%
                        if (cs.size() > 0) {
                            //int i = 1;
                            for (Pic cp : cs) {%>
                    <input type="hidden" name="id" value="<%=c.getProductid()%>"/> 
                    <img src="<%= cp.getPic()%>" style="width: 200px; height: 200px;" class="img-rounded"/>
                    <%}%>
                    <%}%>
                </div><br>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Product Id</label>
                    <div class="col-sm-4" >
                        <input type="text" class="form-control" value="<%=c.getProductid()%>" disabled/>
                        <input type="hidden" name="id" value="<%=c.getProductid()%>"/> 
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" value="<%=c.getUserId()%>" disabled/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Product</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="name" value="<%=c.getName()%>"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Price</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="price" value="<%=c.getPrice()%>"/> * Bahts
                        <input type="text" class="form-control" name="text" value="<%=c.getText() %>"> * ตัวหนังสือ
                    </div> 
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-4">
                        <textarea name="des" class="form-control" rows="3"><%= c.getDes()%></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Type</label>
                    <div class="col-sm-4">
                        <select name="type" class="form-control">
                            <option value="Women Wear" ${product.type=="Women Wear"?"selected":''} >Women Wear</option>
                            <option value="Men Wear" ${product.type=="Men Wear"?"selected":''}>Men Wear</option>
                            <option value="IT" ${product.type=="IT"?"selected":''}>IT</option>
                            <option value="Car" ${product.type=="Car"?"selected":''}>Car</option>
                            <option value="Home" ${product.type=="Home"?"selected":''}>Home</option>  
                            <option value="Musical instrument" ${product.type=="Musical instrument"?"selected":''}>Musical instrument</option>
                            <option value="Others" ${product.type=="Others"?"selected":''}>Others</option> 
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Phone</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="phone" value="<%= c.getPhone()%>"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Address</label>
                    <div class="col-sm-4">
                        <textarea class="form-control" rows="3" name="address"><%= c.getAddress()%></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label"></label>
                    <div class="col-sm-4">
                        <input type="submit" class="btn btn-default" value="Edit !">
                    </div>
                </div>
            </form>
            <div style="max-width: 500px; padding-left: 240px">
                <table style="border: none">
                    <form action="insertPic" method="post"
                          enctype="multipart/form-data">
                        <tr>
                            <td style="border: none"><input type="file" name="file" size="50" /></td>
                        <input type="hidden" name="id" value="<%=c.getProductid()%>"/>
                        <td style="border: none"><input type="submit" class="btn btn-default" value="Insert Pic !" /></td>

                    </form>
                    <form action="showDeletePic" method="get">
                        <input type="hidden" name="productid" value="<%=c.getProductid()%>">
                        <td style="border: none"><input type="submit" value="Delete Pic !" class="btn btn-default"></td>
                    </form>
                    </tr>
                </table>
            </div>
        </div>  
        <form action="deleteComment" method="post">
            <div style="padding-left: 244px; color: black " ><h2>Comment</h2><hr></div>
                <%
                    if (css.size() > 0) {
                        //int i = 1;
                        for (Comment cpp : css) {%>
            <input type="hidden" name="productid" value="<%=cpp.getProductid()%>"/>
            
            <div style="padding-left: 244px;max-width: 70%;color: black ">
                <table style="border: none">
                    <tr>
                        <td style="border: none"><input type="radio" name="id" value="<%=cpp.getCommentid()%>"/><img src="<%=cpp.getPic()%>" style="width: 50px; height: 50px;" /> <%=cpp.getUserid()%> : <%= cpp.getComment()%></td>
                        <td style="border: none"><input type="submit" value="Delete Comment !" class="btn btn-default"></td>
                    </tr>
                </table>
            </div>
            <%}%>
            <%}%> 
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
