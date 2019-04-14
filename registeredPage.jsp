<%-- 
    Document   : registeredPage
    Created on : Mar 15, 2019, 10:33:15 PM
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
    </head>
    <body>
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light" type="button" value="Logout"></a>
        
        <%!
           private Connection cn = null; 
        %>
       
        <%
            String number=request.getParameter("regNo");
            int chaseNo=Integer.parseInt(request.getParameter("chaseNo"));
            String user=request.getParameter("userId");
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            String query="update vehicleDetails set regNo='"+number+"' where chaseNo="+chaseNo+";";
            Statement stmt = cn.createStatement();
            stmt.executeUpdate(query);
            query="select * from users where userId="+user+";";
            ResultSet rs=stmt.executeQuery(query);
            rs.next();
            String pass=rs.getString("password");
        %>
        <%=number%>
        <form method="get" action="loggedIn.jsp">
            <input type="text" name="userId" value="<%=user%>" hidden>
            <input type="text" name="password" value="<%=pass%>" hidden>
            <input type="submit" class="btn btn-light btn-outline-success" value="home">
            
        </form>
    </body>
</html>
