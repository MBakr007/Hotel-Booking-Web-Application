<%-- 
    Document   : HomePage
    Created on : Jan 11, 2021, 7:51:05 PM
    Author     : User
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

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
            li{
                float: left;
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
        <%
            if (request.getSession().getAttribute("userID") == null) {
                response.sendRedirect("Login.html");
            } else {
                String userID = request.getSession().getAttribute("userID").toString();
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bookingdb";
                String user = "root";
                String password = "root";
                Connection Con = null;
                Statement Stmt = null;

                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
            }
        %>
        <ul>

            <li style="float:left"><a class="disabled" href="HomePage.jsp">Back</a></li>
            <li style="margin-left: 71%">"                                             "</li>
            <li><a href="HomePage.jsp">Home</a></li>
            <li><a href="Profile.jsp">Profile</a></li>
            <li><a href="Reservation.jsp">Reservation</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
        </ul>

        <div class="center container">
            <h1>Hotel Search</h1>
            <form class="form-inline" action="Search.jsp" method="POST" onsubmit="return checkDate();">
                <div class="form-group">
                    <img src="location.png" width="20">
                    <input type="text" required name="destination" class="form-control" style="width: 250px" id="destination" placeholder="Where are you going..">
                </div>
                &nbsp;&nbsp;&nbsp;
                <div class="form-group">
                    <img src="calender.png" width="20">
                    <%
                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date date = new Date();
                        String curr_date = dateFormat.format(date);
                        Date dt = new Date();
                        
                        Calendar c = Calendar.getInstance();
                        c.setTime(dt);
                        c.add(Calendar.DATE, 1);
                        dt = c.getTime();

                        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        String next_date = dateFormat.format(dt);
                    %>
                    <input type="date" required class="form-control" name="checkIn" id="checkIn" min="<%=curr_date%>">
                </div>
                <div class="form-group">
                    
                    <input type="date" required name="checkOut" class="form-control" id="checkOut" min="<%=next_date%>">
                </div>
                &nbsp;&nbsp;&nbsp;
                <div class="form-group">
                    <img src="user.png" width="25">
                    <input type="number" required min="0" max="10" name="numberOfAdults" placeholder="No. of Adults" class="form-control" id="numberOfAdults">
                </div>
                <div class="form-group">
                    <input type="number" required min="0" max="10" name="numberOfChildern" placeholder="No. of Children" class="form-control" id="numberOfChildern">
                </div>
                
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                <button type="submit" class="btn btn-default">Search</button>
                
                <p class="text-danger" style="margin-left: 17px;" id="wrongDate"></p>

            </form>
        </div>
    </body>
</html>
