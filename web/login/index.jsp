<%@ page import="com.schulwebsite.nav" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Marvin
  Date: 20.09.2016
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Schulwebseite</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/bootstrap-theme.css">
    <link rel="stylesheet" href="../css/custom.css">
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/custom.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
<%
    nav navi = new nav();
    navi.set_toggle("login");
    out.println(navi.getNav(request));
%>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <%
                            HttpSession sess = request.getSession(false);
                            String user = "";
                            String email = "";
                            if(sess.getAttribute("username") != null && sess.getAttribute("email") != null)
                            {
                                user = String.valueOf(sess.getAttribute("username"));
                                email = String.valueOf(sess.getAttribute("email"));
                            }
                            if (sess.getAttribute("state") == "register") {
                        %>
                        <div class="col-xs-6">
                            <a href="#" id="login-form-link">Login</a>
                        </div>
                        <div class="col-xs-6">
                            <a href="#" class="active" id="register-form-link">Register</a>
                        </div>
                        <%
                        } else {
                        %>
                        <div class="col-xs-6">
                            <a href="#" class="active" id="login-form-link">Login</a>
                        </div>
                        <div class="col-xs-6">
                            <a href="#" id="register-form-link">Register</a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <%
                                if (sess.getAttribute("state") == "register") {
                            %>
                            <form id="login-form" action="/login/login.jsp" method="post" role="form"
                                  style="display: none;">
                                    <%
                                        }
                                        else {
                                            %>
                                <form id="login-form" action="/login/login.jsp" method="post" role="form"
                                      style="display: block;">
                                    <%
                                        }
                                    %>
                                    <%
                                        if (sess.getAttribute("wrongpw") == "1") {
                                            sess.removeAttribute("wrongpw");
                                    %>
                                    <div class="alert alert-danger" role="alert">Wrong Password! Please try again!</div>
                                    <%
                                        }
                                    %>
                                    <div class="form-group">
                                        <input type="text" name="lusername" id="lusername" tabindex="1"
                                               class="form-control" placeholder="Username" value="" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="lpassword" id="lpassword" tabindex="2"
                                               class="form-control" placeholder="Password" required>
                                    </div>
                                    <div class="form-group text-center">
                                        <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                        <label for="remember"> Remember Me</label>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <input type="submit" name="login-submit" id="login-submit" tabindex="4"
                                                       class="form-control btn btn-login" value="Log In">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                    <%
                                if (sess.getAttribute("state") == "register") {
                            %>
                                <form id="register-form" action="/login/register.jsp" method="post" role="form"
                                      style="display: block;">
                                        <%
                                        }
                                        else {
                                            %>
                                    <form id="register-form" action="/login/register.jsp" method="post" role="form"
                                          style="display: none;">
                                        <%
                                            }
                                        %>

                                        <%
                                            if (sess.getAttribute("problem") == "userexist") {
                                        %>
                                        <div class="alert alert-danger" role="alert">
                                            <span class="glyphicon glyphicon-exclamation-sign"
                                                  aria-hidden="true"></span>
                                            <span class="sr-only">Error:</span>
                                            Es existiert bereits ein Nutzer mit diesem Namen!
                                        </div>
                                        <%
                                            }
                                            else if (sess.getAttribute("problem") == "pwdmatch")
                                            {
                                        %>
                                        <div class="alert alert-danger" role="alert">
                                            <span class="glyphicon glyphicon-exclamation-sign"
                                                  aria-hidden="true"></span>
                                            <span class="sr-only">Error:</span>
                                            Die Passwörter stimmen nicht überein!
                                        </div>
                                        <%
                                            }else if (sess.getAttribute("problem") == "emailexist")
                                            {
                                        %>
                                        <div class="alert alert-danger" role="alert">
                                            <span class="glyphicon glyphicon-exclamation-sign"
                                                  aria-hidden="true"></span>
                                            <span class="sr-only">Error:</span>
                                            Es existiert bereits ein Konto unter dieser eMail Adresse!
                                        </div>
                                        <%
                                            }
                                        %>
                                        <div class="form-group">
                                            <input type="text" name="rusername" id="rusername" tabindex="1"
                                                   class="form-control" placeholder="Username" value="<%=user%>" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="email" id="email" tabindex="1"
                                                   class="form-control" placeholder="Email Address" value="<%=email%>" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="rpassword" id="rpassword" tabindex="2"
                                                   class="form-control" placeholder="Password" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="rpassword-confirm" id="rpassword-confirm"
                                                   tabindex="2" class="form-control" placeholder="Confirm Password" required>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="register-submit" id="register-submit"
                                                           tabindex="4" class="form-control btn btn-register"
                                                           value="Register Now">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
