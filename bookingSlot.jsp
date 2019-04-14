<%-- 
    Document   : bookingSlot
    Created on : Mar 17, 2019, 4:31:18 PM
    Author     : Hariharan
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        <script>
                alert("Sucessfully booked");
            
        </script>
    </head>
    <body>
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light" type="button" value="Logout"></a>
           <%!
            private Connection cn = null; 
            String names;
        %>
        <h1 class="text-center">BOOKED for you</h1>
        <%
            String chaseNo=request.getParameter("chaseNo");
            String brand=request.getParameter("brand");
            String model=request.getParameter("model");
            String gear=request.getParameter("gear");
            int i=0;
            if(gear.equals("yes"))
                i=1;
            String showId=request.getParameter("showId");
            String custId=request.getParameter("custId");
            String dateS=request.getParameter("dateS");
            //out.println(chaseNo+brand+model+gear+showId+custId+dateS);
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String query ="insert into slots values("+showId+","+custId+","+chaseNo+",'"+dateS+"');";
            stmt.executeUpdate(query);
            query="insert into vehicledetails value("+chaseNo+","+i+",'"+brand+"','"+model+"','PENDING');";
            stmt.executeUpdate(query);
            query="select * from users where userId="+showId+";";
            ResultSet rs=stmt.executeQuery(query);
            rs.next();
            String pass=rs.getString("password");
        %>
        <form method="get"class="text-center" action="loggedIn.jsp">
            <input type="text" name="userId" value="<%=showId%>" hidden>
            <input type="text" name="password" value="<%=pass%>" hidden>
            <input type="submit" class="btn btn-block btn-light btn-outline-success" value="home">
            
        </form>
    </body>
</html>
