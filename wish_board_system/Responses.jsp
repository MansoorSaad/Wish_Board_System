<!--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Responses</title>
    <style>
            table{
                width: 100%;
            }
    /* width */
    ::-webkit-scrollbar {
        width: 6px;
        }

    /* Track */
    ::-webkit-scrollbar-track {
        background:#269da1; 
    }
 
    /* Handle */
    ::-webkit-scrollbar-thumb {
        background:cornflowerblue; 
    }

    /* Handle on hover */
    ::-webkit-scrollbar-thumb:hover {
        background:rgb(7, 127, 129);
    }
    </style>
</head>
<body>
    <table border="1" id='list' cellpadding=10mm>

    </table>
        <script>
            s="";
            n=100;
            for(i=0;i<=n;i++){
                s+="<tr><td>"+i+"</td></tr>"
            }
            list.innerHTML=s;
        </script>
</body>
</html>
-->
<style>
            table{
                width: 100%;
            }
    /* width */
    ::-webkit-scrollbar {
        width: 6px;
        }

    /* Track */
    ::-webkit-scrollbar-track {
        background:#269da1; 
    }
 
    /* Handle */
    ::-webkit-scrollbar-thumb {
        background:cornflowerblue; 
    }

    /* Handle on hover */
    ::-webkit-scrollbar-thumb:hover {
        background:rgb(7, 127, 129);
    }
    </style>
<%!String receiverid;%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*;" %>
<%String receiverid=(String)session.getAttribute("uid");

    response.setContentType("text/html");
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish","website","12345678");
    Statement stmt=con.createStatement();
    ResultSet rs1=stmt.executeQuery("select senderid from respond where receiverid="+receiverid+";");
    
    String s="<table border='1'>";
    while(rs1.next()){
        s+="<tr>";
        //data
        s+= "<td><a target='_blank' href='chatting3.jsp?senderid="+
            rs1.getString(1)+
            "'>"+rs1.getString(1)+"</a></td>";
        s+="</tr>";
    }
    s+="</table>";
    out.println(s);
     }
    catch(Exception e){
        out.print(e);
    }
    %> 
