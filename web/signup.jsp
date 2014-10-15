<%-- 
    Document   : signup
    Created on : Sep 19, 2014, 9:41:00 PM
    Author     : smw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/foundation-icons.css" />
        <link rel="stylesheet" href="assets/css/foundation.css" />
        <link rel="stylesheet" href="assets/css/custom.css" />
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />

        <script src="assets/js/vendor/modernizr.js"></script>
    </head>
    <body class="sign-up-page">
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <div class="jarak3"></div>
        <h1 class="text-center titel size-56">rumbler.</h1>
        <div class="sign-up-desc"><p class="text-center" style="color:white;">Follow the blogs you've been hearing about.
                Share the things you love.</p></div>
        <form class="form-2" method="post" action="ServSignUp" data-abide>
            <h1><span class="sign-up">sign up</span></h1>
            <div>
                <input type="email" name="email" placeholder="Email" required pattern="email">
                <small class="error">A valid email address is required.</small>
            </div>
            <div>
                <input type="password" name="password" id="password" placeholder="Password" class="showpassword" required pattern="alpha_numeric">
                <small class="error">Password must contain at least 8 character and Uppercase.</small>
            </div>
            <div>
                <input type="password" name="cpassword" placeholder="Confirm Password" class="showpassword" required pattern="alpha_numeric" data-equalto="password">
                <small class="error">Password doesn't match.</small>
            </div>
            <div>
                <input type="text" name="username" placeholder="Username" required pattern="alpha_numeric">
                <small class="error">You must provide a username.</small>
            </div>
            <p class="clearfix">
                <input type="submit" name="submit" value="Sign Up">
            </p>
        </form>
        <a href="login.jsp" class="button transparan radius">LOG IN</a>
        <script src="assets/js/vendor/jquery.js"></script>
        <script src="assets/js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>
    </body>
</html>

