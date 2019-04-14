<%-- 
    Document   : giveFancy
    Created on : Mar 16, 2019, 1:47:13 PM
    Author     : Hariharan
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        <title>Fancy Number</title>
    </head>
    <body>
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light" type="button" value="Logout"></a>
        <h1 class="alert-success">Updated</h1>
        <%!
            private Connection cn = null; 
        %>
        <%            
            String custId=request.getParameter("custId");
            String chaseNo=request.getParameter("chaseNo");
            String fancy=request.getParameter("fancy");
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String query ="select * from fancy;";
            ResultSet rs = stmt.executeQuery(query);
            int isThere=0;
            while (rs.next()) {
                if(chaseNo.equals(rs.getString("chaseNo"))) {
                    isThere=1;
                    break;
                }
            }
            if(isThere==1) {
                    query="delete from fancy where custId="+custId+";";
                    stmt.executeUpdate(query);
                    query="insert into fancy values("+custId+","+chaseNo+",'"+fancy+"');";
                    stmt.executeUpdate(query);
            }
            else {
                query="insert into fancy values("+custId+","+chaseNo+",'"+fancy+"');";
                    stmt.executeUpdate(query);
            }
            String pass="";
            query="select * from users where userId="+custId+";";
            rs=stmt.executeQuery(query);
            rs.next();
            pass=rs.getString("password");
        %>
        <form method="get" action="loggedIn.jsp">
            <input type="text" name="userId" value="<%=custId%>" hidden>
            <input type="text" name="password" value="<%=pass%>" hidden>
            <input type="submit" class="btn btn-light btn-outline-success" value="home">
            
        </form>
    </body>
</html>
