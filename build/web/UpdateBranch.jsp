<%-- 
    Document   : UpdateBranch
    Created on : Jan 15, 2021, 9:42:20 PM
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
        <title>Update Branch</title>
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
            <li style="float:left"><a href="UpdateHotelInfo.jsp">Back</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
            <li style="float:right"><a href="AdminHomePage.jsp">Home</a></li>
        </ul>
        <br><br><br><br>
        <%
            if (request.getSession().getAttribute("userID") == null) {
                response.sendRedirect("Login.html");
            } else {
                if (request.getSession().getAttribute("hotelID") == null) {
                    response.sendRedirect("Login.html");
                } else {
                    String userID = request.getSession().getAttribute("userID").toString();
                    String hotelID = request.getSession().getAttribute("hotelID").toString();
                    String branchID = request.getParameter("branchID");

                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/bookingdb";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();

                    rs = stmt.executeQuery("select * from branch inner join hotel on branch.Hotel_hotelID = hotel.hotelID and Hotel_hotelID  ='" + hotelID + "' and branch.branchID = '" + branchID + "'");
                    if (rs.next()) {%>
        <form action="UpdateBranch?branchID=<%=rs.getString("branchID")%>" method="POST">
            <div class="card" style="width: 25rem; margin-left: 100px;">
                <img class="card-img-top" src="<%=rs.getString("BranchImage")%>">
                <div class="card-body">
                    <h5 class="card-title"><b><%=rs.getString("hotelName")%>, <%=rs.getString("location")%></b></h5>
                    <br>

                    <p class="card-text"><img src="location.png" width="15">&nbsp;&nbsp;<input type="text" name="location" id="location" required value="<%=rs.getString("location")%>">
                    </p>
                    <p class="card-text"><img src="price.png" width="15">&nbsp;&nbsp;Expected Price: <input type="number" size="5" name="expectedPrice" id="expectedPrice" required min="1" value="<%=rs.getString("expectedPrice")%>">                
                    </p>
                    <p class="card-text"><img src="star.png" width="15">&nbsp;&nbsp;Stars:&nbsp;<input type="number" required min="0" max="5" size="1" name="branchStars" id="branchStars" value="<%=rs.getString("branchStars")%>">
                    </p>
                    <p class="card-text"><img src="contact.png" width="15">&nbsp;&nbsp;Contact Number: &nbsp;<input type="text" required name="contactNumber" id="contactNumber" value="<%=rs.getString("contactNumber")%>">
                    </p>
                    <p class="text-danger" style="margin-left: 17px;" id="wrongDate"></p>
                    <p class="text-danger" style="margin-left: 17px;" id="wrongAdults"></p>
                    <p class="text-danger" style="margin-left: 17px;" id="wrongChildren"></p>

                    <button type="submit" style="float: right;" class="btn btn-primary">Update</button>

                </div>
            </div>
        </form>

        <%}
                }
            }
        %>
    </body>
</html>
