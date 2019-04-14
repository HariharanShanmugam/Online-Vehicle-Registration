<%-- 
    Document   : processRegistration
    Created on : Mar 14, 2019, 9:37:20 PM
    Author     : Hariharan
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        <script>
            function confirm() {
                alert("Is all details are verified?");
            }
        </script>
    </head>
    <body>
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light" type="button" value="Logout"></a>
        <%
            String userId=request.getParameter("userId");
            String chaseNo=request.getParameter("chaseNum");
            String custId=request.getParameter("custId");
        %>
        <h1>REGISTER</h1> 
        <%!
           private Connection cn = null; 
         %>
         <b>Vehicle Details</b>
         <table class="table-hover">

         <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            String query="select * from vehicledetails where chaseNo="+chaseNo;
            Statement stmt = cn.createStatement();
            //query ="select * from users;";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            out.println("<tr><th>Chase Number:</th><td> "+rs.getString("chaseNo")+" </td>"
                    + "<td><input type=\"checkbox\" name=\"chaseCheck\"value=\"true\"required> </td></tr>");
            
            out.println("<tr><th>Brand: </th><td>"+rs.getString("brand")+"</td>"
                    + "<td><input type=\"checkbox\" name=\"brandCheck\"value=\"true\" required></td></tr>");
            out.println("<tr><th>Model: </th><td>"+rs.getString("model")+"</td>"
                    + "<td><input type=\"checkbox\" name=\"modelCheck\"value=\"true\" required></td></tr>");
            if(rs.getBoolean("geared"))
                out.println("<tr><th>Geared: </th><td>Yes </td>"
                        + "<td><input type=\"checkbox\" name=\"gearCheck\"value=\"true\" required></td></tr>");
            else
                out.println("<tr><th>Geared:</th><td> No </td>"
                        + "<td><input type=\"checkbox\" name=\"gearCheck\"value=\"true\" required></td></tr>");
              String query1="select * from users where userId="+custId+";";
                  ResultSet rs1 =stmt.executeQuery(query1);
                  rs1.next();
              String name=rs1.getString("name");
          %>
          </table>
          <br><b>Customer details verification</b>
          <table class="table-hover">
              <%
                  query="select * from userdetails where aadhar="+custId+";";
                  ResultSet cust =stmt.executeQuery(query);
                  cust.next();
                              
                  out.println("<tr><th>Name: </th><td> "+name+" </td>"
                    + "<td><input type=\"checkbox\" name=\"nameCheck\"value=\"true\" required></td></tr>");    
                  
                  out.println("<tr><th>Aadhar: </th><td> "+cust.getInt("aadhar")+" </td>"
                    + "<td><input type=\"checkbox\" name=\"aadharCheck\"value=\"true\" required></td></tr>");
                  out.println("<tr><th>mail: </th><td> "+cust.getString("email")+" </td>"
                    + "<td><input type=\"checkbox\" name=\"aadharCheck\"value=\"true\" required></td></tr>");
                  out.println("<tr><th>Aadhar :</th><td> "+cust.getString("street")+", </td>"
                    + "<td></td></tr>");
              %>
              <tr>
                  <td></td>
                  <td><%=cust.getString("area")%>,</td>
                  <td></td>
              </tr>
              <tr>
                  <td></td>
                  <td><%=cust.getString("city")%>,</td>
                  <td></td>
              </tr>
              <tr>
                  <td></td>
                  <td><%=cust.getInt("pin")%>.</td>
                  <td><input type="checkbox" name="addressCheck" value="false" required/></td>
              </tr>
          </table>
                  <input type="checkbox" name="allCheck"  onclick="confirm()" required>All details are verified
                  <form method="get" action="registeredPage.jsp">
                      <%
                          query="select * from fancy;";
                          rs=stmt.executeQuery(query);
                          int isThere=0;
                          while(rs.next()) {
                              if(chaseNo.equals(rs.getString("chaseNo"))) {
                                  isThere=1;
                                  break;
                              }
                          }
                          if(isThere==1){
                          %>
                          <input type="text" name="regNo1" value="<%=rs.getString("fancy")%>" disabled>
                          <input type="text" name="regNo" value="<%=rs.getString("fancy")%>" hidden>
                      <%
                          }
                        else{
                        %>
                            <input type="text" name="regNo" placeholder="TN72 XX 000"required>
                        <%
                        }
                      %>
                        
                      <input type="text" name="chaseNo" value="<%=chaseNo%>" hidden>
                      <input type="text" name="userId" value="<%=userId%>" hidden>
                      <input type="submit" value="Register">
                  </form>
         </body>
</html>
