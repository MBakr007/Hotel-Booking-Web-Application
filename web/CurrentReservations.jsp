<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    if (request.getSession().getAttribute("userID") == null) {
        response.sendRedirect("Login.html");
    } else {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
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
        if (request.getSession().getAttribute("hotelID") == null) {
            response.sendRedirect("Login.html");
        } else {
            String hotelID = request.getSession().getAttribute("hotelID").toString();         
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservations Page</title>
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
        
        <table class="table table-bordered center">
            <thead class="table-dark">
                
            <th>reservation ID</th> 
            <th>Total Price</th>
            <th>
                Include Meals
            </th>
            <th>
                check In Date 
            </th>
            <th>
                check out Date
            </th>
            <th>
                Total number Of Days
            </th>
            <th>
                Number Of Adults
            </th>
            <th>
                Number Of Children
            </th>
            <th>
                Room number
            </th>
            <th>
                Branch ID
            </th>
            <th>
                client user ID
            </th>
            <th>
                payment ID
            </th>
            </thead>
            
            <%
                rs = stmt.executeQuery("select * from reservation where reservationID in (select reservationID from reservation where checkOutDate >= '" + dtf.format(now) + "'  ) and Branch_branchID in (select branchID from branch where Hotel_hotelID = '"+ hotelID+"')"   );
                while (rs.next()) {
            %>
            <tr class="bg-primary">
                <td><% out.print(rs.getInt("reservationID"));%></td>
                <td><% out.print(rs.getInt("reservationPrice"));%></td>
                <%
                    String x = "";
                    if (rs.getBoolean("reservationMeals") == false) {
                        x = "NO";
                    } else {
                        x = "YES";
                    }
                %>

                <td><%out.print(x);%></td>

                <td><% out.print(rs.getString("checkInDate")); %></td>
                <td><% out.print(rs.getString("checkOutDate")); %></td>

                <td><%out.print(rs.getInt("numberOfDays"));%></td>
                <td><%out.print(rs.getInt("numberOfAdults"));%></td>
                <td><%out.print(rs.getInt("numberOfChildren"));%></td>
                <td><%out.print(rs.getInt("Room_roomID"));%></td>

                <td><%out.print(rs.getInt("Branch_branchID"));%></td>
                <td><% out.print(rs.getInt("User_userID"));%></td>
                <td><% out.print(rs.getInt("Payment_paymentID"));%></td>

            </tr> 
            <%}%>
        </table>

    </body>
</html>
<%}
    }%>