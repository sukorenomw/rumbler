<%-- 
    Document   : header
    Created on : Sep 24, 2014, 12:47:12 PM
    Author     : smw
--%>

<%@page import="controller.ControllerDB"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Users"%>
<%@page import="model.Comments"%>
<%@page import="model.Posts"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <% if (request.getParameter("search") == null) {

                %>
                <div class="row">
                    <div class="large-2 columns profpict"><img class="radius" src="<%= ControllerDB.serverStorage%><%= controller.ModelStatic.useRumbler.getPicturePath()%>"/><%

                        %></div>
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
                                <form data-abide name="text-only-post" action="PostLink" method="POST">
                                    <div class="row">
                                        <div>
                                            <input name="post-title" type="text" placeholder="Link .." required>
                                        </div>   
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
                            <section id="post-quote" style="display:none">
                                <form data-abide name="text-only-post" action="PostQuote" method="POST">
                                    <div class="row">
                                        <div>
                                            <input name="post-title" type="text" placeholder="Title..">
                                        </div>
                                        <div>
                                            <textarea name="post-content" placeholder="Quote here .." rows="4" style="resize:none" required></textarea>
                                        </div>
                                        <input name="post-tag" type="text" placeholder="From .." required >
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
                                    <div class="checkbox"><label><input type="checkbox"><span class="custom checkbox"></span>Upload to Facebook</label>
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
                    </div>
                </div>
                <div class="jarak"></div>
                <% } %>
                <%!
                    ArrayList<Posts> arr = new ArrayList<Posts>();
                    ArrayList<Comments> arrCom = new ArrayList<Comments>();
                    ArrayList<Users> userr = new ArrayList<Users>();
                    ArrayList<Users> randUser;
//                    DatabaseController dbc;
//                    SessionFactory factory;
                    String pic;
                %>
                <%
                    int n = 10;
//                    DatabaseController dbc = new DatabaseController();
                    List<Posts> results = null;

//                    try {
//                        factory = util.HibernateUtil.getSessionFactory();
//                    } catch (Throwable ex) {
//                        System.err.println("Failed to create sessionFactory object." + ex);
//                        throw new ExceptionInInitializerError(ex);
//                    }
//                    results = dbc.selectPosts(factory.openSession(), ModelStatic.useRumbler.getUserId());
                    arr = ControllerDB.homePost();
