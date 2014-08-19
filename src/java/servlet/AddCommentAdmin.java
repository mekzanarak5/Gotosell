/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Comment;

/**
 *
 * @author Admin
 */
public class AddCommentAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession s = request.getSession(false);
        Account a = (Account) s.getAttribute("user");
        String comment = request.getParameter("comment");
        String productid = request.getParameter("id");
        String name = request.getParameter("name");
        String namethai = new String(name.getBytes("ISO8859_1"),"UTF-8");
        String pic = "image/no_photo_male.jpg";
        String userid =null;
        if(a!=null){
            userid = a.getUserId();
            pic = a.getPic();
        }
        System.out.println(userid + " " + productid + " " + comment);
        if(userid == null){
            userid = "Guest";
            Comment c = new Comment();
            c.insertComment(productid, userid, comment,pic,name);
            c.upToDate(productid);
            request.setAttribute("comment", c);
        }else{
            Comment c = new Comment();
            c.insertComment(productid, userid, comment,pic,name);
            c.upToDate(productid);
            request.setAttribute("comment", c);
        }
        
        getServletContext().getRequestDispatcher("/editProductAdmin?id="+productid).forward(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
