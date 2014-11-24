<%-- 
    Document   : header
    Created on : Sep 24, 2014, 12:47:12 PM
    Author     : smw
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Users"%>
<%@page import="model.Comments"%>
<%@page import="model.Posts"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="controller.DatabaseController" %>
<%@ page import="controller.ModelStatic" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Rumbler</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="assets/css/foundation-icons.css" />
        <link rel="stylesheet" href="assets/css/foundation.css" />
        <link rel="stylesheet" href="assets/css/custom.css" />
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />

        <!--<link rel="stylesheet" href="assets/css/normalize.css" />-->

        <script src="assets/js/vendor/modernizr.js"></script>
    </head>
    <body class="timeline-page">
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <jsp:include flush="true" page="header.jsp" />
        <%
            if (session.getAttribute("user") == null) {
                String site = new String("login.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
            controller.ServController.n = 10;
        %>
        <div class="row mainbg radius">
            <div class="large-9 columns">
                <% if (request.getParameter("search") == null) {%>
                <div class="row">
                    <div class="large-2 columns profpict"><img class="radius" src="<%= controller.ModelStatic.useRumbler.getPicturePath()%>"/></div>
                    <div id="user-post" class="large-10 columns bubble radius small-padding">
                        <section>
                            <ul id="usr_post_menu" class="inline-list">
                                <li>
                                    <a href="#" id="newText"><i class="fi-text-color size-72 gray"></i></a>
                                    <label>Text</label>
                                </li>
                                <li><span class="size-72">|</span></li>
                                <li>
                                    <a href="#" id="newPict"><i class="fi-camera size-72 maroon"></i></a>
                                    <label>Picture</label>
                                </li>
                                <li><span class="size-72">|</span></li>
                                <li>
                                    <a href="#" id="newVideo"><i class="fi-video size-72 gray-light"></i></a>
                                    <label>Video</label>
                                </li>
                                <li><span class="size-72">|</span></li>
                                <li>
                                    <a href="#" id='newQuote'><i class="fi-quote size-72 orange"></i></a>
                                    <label>Quote</label>
                                </li>
                                <li><span class="size-72">|</span></li>
                                <li>
                                    <a href="#" id='newLink'><i class="fi-link size-72 army-green"></i></a>
                                    <label>Link</label>
                                </li>

                            </ul>
                            <section id="post-link" style="display:none">
                                <div class="cooming-soon1">
                                    <div class="cooming-soon">
                                        Cooming Soon<br/>
                                        <a class="cancelBtn">Cancel</a>

                                    </div>
                                </div>
                            </section>
                            <section id="post-quote" style="display:none">
                                <div class="cooming-soon1">
                                    <div class="cooming-soon">
                                        Cooming Soon<br/>
                                        <a class="cancelBtn">Cancel</a>

                                    </div>
                                </div>
                            </section>
                            <section id="post-video" style="display:none">
                                <form method="post" action="UploadVideo" enctype="multipart/form-data">
                                    <div id="upload-vid">
                                        <div id="drop-vid">
                                            Drop Video Here<br/>
                                            <a>Browse</a>
                                            <input type="file" name="upl"/>
                                        </div>

                                        <ul>
                                        </ul>
                                    </div>
                                    <input name="post-tag" class='radius' type="text" placeholder="hashtag..">    
                                    <div class="jarak"></div>
                                    <div class="row">
                                        <div class="small-3 left small">
                                            <input type="submit" id="sbmtVid" class="button small radius" value="post" />
                                        </div>
                                        <div class="cancelBtn small-3 right columns small">
                                            <a href="#" class="button radius small alert">Cancel</a>
                                        </div>
                                    </div>

                                </form>
                            </section>
                            <section id="post-picture" style="display:none">
                                <form method="post" action="UploadFile" enctype="multipart/form-data">
                                    <div id="upload">
                                        <div id="drop">
                                            Drop Image Here<br/>
                                            <a>Browse</a>
                                            <input type="file" name="upl"/>
                                        </div>

                                        <ul>
                                        </ul>
                                    </div>
                                    <input name="post-tag" class='radius' type="text" placeholder="hashtag..">    
                                    <div class="jarak"></div>
                                    <div class="row">
                                        <div class="small-3 left small">
                                            <input type="submit" id="sbmtPict" class="button small radius" value="post" style="display: none;"/>
                                        </div>
                                        <div class="cancelBtn small-3 right columns small">
                                            <a href="#" class="button radius small alert">Cancel</a>
                                        </div>
                                    </div>

                                </form>
                            </section>
                            <section id="post-text" style="display:none">
                                <form data-abide name="text-only-post" action="PostText" method="POST">
                                    <div class="row">
                                        <div>
                                            <input name="post-title" type="text" placeholder="Title.." required pattern="alpha_numeric">
                                        </div>
                                        <div>
                                            <textarea name="post-content" placeholder="Post here .." rows="10" style="resize:none" required></textarea>
                                        </div>
                                        <input name="post-tag" type="text" placeholder="hashtag.." required >
                                    </div>
                                    <div class="jarak"></div>
                                    <div class="row">
                                        <div class="small-3 left small">
                                            <input type="submit" class="button small radius" value="post" />
                                        </div>
                                        <div class="cancelBtn small-3 right columns small">
                                            <a href="#" class="button radius small alert">Cancel</a>
                                        </div>
                                    </div>
                                </form>
                            </section>                                                                                                                                                                                                                                                                      
                        </section>
                    </div>
                </div>
                <div class="jarak"></div>
                <% } %>
                <%!
                    ArrayList<Posts> arr;
                    ArrayList<Comments> arrCom;
                    ArrayList<Users> userr = new ArrayList<Users>();
                    List<Users> randUser = null;
                    DatabaseController dbc;
                    SessionFactory factory;
                    String pic;
                %>
                <%
                    int n = 10;
                    DatabaseController dbc = new DatabaseController();
                    List<Posts> results = null;
                    arr = new ArrayList<Posts>();
                    arrCom = new ArrayList<Comments>();
                    try {
                        factory = util.HibernateUtil.getSessionFactory();
                    } catch (Throwable ex) {
                        System.err.println("Failed to create sessionFactory object." + ex);
                        throw new ExceptionInInitializerError(ex);
                    }
                    results = dbc.selectPosts(factory.openSession(), ModelStatic.useRumbler.getUserId());
                    for (Posts entity : results) {
                        arr.add(entity);
                    }
                %>

                <% if (request.getParameter("search") == null) { %>

                <div id="post-box">
                    <%
                        if (arr.size() > 0) {
                            if (arr.size() < 10) {
                                n = arr.size();
                            }
                            for (int i = 0; i < n; i++) {
                                List<Users> res12 = dbc.selectOperator(factory.openSession(), (arr.get(i).getUsers().getUserId()));
                                for (Users entity1 : res12) {
                                    pic = entity1.getPicturePath();
                                }
                    %>
                    <div id="commentModal<%= arr.get(i).getPostId()%>" class="reveal-modal small" data-reveal>
                        <h2>Post a comment</h2>
                        <div class="row">
                            <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="<%= ModelStatic.useRumbler.getName()%>"><img src="<%= ModelStatic.useRumbler.getPicturePath()%>"/></span></div>
                            <form id="postComment" name="postComment" method="POST" action="commentHandle">
                                <div class="large-8 columns">
                                    <input type="hidden" name="post_id" value="<%= arr.get(i).getPostId()%>" />
                                    <input type="hidden" name="user_id" value="<%= ModelStatic.useRumbler.getUserId()%>" />
                                    <textarea name="commentContent" placeholder="Write a comment..." style="resize: none;"></textarea>

                                </div>
                                <div class="large-2 columns small-3">
                                    <!--<a href="#" class="button" style="margin-left: -30px; height: 3.15rem; width: 4rem; padding: 15px 5px 15px 5px;">Submit</a>-->
                                    <input type="submit" class="button" style="margin-left: -30px; height: 3.15rem; width: 4rem; padding: 15px 5px 15px 5px;" value="submit"/>
                                </div>
                            </form>
                        </div>
                        <a class="close-reveal-modal">&#215;</a>
                    </div>
                    <div class="row">
                        <div class="large-2 columns small-3 profpict"><img class="radius" src="<%= pic%>"/></div>
                        <div class="large-10 columns bubble radius">
                            <section>
                                <p class="size-14"><a href="FriendsBlog<%= "?user_id=" + arr.get(i).getUsers().getUserId()%>"> <%= dbc.selectFriendsName(factory.openSession(), arr.get(i).getUsers().getUserId())%></a></p>
                                <% if (arr.get(i).getContent() != null) {%>
                                <header><h3 class="title"><%= arr.get(i).getContent()%></h3></header>
                                    <% } %>
                                    <% if (arr.get(i).getTitle() != null) {%>
                                <p><%= arr.get(i).getTitle()%></p>
                                <% } %>
                                <% if (arr.get(i).getIsVideo() == 1) {%>
                                <video width="480" height="320" controls>
                                    <source src="<%= arr.get(i).getImage()%>" type="video/avi">
                                    <source src="<%= arr.get(i).getImage()%>" type="video/mp4">
                                    <source src="<%= arr.get(i).getImage()%>" type="video/mkv">
                                    <source src="<%= arr.get(i).getImage()%>" type="video/webm">
                                </video>

                                <% } else if (!arr.get(i).getImage().equals("no image")) {%>
                                <span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Gambar"><img src="<%= arr.get(i).getImage()%>" width="480" height="320" />
                                </span>
                                <%
                                    }
                                %>
                                <hr/>
                                <% if (arr.get(i).getTag() != null) {%>
                                <p><%= arr.get(i).getTag()%></p>
                                <% }%>
                                <ul class="inline-list">
                                    <% if (dbc.isLiked(factory.openSession(), ModelStatic.useRumbler.getUserId(), arr.get(i).getPostId()) == 1) {%>
                                    <li><a href="#"><i class="likeBtn step fi-heart size-36 liked" data-post="<%= arr.get(i).getPostId()%>" data-userid="<%= ModelStatic.useRumbler.getUserId()%>" data-like="<%= dbc.isLiked(factory.openSession(), ModelStatic.useRumbler.getUserId(), arr.get(i).getPostId())%>"></i></a></li>
                                            <% } else {%>
                                    <li><a href="#"><i class="likeBtn step fi-heart size-36" data-post="<%= arr.get(i).getPostId()%>" data-userid="<%= ModelStatic.useRumbler.getUserId()%>" 
                                                       data-like="<%= dbc.isLiked(factory.openSession(), ModelStatic.useRumbler.getUserId(), arr.get(i).getPostId())%>"></i></a></li>
                                            <% }%>
                                    <li><a href="#" data-reveal-id="commentModal<%= arr.get(i).getPostId()%>"><i class="step fi-comment size-36"></i></a></li>
                                </ul>
                            </section>
                            <hr/>
                            <dl class="accordion radius" data-accordion>
                                <dd class="accordion-navigation">
                                    <a href="#commentView<%= arr.get(i).getPostId()%>" >View Comments</a>
                                    <div id="commentView<%= arr.get(i).getPostId()%>" class="content radius">
                                        <%
                                            List<Comments> res3;
                                            res3 = dbc.selectComments(factory.openSession(), arr.get(i).getPostId());
                                            arrCom = new ArrayList<Comments>();
                                            for (Comments entity : res3) {
                                                arrCom.add(entity);
                                            }
                                        %>
                                        <h6><%= arrCom.size()%> Comments</h6>
                                        <%
                                            if (arrCom.size() > 0) {
                                                for (int j = 0; j < arrCom.size(); j++) {
                                        %>
                                        <div class="row">
                                            <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="<%= dbc.selectFriendsName(factory.openSession(), arrCom.get(j).getUsers().getUserId())%>"><img src="<%= dbc.selectPicturePath(factory.openSession(), arrCom.get(j).getUsers().getUserId())%>"/></span></div>
                                            <div class="large-10 columns"><p><%= arrCom.get(j).getContent()%></p></div>
                                        </div>
                                        <hr/>
                                        <%
                                                }
                                            }
                                        %>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="jarak"></div>
                    <%                        }
                        }
                    %>
                </div>

                <div class="jarak"></div>
                <div class="spinner">
                    <div class="rect1"></div>
                    <div class="rect2"></div>
                    <div class="rect3"></div>
                    <div class="rect4"></div>
                    <div class="rect5"></div>
                </div>
                <% } else { %>
                <%!
                    List<Users> res;

                %>
                <div class="large-11 panel radius">
                    <%

                        res = dbc.selectUsers(factory.openSession(), request.getParameter("search"));
                        userr = new ArrayList<Users>();
                        for (Users entity : res) {
                            userr.add(entity);
                        }
                        if (userr.size() > 0) {
                            for (int i = 0; i < userr.size(); i++) {
                    %>
                    <div id="searchUser<%= userr.get(i).getUserId()%>">
                        <div class="row">
                            <div class="small-8">
                                <div class="row">
                                    <div class="small-5 push-1 columns">
                                        <div class="columns profpict"><img class="radius" src="<%= userr.get(i).getPicturePath()%>"/></div>
                                    </div>
                                    <div class="large-7 columns">
                                        <p><a href="FriendsBlog<%= "?user_id=" + userr.get(i).getUserId()%>"><%= userr.get(i).getName()%></a></p>
                                            <% if (dbc.isFollowing(factory.openSession(), ModelStatic.useRumbler.getUserId(), userr.get(i).getUserId()) == 1) {%>
                                        <a href="#" class="unfollow" data-unfol="<%= userr.get(i).getUserId()%>" data-user="<%= ModelStatic.useRumbler.getUserId()%>"><span class="label radius success medium">Following</span></a>
                                        <% } else {%>
                                        <a href="#" class="followToSearch" data-user="<%= userr.get(i).getUserId()%>" "><span class="label radius success medium">Follow User</span></a>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr/>
                    </div>
                    <%
                            }

                        } %>
                </div>
                <% }%>
            </div>
            <div class="large-3 columns">
                <aside>
                    <div id="changeAjax" class="large-2 columns right">
                        <p>Recommended Blogs</p>
                        <hr/>
                        <input type="hidden" id="hidden" data-user="<%= ModelStatic.useRumbler.getUserId()%>"/>
                        <%
                            randUser = dbc.selectRandomUsers(factory.openSession(), ModelStatic.useRumbler.getUserId());
                            for (Iterator itr = randUser.iterator(); itr.hasNext();) {
                                Users usr = (Users) itr.next();
                        %>
                        <a href="FriendsBlog<%= "?user_id=" + usr.getUserId()%>"><img class="radius left" src="<%= usr.getPicturePath()%>" height="40" width="40"/>
                            <p class="left blogname"><%= usr.getUsername()%> </p></a>
                        <a href="#"><span class="left"><i class="fi-plus size-28 followTo" data-user="<%= usr.getUserId()%>"></i></span></a>
                        <hr class="hr-child"/>
                        <% }%>
                    </div>
                </aside>
            </div>
        </div>

        <a href="#" class="button totop radius"><i class="fi-arrow-up size-48"></i></a>

        <%--<jsp:include flush="true" page="function/addComment.jsp"></jsp:include>--%>
        <script src="assets/js/vendor/jquery.js"></script>
        <script src="assets/js/foundation.min.js"></script>


        <!--upload js-->
        <script src="assets/js/uploadjs/jquery.knob.js"></script>
        <script src="assets/js/uploadjs/jquery.ui.widget.js"></script>
        <script src="assets/js/uploadjs/jquery.iframe-transport.js"></script>
        <script src="assets/js/uploadjs/jquery.fileupload.js"></script>
        <script src="assets/js/script.js"></script>

    </body>
</html>
