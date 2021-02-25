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
        if (request.getSession().getAttribute("hotelID") == null) {
            response.sendRedirect("Login.html");
        } else {
            String hotelID = request.getSession().getAttribute("hotelID").toString();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css\bootstrap.min.css" rel="stylesheet" >
        <link href="css\myfile.css" rel="stylesheet" >
        <title>Today Clients</title>
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
                <a class="nav-link" href="LogOut" tabindex="-1" aria-disabled="true">Log Out</a>
            </li>
        </ul>
        <form action="CheckTodayClients.jsp" class="center" style="margin-top: 50px ">
            <button type="submit" name="checkInDate" class="btn btn-primary">Clients Checked In Today</button>
            <button type="submit" name="checkOutDate" class="btn btn-primary" style="float: right"> Clients Checked Out Today</button>
        </form>
    </body>
</html>
<%}
    }%>