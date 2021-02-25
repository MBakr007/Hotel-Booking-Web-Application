
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    if (request.getSession().getAttribute("userID") == null) {
        response.sendRedirect("Login.html");
    } else {
        if (request.getSession().getAttribute("hotelID") == null) {
            response.sendRedirect("Login.html");
        } 
%>
<html>
    <head>
        <link href="css\bootstrap.min.css" rel="stylesheet" >
        <link href="css\myfile.css" rel="stylesheet" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home Page</title>
        <link href="css\main.css" rel="stylesheet" />
        <link href="css\bootstrap.min.css" rel="stylesheet" >
        <link href="css\myfile.css" rel="stylesheet">
        <link href="js\bootstrap.min.js" rel="stylesheet" >
        <script src="js\validation.js">
        </script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body {
                background-image: url('background.jpg');

            }
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333;
            }
            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }
            li a:hover {
                background-color: white;
            }
            .disabled {
                pointer-events:none; 
                opacity:0.6;         
            }
        </style> 
    </head>
    <body>
        <ul>
            <li style="float:left"><a class="disabled">Back</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
            <li style="float:right"><a href="AdminHomePage.jsp">Home</a></li>
        </ul>
        <ul class="center">
            <li><a class="nav-link"  href="SearchUser.jsp">Search for User</a></li>
            <br>
            <li><a class="nav-link" href="CurrentReservations.jsp">View Current Reservation</a></li>
            <br>
            <li><a class="nav-link" href="ReservationHistory.jsp">View Reservation within specific Period</a></li>
            <br>
            <li><a class="nav-link" href="CancelReservation.jsp">Cancel Reservations</a></li>
            <br>
            <li><a class="nav-link" href="ConfirmPayment.jsp">Confirm pending payments</a></li>
            <br>
            <li><a class="nav-link" href="UpdateRoomInfo.jsp">ADD/Update room information</a></li>
            
            <br>
            <li><a class="nav-link" href="HotelRate.jsp">View hotel rating and client’s comments</a></li>
            <br>
            <li><a class="nav-link" href="UpdatePhotos.jsp"> Upload and update hotel photos</a></li>
            <br>
            <li><a class="nav-link" href="UpdateHotelInfo.jsp">Update hotel basic information</a></li>
           
        </ul>
       
    </body>
</html>
<%}%>