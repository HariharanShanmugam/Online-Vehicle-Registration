<%-- 
    Document   : loggedIn
    Created on : Feb 18, 2019, 8:30:59 PM
    Author     : Hariharan
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LOgGED IN</h1>
        <%
            String user=request.getParameter("userId");
            String pass=request.getParameter("password");
            String userName="";
            int isThere=0,type=0;
        %>
        <%!
            private Connection cn = null; 
            RequestDispatcher dispatcher;
        %>
        
        <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String query ="select * from users where userId="+user+";";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                if(user.equals(rs.getString("userId"))){
                    if(pass.equals(rs.getString("password"))){
                        isThere=1;
                        userName=rs.getString("name");
                        type=rs.getInt("type");
                        break;
                    }
                }
            }
            if(isThere==1){
                out.println("Welcome "+userName);
                if(type==1){
                    dispatcher = request.getRequestDispatcher("rtoHome.jsp");
                    request.setAttribute("userId",user);
                    dispatcher.forward(request, response);
                }
                else if(type==2) {
                    dispatcher = request.getRequestDispatcher("showHome.jsp");
                    request.setAttribute("userId",user);
                    dispatcher.forward(request, response);
                }
                else { 
                    dispatcher = request.getRequestDispatcher("custHome.jsp");
                    request.setAttribute("userId",user);
                    dispatcher.forward(request, response);
                }
            }        
            else {
        %>
        Invalid user!
        <a href="index.jsp">Retry</a>
        <a href="registerUser.jsp">Register Please</a>
        <%
            }
        %>
        
        
    </body>
</html>
