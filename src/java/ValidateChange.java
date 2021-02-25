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
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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
@WebServlet(urlPatterns = {"/ValidateChange"})
public class ValidateChange extends HttpServlet {

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
            try 
            {
                String reservationID = request.getParameter("reservationID");
                String checkIn = request.getParameter("checkIn");
                String checkOut = request.getParameter("checkOut");
                String numberOfRooms = request.getParameter("numberOfRooms");
                String numberOfAdults = request.getParameter("adult");
                String numberOfChildren = request.getParameter("children");
                String roomPrice = request.getParameter("roomPrice");
                
                float reservationPrice = Float.valueOf(roomPrice) * Integer.valueOf(numberOfRooms);

                LocalDate dateBefore = LocalDate.parse(checkIn);
                LocalDate dateAfter = LocalDate.parse(checkOut);

                long numberOfDays = ChronoUnit.DAYS.between(dateBefore, dateAfter);
		
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bookingdb";
                String user = "root";
                String password = "root";
                Connection con = null;
                Statement stmt = null;
                con = DriverManager.getConnection(url, user, password);
                stmt = con.createStatement();
                
                stmt.executeUpdate("UPDATE reservation SET checkInDate= '" + checkIn + "' , checkOutDate= '" + checkOut + "' , numberOfRooms= '" + numberOfRooms + "' , numberOfAdults = '" + numberOfAdults + "' , numberOfChildren = '" + numberOfChildren + "' , reservationPrice = '" + reservationPrice + "' , numberOfDays = '" + numberOfDays + "' WHERE reservationID = '" + reservationID + "'");
                response.sendRedirect("Reservation.jsp");                

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
            Logger.getLogger(ValidateChange.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ValidateChange.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ValidateChange.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ValidateChange.class.getName()).log(Level.SEVERE, null, ex);
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
