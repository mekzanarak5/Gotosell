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
import model.Product;

/**
 *
 * @author Admin
 */
public class AdvenceSearch extends HttpServlet {

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
       String sid = request.getParameter("name");
       String st = request.getParameter("type");
       double p1 = 0;
       double p2 = 999999;
       
       request.setAttribute("msg", "");
        if (!(sid.length()==0 && request.getParameter("p1").length()==0 && request.getParameter("p2").length()==0)){
            if(sid.length()==0){
                sid="%";
            }
            if(request.getParameter("p1").length()!=0){
                p1 = Double.parseDouble(request.getParameter("p1"));
                
            }
            if(request.getParameter("p2").length()!=0){
                p2 = Double.parseDouble(request.getParameter("p2"));
            }
            if (!sid.equals("")) {
                List<Product> cs = Product.findtwo(sid,st,p1,p2);
                request.setAttribute("cs", cs);
                if (cs.isEmpty()) {
                    request.setAttribute("msg", "Seller/Price/Product: " + sid + " does not exist !!!");
                }
            }

            getServletContext().getRequestDispatcher("/showProduct.jsp").forward(request, response);
        }else
            request.setAttribute("msg", "Please type less 1");
            getServletContext().getRequestDispatcher("/AdvenceSearch.jsp").forward(request, response);
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
