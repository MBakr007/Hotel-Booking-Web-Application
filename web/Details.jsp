<%-- 
    Document   : Details
    Created on : Jan 13, 2021, 5:46:08 AM
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
        <title>Details Information</title>
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
            div.gallery {
                margin: 20px;
                float: left;
                width: 180px;
            }

            div.gallery:hover {
            }

            div.gallery img {
                width: 100%;
                height: auto;
            }
            div.desc {
                padding: 15px;
                text-align: center;
            }
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
        <%
            if (request.getSession().getAttribute("userID") == null) {
                response.sendRedirect("Login.html");
            } else {

                try {
                    String branchID = request.getParameter("branchID");
                    session.setAttribute("branchID", branchID);
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/bookingdb";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();
                    stmt.executeQuery("SELECT distinct * FROM branch INNER JOIN hotel ON hotel.hotelID = branch.Hotel_hotelID and branch.branchID= '" + branchID + "'");
                    rs = stmt.getResultSet();
                    if (rs.next()) {
                        String branchRate = String.format("%.1f", rs.getFloat("branchRate"));
                        int branchStars = rs.getInt("branchStars");
                        float expectedPrice = rs.getFloat("expectedPrice");
                        String latitude = rs.getString("latitude");
                        String longitude = rs.getString("longitude");
                        String contactNumber = rs.getString("contactNumber");
                        String branchImage = rs.getString("BranchImage");
                        String location = rs.getString("location");
                        String hotelName = rs.getString("hotelName");
                        String locationGoogle = "https://www.google.com/maps/search/?api=1&query=" + latitude + "," + longitude;
        %>

        <ul>

            <li style="float:left"><a href="Search.jsp">Back</a></li>
            <li style="margin-left: 71%">"                                             "</li>
            <li><a href="HomePage.jsp">Home</a></li>
            <li><a href="Profile.jsp">Profile</a></li>
            <li><a href="Reservation.jsp">Reservation</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
        </ul>

        <br><br><br>
        <div class="container">

            <div class="row">
                <div class="col-sm-5"><img width="500" border="3" src="<%=branchImage%>"></div>
                <div class="col-sm-5">
                    <h1 class="ex1"><%=hotelName%>, <%=location%></a></h1>
                    <h5>Expected Price : <%=expectedPrice%> EGP</h5>
                    <h5>Hotel Rate : <%=branchRate%></h5>
                    <h5>Hotel Stars : <%=branchStars%></h5>
                    <h5>Contact Number : <%=contactNumber%></h5>
                    <a class="ex2" target="_blank" href="<%=locationGoogle%>"><h5>Location on Google Map </h5></a>
                    <br>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Rate This Hotel</button>

                </div>

            </div>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Hotel Rate</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="addComment" method="POST" onsubmit="return checkRate();">
                                <div class="mb-3">
                                    <label for="hotelRate" class="col-form-label">Hotel Rate:</label>
                                    <input type="number" name="userRate" min="1" max="10" class="form-control" id="userRate" placeholder="Rate out of 10">
                                    <p class="text-danger" style="margin-left: 17px;" id="wrongRate"></p>

                                </div>
                                <div class="mb-3">
                                    <label for="message-text" class="col-form-label">Comment:</label>
                                    <textarea name="comment" class="form-control" id="comment"></textarea>
                                    <p class="text-danger" style="margin-left: 17px;" id="wrongComment"></p>

                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Confirm</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
            <%
                }
                rs = null;
                stmt.executeQuery("SELECT * FROM image where image.Branch_branchID= '" + branchID + "'");
                rs = stmt.getResultSet();
                while (rs.next()) {
            %>
            <div class="gallery">
                <a target="_blank" href="<%=rs.getString("imageName")%>">
                    <img src="<%=rs.getString("imageName")%>" alt="Forest" width="800" height="400" border="1">
                </a>
            </div>

            <%
                }
            %>

            <br><br><br><br><br><br><br><br>
            <div>
                <%
                    rs = null;
                    stmt.executeQuery("SELECT * FROM room where room.Branch_branchID= '" + branchID + "' and roomCount > 0");
                    rs = stmt.getResultSet();
                    ResultSet rs1 = null;
                    Statement stmt2 = null;
                    stmt2 = con.createStatement();
                    while (rs.next()) {%>
                <div class="card bg-light mb-3" style="max-width: 18rem; float: left; margin: 18px;">
                    <div class="card-header">
                        
                        <h3><b><%=rs.getString("roomType")%></b></h3></div>
                    <div class="card-body">
                        
                        <h5 class="card-title"><img src="price.png" width="25">&nbsp;&nbsp;&nbsp;<%=rs.getString("roomPrice")%> EGP</h5>
                        
                        <p class="card-text"><img src="user.png" width="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("adultsCapacity")%> Adults, <%=rs.getString("childrenCapacity")%> Children</p>
                        <%
                            stmt2.executeQuery("SELECT * FROM roomfacility INNER JOIN room_has_roomfacility on room_has_roomfacility.Room_roomID = '" + rs.getString("roomID") + "' and room_has_roomfacility.RoomFacility_roomFacilityID = roomfacility.roomFacilityID");
                            rs1 = stmt2.getResultSet();
                            String facilities = "";
                            while (rs1.next()) {
                                if (rs1.getInt("facilityNumber") > 0) {
                                    facilities += rs1.getString("facilityNumber") + " " + rs1.getString("facilityType") + ", ";
                                }
                            }

                        %>
                        <p class="card-text"><img src="facility.png" width="25">&nbsp;&nbsp;&nbsp;&nbsp;<%=facilities%></p>
                        <a class="btn btn-primary" href="Payment.jsp?roomID=<%=rs.getString("roomID")%>&branchID=<%=branchID%>" >Reserve</a>
                    </div>
                </div><%}%><%
                        } catch (Exception e) {
                            out.print(e);
                        }
                    }
                %>
            </div>

        </div>

    </body>
</html>
