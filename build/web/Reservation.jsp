<%-- 
    Document   : Reservation
    Created on : Jan 14, 2021, 5:11:06 AM
    Author     : mbakr
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.sun.javafx.binding.StringFormatter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Page</title>
        <link href="css\bootstrap.min.css" rel="stylesheet" >
        <link href="js\bootstrap.min.js" rel="stylesheet">
        <link href="css\myfile.css" rel="stylesheet">
        <link href="css\main.css" rel="stylesheet">
        <script src="js\validation.js">
        </script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
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
            li{
                float: left;
            }
            li a:hover {
                background-color: white;
            }
        </style>
    </head>
    <body>
        <ul>

            <li style="float:left"><a href="HomePage.jsp">Back</a></li>
            <li style="margin-left: 71%">"                                             "</li>
            <li><a href="HomePage.jsp">Home</a></li>
            <li><a href="Profile.jsp">Profile</a></li>
            <li><a href="Reservation.jsp">Reservation</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
        </ul>
        <br><br><br>
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
                Statement stmt1 = null;
                ResultSet rs = null;
                ResultSet rs1 = null;

                con = DriverManager.getConnection(url, user, password);
                stmt = con.createStatement();
                stmt1 = con.createStatement();
                rs = stmt.executeQuery("select * from reservation where User_userID= '" + userID + "'");
                while (rs.next()) {
                    rs1 = stmt1.executeQuery("select room.roomType, branch.BranchImage, branch.location, hotel.hotelName from branch INNER JOIN room INNER JOIN hotel on hotel.hotelID = branch.Hotel_hotelID and branchID = '" + rs.getString("Branch_branchID") + "' and room.roomID = '" + rs.getString("Room_roomID") + "'");
                    rs1.next();

                    DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    Date date = new Date();
                    String checkOut = dateFormat.format(rs.getDate("CheckOutDate"));
                    String checkIn = dateFormat.format(rs.getDate("CheckInDate"));
        %>

        <div class="card" style="width: 20rem; margin-left: 50px; float: left; ">
            <img class="card-img-top" src="<%=rs1.getString("BranchImage")%>">
            <div class="card-body">
                <h5 class="card-title"><b><%=rs1.getString("hotelName")%>, <%=rs1.getString("location")%></b></h5>
                <p class="card-text"><img src="calender.png" width="15">&nbsp;&nbsp;<%=checkIn%> &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;  <%=checkOut%></p>
                <p class="card-text"><img src="bed.png" width="20">&nbsp;&nbsp;<%=rs1.getString("roomType")%>&nbsp;&nbsp;x<%=rs.getString("numberOfRooms")%></p>
                <p class="card-text"><img src="user.png" width="15">&nbsp;&nbsp;<%=rs.getString("numberOfAdults")%> Adults&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;  <%=rs.getString("numberOfChildren")%> Children</p>
                <p class="card-text"><img src="price.png" width="20">&nbsp;&nbsp;<%=rs.getString("reservationPrice")%> EGP
                    <%
                        boolean bool = true;
                        String status = rs.getString("reservationStatus");
                        if (status.equals("Pending")) {
                    %>
                    <b style="float: right; color: gray; font-size: 20px; margin-right: 2px">Pending</b>
                    <%
                       } else {
                           bool = false;%>
                    <b style="float: right; color: green; font-size: 20px; margin-right: 10px">Accepted</b>
                    <%}
                    %>
                </p>
                <a href="CancelReservation?reservationID=<%=rs.getString("reservationID")%>"  style="background-color: red;" class="btn btn-primary">Cancel</a>
                <%
                    if (bool) {%>
                <a href="ChangeReservation.jsp?reservationID=<%=rs.getString("reservationID")%>" style="float: right;" class="btn btn-primary">Change</a>
                <%} 
                %>

            </div>
        </div>
        <%
                }
            }
        %>

    </body>
</html>
