<%-- 
    Document   : Payment_2
    Created on : Jan 15, 2021, 3:33:20 PM
    Author     : mbakr
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
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
        <%
            if (request.getSession().getAttribute("userID") == null) {
                response.sendRedirect("Login.html");
            } else {

                try {
                    String branchID = request.getParameter("branchID");
                    String roomID = request.getParameter("roomID");
                    String userID = request.getSession().getAttribute("userID").toString();

                    String checkIn = request.getParameter("checkIn");
                    String checkOut = request.getParameter("checkOut");
                    String numberOfRooms = request.getParameter("numberOfRooms");
                    String adult = request.getParameter("adult");
                    String children = request.getParameter("children");
                    String roomPrice = request.getParameter("roomPrice");
                    float reservationPrice = Float.valueOf(roomPrice) * Integer.valueOf(numberOfRooms);

                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/bookingdb";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();
                    
                    
                    String path = "checkIn=" + checkIn + "&"
                            + "checkOut=" + checkOut + "&"
                            + "numberOfRooms=" + numberOfRooms + "&"
                            + "adult=" + adult + "&"
                            + "children=" + children + "&"
                            + "reservationPrice=" + reservationPrice + "&"
                            + "userID=" + userID + "&"
                            + "roomID=" + roomID + "&"
                            + "branchID=" + branchID;
        %>
        <ul>

            <li style="float:left"><a href="Payment.jsp?roomID=<%=roomID%>&branchID=<%=branchID%>">Back</a></li>
            <li style="margin-left: 71%">"                                             "</li>
            <li><a href="HomePage.jsp">Home</a></li>
            <li><a href="Profile.jsp">Profile</a></li>
            <li><a href="Reservation.jsp">Reservation</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
        </ul>

        <br><br>
        <form action="ValidatePayment?<%=path%>" method="POST">
            <div class="card center" style="width: 30rem;">
                <div class="card-body">
                    <p class="card-text"><img src="card.png" width="20">&nbsp;&nbsp;<b>Card Number: </b><input type="text" id="cardNumber" name="cardNumber" required ></p>
                    <br>
                    <p class="card-text"><img src="card.png" width="20">&nbsp;&nbsp;<b>Card Type: </b>
                        <select required name="cardType" id="cardType">
                            <option value="Visa">Visa</option>
                            <option value="Master Card">Master Card</option>
                            <option value="Pay Pal">Pay Pal</option>
                        </select>
                    </p>
                    <br>
                    <p class="card-text"><img src="price.png" width="20">&nbsp;&nbsp;<b>Reservation Price: </b> <%=reservationPrice%> EGP</p>
                    <p class="text-danger" style="margin-left: 17px;" id="wrongCardNumber"></p>
                    <button type="submit" style="float: right;" class="btn btn-primary">Confirm</button>
                </div>
            </div>
        </form>
        <%

                } catch (Exception e) {
                    out.println(e);
                }
            }
        %> 
    </body>
</html>
