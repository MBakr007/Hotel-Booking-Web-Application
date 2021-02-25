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

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Reservations</title>
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
            <li style="float:left"><a href="AdminHomePage.jsp">Back</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
            <li style="float:right"><a href="AdminHomePage.jsp">Home</a></li>
        </ul>
        <br><br><br><br>
        <div class="center" style="width: 30%; background-color: black">
            <form action="ViewReservationHistory.jsp" method="post">
                <p>
                    &nbsp;&nbsp;
                    <b style="color: white">From: </b>&nbsp;&nbsp;
                    <input type ="date" required name="fromDate">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <b  style="color: white">To:</b>&nbsp;&nbsp;
                    <input type ="date" required name="toDate">
                </p>
                <br>
                <input type="submit" value="submit" style="float: right;" class="btn btn-primary">
                <br>
            </form>
        </div>
        <%}
                }%>