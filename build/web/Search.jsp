<%-- 
    Document   : Search
    Created on : Jan 13, 2021, 1:52:22 AM
    Author     : mbakr
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <link href="css\main.css" rel="stylesheet" />
        <link href="css\bootstrap.min.css" rel="stylesheet" >
        <link href="css\myfile.css" rel="stylesheet">
        <link href="css\css1.css" rel="stylesheet">
        <link href="js\bootstrap.min.js" rel="stylesheet" >
        <style>
             body {
                background-image: url('background.jpg');

            }
            #dd{
                float: right;
                margin-right: 50px;
                margin-top: 50px; 
            }
            h1.ex1:visited, h1.ex1:link {color: black; text-decoration: none;}
            h1.ex1:hover, h1.ex1:active {color: blue;}
            a.ex2:visited, a.ex2:link {color: blueviolet; text-decoration: none;}
            a.ex2:hover, a.ex2:active {color: red;}
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
        <div class="dropdown" id="dd">
            <button class="btn btn-primary">Filter</button>
            <div class="dropdown-content">
                <a href="Filter?filterID=1">Price</a>
                <a href="Filter?filterID=2">Rating</a>
                <a href="Filter?filterID=3">Stars</a>
            </div>
        </div>
        <%
            if (request.getSession().getAttribute("userID") == null) {
                response.sendRedirect("Login.html");
            } else {
                String filterID = "";
                String filter = "branch.expectedPrice";
                if(request.getParameter("filterID") != null)
                {
                    filterID = request.getParameter("filterID");
                    if(filterID.equals("2"))
                        filter = "branch.branchRate desc";
                    else if(filterID.equals("3"))
                        filter = "branch.branchStars desc";
                }
                String destination = "";
                String checkIn = "";
                String checkOut = "";
                String numberOfAdults = "";
                String numberOfChildern = "";
                if(request.getParameter("destination") != null)
                {
                    destination = request.getParameter("destination");
                    checkIn = request.getParameter("checkIn");
                    checkOut= request.getParameter("checkOut");
                    numberOfAdults = request.getParameter("numberOfAdults");
                    numberOfChildern = request.getParameter("numberOfChildern");
                    session.setAttribute("destination", destination);
                    session.setAttribute("checkIn", checkIn);
                    session.setAttribute("checkOut", checkOut);
                    session.setAttribute("numberOfAdults", numberOfAdults);
                    session.setAttribute("numberOfChildern", numberOfChildern);
            
                }
                else
                {
                    destination = request.getSession().getAttribute("destination").toString();
                    checkIn = request.getSession().getAttribute("checkIn").toString();
                    checkOut= request.getSession().getAttribute("checkOut").toString();
                    numberOfAdults = request.getSession().getAttribute("numberOfAdults").toString();
                    numberOfChildern = request.getSession().getAttribute("numberOfChildern").toString();
                }
                
                
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bookingdb";
                String user = "root";
                String password = "root";
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;

                con = DriverManager.getConnection(url, user, password);
                stmt = con.createStatement();
                String query = "SELECT distinct hotel.hotelName, branch.branchStars, branch.longitude, branch.latitude, branch.expectedPrice, branch.branchRate, branch.BranchImage, branch.branchID, branch.location FROM branch INNER JOIN room INNER JOIN hotel ON hotel.hotelID = branch.Hotel_hotelID and branch.branchID = room.Branch_branchID and branch.location = '" + destination + "' and room.adultsCapacity >= '" + numberOfAdults + "' and room.childrenCapacity >= '" + numberOfChildern + "' and room.roomCount > '" + 0 + "' order by " + filter + "";
                stmt.executeQuery(query);
                rs = stmt.getResultSet();
                if (rs.isBeforeFirst()) {
        %>
        <div class="container">

            <%                while (rs.next()) {
                String location = "https://www.google.com/maps/search/?api=1&query=" +rs.getString("latitude") + "," + rs.getString("longitude");
                String branchRate = String.format("%.1f", rs.getFloat("branchRate"));
            %>

            <br><br>
            <div class="row">
                <div class="col-sm-3"><img width="300" border="3" src="<%=rs.getString("BranchImage")%>"></div>
                <div class="col-sm-5">
                    <h1 class="ex1" id='<%=rs.getString("branchID")%>' onclick='doClick(this)'><%=rs.getString("hotelName")%>, <%=rs.getString("location")%></a></h1>
                    <h5>Expected Price : <%=rs.getString("expectedPrice")%> EGP</h5>
                    <h5>Hotel Rate : <%=branchRate%></h5>
                    <h5>Hotel Stars : <%=rs.getString("branchStars")%></h5>
                    <a class="ex2" target="_blank" href="<%=location%>"><h5>Location on Google Map </h5></a>
                </div>

            </div>

            <%
                }
            %>


        </div>
        <%}%>
        <script type='text/javascript'>
            doClick = function (sender)
            {
                window.location = "Details.jsp?branchID=" + sender.id;
            };
        </script>

        <script type='text/javascript'>
            doClick1 = function (sender)
            {
                
                sender.id;
            };
        </script>

    </body><%
        }%>


</html>
