<%-- 
    Document   : UserProfile
    Created on : Nov 6, 2013, 12:32:18 AM
    Author     : Admin
--%>

<%@page import="model.Address"%>
<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="profile/css/component.css" />
        <script src="profile/js/modernizr.custom.js"></script>
        <title>Profile</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <%
            Account c = (Account) session.getAttribute("user");
            Product p = (Product) request.getAttribute("product");
        %>

        <div style="color: black; margin-top: 200px;">
            <div class="main" style="text-align: center">
                <nav id="cbp-hrmenu" class="cbp-hrmenu">
                    <ul>
                        <li>
                            <a href="#">Edit Profile</a>
                            <div class="cbp-hrsub"> 
                                <div style="text-align: center"><h1><%=c.getUserId()%> <img src="<%=c.getPic()%>" style="width: 50px; height: 50px;"/><hr></h1></div>
                                <form action="editProfile" method="get">
                                    <div class="form-horizontal" role="form" style="margin-left: 350px">
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
                                    <div style="max-width: 500px; padding-left: 550px">
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
                        </li>
                        <li>
                            <a href="profile">All My Product</a>
                            <div class="cbp-hrsub"> 
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
                                            <td><a href="showProduct?id=<%= a.getProductid()%>"><img src="<%= a.getPic()%>" style="width: 100px; height: 100px;" class="img-rounded"/></a></td>
                                            <td>
                                                <a href="showProduct?id=<%= a.getProductid()%>">
                                                    <%= a.getName()%></a></td>
                                            <td><%= a.getPrice()%></td>
                                            <td><%= a.getType()%></td>
                                            <td><%= a.getNowDay()%></td>
                                        <form action="upDate" method="post">
                                            <input type="hidden" name="id" value="<%= a.getProductid()%>">
                                            <td><input type="submit" class="btn btn-default" value="Up !" OnClick="JavaScript:alert('Up Success !');"></td>
                                        </form>
                                        <form action="deleteProfile" method="post">
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
                            </div>
                        </li>
                        <li>
                            <a href="#">All My Comment</a>
                            <div class="cbp-hrsub"> 
                                <div style="color: black;text-align: center" ><h2>All My Comment</h2><hr></div>
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
                                                <td style="border: none"> in Product <%=cpp.getName()%></td>
                                                <td style="border: none"><input type="submit" value="Delete Comment !" class="btn btn-default"></td>

                                                </div>
                                                </form>
                                            <form action="showEditComment" method="get">
                                                <input type="hidden" name="id" value="<%=cpp.getCommentid()%>">
                                                <td style="border: none"><input type="submit" value="Edit Comment !" class="btn btn-default"></td>
                                            </form>
                                            </tr>  
                                        </table>
                                    </div>
                                    <%}%>
                                    <%}%> 
                            </div>
                        </li>
                        <li>
                            <a href="#">My Address</a>
                            <div class="cbp-hrsub"> 
                                <br>
                                <a href="addAddress.jsp"><button type="button" class="btn btn-warning">Add Address</button></a>
                                <%
                                    List<Address> ad = (List<Address>) request.getAttribute("ad");
                                    if (ad.size() > 0) {
                                        //int i = 1;
                                        for (Address add : ad) {%>
                                <form action="deleteAddress" method="post">
                                    <div style="padding-left: 244px;max-width: 70%;color: black ">
                                        <table style="border: none">
                                            <tr>
                                                <td style="border: none"><input type="radio" name="id" value="<%=add.getAddress_id()%>"/><%= add.getAddress()%></td>
                                                <td style="border: none"><input type="submit" value="Delete Address !" class="btn btn-default"></td>
                                                </form>
                                            <form action="showEditAddress" method="get">
                                                <input type="hidden" name="id" value="<%=add.getAddress_id()%>">
                                                <td style="border: none"><input type="submit" value="Edit Address !" class="btn btn-default"></td>
                                            </form>
                                            </tr>  
                                        </table>
                                    </div>
                                    <%}%>
                                    <%}%>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
            <script src="profile/js/cbpHorizontalMenu.min.js"></script>
            <script>
                                                $(function() {
                                                    cbpHorizontalMenu.init();
                                                });
            </script>
        </div>
    </body>
</html>