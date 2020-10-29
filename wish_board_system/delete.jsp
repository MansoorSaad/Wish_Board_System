<%-- 
    Document   : delete
    Created on : 23 Oct, 2019, 9:30:38 PM
    Author     : gowthamkumar
--%>

<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*;" %>
<%
    String wish=(String)request.getParameter("wish");
    String wid=(String)request.getParameter("wishid");
    
    response.setContentType("text/html");
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish","website","12345678");
    Statement stmt=con.createStatement();
    int i=stmt.executeUpdate("delete from wishes where wid="+wid+";");
    if(i>0){
        out.print("successful");
    }
    else
    {
        out.print("deletion failed"+wid+wish);
    }
    con.close();
    //response.sendRedirect("userpage.jsp");
    }
    catch(Exception e){
        out.print("delete from wishes where wid="+wid+";"+e);
    }
%>

