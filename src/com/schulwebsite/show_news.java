package com.schulwebsite;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by Marvin on 27.09.2016.
 */
@WebServlet(name = "show_news", urlPatterns = {"/a/b/c", "/servlets/news"})
public class show_news extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username="";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Cookie[] cookies = request.getCookies();

        out.println("<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Schulwebseite</title>\n" +
                "    <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n" +
                "    <link rel=\"stylesheet\" href=\"css/bootstrap-theme.css\">\n" +
                "    <script src=\"js/jquery-3.1.0.min.js\"></script>\n" +
                "    <script src=\"js/bootstrap.js\"></script>\n" +
                "</head>");
        out.println("<body>\n" +
                "<nav class=\"navbar navbar-default\">\n" +
                "    <div class=\"container-fluid\">\n" +
                "        <!-- Brand and toggle get grouped for better mobile display -->\n" +
                "        <div class=\"navbar-header\">\n" +
                "            <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\"\n" +
                "                    data-target=\"#bs-example-navbar-collapse-1\" aria-expanded=\"false\">\n" +
                "                <span class=\"sr-only\">Toggle navigation</span>\n" +
                "            </button>\n" +
                "            <a class=\"navbar-brand\" href=\"#\">Schule</a>\n" +
                "        </div>\n" +
                "        <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\n" +
                "            <ul class=\"nav navbar-nav\">\n" +
                "                <li class=\"active\"><a href=\"http://localhost\">Neuigkeiten <span class=\"sr-only\">(current)</span></a></li>\n" +
                "            </ul>");

        for (int i = 0; i < cookies.length; i++) {
            String test = cookies[i].getName();
            if(test.equals("username")){
                username = cookies[i].getValue();
            }
        }
        if(username != "")
        {
            out.println("<ul class=\"nav navbar-nav navbar-right\">\n" +
                    "                      <li class=\"dropdown\">\n" +
                    "                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" \n" +
                    "                        aria-expanded=\"false\">Welcome  "+ username +" <span class=\"caret\"></span></a>\n" +
                    "                        <ul class=\"dropdown-menu\">\n" +
                    "                        <li><a href=\"/admin\">Admin</a></li>\n" +
                    "                        <li role=\"separator\" class=\"divider\"></li>\n" +
                    "                        <li><a href=\"/logout\">Logout</a></li>\n" +
                    "                        </ul>\n" +
                    "                        </li>\n" +
                    "                  </ul>");
        }
        else{
            out.println("<ul class=\"nav navbar-nav navbar-right\">\n" +
                    "                        <li><a href=\"/login\">Login</a></li>\n" +
                    "                      </ul>");
        }

        out.println("        </div>\n" +
                "    </div>\n" +
                "</nav>");
        try {
            out.println(getNews(request.getParameter("newsid")));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        out.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    String getNews(String id) throws SQLException {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schulwebsite",
                "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        String result="";
        rs = st.executeQuery("select * from schulwebsite.news WHERE id=" +id);
        if (rs.next()) {
            result = "<div class=\"container\">\n" +
                    "  \n" +
                    "  <div class=\"text-center\">\n" +
                    " <center><img src=\" "+rs.getString("headerimage")+ "\" class=\"img-responsive\" alt=\"Responsive image\"></center>" +
                    "    <h1>"+rs.getString("header")+"</h1>\n" +
                    "    <p class=\"lead\">"+rs.getString("content")+"</p>\n" +
                    "  </div>\n" +
                    "  \n" +
                    "</div>";
            return result;
        }
        else{
            return result;
        }
    }
}
