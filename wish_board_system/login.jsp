<%-- 
    Document   : login
    Created on : 27 Oct, 2019, 2:20:26 PM
    Author     : gowthamkumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<table>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<% 
     String site = new String("newhtml1.html");
     String site1 = new String("userpage.jsp");
    response.setContentType("text/html");
    String uid=request.getParameter("uid");
    String passwd=request.getParameter("passwd");
    
    
    try{
        session.setAttribute("uid", uid);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish","website","12345678");

    PreparedStatement ps= con.prepareStatement("Select userid,passwordd from usertable where userid=?"
            + " and passwordd=?");
    ps.setString(1, uid);
                ps.setString(2, passwd);
                ResultSet rs=ps.executeQuery();
                if (rs.next()) {

                     /*response.setStatus(response.SC_MOVED_TEMPORARILY);
                     response.setHeader("Location", site1);*/
                     response.sendRedirect("userpage.jsp");
                } 
                else {
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
             response.setHeader("Location", site);

                }
                  }
    catch(Exception e) {
    out.print(e);
    }
%>