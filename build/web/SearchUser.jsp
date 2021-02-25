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
        
        if (request.getSession().getAttribute("hotelID") == null) {
            response.sendRedirect("Login.html");
        } else {
            String hotelID = request.getSession().getAttribute("hotelID").toString();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Reservations</title>
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
        <script>
            function checkEmpty()
            {
                var id = document.getElementById("i").value;
                var email = document.getElementById("e").value;
                var phoneNumber = document.getElementById("p").value;
                flag = true;
                if (email === "" && phoneNumber === "" && id === "")
                {
                    document.getElementById("wrongData").innerHTML = "Data is Required.";
                    flag =  false;
                }
                else if (phoneNumber != "" && isNaN(phoneNumber))
                {
                    document.getElementById("wrongData").innerHTML = "phone number must be numbers!.";
                    flag = false;
                }
                else if(id != "" && isNaN(id))
                {                    
                    document.getElementById("wrongData").innerHTML = "id must be number!.";
                    flag = false;
                }
                else if((id!="" && phoneNumber != "") || (id!="" && email != "") || (email!="" && phoneNumber != ""))
                {
                    document.getElementById("wrongData").innerHTML = "select only one feature!";
                    flag = false;
                }
                else
                {
                    document.getElementById("wrongData").innerHTML = "";
                }
                return flag;
            }
        </script>
    </head>
    <body>
        <ul>
             <li style="float:left"><a href="AdminHomePage.jsp">Back</a></li>
            <li style="float:right"><a href="LogOut">LogOut</a></li>
            <li style="float:right"><a href="AdminHomePage.jsp">Home</a></li>
        </ul>
        <br><br><br>
        <h4 style="text-align: center;margin: 10px"><b>USE ONLY ONE OF THIS FILTERS</b></h4> 
        <form class="center" action="GetUser.jsp" onsubmit="return checkEmpty()" style="margin-top:20px" method="post">
            <label>Search By ID : </label>
            <input type ="text" class="form-control" name="id" placeholder="Search By ID" id="i">
            <br>
            <label>Search By Email : </label>
            <input type ="email" class="form-control" name="email" placeholder="Search By Email"  id="e">
            <br>
            <label >Search By Phone Number : </label>
            <input type ="text" class="form-control" name="phoneNumber" placeholder="Search By phone number" id="p">
            <br>
            <p class="text-danger" style="margin-left: 10px;" id="wrongData"></p>
            <input type="submit" value="submit" class="btn btn-primary">
        </form>
        <%}
        }%>