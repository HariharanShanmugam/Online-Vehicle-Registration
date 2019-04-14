<%-- 
    Document   : confirmRegistration
    Created on : Feb 18, 2019, 11:01:12 PM
    Author     : Hariharan
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
    </head>
    <body>
        
        <%!
           private Connection cn = null; 
         %>
         <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            String user=request.getParameter("userId");
            String pass=request.getParameter("password");
            String userName=request.getParameter("name");
            String position=request.getParameter("type");
            String query="";
            Statement stmt = cn.createStatement();
            int type,isThere=0;
          %>
          <%
            query ="select * from users;";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                if(user.equals(rs.getString("userId"))){
                        isThere=1;                     
                        break;
                    
                }
            }
            if(isThere==1){
                out.println("This UserId("+user+") is already used!");
            %>
             <h1>Registration cannot be carried out</h1>
              <a href="registerUser.jsp" >Register again</a>
              <a href="index.jsp">Already a member</a>
            <%
            }
            //String query ="select * from studetails where adno='"+adno+"'";
            // ResultSet rs = stmt.executeQuery(query);
            else {
                if(position.equals("RTO")) 
                    type=1;
                else if(position.equals("show"))
                    type=2;
                else
                    type=3;
                query="insert into users values("+Integer.parseInt(user)+",'"+userName+"','"+pass+"',"+type+")";
                stmt.executeUpdate(query);
            %>
            <div>Registration was successfull.</div>
            <form method="post" action="updateProfile.jsp">
                <input type="text" name="userid" value="<%=user%>" hidden  >
                <input type="submit" value="Update">    
            </form>
            <a href="index.jsp">Login</a>
            <%
            
            }
           %>
       
    </body>
</html>
