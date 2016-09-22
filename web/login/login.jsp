<%--
  Created by IntelliJ IDEA.
  User: Marvin
  Date: 22.09.2016
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("lusername");
    String pwd = request.getParameter("lpassword");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schulwebsite",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from schulwebsite.users where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        Cookie username = new Cookie("username",
                request.getParameter("lusername"));
        username.setMaxAge(60*60*24);
        username.setPath("/");
        username.setDomain("localhost");
        response.addCookie(username);
        response.sendRedirect("http://localhost/");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
