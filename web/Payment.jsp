<%-- 
    Document   : Payment
    Created on : Jan 15, 2021, 2:27:19 PM
    Author     : mbakr
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
%>
        <ul>

            <li style="float:left"><a href="Details.jsp?branchID=<%=branchID%>">Back</a></li>
            <li style="margin-left: 71%">"                                             "</li>
            <li><a href="HomePage.jsp">Home</a></li>
            <li><a href="Profile.jsp">Profile</a></li>
            <li><a href="Reservation.jsp">Reservation</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
        </ul>

        <br><br>
        <%
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/bookingdb";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    Statement stmt1 = null;
                    ResultSet rs1 = null;

                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();
                    stmt1 = con.createStatement();
                    stmt.executeQuery("SELECT * FROM room where roomID = '" + roomID + "' and Branch_branchID = '" + branchID + "'");
                    rs = stmt.getResultSet();
                    if (rs.next()) {
                        stmt1.executeQuery("SELECT branch.BranchImage, user.name, user.email, hotel.hotelName, branch.location FROM user inner join hotel inner join branch on  branch.Hotel_hotelID = hotel.hotelID and user.userID = '" + userID + "' and branch.branchID = '" + branchID + "'");
                        rs1 = stmt1.getResultSet();

                        if (rs1.next()) {
                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            Date date = new Date();
                            String curr_date = dateFormat.format(date);
                            Date dt = new Date();
                            int maxRoom = Integer.valueOf(rs.getString("roomCount"));
                            Calendar c = Calendar.getInstance();
                            c.setTime(dt);
                            c.add(Calendar.DATE, 1);
                            dt = c.getTime();
                            dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            String next_date = dateFormat.format(dt);
        %>     
        <form action="Payment_2.jsp?roomID=<%=rs.getString("roomID")%>&branchID=<%=branchID%>" onsubmit="return checkDate();" method="POST">
            <div class="card" style="width: 25rem; margin-left: 100px;">
                <img class="card-img-top" src="<%=rs1.getString("BranchImage")%>">
                <div class="card-body">
                    <h5 class="card-title"><b><%=rs1.getString("hotelName")%>, <%=rs1.getString("location")%></b></h5>
                    <br>
                    <p class="card-text"><img src="user.png" width="15">&nbsp;&nbsp;<b>Full Name: </b><%=rs1.getString("name")%></p>
                    <p class="card-text"><img src="email.png" width="20">&nbsp;&nbsp;<b>Email: </b><%=rs1.getString("email")%></p>

                    <p class="card-text"><img src="calender.png" width="15">&nbsp;&nbsp;<input type="date" name="checkIn" id="checkIn" required min="<%=curr_date%>">
                        &nbsp;&nbsp;- &nbsp;&nbsp;<input type="date" name="checkOut" id="checkOut" required min="<%=next_date%>">
                    </p>
                    <p class="card-text"><img src="bed.png" width="15">&nbsp;&nbsp;<%=rs.getString("roomType")%>&nbsp;&nbsp;x&nbsp;<input type="number" size="1" name="numberOfRooms" id="numberOfRooms" required min="1" max="<%=maxRoom%>">                
                    </p>
                    <p class="card-text"><img src="user.png" width="15">&nbsp;&nbsp;Adults &nbsp;<input type="number" required min="0" max="10" size="1" name="adult" id="adult">&nbsp;&nbsp;&nbsp;
                        &nbsp;- &nbsp; Children &nbsp;<input type="number" required min="0" max="10" size="1" id="children" name="children">                
                    </p>
                    <p class="text-danger" style="margin-left: 17px;" id="wrongDate"></p>
                    <p class="text-danger" style="margin-left: 17px;" id="wrongAdults"></p>
                    <p class="text-danger" style="margin-left: 17px;" id="wrongChildren"></p>
                    <input type="hidden" name="max_adult" id="max_adult" value="<%=rs.getInt("adultsCapacity")%>">
                    <input type="hidden" name="max_children" id="max_children" value="<%=rs.getInt("childrenCapacity")%>">
                    <input type="hidden" name="roomPrice" id="roomPrice" value="<%=rs.getFloat("roomPrice")%>">
                    
                    <button type="submit" style="float: right;" class="btn btn-primary">Next</button>

                </div>
            </div>
        </form>
        <%}
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            }
        %>

    </body>
</html>
