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
        %>
        
        <%            
            String custId=request.getParameter("custId");
            String chaseNo=request.getParameter("chaseNo");
            String fancy=request.getParameter("fancy");
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String query ="select count(*) as count from vehicledetails;";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int count=rs.getInt("count");
            int isThere=0;
            query="select * from vehicledetails";
            rs=stmt.executeQuery(query);
            while(rs.next()) {
                if(fancy.equals(rs.getString("regNo"))){
                    isThere=1;
                    break;
                }
            }
            if(isThere==1) {
        %>
                <span class="progress-bar progress-bar-striped">Your Number is already available, Try New</span>
                <form action="updateFancy2.jsp" method="get">
                    <input type="text" name="custId" value="<%=custId%>" hidden>
                    <input type="text" name="chaseNo" value="<%=chaseNo%>" hidden>
                    <input type="text" name="fancy" value=""placeholder="TN72XX----" required>
                    <input type="submit" name="check" value="check" onclick="confirm()">
                    
                </form>
        
        <%
            }
            else {
        %>
        <div class="progress-bar progress-bar-striped">
            You got your desired Number on your choice :)
        </div>
        <form method="get" action="giveFancy.jsp"class="text-center">
            <input type="text" name="custId" value="<%=custId%>" hidden>
            <input type="text" name="chaseNo" value="<%=chaseNo%>" hidden>
            <input type="text" name="fancy" value="<%=fancy%>"hidden>
            <input type="submit" class="btn" name="done" value="Request">
        </form>
        <%
            }
        %>
    </body> 
</html>
