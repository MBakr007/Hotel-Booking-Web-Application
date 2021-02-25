<%-- 
    Document   : SignUp
    Created on : Jan 11, 2021, 7:52:08 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
        <link href="css\bootstrap.min.css" rel="stylesheet" >
        <link href="css\myfile.css" rel="stylesheet" >
        <script src="js\validation.js">
        </script>
        <style>
            a.ex1:visited, a.ex1:link {color: blueviolet; text-decoration: none;}
            a.ex1:hover, a.ex1:active {color: blue;}
            a{
                float: right;
            }
            body {
                background-image: url('background.jpg');

            }
        </style>
    </head>
    <body onload="changeCap()">
        <br><br>
        <h1 class="centerText"> Sign Up Page</h1>
        <form class="center" action="CheckSignUp" name="form" onsubmit="return check(this)" method="post" >
            <div class="form-group">
                <label>User Name</label>
                <input type="text" name ="userName" class="form-control" placeholder="Enter Your User Name" id="userName">
            </div>
            <p class="text-danger" style="margin-left: 17px;" id="ua"></p>
            <div class="form-group">
                <label>Name</label>
                <input type="text" name ="name" class="form-control" placeholder="Enter Your Name" id="name">
            </div>
            <p class="text-danger" style="margin-left: 17px;" id="n"></p>
            <div class="form-group">
                <label for="exampleInputEmail1">Email</label>
                <input type="email" name ="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" >
                <p class="text-danger" style="margin-left: 17px;" id="e"></p>
            </div>
            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" name ="phoneNumber" class="form-control" placeholder="Enter Phone Number" id="phonenumber">
                
            </div>
            <p class="text-danger" style="margin-left: 17px;" id="p"></p>
            <br>
            <div>
                <b id ="realCP"></b>
                <button type="button" onclick="changeCap()"><img src="reload.png" width="20"></button>
                <input type="text" name="captcha" id="CP">
            </div>
            <p class="text-danger" style="margin-left: 17px;" id="wrongData"></p>
            <br>
            <input type="submit" class="btn btn-primary" value="Sign up">
            <a class="ex1" href="Login.html">Already Have an Account</a>
        </form>
    </body>
</html>
