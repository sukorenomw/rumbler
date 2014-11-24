<%-- 
    Document   : login
    Created on : Sep 19, 2014, 9:40:18 PM
    Author     : smw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/foundation-icons.css" />
        <link rel="stylesheet" href="assets/css/foundation.css" />
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />

        <!--<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/css/foundation.css" />-->
        <link rel="stylesheet" href="assets/css/custom.css" />
        <script src="assets/js/vendor/modernizr.js"></script>
    </head>
    <body class="login-page">
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            if (session.getAttribute("user") != null) {
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "index.jsp");
            }
        %>
        <div class="jarak2"></div>
        <h1 class="text-center titel size-56">rumbler.</h1>
        <% String userVal = ""; %>
        <% if (request.getAttribute("login") != null && request.getAttribute("login").equals("failed")) { %>
        <% userVal = (String) request.getAttribute("userVal"); %>
        <div data-alert class="row alert-box info radius large-3">
            Username or Password is wrong!
            <a href="#" class="close">&times;</a>
        </div>
        <% }%>
        <form class="form-2" action="ServLogin" method="post">
            <h1><span class="log-in">Log in</span> or <span class="sign-up">sign up</span></h1>
            <p class="float">
                <label for="login"><i class="fi-mail size-12"></i>Username</label>
                <input type="text" name="login" placeholder="Username or Email" value="<%= userVal%>">
            </p>
            <p class="float">
                <label for="password"><i class="fi-lock size-12"></i>Password</label>
                <input type="password" name="password" placeholder="Password" class="showpassword">
            </p>
            <p class="clearfix">
                <input type="submit" name="submit" value="Log in">
            </p>
        </form>
        <a href="signup.jsp" class="button transparan radius">SIGN UP</a>
        <script src="assets/js/vendor/jquery.js"></script>
        <script src="assets/js/foundation.min.js"></script>

        <script src="assets/js/uploadjs/jquery.knob.js"></script>
        <script src="assets/js/uploadjs/jquery.ui.widget.js"></script>
        <script src="assets/js/uploadjs/jquery.iframe-transport.js"></script>
        <script src="assets/js/uploadjs/jquery.fileupload.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>
