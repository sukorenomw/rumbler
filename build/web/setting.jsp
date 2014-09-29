<%-- 
    Document   : setting
    Created on : Sep 29, 2014, 11:46:42 AM
    Author     : smw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Rumbler</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="assets/css/foundation-icons.css" />
        <link rel="stylesheet" href="assets/css/foundation.css" />
        <link rel="stylesheet" href="assets/css/custom.css" />
        <link rel="stylesheet" href="assets/css/datepicker.css" />
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />

        <!--<link rel="stylesheet" href="assets/css/normalize.css" />-->

        <script src="assets/js/vendor/modernizr.js"></script>
    </head>
    <body class="timeline-page">
        <jsp:include flush="true" page="header.jsp" />
        <div class="row mainbg radius">
            <aside>
                <div class="large-2 right">
                    <p>Settings</p>
                    <hr/>
                    <a href="#"><img class="radius left" src="http://placehold.it/48x48&text=[img]"/>
                        <p class="left blogname">blognamehere </p>
                        <span class="left"><i class="fi-plus size-28"></i></span></a>
                    <hr class="hr-child"/>
                    <a href="#"><img class="radius left" src="http://placehold.it/48x48&text=[img]"/>
                        <p class="left blogname">blognamehere </p>
                        <span class="left"><i class="fi-plus size-28"></i></span></a>
                    <hr class="hr-child"/>
                    <a href="#"><img class="radius left" src="http://placehold.it/48x48&text=[img]"/>
                        <p class="left blogname">blognamehere </p>
                        <span class="left"><i class="fi-plus size-28"></i></span></a>
                    <hr class="hr-child"/>
                    <a href="#"><img class="radius left" src="http://placehold.it/48x48&text=[img]"/>
                        <p class="left blogname">blognamehere </p>
                        <span class="left"><i class="fi-plus size-28"></i></span></a>
                    <hr class="hr-child"/>
                </div>
            </aside>
            <!--<div class="row" >-->
            <div class="large-9 panel radius">
                <h3 class="title">Account</h3>
                <hr/>
                <form>
                    <div class="row">
                        <div class="small-8">
                            <div class="row">
                                <div class="small-3 columns">
                                    <label for="right-label" class="right" style="font-weight: bold;">Email</label>
                                </div>
                                <div class="small-9 push-1 columns">
                                    <input type="text" id="right-label" class="radius" placeholder="youremail@domain">
                                </div>
                            </div>
                        </div>
                        <div class="switch round tiny push-3 left">
                            <input id="emailSwitch" name="emailSwitch" type="checkbox">
                            <label for="emailSwitch"></label>
                        </div>
                        <p class=" push-3 left size-12">Let people see my email</p>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="small-8">
                            <div class="row">
                                <div class="small-3 columns">
                                    <label for="right-label" class="right" style="font-weight: bold;">Password</label>
                                </div>
                                <div class="small-9 push-1 columns">
                                    <input type="password" id="right-label" class="radius" placeholder="********">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="small-8">
                            <div class="row">
                                <div class="small-3 columns">
                                    <label for="right-label" class="right" style="font-weight: bold;">Real Name</label>
                                </div>
                                <div class="small-9 push-1 columns">
                                    <input type="text" id="right-label" class="radius" placeholder="Your Name Here">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="small-8">
                            <div class="row">
                                <div class="small-3 columns">
                                    <label for="right-label" class="right" style="font-weight: bold;">Blog Title</label>
                                </div>
                                <div class="small-9 push-1 columns">
                                    <input type="text" id="right-label" class="radius" placeholder="Your Blog name Here">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="small-8">
                            <div class="row">
                                <div class="small-3 columns">
                                    <label for="right-label" class="right" style="font-weight: bold;">Birthday</label>
                                </div>
                                <div class="small-9 push-1 columns">
                                     <input type="date" id="datepicker">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            <!--</div>-->
        </div>
        <a href="#" class="button totop radius"><i class="fi-arrow-up size-48"></i></a>
            <jsp:include flush="true" page="function/addComment.jsp"></jsp:include>
        <script src="assets/js/vendor/jquery.js"></script>
        <script src="assets/js/foundation.min.js"></script>
        <script src="assets/js/datepicker.js"></script>
        <script>
            var picker = new Pikaday({field: document.getElementById('datepicker')});
        </script>
        <script src="assets/js/script.js"></script>

    </body>
</html>
