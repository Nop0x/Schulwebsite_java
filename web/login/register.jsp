<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("rusername");
    String pwd = request.getParameter("rpassword");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schulwebsite",
            "root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into schulwebsite.users(email, username, password) values ('"+ email + "','" + user + "','" + pwd + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        Cookie username = new Cookie("username",
                request.getParameter("rusername"));
        username.setMaxAge(60*60*24);
        username.setPath("/");
        username.setDomain("localhost");
        response.addCookie(username);
        response.sendRedirect("http://localhost/");
        // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>