<%-- 
    Document   : listUsers
    Created on : Feb 18, 2019, 9:32:50 PM
    Author     : Hariharan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <h1>List of Users</h1>
        <%!
            private Connection cn = null; 
        %>
        
        <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String query ="select * from users;";
            ResultSet rs = stmt.executeQuery(query);
        %>
        <table border = "1" width = "100%">
            <tr>
              <th>User Id</th>
              <th>Name</th>
              <th>Password</th>
            </tr>
            <% 
                while(rs.next())
                    {            
            %>
            <tr>
                <th><%=rs.getString("userId")%></th>
                <th><%=rs.getString("name")%></th>
                <th><%=rs.getString("password")%></th>
            </tr>
            <%
                }
            %>
        </table>

    
</html>
