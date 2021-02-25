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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mbakr
 */
@WebServlet(urlPatterns = {"/CancelReservation"})
public class CancelReservation extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String reservationID = request.getParameter("reservationID");

            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bookingdb";
                String user = "root";
                String password = "root";
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                Statement stmt1 = null;
                Statement stmt2 = null;
                ResultSet rs1 = null;

                con = DriverManager.getConnection(url, user, password);
                stmt = con.createStatement();
                stmt1 = con.createStatement();
                stmt2 = con.createStatement();

                rs = stmt.executeQuery("select * from reservation where reservationID = '" + reservationID + "'");
                if (rs.next()) 
                {
                    if (rs.getString("reservationStatus").equals("Accepted")) 
                    {
                        stmt1.executeUpdate("update room set roomCount = roomCount + '" + rs.getString("numberOfRooms") + "' where roomID = '" + rs.getString("Room_roomID") + "'");
                    }
                    rs1 = stmt1.executeQuery("select user.email from reservation inner join branch  inner join hotel inner join user on user.userID = hotel.adminID and branch.Hotel_hotelID = hotel.hotelID and reservation.Branch_branchID = branch.branchID and reservation.reservationID = '" + reservationID + "'");
                    if (rs1.next()) 
                    {
                        String adminEmail = rs1.getString("email");
                        String msg = "Reservation ID is " + rs.getString("reservationID") + "\n";
                        msg +=  "User ID is " + rs.getString("User_userID") + "\n";
                        msg += "Room ID is " + rs.getString("Room_roomID") + "\n";
                        msg += "Branch ID is " + rs.getString("Branch_branchID") + "\n";
                        SendEmail s = new SendEmail();
                        s.sendEmail_admin(adminEmail, msg);
                        stmt.executeUpdate("DELETE FROM reservation WHERE reservationID = '" + reservationID + "'");
                        response.sendRedirect("Reservation.jsp");
                    }

                }

            } catch (Exception e) {
                out.println(e);
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
            Logger.getLogger(CancelReservation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CancelReservation.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CancelReservation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CancelReservation.class.getName()).log(Level.SEVERE, null, ex);
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
