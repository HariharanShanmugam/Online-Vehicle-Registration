<%-- 
    Document   : viewSlots
    Created on : Mar 12, 2019, 2:14:47 PM
    Author     : Hariharan
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slots</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        <script>
            function show(a) {
                
                    <%
                      //  out.println(" \"a=5");
                    %>
                            alert("this is  "+a);
            }
        </script>
    </head>
    <body>
        <div class="text-right">
        <a href="index.jsp" ><input class="btn btn-outline-info btn-light" type="button" value="Logout"></a>
        </div>
        <%!
           private Connection cn = null; 
         %>
         <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclereg","root","");
            int user=Integer.parseInt(request.getParameter("userid"));
            String dateS=request.getParameter("dateS");
            String query="";
            Statement stmt = cn.createStatement();
            int isThere=0;
            out.print("Date: "+dateS);       %>
          
          <%
            query ="select count(*) as count from vehicledetails;";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int vCount=rs.getInt("count");
            out.print(vCount);
            String regNos[][];
            regNos=new String[2][vCount];
            int i=0;
            query="select * from vehicledetails;";
            rs=stmt.executeQuery(query);
            while(rs.next()) {
                /*if(user==(rs.getInt("userId"))){
                        isThere=1;                     
                        break;                    
                }*/
                regNos[0][i]=rs.getString("chaseNo");
                regNos[1][i]=rs.getString("regNo");
                i++;
            }
            /*for(int k=0;k<vCount;k++){
                
            for(int j=0;j<2;j++){
                out.print("<h4>"+regNos[j][k]+"</h4>");
            }
            out.println("<br>");
            }*/
            i=0;
            int count=0;
            query="select * from slots";
            ResultSet sl= stmt.executeQuery(query);%>
            <legend>
                <fieldset>
          <%
            String is;
            //out.println("<legend><fieldset> Slots");
            while (sl.next()) {
                if(sl.getString("dateS").equals(dateS)) {
                    String curr=sl.getString("chaseNo");
                    int isDone=0;
                    for(int j=0;j<vCount;j++){
                        if(curr.equals(regNos[0][j])){
                            if(regNos[1][j].equals("PENDING"))
                                isDone=1;
                        }
                    }
                   // out.println(isDone);
                    if(isDone==1) {
            %>
                    <div>
                        <div class="text-center">
                            <form post="get" action="processRegistration.jsp">
                                <input type="text" name="userId" value="<%=user%>" hidden/>
                                <input type="text" name="showId" value="<%=sl.getString("showId")%>" hidden/>
                                <input type="text" name="custId" value="<%=sl.getString("custId")%>" hidden/>
                                <input type="text" name="chaseNum" value="<%=sl.getString("chaseNo")%>" hidden/>
                                <input type="submit" class="btn btn-outline-success" value="<%=sl.getString("chaseNo")%>"/>
                            </form>
                            <br>
                        </div>
                    </div>
                    
                 
        <%
                }
                }
            }
           // out.println("</fieldset></legend>");
          %>
          </fieldset>
            </legend>
    </body>
</html>
