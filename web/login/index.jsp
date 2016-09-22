<%--
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
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Schule</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li><a href="http://localhost">Neuigkeiten</a></li>
          <li class="active"><a href="#">Login<span class="sr-only">(current)</span></a></li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container">
      <div class="row">
          <div class="col-md-6 col-md-offset-3">
              <div class="panel panel-login">
                  <div class="panel-heading">
                      <div class="row">
                          <div class="col-xs-6">
                              <a href="#" class="active" id="login-form-link">Login</a>
                          </div>
                          <div class="col-xs-6">
                              <a href="#" id="register-form-link">Register</a>
                          </div>
                      </div>
                      <hr>
                  </div>
                  <div class="panel-body">
                      <div class="row">
                          <div class="col-lg-12">
                              <form id="login-form" action="/login/login.jsp" method="post" role="form" style="display: block;">
                                  <div class="form-group">
                                      <input type="text" name="lusername" id="lusername" tabindex="1" class="form-control" placeholder="Username" value="">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" name="lpassword" id="lpassword" tabindex="2" class="form-control" placeholder="Password">
                                  </div>
                                  <div class="form-group text-center">
                                      <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                      <label for="remember"> Remember Me</label>
                                  </div>
                                  <div class="form-group">
                                      <div class="row">
                                          <div class="col-sm-6 col-sm-offset-3">
                                              <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                          </div>
                                      </div>
                                  </div>
                              </form>
                              <form id="register-form" action="/login/register.jsp" method="post" role="form" style="display: none;">
                                  <div class="form-group">
                                      <input type="text" name="rusername" id="rusername" tabindex="1" class="form-control" placeholder="Username" value="">
                                  </div>
                                  <div class="form-group">
                                      <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" name="rpassword" id="rpassword" tabindex="2" class="form-control" placeholder="Password">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
                                  </div>
                                  <div class="form-group">
                                      <div class="row">
                                          <div class="col-sm-6 col-sm-offset-3">
                                              <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
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
