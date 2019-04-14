<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Details</title>
        
        <style type="text/css">
            #big{
                    font-size:25px;
                    position: absolute;
                    left:150px;
                    top:150px;
                 }
                 #div1 {background-color: pink;width:33cm;height:40px;}
                 #bor {border-color: black;border-style: solid;}
                #p1 {font-size:30px;font-family:arial;text-align:center;font-style:italic;}
                body{background-color:lightgrey;}
        </style>
    </head>
    
    <body>
        <div id="bor">
        
        <%!
           private Connection cn = null; 
         %>
         <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servletdb","root","");
          %>
          <%String adno = (String)request.getAttribute("adno");%>
          <%
            Statement stmt = cn.createStatement();
            String query ="select * from studetails where adno='"+adno+"'";
            ResultSet rs = stmt.executeQuery(query);
           %>
           <%
                    while(rs.next())
                    {   
            %>
            <div id="div1">
                <p id="p1">Welcome to Your Profile <b><%=rs.getString("stuname")%></b>..!!</p>
            </div><br><br><br>
             <%
                  }
             %>
            <%
              String query1 ="select * from studetails where adno='"+adno+"'";
              rs = stmt.executeQuery(query1);
            %>
           
    </body>
</html>