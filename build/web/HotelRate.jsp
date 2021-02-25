<%-- 
    Document   : HotelRate
    Created on : Jan 15, 2021, 9:17:14 PM
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
        <title>Hotel Rate</title>
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
        <%

            if (request.getSession().getAttribute("userID") == null) {
                response.sendRedirect("Login.html");
            } else {
                if (request.getSession().getAttribute("hotelID") == null) {
                    response.sendRedirect("Login.html");
                } else {

                    try {

                        String userID = request.getSession().getAttribute("userID").toString();
                        String hotelID = request.getSession().getAttribute("hotelID").toString();

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
                        rs = stmt.executeQuery("select * from branch inner join hotel on branch.Hotel_hotelID = hotel.hotelID and Hotel_hotelID  ='" + hotelID + "'");
                        while (rs.next()) {%>
        <div class="card " style="width: 50rem; float: left; margin-left: 40px;">
            <img class="card-img-top" src="<%=rs.getString("BranchImage")%>">
            <div class="card-body">
                <h3 class="card-title"><b><%=rs.getString("hotelName")%>, <%=rs.getString("location")%></b></h3>
                <h4 class="card-title"><b>Rate: <%=rs.getString("branchRate")%></b></h4>
                <h4 class="card-title"><b>Comments: </b></h4>
               
                <%
                    rs1 = stmt1.executeQuery("select * from comment where Branch_branchID = '" + rs.getString("branchID") + "'");
                    while (rs1.next()) {%>
                    <p class="card-text" style="margin-left: 10px;"><%=rs1.getString("description")%></p>
            </div>
        </div>                    
        <%}
        %>

        <%}

                    } catch (Exception e) {
                        out.print(e);
                    }
                }
            }
        %>
    </body>
</html>
