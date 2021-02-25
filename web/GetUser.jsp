
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
        ResultSet rs = null;
        ResultSet ds = null;

        con = DriverManager.getConnection(url, user, password);
        stmt = con.createStatement();

        rs = stmt.executeQuery("select isAdmin from user where userID ='" + userID + "'");
        rs.next();
        if (rs.getBoolean("isAdmin") == false) {
            response.sendRedirect("Login.html");
        } else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Today Clients</title>
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
        </style>     </head>
    <body>
        <ul>
            <li style="float:left"><a href="SearchUser.jsp">Back</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
            <li style="float:right"><a href="AdminHomePage.jsp">Home</a></li>
        </ul>
        <br><br><br>
        <%if (request.getParameter("id") != "") {
                rs = stmt.executeQuery("select * from user where userID = '" + request.getParameter("id") + "'  ");
                if (rs.next()) { %>

        <table class="table table-bordered center" style="width: 70%;">
            <thead class="table-dark">
                <tr>
                    <th>user id</th>
                    <th>name</th>
                    <th>user name</th>
                    <th>email</th>
                    <th>phone number</th>
                </tr>
            </thead>
            <tbody>
                <tr class="bg-primary">
                    <td><%out.print(rs.getInt("userID"));%></td>
                    <td><%out.print(rs.getString("name"));%></td>    
                    <td><%out.print(rs.getString("userName"));%></td>
                    <td><%out.print(rs.getString("email"));%></td>
                    <td><%out.print(rs.getString("phoneNumber"));%></td>
                </tr>
            </tbody>
        </table>
        <%}
        } else if (request.getParameter("phoneNumber") != "") {
            rs = stmt.executeQuery("select * from user where phoneNumber = '" + request.getParameter("phoneNumber") + "'  ");
            if (rs.next()) { %>

        <table class="table table-striped">
            <th>user id</th>
            <th>name</th>
            <th>user name</th>
            <th>email</th>
            <th>phone number</th>

            <tr>
                <td><%out.print(rs.getInt("userID"));%></td>
                <td><%out.print(rs.getString("name"));%></td>    
                <td><%out.print(rs.getString("userName"));%></td>
                <td><%out.print(rs.getString("email"));%></td>
                <td><%out.print(rs.getString("phoneNumber"));%></td>
            </tr>

        </table><%}
        } else if (request.getParameter("email") != "") {
            rs = stmt.executeQuery("select * from user where email = '" + request.getParameter("email") + "'  ");
            if (rs.next()) {
        %><table class="table table-striped">
            <th>user id</th>
            <th>name</th>
            <th>user name</th>
            <th>email</th>  
            <th>phone number</th>
            <tr>
                <td><%out.print(rs.getInt("userID"));%></td>
                <td><%out.print(rs.getString("name"));%></td>    
                <td><%out.print(rs.getString("userName"));%></td>
                <td><%out.print(rs.getString("email"));%></td>
                <td><%out.print(rs.getString("phoneNumber"));%></td>
            </tr>

        </table><%
                }
            }
        %>

    </body>
</html>
<%
        }
    }%>