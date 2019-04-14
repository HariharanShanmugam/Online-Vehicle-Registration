<%-- 
    Document   : rtoHome
    Created on : Feb 19, 2019, 8:26:59 PM
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
        <style>
            body{
                background-color:skyblue;
            }
        </style>
    </head>
    <body>
      <center>
        <div class="text-right">
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light" type="button" value="Logout"></a>
        </div>
        <%!
            private Connection cn = null; 
            String names;
        %>
        
        <%
            String user=(String)request.getAttribute("userId");
            //out.print(user);
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String query ="select * from users where userId='"+user+"';";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
                //while(rs.next())
                    {            
                 names=rs.getString("name");   
                }
            %>
        
        
          <br>
        <br>
        <h1>Hello <%=names%>,</h1>
        <form method="post" action="updateProfile.jsp">
              <input type="text" name="userid" value="<%=user%>" hidden  >
              <input type="submit" class="btn btn-link" value="Update profile details">
            
        </form>
        <br>
        <br>
        <br>
        <br>
        <form method="get" action="viewSlots.jsp">
            <input type="text" name="userid" value="<%=user%>" hidden  >
            <h6>Select date</h6>
            <input type="date"  name="dateS" value=""><br><br>
            <input type="submit" class=" btn btn-outline-info btn-light btn btn-success" value="View Slots">
        </form>
      </center>
    </body>
</html>
