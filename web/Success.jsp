<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <h1>Booking Success full!!</h1>
        <div>
            <table>
                <tr>
                    <td><font size="5" >
                        Booking Details
                    </td>
                </tr><br>
                    <tr>
                        <td>
                            Booking Id:
                        </td>
                        <td>
                            <div id="bkngid" >
                                <%
                                    %>
                                    
                    </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Booking Time:
                        </td>
                        <td>
                            <div id="time" ></div>
                        </td>
                    </tr>
            </table>
        </div>
        <script language="javascript">
 var currentdate = new Date();
var datetime = currentdate.getDay() + "/"+currentdate.getMonth() 
+ "/" + currentdate.getFullYear() + " @ " 
+ currentdate.getHours() + ":" 
+ currentdate.getMinutes() + ":" + currentdate.getSeconds();
 
 document.getElementById("time").innerHTML=datetime;
 
 var d=userid;
     </script>
        
    </body>
</html>
