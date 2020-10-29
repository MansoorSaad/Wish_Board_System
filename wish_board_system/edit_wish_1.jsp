<!--<html>
<head>
    <style>
        body{
      background: linear-gradient(rgb(164, 226, 241), rgba(164, 215, 228, 0.63)), url("boy_cn.jpg");
      background-size: 100% 100%;
            }
        .table{
            width:100%;
            height: 100%;
        }
        .delete{
           border-radius: 20%;
           background: rgb(164,226,241);
           padding: 0.3% 0.5%;
           cursor: pointer;
        }
        .delete:hover{
            background: aquamarine;
        }
        td{
            font-size: 20px;
        }
    </style>
</head>

    <body>
        <%!// int a=10,b=5;%>
    <table class='table'>
        <%
           /* for(int i=1;i<a;i++)
            {
                out.println("<form action='delete.jsp'><tr><td>abc &emsp;<input type='submit' class='delete' value='delete'></td></tr></form>");
            }
        */%>
    </table>
    </body>
</html>
        
-->
<html><head>
    <style>
        body{
      background: linear-gradient(rgb(164, 226, 241), rgba(164, 215, 228, 0.63)), url("boy_cn.jpg");
      background-size: 100% 100%;
            }
        .table{
            width:100%;
            height: 100%;
        }
        .delete{
           border-radius: 20%;
           background: rgb(164,226,241);
           padding: 0.3% 0.5%;
           cursor: pointer;
        }
        .delete:hover{
            background: aquamarine;
        }
        td{
            font-size: 20px;
        }
    </style>
    
     <script>
    function del(wishid,wish)
    {
   
    var http = new XMLHttpRequest();
   http.open("POST", "http://localhost:8084/main/wish_board_system/delete.jsp", true);
   http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   http.send("wishid="+wishid+"&"+"wish="+wish);
   http.onload = function() {
   alert(http.responseText);
   } 
   }
    </script> 
    </head>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*;" %>
<%String userid=(String)session.getAttribute("uid");
    response.setContentType("text/html");
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish","website","12345678");
    Statement stmt=con.createStatement();
    ResultSet rs1=stmt.executeQuery("select wish,wid from wishes where userid="+userid+";");
    
    String s="<table border='1'>";
    while(rs1.next()){
        s+="<form>"
                + "<tr><td name='wid'>"+rs1.getString(2)+"</td>"
                +"<td name='wish'>"+rs1.getString(1)+" </td>"+
                "<td><input type='button' class='delete' value='delete' onclick='del("+rs1.getString(2)+",\""+rs1.getString(1)+"\")' >"
                + "</td>"
                + "</tr>"
                + "</form>";
    }
    s+="</table>";
    out.println(s);
    con.close();
     }
    catch(Exception e){
        out.print(e);
    }
    %> 
    
</html>
