<%-- 
    Document   : setting
    Created on : Sep 29, 2014, 11:46:42 AM
    Author     : smw
--%>

<%@page import="java.util.List"%>
<%@page import="model.Users"%>
<%@page import="controller.ModelStatic"%>
<%@page import="controller.DatabaseController"%>
<%@page import="org.hibernate.SessionFactory"%>
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
        <%
            if (session.getAttribute("user") == null) {
                String site = new String("login.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
        %>
        <jsp:include flush="true" page="header.jsp" />
        <%!
            DatabaseController dbc = new DatabaseController();
            SessionFactory factory;
        %>
        <%
            DatabaseController dbc = new DatabaseController();
            try {
                factory = util.HibernateUtil.getSessionFactory();
            } catch (Throwable ex) {
                System.err.println("Failed to create sessionFactory object." + ex);
                throw new ExceptionInInitializerError(ex);
            }
            dbc.updateModelStatic(ModelStatic.useRumbler.getUsername());
        %>
        <div class="row mainbg radius">
            <div class="large-9 columns">
                <div class="row" >
                    <div class="large-11 panel radius">
                        <div id='generalSetting'>
                            <h3 class="title">Account</h3>
                            <hr/>
                            <form action="settingGeneral">
                                <div class="row">
                                    <div class="small-8">
                                        <div class="row">
                                            <div class="small-3 columns">
                                                <label for="right-label" class="right" style="font-weight: bold;">Profil Picture</label>
                                            </div>
                                            <div class="small-5 pull-3 columns">
                                                <div class="columns profpict"><img class="radius" src="<%= controller.ModelStatic.useRumbler.getPicturePath()%>"/></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="small-8">
                                        <div class="row">
                                            <div class="small-3 columns">
                                                <label for="right-label" class="right" style="font-weight: bold;">Email</label>
                                            </div>
                                            <div class="small-9 push-1 columns">
                                                <input type="text" id="right-label" class="radius" placeholder="Email" value="<%= ModelStatic.useRumbler.getEmail() %>">
                                            </div>
                                        </div>
                                    </div>
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
                                                <input type="text" id="right-label" class="radius" placeholder="Your Name Here" value="<%= ModelStatic.useRumbler.getName() %>">
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
                                                <input type="text" id="right-label" class="radius" placeholder="Blog name" value="<%= ModelStatic.useRumbler.getBlogTitle() %>">
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
                                                <input type="date" id="datepicker" placeholder="Pick a Date">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="push-1 small-3">
                                        <input type="submit" class="button small radius" value="save" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id='privacySetting'>
                            <h3 class="title">Privacy</h3>
                            <p class="size-12">This setting let people see or not your detail</p>
                            <hr/>
                            <form>
                                <div class="row">
                                    <div class="small-8">
                                        <div class="row">
                                            <div class="small-3 columns">
                                                <label for="right-label" class="right" style="font-weight: bold;">Email</label>
                                            </div>
                                            <p class="left size-14 push-1">example@example.com</p>
                                            <div class="switch round tiny right">
                                                <input id="emailSwitchPrivacy" name="emailSwitchPrivacy" type="checkbox">
                                                <label for="emailSwitchPrivacy"></label>
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
                                            <p class="left size-14 push-1">Sukoreno Mukti</p>
                                            <div class="switch round tiny right">
                                                <input id="nameSwitchPrivacy" name="nameSwitchPrivacy" type="checkbox">
                                                <label for="nameSwitchPrivacy"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="small-8">
                                        <div class="row">
                                            <div class="small-3 columns">
                                                <label for="right-label" class="right" style="font-weight: bold;">Username</label>
                                            </div>
                                            <p class="left size-14 push-1">smw94flynn</p>
                                            <div class="switch round tiny right">
                                                <input id="usrnameSwitchPrivacy" name="usrnameSwitchPrivacy" type="checkbox">
                                                <label for="usrnameSwitchPrivacy"></label>
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
                                            <p class="left size-14 push-1">26 February 1994</p>
                                            <div class="switch round tiny right">
                                                <input id="bdSwitchPrivacy" name="bdSwitchPrivacy" type="checkbox">
                                                <label for="bdSwitchPrivacy"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="push-1 small-3">
                                        <input type="submit" class="button small radius" value="save" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id='notifSetting'>
                            <h3 class="title">Notification</h3>
                            <p class="size-12">This setting set your notification on or off</p>
                            <hr/>
                            <form>
                                <div class="row">
                                    <div class="small-8">
                                        <div class="row">
                                            <p class="left size-14 push-1">Likes from followers</p>
                                            <div class="switch round tiny right">
                                                <input id="likesNotif" name="likesNotif" type="checkbox">
                                                <label for="likesNotif"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="small-8">
                                        <div class="row">
                                            <p class="left size-14 push-1">Comments of your posts</p>
                                            <div class="switch round tiny right">
                                                <input id="commentsNotif" name="commentsNotif" type="checkbox">
                                                <label for="commentsNotif"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="small-8">
                                        <div class="row">
                                            <p class="left size-14 push-1">New followers</p>
                                            <div class="switch round tiny right">
                                                <input id="followerNotif" name="followerNotif" type="checkbox">
                                                <label for="followerNotif"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="push-1 small-3">
                                        <input type="submit" class="button small radius" value="save" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="large-3 columns">
                <aside>
                    <div class="large-2 columns right">
                        <p>Settings</p>
                        <hr/>
                        <a href="#" id='generalSettingBtn'>
                            <p class="left blogname">General Settings </p>
                            <span class="left"><i class="fi-widget size-28"></i></span></a>
                        <hr class="hr-child"/>
                        <a href="#" id='privacySettingBtn'>
                            <p class="left blogname">Privacy Settings </p>
                            <span class="left"><i class="fi-widget size-28"></i></span></a>
                        <hr class="hr-child"/>
                        <a href="#" id='notifSettingBtn'>
                            <p class="left blogname">Notification Settings </p>
                            <span class="left"><i class="fi-widget size-28"></i></span></a>
                        <hr class="hr-child"/>
                    </div>
                </aside>
            </div>
        </div>
        <a href="#" class="button totop radius"><i class="fi-arrow-up size-48"></i></a>
            <jsp:include flush="true" page="function/addComment.jsp"></jsp:include>
        <script src="assets/js/vendor/jquery.js"></script>
        <script src="assets/js/ajaxupload.js"></script>
        <script src="assets/js/foundation.min.js"></script>
        <script src="assets/js/datepicker.js"></script>
        <script>
            var picker = new Pikaday({field: document.getElementById('datepicker')});
        </script>
        <script src="assets/js/script.js"></script>
        <script src="assets/js/uploadjs/jquery.knob.js"></script>
        <script src="assets/js/uploadjs/jquery.ui.widget.js"></script>
        <script src="assets/js/uploadjs/jquery.iframe-transport.js"></script>
        <script src="assets/js/uploadjs/jquery.fileupload.js"></script>
    </body>
</html>
