<%-- 
    Document   : showHome
    Created on : Feb 19, 2019, 8:27:14 PM
    Author     : Hariharan
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
           
        <h1>Hello <%=names%>,</h1>
        <hr>
        <form method="post" class="text-right" action="updateProfile.jsp">
            <input type="text" name="userid" value="<%=user%>" hidden  >
            <input type="submit" class=" btn  btn-outline-light text-right" value="Update">
        </form> 
        <form method="post" class="text-right" action="showView.jsp">
            <input type="text" name="userId" value="<%=user%>" hidden>
            <input type="submit" class="btn btn-outline-secondary" name="book" value="View status">            
        </form>
            <div class="container">
                <div class="container">

                <form method="post" class="card text-center " action="bookSlot.jsp">
                    <h3 class="card-header">Book Your Slot</h3>
                    <div class="card-body">
                        Date:
                        <input type="date"  name="dateS" required><br> 
                    <input type="text" name="userId"  value="<%=user%>" hidden>
                    <input type="submit" name="book" class="btn btn-block btn-success" value="Book Slots">
                    </div>
                </form>
                </div>
            </div>
               

    </body>
    

