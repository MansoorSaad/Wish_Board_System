<%-- 
    Document   : saveresponse
    Created on : 30 Oct, 2019, 7:28:16 PM
    Author     : gowthamkumar


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.util.*" %>
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*;" %>
        <%!int i1;String senderid,receiverid,response;%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>save response</title>
    </head>
    <body>
        <%
        String senderid=(String)session.getAttribute("userid"); 
        String receiverid=(String)session.getAttribute("receiverid");
        String respond=(String)session.getAttribute("respond");
//        String time=(String)session.getAttribute("time");
//        String date=(String)session.getAttribute("date");
        %>
        <%
         //String wish=request.getParameter("wish");
          //data base connection
           response.setContentType("text/html");
           try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish","website","12345678");
            Statement stm=con.createStatement();
            int i;
            String q1;
            q1="insert into respond values("
                    +"default,'"
                    +senderid+
                    "','"+
                    receiverid
                    +"','"+
                    respond+
                    "','"+
                    "curtime()"+
                    "','"+
                    "curdate()"+"')";
            i1=stm.executeUpdate(q1);   
            if(i1>0){
                
            }
            else{
                out.println("insertion unsuccessfulllll");
            }
            con.close();
        }
        catch(Exception e){
            out.print("insert into respond values("
                    +"default,'"
                    +senderid+
                    "','"+
                    receiverid
                    +"','"+
                    respond+
                    "','"+
                    "curtime()"+
                    "','"+
                    "curdate()"+"')"+e);
        }
           
          %>
    </body>
</html>

--%>


<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*;" %>
<%String senderid=(String)session.getAttribute("uid");%>
<%   
String respond=(String)request.getParameter("respond");
String receiverid=(String)request.getParameter("receiverid");


response.setContentType("text/html");
try{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish","website","12345678");
 Statement stm=con.createStatement();
    int i;
   String q1;
   q1="insert into respond values("
           +"default,'"
           +senderid+
           "','"+
           receiverid
           +"','"+
           respond+
           "',"+
           "default"+")";
   i=stm.executeUpdate(q1);   
   if(i>0){
       out.println("message sent successfulllll");
   }
   else{
       out.println("insertion unsuccessfulllll");
   }
   con.close();
}
catch(Exception e){
   out.print("insert into respond values("
           +"default,"
           +senderid+
           "','"+
           receiverid
           +"','"+
           respond+
           "','"+
           "default"+")"+e);
}
%>
