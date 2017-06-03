<%@ page import ="java.sql.*" %>
<%
    
    Class.forName("oracle.jdbc.OracleDriver");
        Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","system","jatin1903");
        String user = request.getParameter("uname");
        String pass1 = request.getParameter("pass");
        PreparedStatement ps=con.prepareStatement("select * from members where uname=? and pass=?");
        ps.setString(1,user);
        ps.setString(2,pass1);
        ResultSet rs=ps.executeQuery();

    if (rs.next()) {
        session.setAttribute("userid", user);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("newjsp1.jsp");
    } else {
        out.println("Invalid password <a href='Login.jsp'>try again</a>");
    }
%>