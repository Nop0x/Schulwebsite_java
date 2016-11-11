package com.schulwebsite;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;

/**
 * Created by Marvin on 11.11.2016.
 * JAVA BEAN
 */
public class nav implements Serializable {
    private String _toggle;

    public String get_toggle() {
        return _toggle;
    }

    public void set_toggle(String _toggle) {
        this._toggle = _toggle;
    }

    public nav()
    {
        _toggle = "news";
    }

    public String getNav(HttpServletRequest request)
    {
        String output = "<div class=\"container-fluid\">\n" +
                "        <!-- Brand and toggle get grouped for better mobile display -->\n" +
                "        <div class=\"navbar-header\">\n" +
                "            <button type=\"button\" class=\"navbar-toggle collapse\" data-toggle=\"collapse\"\n" +
                "                    data-target=\"#bs-example-navbar-collapse-1\" aria-expanded=\"false\">\n" +
                "                <span class=\"sr-only\">Toggle navigation</span>\n" +
                "            </button>\n" +
                "            <a class=\"navbar-brand\" href=\"#\"><svg style='width: 35px; height: 32px; padding-bottom: 5px;' " +
                "           xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 68 65\">\n" +
                "        <path fill=\"#1A374D\"\n" +
                "              d=\"M42 27v-20c0-3.7-3.3-7-7-7s-7 3.3-7 7v21l12 15-7\n" +
                "              15.7c14.5 13.9 35 2.8 35-13.7 0-13.3-13.4-21.8-26-18zm6 25c-3.9 0-7-3.1-7-7s3.1-7 7-7 7 3.1 7 7-3.1 7-7 7z\"/>\n" +
                "        <path\n" +
                "            d=\"M14 27v-20c0-3.7-3.3-7-7-7s-7 3.3-7 7v41c0 8.2 9.2 17 20 17s20-9.2 20-20c0-13.3-13.4-21.8-26-18zm6\n" +
                "            25c-3.9 0-7-3.1-7-7s3.1-7 7-7 7 3.1 7 7-3.1 7-7 7z\"/>\n" +
                "    </svg> ";
        output += "</a>\n" +
                "        </div>\n" +
                "        <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\n" +
                "            <ul class=\"nav navbar-nav\">\n" +
                "            ";
        switch (_toggle){
            case "news":
                output += "<li class=\"active\"><a href=\"/\">Neuigkeiten <span class=\"sr-only\">(current)</span></a></li>\n" +
                        "  <li class=\"\"><a href=\"/classes/classesoverview.php\">Stundenplan<span class=\"sr-only\">(current)</span></a></li>\n" +
                        "  <li class=\"\"><a href=\"/roomplan\">Raumplan<span class=\"sr-only\">(current)</span></a></li>";
                break;
            case "classes":
                output += "<li class=\"\"><a href=\"/\">Neuigkeiten <span class=\"sr-only\">(current)</span></a></li>\n" +
                        "  <li class=\"active\"><a href=\"/classes/classesoverview.php\">Stundenplan<span class=\"sr-only\">(current)</span></a></li>\n" +
                        "  <li class=\"\"><a href=\"/roomplan\">Raumplan<span class=\"sr-only\">(current)</span></a></li>";
                break;
            case "room":
                output += "<li class=\"\"><a href=\"/\">Neuigkeiten <span class=\"sr-only\">(current)</span></a></li>\n" +
                        "  <li class=\"\"><a href=\"/classes/classesoverview.php\">Stundenplan<span class=\"sr-only\">(current)</span></a></li>\n" +
                        "  <li class=\"active\"><a href=\"/roomplan/\">Raumplan<span class=\"sr-only\">(current)</span></a></li>";
                break;
            default:
                output += "<li class=\"\"><a href=\"/\">Neuigkeiten <span class=\"sr-only\">(current)</span></a></li>\n" +
                        "  <li class=\"\"><a href=\"/classes/classesoverview.php\">Stundenplan<span class=\"sr-only\">(current)</span></a></li>\n" +
                        "  <li class=\"\"><a href=\"/roomplan/\">Raumplan<span class=\"sr-only\">(current)</span></a></li>";
                break;
        }
        output += "</ul>";
        Cookie[] cookies = request.getCookies();
        String username="";
        try
        {
            for (int i = 0; i < cookies.length; i++) {
                String test;
                test = cookies[i].getName();
                if(test.equals("username")){
                    username = cookies[i].getValue();
                }
            }
        }
        catch (Exception ex)
        {
        }
        if(username != "")
        {
            output+=("<ul class=\"nav navbar-nav navbar-right\">\n" +
                    "                      <li class=\"dropdown\">\n" +
                    "                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" \n" +
                    "                        aria-expanded=\"false\">Welcome  "+ username +" <span class=\"caret\"></span></a>\n" +
                    "                        <ul class=\"dropdown-menu\">\n" +
                    "                        <li><a href=\"/admin\">Admin</a></li>\n" +
                    "                        <li role=\"separator\" class=\"divider\"></li>\n" +
                    "                        <li><a href=\"/logout.php\">Logout</a></li>\n" +
                    "                        </ul>\n" +
                    "                        </li>\n" +
                    "                  </ul>");
        }
        else{
            if(_toggle == "login")
            {
                output+=("<ul class=\"nav navbar-nav navbar-right\">\n" +
                        "                        <li class=\"active\"><a href=\"/login\">Login</a></li>\n" +
                        "                      </ul>");
            }
            else
            {
                output+=("<ul class=\"nav navbar-nav navbar-right\">\n" +
                        "                        <li><a href=\"/login\">Login</a></li>\n" +
                        "                      </ul>");
            }
        }
        output+=("        </div>\n" +
                "    </div>\n");
        return output;
    }
}
