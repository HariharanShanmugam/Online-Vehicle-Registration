<%-- 
    Document   : index
    Created on : Feb 18, 2019, 4:41:21 PM
    Author     : Hariharan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Vehicle Registration</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
    </head>
    <style>
        body{
            background-image: url('./images/image1.jpg');
           
            background-size: 100%;
        } 
        .card{
             width:50%;
             left: 25%;
        }
        .r{
           left:60%;
        }
    </style>
    <body>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="container">
            <div >
                <h1 id="title" class="text-center" style="color:white">Online Vehicle Registration</h1>
            </div>
            <h4 class="text-center" style="color:white">Enter the Credentials</h4>
            <div class="card text-center">
                <div class="card-content"> 
                    <div class="card-header">
                        Login
                    </div>
                    <div class="card-body">
                        <form class="text-center" method="get" action="loggedIn.jsp">
                            
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text" id="i1">Aadhar Id</span>
                                </div>
                                <input type="text" name="userId" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text" id="i2">Password</span>
                                </div>
                                <input type="password" name="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                            </div>
                            <input type="submit" class="btn btn-outline-success" id="s" name="submit" value="Login">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="r text-center">
            <a href="registerUser.jsp" style="color:white">Register</a>
        </div>
        
    </body>
</html>
