<%-- 
    Document   : UpdatingProfile
    Created on : Mar 4, 2019, 4:06:48 PM
    Author     : Hariharan
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating</title>
    </head>
    <body>
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light" type="button" value="Logout"></a>
        <h1>Updated</h1>
        <%!
           private Connection cn = null; 
         %>
         <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            int user=Integer.parseInt(request.getParameter("userId"));
            String mail=request.getParameter("mail");
            String street=request.getParameter("street");
            String area=request.getParameter("area");
            String city=request.getParameter("city");
            int pin=Integer.parseInt(request.getParameter("pin"));
            String query="";
            Statement stmt = cn.createStatement();
            int type,isThere=0;
          %>
          <%
            query ="select * from userdetails;";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                if(user==(rs.getInt("aadhar"))){
                        isThere=1;                     
                        break;                    
                }
            }
            if(isThere==1){
                query="delete from userdetails where aadhar="+user+";";
                stmt.executeUpdate(query);
                query="insert into userdetails values("+user+",'"+mail+"','"+street+"','"+area+"','"+city+"',"+pin+")";
                stmt.executeUpdate(query);
                out.println("Your details are updated");
            %>
            <%
            }
            else {
                query="insert into userdetails values("+user+",'"+mail+"','"+street+"','"+area+"','"+city+"',"+pin+")";
                stmt.executeUpdate(query);
            }
            %>
            <div>Updation was successfull.</div>
              
          

    </body>
</html>
