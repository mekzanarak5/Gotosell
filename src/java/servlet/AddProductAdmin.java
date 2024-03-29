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
import model.Product;

/**
 *
 * @author Admin
 */
public class AddProductAdmin extends HttpServlet {

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
       String userId = request.getParameter("userid");
        String name = request.getParameter("name");
        String namethai = new String(name.getBytes("ISO8859_1"),"UTF-8");
        String text = request.getParameter("text");
        String textthai = new String(text.getBytes("ISO8859_1"),"UTF-8");
        String des = request.getParameter("des");
        String desthai = new String(des.getBytes("ISO8859_1"),"UTF-8");
        String type = request.getParameter("type");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String addressthai = new String(address.getBytes("ISO8859_1"),"UTF-8");
        String firstDate = request.getParameter("firstdate");
        String nowDay = request.getParameter("nowday");
        double price = Double.parseDouble(request.getParameter("price"));
        String pic = "";
        String msg = "";
        Boolean complete = false;

        Product p = new Product();

                            int row = Product.addProduct(userId, namethai, price, desthai, type, phone, addressthai, firstDate,nowDay,pic,textthai);
                            if (row == 1) {
                                msg = "Congratulations, GoToTheSell!";
                                request.setAttribute("msg", msg);
                                complete = true;

                            } else {
                                msg = "Database is not updated, please contact administrator.";
                                request.setAttribute("msg", msg);
                                complete = false;
                            }
                            
        if (complete) {
            
            request.setAttribute("lastid", Product.lastid());
            getServletContext().getRequestDispatcher("/WEB-INF/admin//upLoad.jsp").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/WEB-INF/admin/AddProductAdmin.jsp").forward(request, response);
        }
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
