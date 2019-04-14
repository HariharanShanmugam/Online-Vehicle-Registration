<%-- 
    Document   : registerUser
    Created on : Feb 18, 2019, 9:03:40 PM
    Author     : Hariharan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
    </head>
    <body>
        <h1>You can register soon</h1>
        <form method="get" action="confirmRegistration.jsp">
            Aadhar Id:
            <input type="text" name="userId" required><br>
            Name:
            <input type="text" name="name" required><br>
            Password:
            <input type="password" name="password" required><br>
            <select name="type">
                <option value="show">Show Room</option>
                <option value="cust">Customer</option>
            </select>
            <input type="submit" name="submit" value="Register">
        </form>
    </body>
</html>
