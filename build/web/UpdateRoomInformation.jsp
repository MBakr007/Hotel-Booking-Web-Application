
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("userID") == null) {
        response.sendRedirect("Login.html");
    } else {
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
            String branchID = request.getParameter("branchID");
            String hotelID = request.getSession().getAttribute("hotelID").toString();
            String roomID = request.getParameter("roomID");
            rs = stmt.executeQuery("select * from room where roomID = '"+ roomID +"'");
            rs.next();
%>
    

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>room edit</title>
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
            <li style="float:left"><a href="room.jsp?branchID=<%=branchID%>">Back</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
            <li style="float:right"><a href="AdminHomePage.jsp">Home</a></li>
        </ul>
        <form method="POST" class="center" action="EditRoom" >
        <h4 style="text-align: center ; margin: 10px"><b>Update Room Information</b></h4>
        
            <div class="mb-3">
                <label  class="form-label">Room Type</label>
                <input type="text" id="name" name="roomType" class="form-control" required value="<%=rs.getString("roomType")%>">
            </div>
            <div class="mb-3">
                <label  class="form-label">Room Count</label>
                <input type="text"  name="roomCount" class="form-control" required value="<%=rs.getInt("roomCount")%>">
            </div>
            <p class="text-danger" style="margin-left: 17px;" id="e"></p>
            
            <div class="mb-3">
                <label class="form-label">Adults Capacity</label>
                <input type="text"  name="adultsCapacity" class="form-control" required value="<%=rs.getInt("adultsCapacity")%>">
            </div>
            
            <div class="mb-3">
                <label class="form-label">Children Capacity</label>
                <input type="text"  name="childrenCapacity" class="form-control" required value="<%=rs.getInt("childrenCapacity")%>">
            </div>
            
            <div class="mb-3">
                <label class="form-label">room price</label>
                <input type="text"  name="roomPrice" class="form-control" required value="<%=rs.getInt("roomPrice")%>">
            </div>
            <input type="hidden"  name="id" class="form-control" required value="<%=rs.getInt("roomID")%>">
            
            <button type="submit" class="btn btn-primary">submit</button>
        </form>
    </body>
</html>
<%}}%>