<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    if (request.getSession().getAttribute("userID") == null) {
        response.sendRedirect("Login.html");
    } else {
        String userID = request.getSession().getAttribute("userID").toString();
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/bookingdb";
        String user = "root";
        String password = "root";
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ResultSet ds = null;

        con = DriverManager.getConnection(url, user, password);
        stmt = con.createStatement();
  
        if (request.getSession().getAttribute("hotelID") == null) {
            response.sendRedirect("Login.html");
        } else {
            String hotelID = request.getSession().getAttribute("hotelID").toString();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Today Clients</title>
        <link href="css\bootstrap.min.css" rel="stylesheet" >
        <link href="css\myfile.css" rel="stylesheet" >
    </head>
    <body>
        <ul class="nav justify-content-center">
            <li class="nav-item">
                <a class="nav-link"  href="SearchUser.jsp">Search for User</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="CurrentReservations.jsp">View Current Reservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ReservationHistory.jsp">view Reservation within specific Period</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="CheckTodayClientsChoice.jsp">Check Today Clients</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="CancelReservation.jsp">Cancel Reservations</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ConfirmPayment.jsp">Confirm pending payments</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="room.jsp">ADD/update room information</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogOut" tabindex="-1" aria-disabled="true">Log Out</a>
            </li>
        </ul>
        <%
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            if (request.getParameter("checkInDate") != null) {
                rs = stmt.executeQuery("select * from user where userID in (select User_userID from reservation where checkInDate = '" + dtf.format(now) + "' and Branch_branchID in (select branchID from branch where Hotel_hotelID = '"+ hotelID+"'))"  );
        %><table class="table table-striped">
            <th>user id</th>
            <th>name</th>
            <th>user name</th>
            <th>email</th>
                <%
                    while (rs.next()) {%>
            <tr>
                <td><%out.print(rs.getInt("userID"));%></td>
                <td><%out.print(rs.getString("name"));%></td>    
                <td><%out.print(rs.getString("userName"));%></td>
                <td><%out.print(rs.getString("email"));%></td>
            </tr>

            <%}%>
        </table><%
        } else if (request.getParameter("checkOutDate") != null) {
                 rs = stmt.executeQuery("select * from user where userID in (select User_userID from reservation where checkOutDate = '" + dtf.format(now) + "' and Branch_branchID in (select branchID from branch where Hotel_hotelID = '"+ hotelID+"'))"  );
       
        %><table class="table table-striped">
            <th>user id</th>
            <th>name</th>
            <th>user name</th>
            <th>email</th>   
                <%
                    while (rs.next()) {%>
            <tr>
                <td><%out.print(rs.getInt("userID"));%></td>
                <td><%out.print(rs.getString("name"));%></td>    
                <td><%out.print(rs.getString("userName"));%></td>
                <td><%out.print(rs.getString("email"));%></td>
            </tr>

            <%}%>
        </table><%
            }
        %>

    </body>
</html>
<%}
    }%>