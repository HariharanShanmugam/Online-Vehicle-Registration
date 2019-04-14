<%-- 
    Document   : updateProfile
    Created on : Feb 25, 2019, 4:11:03 PM
    Author     : Hariharan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" type="text/css" href="bootstrap.css">

        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            int user=Integer.parseInt(request.getParameter("userid"));
        %>
    <center><h1>Update Personal Details</h1></center>
        <form method="post" action="UpdatingProfile.jsp">
        <input type="text" value="<%= user%>" name="userId" hidden  >
        
        <div class="form-row">
          <div class="form-group col-md-6">
              
            <label for="inputEmail4">Email</label>
            <input type="email" class="form-control" name="mail"id="inputEmail4" placeholder="Email">
              
          </div>
        </div>
        
        <div class="form-row">
        <div class="form-group col-md-6">
          <label for="inputAddress">Street</label>
          <input type="text" class="form-control" id="inputAddress" name="street" placeholder="Door, Street Name">
        </div>
        </div>
        <div class="form-row">
        <div class="form-group col-md-6">
          <label for="inputAddress2">Area</label>
          <input type="text" class="form-control" id="inputAddress2" name="area" placeholder="Area">
        </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputCity">City</label>
            <input type="text" class="form-control" name="city" id="inputCity" placeholder="City">
          </div>
        </div>
        <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputZip">Zip</label>
            <input type="text" class="form-control" name="pin" id="inputZip" placeholder="pincode">
        </div>
        </div>
        
        <div class="form-group">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
              I accept, all details given are genuine.
            </label>
          </div>
        </div>
        <br>
        <br>
        
        <button type="submit" class="btn btn-primary">Update</button>
        
      </form>
    </body>
</html>
