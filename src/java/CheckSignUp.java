/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author User
 */
@WebServlet(urlPatterns = {"/CheckSignUp"})
public class CheckSignUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String userName = request.getParameter("userName");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookingdb";
            String user = "root";
            String password = "root";
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                con = DriverManager.getConnection(url, user, password);
                stmt = con.createStatement();
                
                rs = stmt.executeQuery("select userName from user where userName = '" + userName + "'");
                if(rs.next())
                {
                    out.println("<script>");
                    out.println("alert(\"user name is already exists.\")");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
                    rd.include(request, response);
                }
                else
                {
                    rs = stmt.executeQuery("select email from user where email ='" + email + "'");
                    if (rs.next()) 
                    {
                        out.println("<script>");
                        out.println("alert(\"Email  is already exists.\")");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
                        rd.include(request, response);
                    }                 
                    else {
                        out.println("<script>");
                        out.println("alert(\"Check your " + email + " for your Password.\")");
                        out.println("</script>");
                        SendEmail mail = new SendEmail();
                        String pass = mail.sendEmail(email);
                        int i = stmt.executeUpdate("insert into user (userName,name,phoneNumber,email,password) values ('"+userName+"','"+name+"','"+phoneNumber+"','"+email+"','"+pass+"')");
                        RequestDispatcher rd = request.getRequestDispatcher("Login.html");
                        rd.include(request, response);
                    }

                }
                
                
                con.close();
            } catch (Exception n) {
                out.print(n);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckSignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckSignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
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
