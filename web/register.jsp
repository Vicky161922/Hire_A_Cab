<%@ page import ="java.sql.*" %>
<%
   
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","system","jatin1903");
    PreparedStatement cs=con.prepareStatement("insert into  members values(?,?,?,?,?)");
    //ResultSet rs;
    cs.setString(1,request.getParameter("fname"));
    cs.setString(2,request.getParameter("lname"));
    cs.setString(3,request.getParameter("email"));
    cs.setString(4,request.getParameter("uname"));
    cs.setString(5,request.getParameter("pass"));
    int i=cs.executeUpdate();
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome1.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("Sorry.jsp");
    }
%>