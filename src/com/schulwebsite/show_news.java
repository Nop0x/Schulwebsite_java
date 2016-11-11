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
        out.println("<body>\n<nav class=\"navbar navbar-default\">");
        nav navi = new nav();
        navi.set_toggle("news");
        out.println(navi.getNav(request));
        out.println("</nav>");

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
            result = ("<div class=\"container\">\n" +
                    "  \n" +
                    "  <div class=\"text-center\">\n");
            if(!(rs.getString("headerimage").equals("")))
            {
                result += "<center><img src=\" "+rs.getString("headerimage")+ "\" class=\"img-responsive\" alt=\"Responsive image\"></center>";
            }
            else
            {
                result += "<center><img src=/img/default.png class=\"img-responsive\" alt=\"Responsive image\"></center>";
            }

            result += "    <h1>"+rs.getString("header")+"</h1>\n" +
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
