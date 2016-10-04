<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.*" %>
<%
    String user = request.getParameter("rusername");
    String pwd = request.getParameter("rpassword");
    String conpwd = request.getParameter("rpassword-confirm");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schulwebsite",
            "root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
    if (!(pwd.equals(conpwd))) {
        HttpSession sess = request.getSession();
        sess.setAttribute("state", "register");
        sess.setAttribute("problem", "pwdmatch");
        sess.setAttribute("username", user);
        sess.setAttribute("email", email);
        response.sendRedirect("http://localhost/login");
    } else {
        ResultSet rs;
        rs = st.executeQuery("select * from schulwebsite.users where username='" + user + "'");
        if (rs.next()) {
            HttpSession sess = request.getSession();
            sess.setAttribute("state", "register");
            sess.setAttribute("problem", "userexist");
            sess.setAttribute("username", user);
            sess.setAttribute("email", email);
            response.sendRedirect("http://localhost/login");
        } else {
            rs = st.executeQuery("select * from schulwebsite.users where email='" + email + "'");
            if (rs.next()) {
                HttpSession sess = request.getSession();
                sess.setAttribute("state", "register");
                sess.setAttribute("problem", "emailexist");
                sess.setAttribute("username", user);
                sess.setAttribute("email", email);
                response.sendRedirect("http://localhost/login");
            } else {
                String hashed = BCrypt.hashpw(pwd, BCrypt.gensalt());
                int i = st.executeUpdate("insert into schulwebsite.users(email, username, password) values ('" + email + "','" + user + "','" + hashed + "')");
                if (i > 0) {
                    //session.setAttribute("userid", user);
                    Cookie username = new Cookie("username",
                            request.getParameter("rusername"));
                    username.setMaxAge(60 * 60 * 24);
                    username.setPath("/");
                    username.setDomain("localhost");
                    response.addCookie(username);
                    response.sendRedirect("http://localhost/");
                    // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
                } else {
                    response.sendRedirect("index.jsp");
                }
            }

        }
    }
%>