<%-- 
    Document   : UpdateHotelInfo
    Created on : Jan 15, 2021, 9:37:32 PM
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
        <title>Update Hotel Info</title>
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
            a.ex2:visited, a.ex2:link {color: black; text-decoration: none;}
            a.ex2:hover, a.ex2:active {color: blue;}
        </style>
    </head>
    <body>
        <ul>
            <li style="float:left"><a href="AdminHomePage.jsp">Back</a></li>
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

                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/bookingdb";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();

                    rs = stmt.executeQuery("select * from branch inner join hotel on branch.Hotel_hotelID = hotel.hotelID and Hotel_hotelID  ='" + hotelID + "'");

                    while (rs.next()) {%>
        <form>

            <div class="card" style="width: 20rem; float: left; margin-left: 40px;">
                <img class="card-img-top" src="<%=rs.getString("BranchImage")%>">
                <div class="card-body">
                    <a class="ex2" href="UpdateBranch.jsp?branchID=<%=rs.getString("branchID")%>"><h5 class="card-title"><b><%=rs.getString("hotelName")%>, <%=rs.getString("location")%></b></h5></a>
                    
                </div>
            </div>
        </form>
        <%}
                }
            }
        %>
    </body>
</html>
