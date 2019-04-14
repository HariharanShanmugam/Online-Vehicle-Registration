<%-- 
    Document   : bookSlot
    Created on : Feb 21, 2019, 10:47:10 PM
    Author     : Hariharan
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Slot</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
    </head>
    <body>
        <div class="text-right">
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light " type="button" value="Logout"></a>
        </div>
        <%!
            private Connection cn = null; 
            String names;
        %>
        
        <%
            String user=request.getParameter("userId");
            String dateS=request.getParameter("dateS");
            //out.print(dateS);
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String query ="select count(*) as count from slots where dateS='"+dateS+"';";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int count=rs.getInt("count");
            if(count<11) {
                %>
                <hr>
                <h2 style="font-family: Bodoni MT Black;">Enter the details for Registration</h2>
                <h3>Vehicle Details</h3>
                <form method="get" action="bookingSlot.jsp">
                    <input type="text" name="dateS" value="<%=dateS%>" hidden>
                    <input type="text" name="showId" value="<%=user%>" hidden >
                    <table>
                        <tr>
                            <th >Chase Number</th>
                            <td><input name="chaseNo" class="form-control form-control-file form-text"type="number" placeholder="Chase Number" required><td>
                        </tr>
                        <tr>
                            <th>Brand</th>
                            <td><input name="brand" class="form-control form-control-file form-text" type="text" placeholder="Brand" required><td>
                        </tr>
                        <tr>
                            <th>Model</th>
                            <td><input name="model" class="form-control form-control-file form-text" type="text" placeholder="Model" required><td>
                        </tr>
                        <tr>
                            <th>Geared</th>
                            <td>
                                <input type="radio" name="gear" value="yes" checked> Geared<br>
                                <input type="radio" name="gear" value="no"> Non Gear
                            <td>
                        </tr>
                    </table>
                    <hr>
                    <div>Customer Details</div>
                    <table>
                        <tr>
                            <th>Name</th>
                            <td><input name="custName" type="text" class="form-control form-control-file form-text" placeholder="name" required><td>
                        </tr>
                        <tr>
                            <th>Aadhar</th>
                            <td><input name="custId" type="text" class="form-control form-control-file form-text" placeholder="Aadhar" required><td>
                        </tr>
                    </table>
                    <input type="submit" class="btn btn-light btn-outline-success" name="book" value="book">
                </form>
        <%
            }
            else{
                out.println("The day is busy try other day please");
            }
        %>
       <hr>
    </body>
</html>
