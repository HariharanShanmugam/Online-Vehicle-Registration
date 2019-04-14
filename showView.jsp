<%-- 
    Document   : showView
    Created on : Mar 17, 2019, 1:58:06 PM
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
    </head>
    <body>
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light" type="button" value="Logout"></a>
    <center><h1 style="font-family: First Christmas">Vehicles registered from your showroom</h1></center>
        <%!
            private Connection cn = null; 
            String names;
        %>
        <%
            String user=request.getParameter("userId");
            //out.println(user);
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String query ="select * from slots where showId="+user+";";
            ResultSet slot = stmt.executeQuery(query);
            %>
    <div class="container">
    <div style="border-style:groove;">
        <br>
            <%
            while(slot.next()) {
             %>
    <form action="showDetailView.jsp" class="text-center" method="get">
                    <input type="text" name="custId" value="<%=slot.getInt("custId")%>" hidden>
                    <input type="text" name="showId" value="<%=slot.getInt("showId")%>" hidden>
                    <input type="text" name="chaseNo" value="<%=slot.getInt("chaseNo")%>" hidden>
                    <input type="text" name="dateS" value="<%=slot.getDate("dateS")%>" hidden>                    
                    <input type="submit" class="btn btn-outline-light" value="<%=slot.getInt("chaseNo")%>">                    
                </form>
                <br>
        <%
            }
        %>
        </div>
        </div>
    </body>
</html>
