<%-- 
    Document   : showProductSingle
    Created on : Nov 4, 2013, 7:09:21 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Comment"%>
<%@page import="model.Account"%>
<%@page import="model.Pic"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <script language="javascript">
            function fncSubmit()

            {
                if (confirm('Report to Admin ?') == true)
                {
                    document.form1.submit();
                }
            }
        </script>
        <%
            //HttpSession s = request.getSession(false);
            //Account a = (Account) s.getAttribute("user");
            Product c = (Product) request.getAttribute("product");
            List<Pic> cs = (List<Pic>) request.getAttribute("cs");
            List<Comment> css = (List<Comment>) request.getAttribute("css");
        %>
        <div style="color: black; margin-top: 200px">
            <div style="margin-left: 250px"><h1><%=c.getName()%> by  <a href="showAccount?id=<%= c.getUserId()%>"><%=c.getUserId()%></a></h1><hr></div>
            <form class="form-horizontal" role="form" action="AddComment" method="post">
                <div style="margin-left: 250px">
                    <img src="<%= c.getPic()%>" style="width: 200px; height: 200px;" class="img-rounded"/>
                    <input type="hidden" name="id" value="<%=c.getProductid()%>"/>
                    <input type="hidden" name="name" value="<%=c.getName()%>"/>
                    <input type="hidden" name="user" value="<%=c.getUserId()%>"/>
                    <%
                        if (cs.size() > 0) {
                            //int i = 1;
                            for (Pic cp : cs) {%>
                    <img src="<%= cp.getPic()%>" style="width: 200px; height: 200px;" class="img-rounded"/>
                    <%}%>
                    <%}%>
                </div><br>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Product Id</label>
                    <div class="col-sm-4" >
                        <div class="form-control">
                            <%=c.getProductid()%>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                    <div class="col-sm-4">
                        <div class="form-control">
                            <a href="showAccount?id=<%= c.getUserId()%>"><%=c.getUserId()%></a>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Product</label>
                    <div class="col-sm-4">
                        <div class="form-control">
                            <%=c.getName()%>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Price</label>
                    <div class="col-sm-4">
                        <div class="form-control">
                            <%=c.getPrice()%> *Bahts
                        </div>
                    </div> 
                    <div class="col-sm-4">
                        <div class="form-control">
                            <%=c.getText()%>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-4">
                        <textarea class="form-control" rows="3" disabled=""><%= c.getDes()%></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Type</label>
                    <div class="col-sm-4">
                        <div class="form-control">
                            <%= c.getType()%>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Phone</label>
                    <div class="col-sm-4">
                        <div class="form-control">
                            <%= c.getPhone()%>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Address</label>
                    <div class="col-sm-4">
                        <textarea class="form-control" rows="3" disabled=""><%= c.getAddress()%></textarea>
                    </div>
                </div>
                    <div style="margin-left: 270px"> 
            <%
                                HttpSession s = request.getSession(false);
                                Account a = (Account) s.getAttribute("user");
                                if (a != null) {
                            %>
                                <a href="sendPM?sender=${u}&receiver=admin&pm=<%=c.getUserId() %>,<%=c.getProductid()%>"><input type="button" class="btn btn-default" value="Report Product !" OnClick="JavaScript:fncSubmit();"></a>
                            <%} else {%>
                            <a href="Login.jsp"><input type="button" class="btn btn-default" value="Login to Report !"></a>
                                    <%}%>
                            </div>
                <div style="padding-left: 244px " ><h2>Comment</h2><hr></div>
                    <%
                        if (css.size() > 0) {
                            //int i = 1;
                            for (Comment cpp : css) {%>
                <input type="hidden" name="productid" value="<%=cpp.getProductid()%>"/> 
                <div style="padding-left: 244px;max-width: 70%">
                    <table style="border: 2px solid #000000;border-left: 2px solid #000000;border-right: 2px solid #000000;">
                        <tr>
                            <td><img src="<%=cpp.getPic()%>" style="width: 50px; height: 50px;" /> <a href="showAccount?id=<%=cpp.getUserid()%>"><%=cpp.getUserid()%></a><a href="commentQ?id=<%=cpp.getProductid()%>&com=<%=cpp.getCommentid()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-default" value="Quote"></a><br><br>
                                    <%= cpp.getCommentHTML()%>
                            </td>
                            <%
                                if (a != null) {
                            %>
                            <td>
                                <a href="sendPM?sender=${u}&receiver=admin&pm=<%=cpp.getCommentid()%>,<%=cpp.getProductid()%>"><input type="button" class="btn btn-default" value="Report !" OnClick="JavaScript:fncSubmit();"></a>
                            </td>
                            <%} else {%>
                            <td><a href="Login.jsp"><input type="button" class="btn btn-default" value="Login to Report !"></a></td>
                                    <%}%>
                        </tr>
                    </table>
                </div>
                <%}%>
                <%}%>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label"></label>
                    <div class="col-sm-4">
                        <textarea name="comment" class="form-control" rows="3" required></textarea>
                    </div>
                </div>
                <div style="padding-left: 250px">
                    <input type="submit" class="btn btn-default" value="Comment !">
                </div>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
