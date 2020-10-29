<%-- 
    Document   : signup.jsp
    Created on : 27 Oct, 2019, 2:41:32 PM
    Author     : gowthamkumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*;" %>

<% 
    try{
    String site = new String("userpage.jsp");
response.setContentType("text/html");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String passwd=request.getParameter("passwd");
String year=request.getParameter("yearselectbox");
String regno=request.getParameter("reg_no");
String course=request.getParameter("courseselectbox");
String branch=request.getParameter("branch");
String aboutme=request.getParameter("aboutme");
String last_four_digits_of_regno=regno.substring(regno.length() - 4);
String uid=String.valueOf((Integer.parseInt(last_four_digits_of_regno)*3)-100);
    session.setAttribute("uid", uid);
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
        ("jdbc:mysql://localhost:3306/wish","website","12345678");          
Statement stmt=con.createStatement();

int i=stmt.executeUpdate(
"insert into usertable values('"+uid+"','"+fname+"','"+lname+"','"+
        passwd+"','"+year+"','"+regno+"','"+course+"','"+branch+"','"+aboutme+"')");  

if(i>0)  {        
        session.setAttribute("uid", uid);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
         
}
else {               
out.print("Insert Unsuccessful because of query="+"insert into usertable values('"+uid+"','"+fname+"','"+lname+"','"+
        passwd+"','"+year+"','"+regno+"','"+course+"','"+branch+"','"+aboutme+"')'");            
}}
catch (Exception e) {
out.print(e);
}
out.close();
%>

    </body>
</html>
