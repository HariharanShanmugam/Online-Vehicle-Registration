<%-- 
    Document   : showDetailView
    Created on : Mar 17, 2019, 2:11:27 PM
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
        <h1>My Vehicle</h1>
        <%!
            private Connection cn = null; 
            String names;
        %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            Statement stmt = cn.createStatement();
            String custId=request.getParameter("custId");
            String showId=request.getParameter("showId");
            String chaseNo=request.getParameter("chaseNo");
            String dateS=request.getParameter("dateS");
            String query ="select * from users where userId='"+custId+"';";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            String name=rs.getString("name");
            query ="select * from users where userId='"+showId+"';";
            ResultSet show = stmt.executeQuery(query);
            show.next();
            query ="select * from vehicleDetails where chaseNo="+chaseNo+";";
            ResultSet vechi = stmt.executeQuery(query);
            vechi.next();
            %>
      
            <table class="table table-striped">
                
                <%
                  out.println("<tr><th>Chase Number:</th><td> "+vechi.getString("chaseNo")+" </td></tr>");
                  out.println("<tr><th>Brand: </th><td>"+vechi.getString("brand")+"</td></tr>");
                  out.println("<tr><th>Model: </th><td>"+vechi.getString("model")+"</td></tr>");
                  if(vechi.getBoolean("geared"))
                      out.println("<tr><th>Geared: </th><td>Yes </td></tr>");
                  else
                      out.println("<tr><th>Geared:</th><td> No </td></tr>");
                  out.println("<tr><th>Register Number: </th><td>"+vechi.getString("regNo")+"</td></tr>");
                %>
            </table>
            <form method="get" action="updateFancy.jsp">
            <input type="text" name="custId" value="<%=custId%>" hidden>
            <input type="text" name="chaseNo" value="<%=chaseNo%>" hidden>
            
            
            <br><b>Customer details verification</b>
            </form>
          <table class="table table-striped">
              <%
                  query="select * from userdetails where aadhar="+custId+";";
                  ResultSet cust =stmt.executeQuery(query);
                  cust.next();
                              
                  out.println("<tr><th>Name: </th><td> "+name+" </td></tr>");    
                  
                  out.println("<tr><th>Aadhar: </th><td> "+cust.getInt("aadhar")+" </td></tr>");
                  out.println("<tr><th>mail: </th><td> "+cust.getString("email")+" </td></tr>");
                  out.println("<tr><th>Aadhar :</th><td> "+cust.getString("street")+", </td></tr>");
              %>
              <tr>
                  <td></td>
                  <td><%=cust.getString("area")%>,</td>
              </tr>
              <tr>
                  <td></td>
                  <td><%=cust.getString("city")%>,</td>       
              </tr>
              <tr>
                  <td></td>
                  <td><%=cust.getInt("pin")%>.</td>
              </tr>
          </table>
        
       
    </body>
</html>
