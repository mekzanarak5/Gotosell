/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Comment;
import model.Pic;
import model.Product;

/**
 *
 * @author Admin
 */
public class showProductAdmin extends HttpServlet {

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
        String productid = request.getParameter("id");
        request.setAttribute("msg", "");
        if (productid != null) {
            List<Pic> cs = Pic.find(productid);
            request.setAttribute("cs", cs);
            if (cs.size() == 0) {
                request.setAttribute("msg", "Seller/Price/Product: " + productid + " does not exist !!!");
            }
        }
         if (productid != null) {
             Product c = new Product();
                String id = productid;
                c = Product.findById(id);
                request.setAttribute("product", c);
        }
         if (productid != null) {
            List<Comment> cs = Comment.find(productid);
            request.setAttribute("css", cs);
            if (cs.size() == 0) {
                request.setAttribute("msg", "Seller/Price/Product: " + productid + " does not exist !!!");
            }
        }
       
        getServletContext().getRequestDispatcher("/WEB-INF/admin/showProductAdminEdit.jsp").forward(request, response);
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
