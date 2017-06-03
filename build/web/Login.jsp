<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="image/bootstrap.min.css">
    </head>
    <body>
        <form action="Login1.jsp" method="post">
            <table class="table table-condensed" border="0" align="center" cellpadding="10"
                cellspacing="10" bgcolor="lightblue">
                <tr>
                    <td><font size="4" color="blue">
                        Login to Book a Cab
                    </td>
                </tr><br>
                <tr>
                    <td>
                        User Name
                    </td>
                    <td>
                        <input class="form-control" type="text" name="uname">
                    </td></tr>
                <tr><td>
                        Password
                    </td>
                    <td>
                        <input class="form-control" type="password" name="pass">
                    </td>
                </tr>
                 <tr>
                    <td colspan="4" align="center">
                        <input class="btn btn-success" type="submit" value="Submit">
                    </td>
                </tr>
                <tr><td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Not Register Yet?
                    <a href="reg.jsp" value="Register Here" > Register Here</a></td>
                </tr>
            </table>
        </form>
        <script src="image/jquery.min.js"></script>
       <script src="image/bootstrap.min.js"></script> 
    </body>
</html>
           </body>
</html>
