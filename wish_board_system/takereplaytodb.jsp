<%-- 
    Document   : takereplaytodb
    Created on : 2 Nov, 2019, 2:36:53 AM
    Author     : gowthamkumar
--%>
      <%@page import="java.util.*" %>
     <%@page import="java.sql.*" %>
     <%@page import="java.io.*;" %>
     <%!String presentuid,textmesg;%>
        <%String textmesg=request.getParameter("respond");
          String presentuid=request.getParameter("presentuid");
          String touser=(String)session.getAttribute("touser");
          response.setContentType("text/html");
try{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish","website","12345678");
 Statement stm=con.createStatement();
    int i;
   String q1;
   q1="insert into respond values("
           +"default,'"
           +presentuid+
           "','"+
           touser
           +"','"+
           textmesg+
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
           +"default,'"
           +presentuid+
           "','"+
           touser
           +"','"+
           textmesg+
           "',"+
           "default"+")"+e);
}
%>

