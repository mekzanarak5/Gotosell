<%-- 
    Document   : UserProfile
    Created on : Nov 6, 2013, 12:32:18 AM
    Author     : Admin
--%>

<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
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
            Account c = (Account) session.getAttribute("user");
        %>

        <div style="color: black; margin-top: 100px">
            <div style="margin-left: 250px"><h1><%=c.getUserId()%> <img src="<%=c.getPic()%>" style="width: 50px; height: 50px;"/><hr></h1></div>
            <form action="editProfileAdmin" method="get">
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

            <form action="addProfilePic" method="post"
                  enctype="multipart/form-data">
                <div style="max-width: 500px; padding-left: 240px">
                    <table>
                        <tr>
                            <td><input type="file" name="file" size="50" /></td>
                        <input type="hidden" name="id" value="<%=c.getAccountid()%>"/>
                        <td><input type="submit" class="btn btn-default" value="Upload File" /></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>

        <%
            List<Product> cs = (List<Product>) request.getAttribute("cs");
            if (cs.size() > 0) {
        %>

        <div style="color: black">

            <table class="table table-striped" style="text-align: center">
                <tr bgColor="#ffffff">
                    <td>Seller</td>
                    <td>Pic</td>
                    <td>Name</td>
                    <td>Price</td>
                    <td>Type</td>
                    <td>UpToDate</td>
                    <td>Up</td>
                    <td>Delete</td>
                </tr>
                <%
                    int i = 1;
                    for (Product a : cs) {%>

                <tr bgColor='<%= (i++ % 2 == 0 ? "#EEEEEE" : "#FFFFFF")%>'>
                    <td><%= a.getUserId()%></td>
                    <td><a href="editProductAdmin?id=<%= a.getProductid()%>"><img src="<%= a.getPic()%>" style="width: 100px; height: 100px;" class="img-rounded"/></a></td>
                    <td>
                        <a href="editProductAdmin?id=<%= a.getProductid()%>">
                            <%= a.getName()%></a></td>
                    <td><%= a.getPrice()%></td>
                    <td><%= a.getType()%></td>
                    <td><%= a.getNowDay()%></td>
                <form action="upDateAdmin" method="post">
                    <input type="hidden" name="id" value="<%= a.getProductid()%>">
                    <td><input type="submit" class="btn btn-default" value="Up !"></td>
                </form>
                <form action="deleteProfileAdmin" method="post">
                    <input type="hidden" name="id" value="<%= a.getProductid()%>">
                    <td><input type="submit" class="btn btn-default" value="Delete !"></td>
                </form>
                 </tr>
                <%}%>
            </table>
        </div>
        <%} else {%>
        <H3><font color="red"> 
            ${msg} </font>
        </H3>
                <%}%>
        <div style="padding-left: 244px; color: black " ><h2>All My Comment</h2><hr></div>
            <%
                List<Comment> css = (List<Comment>) request.getAttribute("css");
                if (css.size() > 0) {
                    //int i = 1;
                    for (Comment cpp : css) {%>
        <form action="deleteCommentUser" method="post">
            <input type="hidden" name="productid" value="<%=cpp.getProductid()%>"/>

            <div style="padding-left: 244px;max-width: 70%;color: black ">
                <table style="border: none">
                    <tr>
                        <td style="border: none"><input type="radio" name="id" value="<%=cpp.getCommentid()%>"/><img src="<%=cpp.getPic()%>" style="width: 50px; height: 50px;" /> <%=cpp.getUserid()%> : <%= cpp.getComment()%></td>
                        <td style="border: none"> in Product <%=cpp.getProductid() %></td>
                        <td style="border: none"><input type="submit" value="Delete Comment !" class="btn btn-default"></td>
                    </tr>
                </table>
            </div>
            <%}%>
            <%}%> 
        </form>

    </body>
</html>