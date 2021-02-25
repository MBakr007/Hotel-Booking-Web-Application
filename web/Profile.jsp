<%-- 
    Document   : Profile
    Created on : Jan 12, 2021, 5:53:01 PM
    Author     : User
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    if (request.getSession().getAttribute("userID") == null) 
    {
        response.sendRedirect("Login.html");
    }
    else 
    {
        String userID = request.getSession().getAttribute("userID").toString();
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/bookingdb";
        String user = "root";
        String password = "root";
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        con = DriverManager.getConnection(url, user, password);
        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from user where userID ='" + userID + "'");
        rs.next();
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <script src="js\validation.js">
        </script>
        <link href="css\bootstrap.min.css" rel="stylesheet" >
        <link href="css\myfile.css" rel="stylesheet" >
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

        <form method="POST" class="center" action="EditProfile" onsubmit="return checkUpdateProfile();">
            <div class="mb-3">
                <label for="userName" class="form-label">User Name</label>
                <input type="text" name="userName" disabled class="form-control" value="<%=rs.getString("userName")%>">
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("name")%>">
            </div>
            <p class="text-danger" style="margin-left: 17px;" id="n"></p>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="text" id="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=rs.getString("email")%>">
            </div>
            <p class="text-danger" style="margin-left: 17px;" id="e"></p>
            
            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Phone Number</label>
                <input type="text" id="phonenumber" name="phoneNumber" class="form-control" value="<%=rs.getString("phoneNumber")%>">
            </div>
            <p class="text-danger" style="margin-left: 17px;" id="p"></p>
            
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="Password1">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Confirm Password</label>
                <input type="password" name="confirmPassword" class="form-control" id="Password2">
            </div>
            <p class="text-danger" style="margin-left: 17px;" id="wrongData"></p>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </body>
</html>
<%}%>