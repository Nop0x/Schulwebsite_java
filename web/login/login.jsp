<%--
  Created by IntelliJ IDEA.
  User: Marvin
  Date: 22.09.2016
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import ="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.*" %>
<%
    String userid = request.getParameter("lusername");
    String pwd = request.getParameter("lpassword");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schulwebsite",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    String hashed = BCrypt.hashpw(pwd, BCrypt.gensalt());
    rs = st.executeQuery("select * from schulwebsite.users where username='" + userid+"'");
    if (rs.next()) {
        String db_pw = rs.getString("password");
        if(BCrypt.checkpw(pwd, db_pw))
        {Cookie username = new Cookie("username",
                    request.getParameter("lusername"));
            username.setMaxAge(60*60*24);
            username.setPath("/");
            username.setDomain("localhost");
            response.addCookie(username);
            response.sendRedirect("http://localhost/");
        }
    } else {
        HttpSession sess = request.getSession();
        sess.setAttribute("wrongpw", "1");
        response.sendRedirect("http://localhost/login");
    }
%>
