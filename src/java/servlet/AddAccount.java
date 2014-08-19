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
import model.Account;

/**
 *
 * @author Admin
 */
public class AddAccount extends HttpServlet {

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
        String userid = request.getParameter("userid");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String fthai = new String(firstname.getBytes("ISO8859_1"),"UTF-8");
        String lastname = request.getParameter("lastname");
        String lthai = new String(lastname.getBytes("ISO8859_1"),"UTF-8");
        String pic = "image/no_photo_male.jpg";
        String msg = "";
        Boolean complete = false;

        Account a = new Account();

        if (Account.checkDuplicatedUser(userid) == 0) {
            if (password.length() >= 6) {
                if (password.equals(confirmpassword)) {
                    if (Account.checkEmail(email)) {
                            int row = Account.addAccount(userid, password, email,fthai, lthai,pic);
                            if (row == 1) {
                                msg = "Congratulations, you are now a member of GoToTheSell!";
                                request.setAttribute("msg", msg);
                                complete = true;

                            } else {
                                msg = "Database is not updated, please contact administrator.";
                                request.setAttribute("msg", msg);
                                complete = false;
                            }
                        
                    } else {
                        msg = "Wrong email gormat, please re-enter.";
                        request.setAttribute("msg", msg);
                        complete = false;
                    }
                } else {
                    msg = "Password not matched.";
                    request.setAttribute("msg", msg);
                    complete = false;
                }
            } else {
                msg = "Password length should more than 5 characters.";
                request.setAttribute("msg", msg);
                complete = false;
            }
        } else {
            msg = "Duplicated username, please re-enter.";
            request.setAttribute("msg", msg);
            complete = false;
        }

        if (complete) {
            getServletContext().getRequestDispatcher("/indextest?id=&x=0&y=3").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/AddAccount.jsp").forward(request, response);
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
