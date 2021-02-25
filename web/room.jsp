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
        String branchID = request.getParameter("branchID");
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
            <li style="float:left"><a href="UpdateRoomInfo.jsp">Back</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
            <li style="float:right"><a href="AdminHomePage.jsp">Home</a></li>
        </ul>
        
        <form action="UpdateRoomInformation.jsp" method="post">
        <table class="table table-bordered center" style="width: 70%;">
            <thead class="table-dark">
            <th>Room ID</th> 
            <th>Room Type</th>
            <th>
                Room Count
            </th>
            <th>
                Adults Capacity
            </th>
            <th>
                Children Capacity
            </th>
            <th>
                room Price
            </th>
            <th>
                branch ID
            </th>
            </thead>
            <%
                rs = stmt.executeQuery("select * from room where Branch_branchID in (select branchID from branch where Hotel_hotelID = '"+ hotelID+"') and Branch_branchID = '" + branchID + "'"   );
                while (rs.next()) {
            %>
            <tr>
                <td class="bg-primary"><% out.print(rs.getInt("roomID"));%></td>
                <td class="bg-primary"><% out.print(rs.getString("roomType"));%></td>
                

                

                <td class="bg-primary"><%out.print(rs.getInt("roomCount"));%></td>
                <td class="bg-primary"><%out.print(rs.getInt("adultsCapacity"));%></td>
                <td class="bg-primary"><%out.print(rs.getInt("childrenCapacity"));%></td>
                <td class="bg-primary"><%out.print(rs.getInt("roomPrice"));%></td>

                <td class="bg-primary"><%out.print(rs.getInt("Branch_branchID"));%></td>
                 <input type="hidden" name="roomID" value="<%out.print(rs.getInt("roomID"));%>">
                 <input type="hidden" name="branchID" value="<%=branchID%>">
                 <td><input type="submit" class="btn btn-primary" name="update" value="update"></td>
            </tr> 
            <%}%>
        </table>
        </form>
    </body>
</html>
<%}
    }%>