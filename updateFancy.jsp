<%-- 
    Document   : updateFancy
    Created on : Mar 16, 2019, 10:11:58 AM
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
            function confirm() {
                alert("Let me check your desired number is available!");
            }
        </script>
    </head>
    <body>
        <h1>Fancy Number</h1>
         <%!
            private Connection cn = null; 
            String names;
        %>
        
        <%            
            String custId=request.getParameter("custId");
            String chaseNo=request.getParameter("chaseNo");
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String query ="select count(*) as count from vehicledetails;";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int count=rs.getInt("count");
            String all=" ",numbers[];
            numbers= new String[count];
            query="select * from vehicledetails";
            rs=stmt.executeQuery(query);
            while(rs.next()) {
                all=all+rs.getString("regNo");
            }
        %>
      
        
        <form action="updateFancy2.jsp" method="get">
            <input type="text" name="custId" value="<%=custId%>" hidden>
            <input type="text" name="chaseNo" value="<%=chaseNo%>" hidden>
            <input type="text" name="fancy" value=""placeholder="TN72XX----" required>
            <input type="submit" name="check" value="check" onclick="confirm()">
        </form>
        
    </body> 
</html>
