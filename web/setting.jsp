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
                            <form action="settingGeneral" method="post">
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
                                                <input type="text" id="right-label" class="radius" name="email" placeholder="Email" value="<%= ModelStatic.useRumbler.getEmail()%>">
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
                                                <input type="password" id="right-label" class="radius" name="password" placeholder="********">
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
                                                <input type="text" id="right-label" class="radius" name="name" placeholder="Your Name Here" value="<%= ModelStatic.useRumbler.getName()%>">
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
                                                <input type="text" id="right-label" class="radius" name="blog" placeholder="Blog name" value="<%= ModelStatic.useRumbler.getBlogTitle() %>">
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
                                                <input type="date" id="datepicker" name="date" placeholder="<%= ModelStatic.useRumbler.getBirthday().toString() %>">
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
                        <div id='privacySetting' style="display: none;">
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
                                            <p class="left size-14 push-1"><%= ModelStatic.useRumbler.getEmail() %></p>
                                            <div class="switch round tiny right">
                                                <input id="emailSwitchPrivacy" name="emailSwitchPrivacy" type="checkbox" checked="<%= ModelStatic.useRumbler.getSettings().getEmail() %>">
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
                                            <p class="left size-14 push-1"><%= ModelStatic.useRumbler.getName() %></p>
                                            <div class="switch round tiny right">
                                                <input id="nameSwitchPrivacy" name="nameSwitchPrivacy" type="checkbox" checked="<%= ModelStatic.useRumbler.getSettings().getRealname() %>">
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
                                            <p class="left size-14 push-1"><%= ModelStatic.useRumbler.getUsername() %></p>
                                            <div class="switch round tiny right">
                                                <input id="usrnameSwitchPrivacy" name="usrnameSwitchPrivacy" type="checkbox" checked="<%= ModelStatic.useRumbler.getSettings().getUsername() %>">
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
                                            <p class="left size-14 push-1"><%= ModelStatic.useRumbler.getBirthday().toString() %></p>
                                            <div class="switch round tiny right">
                                                <input id="bdSwitchPrivacy" name="bdSwitchPrivacy" type="checkbox" checked="<%= ModelStatic.useRumbler.getSettings().getBirthday() %>">
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
                        <div id='notifSetting' style="display: none;">
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
                        <div id='myFollower' style="display: none;">
                            <h3 class="title">Followers</h3>
                            <p class="size-12">The lists of your followers</p>
                            <hr/>
                            <div class="row">
                                <div class="small-8">
                                    <div class="row">
                                        <div class="small-5 push-1 columns">
                                            <div class="columns profpict"><img class="radius" src="<%= controller.ModelStatic.useRumbler.getPicturePath()%>"/></div>
                                        </div>
                                        <div class="small-3 pull-5 columns">
                                            <p><a href="#">nama orang</a></p>
                                            <a href="#" class="unfollow"><span class="label radius success medium">Following</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <div class="row">
                                <div class="small-8">
                                    <div class="row">
                                        <div class="small-5 push-1 columns">
                                            <div class="columns profpict"><img class="radius" src="<%= controller.ModelStatic.useRumbler.getPicturePath()%>"/></div>
                                        </div>
                                        <div class="small-3 pull-5 columns">
                                            <p><a href="#">nama orang</a></p>
                                            <a href="#" class="unfollow"><span class="label radius success medium">Following</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
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
                            <span class="left"><i class="fi-widget size-28"></i></span></a>
                        <p class="left blogname">General Settings </p>
                        <hr class="hr-child"/>
                        <a href="#" id='privacySettingBtn'>
                            <span class="left"><i class="fi-widget size-28"></i></span></a>
                        <p class="left blogname">Privacy Settings </p>
                        <hr class="hr-child"/>
                        <a href="#" id='notifSettingBtn'>
                            <span class="left"><i class="fi-widget size-28"></i></span></a>
                        <p class="left blogname">Notification Settings </p>
                        <hr class="hr-child"/>
                        <a href="#" id='myFollowerBtn'>
                            <span class="left"><i class="fi-widget size-28"></i></span></a>
                        <p class="left blogname">My Followers </p>
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
        <script src="assets/js/moment.js"></script>
        <script src="assets/js/datepicker.js"></script>
        <script>

            var picker = new Pikaday({
                field: document.getElementById('datepicker'),
                format: 'MMMM DD, YYYY',
                onSelect: function () {
                    console.log(this.getMoment().format('MMMM DD, YYYY'));
                }
            });
        </script>
        <script src="assets/js/script.js"></script>
        <script src="assets/js/uploadjs/jquery.knob.js"></script>
        <script src="assets/js/uploadjs/jquery.ui.widget.js"></script>
        <script src="assets/js/uploadjs/jquery.iframe-transport.js"></script>
        <script src="assets/js/uploadjs/jquery.fileupload.js"></script>
    </body>
</html>
