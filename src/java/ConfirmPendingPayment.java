/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(urlPatterns = {"/ConfirmPendingPayment"})
public class ConfirmPendingPayment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int reservationID = Integer.parseInt(request.getParameter("reservationID"));
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookingdb";
            String user = "root";
            String password = "root";
            Connection con = null;
            Statement stmt = null;
            Statement stmt1 = null;
            
            ResultSet rs = null;
            try {
                con = DriverManager.getConnection(url, user, password);
                stmt = con.createStatement();
                stmt1 = con.createStatement();
                if (request.getParameter("confirm") != null) {
                    String a = "Accepted";
                    int n = stmt.executeUpdate("UPDATE reservation SET reservationStatus = '" + a + "' WHERE reservationID = '" + reservationID + "'");
                    rs = stmt1.executeQuery("select * from reservation where reservationID = '" + reservationID + "'");
                    rs.next();
                    stmt1.executeUpdate("update room set roomCount = roomCount - '" + rs.getString("numberOfRooms") + "' where roomID = '" + rs.getString("Room_roomID") + "'");                    
                    response.sendRedirect("ConfirmPayment.jsp");
                } else if (request.getParameter("cancel") != null) {
                    int n = stmt.executeUpdate("delete from reservation where reservationID ='" + reservationID + "'");
                    response.sendRedirect("ConfirmPayment.jsp");
                }
            } catch (Exception e) {
                out.print(e);
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
            Logger.getLogger(ConfirmPendingPayment.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ConfirmPendingPayment.class.getName()).log(Level.SEVERE, null, ex);
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
