<!DOCTYPE html>
<html lang="en">
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*;" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Timeline</title>
    <%! String time,date,receiverid,respond;%>
    <%! int n,i,i1;ResultSet rs1;%>
    <script>
    function take(receiverid)
    {
//        today=new Date();
//        time = (today.getHours()) + ":" + (today.getMinutes()) + ":" + (today.getSeconds());
//        date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        respond=prompt("give your responce","ya i am also interested in it..");
        if(respond == null)
        {
            return false;
        }
        else
        {
             var http = new XMLHttpRequest();
            http.open("POST", "http://localhost:8084/main/wish_board_system/saveresponse.jsp", true);
            http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            http.send("respond="+respond+"&"+"receiverid="+receiverid);
            http.onload = function() {
            alert(http.responseText);
            }
            
    }
    }
        </script>
    <style>
        table{
            width: 100%;
            margin-top:0%;
            font-weight:bold;
            font-style:oblique;
            color:ghostwhite;
            font-size:large;
        }

    .jsbutton{
        background-color:#59798d;
        text-align: center;
        cursor: pointer;
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
      <!--body will come from jsp tag -->  
    </table>
<%
  String wish=request.getParameter("wish");
  //data base connection
    response.setContentType("text/html");
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wish","website","12345678");
    Statement stmt=con.createStatement();
    ResultSet rs1=stmt.executeQuery("select wish,userid from wishes;");
    
    String s="<table border='1'>";
    while(rs1.next()){
        s+="<tr>";
        //data
        s+="<td>"+rs1.getString(2)+"</td>"+
            "<td>"+rs1.getString(1)+"</td>"+
            "<td>"+"<button onclick='take(\"" + rs1.getString(2) + "\")' name='jsbutton' value='Respond'>Respond</button>"+"</td>";
        s+="</tr>";
    }//\'' + result.name + '\'   ;;rs1.getString(2)
    s+="</table>";
    out.println(s);
     }
    catch(Exception e){
        out.print(e);
    }
    %>   
</body>
</html>