<%-- 
    Document   : editComment
    Created on : Nov 15, 2013, 8:54:41 PM
    Author     : Admin
--%>

<%@page import="model.Comment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Comment</title>
    </head>
    <body>
        <jsp:include page="header1.jsp"/>
        <jsp:include page="menucat.jsp"/>
        <%
            Comment c = (Comment) request.getAttribute("comment");
        %>
        <form action="editComment" method="post">
            <div style="padding-left: 244px; color: black " ><h2>Comment</h2><hr></div>
            <input type="hidden" name="productid" value="<%=c.getProductid()%>"/>
            
            <div style="padding-left: 244px;max-width: 70%;color: black ">
                <table style="border: none">
                    <tr>
                        <td style="border: none"><input type="hidden" name="id" value="<%=c.getCommentid()%>"/>
                            <textarea name="comment" class="form-control" rows="3"><%=c.getComment() %></textarea>
                        <td style="border: none"><input type="submit" value="Edit Comment !" class="btn btn-default"></td>
                    </tr>
                </table>
            </div>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
