<%-- 
    Document   : custHome
    Created on : Feb 19, 2019, 8:27:27 PM
    Author     : Hariharan
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light" type="button" value="Logout"></a>
    <center>
        
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
        <form method="post" action="updateProfile.jsp">
            <input type="text" name="userid" value="<%=user%>" hidden  >
            <input type="submit" value="Update">
        </form>
        Your slots are:
        <%
            query ="select * from slots where custId="+user+";";
            ResultSet slot=stmt.executeQuery(query);
            //slot.next();
            //out.println(slot.getInt("chaseNo"));
            while(slot.next()){
                %>
                <form action="fancy.jsp" method="get">
                    <input type="text" name="custId" value="<%=user%>" hidden>
                    <input type="text" name="showId" value="<%=slot.getInt("showId")%>" hidden>
                    <input type="text" name="chaseNo" value="<%=slot.getInt("chaseNo")%>" hidden>
                    <input type="text" name="dateS" value="<%=slot.getDate("dateS")%>" hidden>                    
                    <input type="submit" class="btn btn-outline-light" value="<%=slot.getInt("chaseNo")%>">                    
                </form>
        <%
            }
        %>
    </center>
    <footer>
        <hr>
        
    </footer>
    </body>
</html>