//                    //ControllerDB.print(results);
//                    for (Posts entity : results) {
//                        arr.add(entity);
//                    }
                %>

                <% if (request.getParameter("search") == null) { %>

                <div id="post-box">
                    <%
                        if (arr.size() > 0) {
                            if (arr.size() < 10) {
                                n = arr.size();
                            }
                            for (int i = 0; i < n; i++) {
//                                List<Users> res12 = dbc.selectOperator(factory.openSession(), (arr.get(i).getUsers().getUserId()));
                                pic = arr.get(i).getUsers().getPicturePath();
                    %>
                    <div id="commentModal<%= arr.get(i).getPostId()%>" class="reveal-modal small" data-reveal>
                        <h2>Post a comment</h2>
                        <div class="row">
                            <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="<%= ModelStatic.useRumbler.getName()%>"><img src="<%= ControllerDB.serverStorage%><%= ModelStatic.useRumbler.getPicturePath()%>"/></span></div>
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
                        <div class="large-2 columns small-3 profpict"><img class="radius" src="<%= ControllerDB.serverStorage%><%= pic%>"/></div>
                        <div class="large-10 columns bubble radius">
                            <section>
                                <p class="size-14"><a href="FriendsBlog<%= "?user_id=" + arr.get(i).getUsers().getUserId()%>"> <%= arr.get(i).getUsers().getName()%></a></p>
                                <% if ((arr.get(i).getContent() != null || arr.get(i).getIsQuote() == 1) && arr.get(i).getIsLink() != 1) {%>
                                <header><h3 class="title"><%= arr.get(i).getContent()%></h3></header>
                                    <% } %>
                                    <% if (arr.get(i).getTitle() != null) {%>
                                <p><%= arr.get(i).getTitle()%></p>
                                <% } %>
                                <% if (arr.get(i).getIsVideo() == 1) {%>
                                <video width="480" height="320" controls>
                                    <source src="<%= ControllerDB.serverStorage%><%= arr.get(i).getImage()%>%>" type="video/avi">
                                    <source src="<%= ControllerDB.serverStorage%><%= arr.get(i).getImage()%>" type="video/mp4">
                                    <source src="<%= ControllerDB.serverStorage%><%= arr.get(i).getImage()%>" type="video/mkv">
                                    <source src="<%= ControllerDB.serverStorage%><%= arr.get(i).getImage()%>" type="video/webm">
                                </video>

                                <% } else if (!arr.get(i).getImage().equals("")) {%>
                                <span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Gambar"><img src="<%= ControllerDB.serverStorage%><%= arr.get(i).getImage()%>" width="480" height="320" />
                                </span>
                                <% } else if (arr.get(i).getIsLink() == 1) {
                                %>       <% if (arr.get(i).getContent() != null) {%>
                                <a href="<%= arr.get(i).getContent()%>" target="_blank"><h3 class="title" style="color:#014387;font-style: italic"><%= arr.get(i).getContent()%></h3></a>
                                    <% } %>
                                    <% } %>
                                <hr/>
                                <% if (arr.get(i).getTag() != null) {
                                %>
                                <p><%= arr.get(i).getTag()%></p>
                                <% }%>
                                <ul class="inline-list">
                                    <% if (ControllerDB.isLiked(ModelStatic.useRumbler.getUserId(), arr.get(i).getPostId()) == 1) {
                                    %>
                                    <li><a href="#"><i class="likeBtn step fi-heart size-36 liked" data-post="<%= arr.get(i).getPostId()%>" data-userid="<%= ModelStatic.useRumbler.getUserId()%>" data-like="<%= ControllerDB.isLiked(ModelStatic.useRumbler.getUserId(), arr.get(i).getPostId())%>"></i></a></li>
                                            <%
                                            } else {%>
                                    <li><a href="#"><i class="likeBtn step fi-heart size-36" data-post="<%= arr.get(i).getPostId()%>" data-userid="<%= ModelStatic.useRumbler.getUserId()%>" 
                                                       data-like="<%= ControllerDB.isLiked(ModelStatic.useRumbler.getUserId(), arr.get(i).getPostId())%>"></i></a></li>
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
//                                            List<Comments> res3=new ArrayList<Comments>();
//                                            res3 = ControllerDB.arryComent(arr.get(i).getPostId());
//                                            ControllerDB.prints(res3);
//                                            for (Comments entity : res3) {
//                                                arrCom.add(entity);
//                                            }
                                            ControllerDB.printpich("Ukuran arrcom" + arr.get(i).getCommentses().size());
                                            ArrayList<Comments> com = arr.get(i).getCommentses();
                                            arrCom=new ArrayList<Comments>();
                                            arrCom.addAll(com);
                                            ControllerDB.printpich("size arrCom" + arrCom.size());
                                        %>
                                        <h6><%= arrCom.size()%> Comments</h6>
                                        <%
                                            if (arrCom.size() > 0) {
                                                for (int j = 0; j < arrCom.size(); j++) {
                                        %>
                                        <div class="row">
                                            <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="<%= arrCom.get(j).getUsers().getName()%>"><img src="<%= ControllerDB.serverStorage%><%= arrCom.get(j).getUsers().getPicturePath()%>"/></span></div>
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

                        //res = ControllerDB.selectUsers(request.getParameter("search"));
//                        for (Users entity : res) {
//                            userr.add(entity);
//                        }
                        userr = ControllerDB.selectUsers(request.getParameter("search"));
                        if (userr.size() > 0) {
                            for (int i = 0; i < userr.size(); i++) {
                    %>
                    <div id="searchUser<%= userr.get(i).getUserId()%>">
                        <div class="row">
                            <div class="small-8">
                                <div class="row">
                                    <div class="small-5 push-1 columns">
                                        <div class="columns profpict"><img class="radius" src="<%= ControllerDB.serverStorage%><%= userr.get(i).getPicturePath()%>"/></div>
                                    </div>
                                    <div class="large-7 columns">
                                        <p><a href="FriendsBlog<%= "?user_id=" + userr.get(i).getUserId()%>"><%= userr.get(i).getName()%></a></p>
                                            <% // if (dbc.isFollowing(factory.openSession(), ModelStatic.useRumbler.getUserId(), userr.get(i).getUserId()) == 1) 
                                                if (i > 0) {%>
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
                            //ControllerDB.printpich("MASUK RAND USER");
//                            randUser = dbc.selectRandomUsers(factory.openSession(), ModelStatic.useRumbler.getUserId());
                            randUser = ControllerDB.randUsrs();
                            for (int itr = 0; itr < randUser.size(); itr++) {
                                Users usr = randUser.get(itr);
                                //ControllerDB.printpich("userId random"+usr.getUserId());
                        %>
                        <a href="FriendsBlog<%= "?user_id=" + usr.getUserId()%>"><img class="radius left" src="<%= ControllerDB.serverStorage%><%= usr.getPicturePath()%>" height="40" width="40"/>
                            <p class="left blogname"> <%= usr.getUsername()%> </p></a>
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
