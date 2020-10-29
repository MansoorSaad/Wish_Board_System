<%-- 
    Document   : takewish
    Created on : 29 Oct, 2019, 4:58:35 PM
    Author     : gowthamkumar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Wish</title>
        
    </head>
    <body>
     <%@page import="java.util.*" %>
     <%@page import="java.sql.*" %>
     <%@page import="java.io.*;" %>
     <%String userid =(String) session.getAttribute("uid");%>
        <%
            String wish=request.getParameter("wish");
            //data base connection
            response.setContentType("text/html");
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish",
                    "website","12345678");
            Statement stmt=con.createStatement();
            int i=stmt.executeUpdate("insert into wishes values('"
                                        +userid+"','"
                                        +wish+"'"+","+
                                         "default"+
                                          ");");
            if(i>0){%>
            
<!--         <script>
             function al(){
             alert("enter successfull"); 
         }
        </script>
        <script>
            window.onLoad=al;
        </script>-->
        
        <%   
          response.sendRedirect("userpage.jsp");  
            }
            else{
               out.print("sorry not submited try again"); 
            }
            }
            catch(Exception e){
                out.print("insert into wishes values('"
                                        +userid+"','"
                                        +wish+"'"+","+
                                         "default"+
                                          ");"+e);
            }
        %>
    </body>
</html>
