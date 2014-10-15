<%-- 
    Document   : header
    Created on : Sep 24, 2014, 12:47:12 PM
    Author     : smw
--%>

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
        %>
        <div class="row mainbg radius">
            <div class="large-9 columns">
                <div class="row">
                    <div class="large-2 columns profpict"><img class="radius" src="<% out.print(controller.ModelStatic.useRumbler.getPicturePath());%>"/></div>
                    <div id="user-post" class="large-10 columns bubble radius small-padding">
                        <section>
                            <ul id="usr_post_menu" class="inline-list">
                                <li>
                                    <a href="#" id="newText"><i class="fi-text-color size-72 gray"></i></a>
                                    <label>Text</label>
                                </li>
                                <li><span class="size-72">|</span></li>
                                <li>
                                    <a href="#"><i class="fi-camera size-72 maroon"></i></a>
                                    <label>Picture</label>
                                </li>
                                <li><span class="size-72">|</span></li>
                                <li>
                                    <a href="#"><i class="fi-quote size-72 orange"></i></a>
                                    <label>Quote</label>
                                </li>
                                <li><span class="size-72">|</span></li>
                                <li>
                                    <a href="#"><i class="fi-link size-72 army-green"></i></a>
                                    <label>Link</label>
                                </li>
                                <li><span class="size-72">|</span></li>
                                <li>
                                    <a href="#"><i class="fi-video size-72 gray-light"></i></a>
                                    <label>Video</label>
                                </li>
                            </ul>
                            <section id="post-text" style="display:none">
                                <form>
                                    <div class="row">
                                        <input name="post-title" type="text" placeholder="Title..">
                                        <textarea placeholder="Post here .." rows="10" style="resize:none" ></textarea>
                                        <input name="post-tag" type="text" placeholder="hashtag..">
                                    </div>
                                    <div class="jarak"></div>
                                    <div class="row">
                                        <div class="small-3 left small">
                                            <input type="submit" class="button small radius" value="post" />
                                        </div>
                                        <div id="cancelBtn" class="small-3 right columns small">
                                            <a href="#" class="button radius small alert">Cancel</a>
                                        </div>
                                    </div>
                                </form>
                            </section>                                                                                                                                                                                                                                                                      
                        </section>
                    </div>
                </div>
                <div class="jarak"></div>
                <%!
                    ArrayList<Posts> arr = new ArrayList<Posts>();
                    DatabaseController dbc = new DatabaseController();
                    SessionFactory factory;
                %>
                <%
                    int n = 5;
                    DatabaseController dbc = new DatabaseController();
                    List<Posts> results = null;
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
                <div id="post-box">
                    <%
                        for (int i = 0; i < n; i++) {

                    %>

                    <div class="row">
                        <div class="large-2 columns small-3 profpict"><img class="radius" src="http://placehold.it/80x80&text=[img]"/></div>
                        <div class="large-10 columns bubble radius">
                            <section>
                                <p class="size-14"><a href="#"><%= dbc.selectFriendsName(factory.openSession(), arr.get(i).getUsers().getUserId())%></a></p>
                                <header><h3 class="title"><%= arr.get(i).getContent()%></h3></header>
                                <p><%= arr.get(i).getTitle()%></p>
                                <% if (!arr.get(i).getImage().equals("no image")) { %>
                                <span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Gambar"><img src="<% out.print(arr.get(i).getImage()); %>" width="480" height="320" />
                                </span>
                                <% }%>
                                <hr/>
                                <p><%= arr.get(i).getTag()%></p>
                                <ul class="inline-list">
                                    <li><a href="#"><i class="step fi-heart size-36"></i></a></li>
                                    <li><a href="#" data-reveal-id="commentModal"><i class="step fi-comment size-36"></i></a></li>
                                </ul>
                            </section>
                            <hr/>
                            <dl class="accordion radius" data-accordion>
                                <dd class="accordion-navigation">
                                    <a href="#commentView<%= arr.get(i).getPostId()%>" >View Comments</a>
                                    <div id="commentView<%= arr.get(i).getPostId()%>" class="content radius">
                                        <h6>2 Comments</h6>
                                        <div class="row">
                                            <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="<%  %>"><img src="http://placehold.it/50x50&text=[img]"/></span></div>
                                            <div class="large-10 columns"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>
                                        </div>

                                        <div class="row">
                                            <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Nama User"><img src="http://placehold.it/50x50&text=[img]"/></span></div>
                                            <div class="large-10 columns"><p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit</p></div>
                                        </div>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="jarak"></div>
                    <%
                        }
                    %>
                </div>
                <div class="jarak"></div>
            </div>
            <div class="large-3 columns">
                <aside>
                    <div class="large-2 columns right">
                        <p>Recommended Blogs</p>
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
            </div>
        </div>
        <a href="#" class="button totop radius"><i class="fi-arrow-up size-48"></i></a>

        <jsp:include flush="true" page="function/addComment.jsp"></jsp:include>
        <jsp:include flush="true" page="footer.jsp" />
        <script src="assets/js/vendor/jquery.js"></script>
        <script src="assets/js/foundation.min.js"></script>
        <script src="assets/js/transit.min.js"></script>
        <script src="assets/js/script.js"></script>

    </body>
</html>
