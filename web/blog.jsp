<%-- 
    Document   : index
    Created on : Sep 19, 2014, 9:31:17 PM
    Author     : smw
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Users"%>
<%@page import="model.Comments"%>
<%@page import="java.util.Set"%>
<%@page import="model.Posts"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="controller.DatabaseController" %>
<%@ page import="controller.ModelStatic" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Profile Page</title>
        <link rel="stylesheet" href="assets/css/foundation-icons.css" />
        <link rel="stylesheet" href="assets/css/foundation.css" />
        <!--<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/css/foundation.css" />-->
        <link rel="stylesheet" href="assets/css/custom.css" />
        <!--<link rel="stylesheet" href="assets/css/normalize.css" />-->

        <script src="assets/js/vendor/modernizr.js"></script>
    </head>
    <body>
        <%
            if (session.getAttribute("user") == null) {
                String site = new String("login.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
            DatabaseController dbc = new DatabaseController();
            dbc.updateModelStatic(ModelStatic.useRumbler.getUsername());
        %>
        <%!
            ArrayList<Posts> arr = new ArrayList<Posts>();
            ArrayList<Comments> arrCom = new ArrayList<Comments>();
            Users usr;
            SessionFactory factory;
            List<Users> results;
        %>
        <%
            try {
                factory = util.HibernateUtil.getSessionFactory();
            } catch (Throwable ex) {
                System.err.println("Failed to create sessionFactory object." + ex);
                throw new ExceptionInInitializerError(ex);
            }
            System.out.println("tes paramatert" + request.getAttribute("userId"));
            results = dbc.selectOperator(factory.openSession(), Integer.parseInt(request.getAttribute("userId").toString()));
            for (Iterator itr = results.iterator(); itr.hasNext();) {
                Users usrTemp = (Users) itr.next();
                usr = usrTemp;
            }
        %>
        <div class="off-canvas-wrap">
            <div class="fixed off-canvas-fixed">

                <nav class="tab-bar">
                    <section class="left-small">
                        <a class="left-off-canvas-toggle menu-icon" href="#"><span></span></a>
                    </section>

                    <section class="middle tab-bar-section">
                        <nav class="top-bar" data-topbar role="navigation">
                            <section class="top-bar-section">
                                <!-- Right Nav Section -->
                                <ul class="right">
                                    <li class="has-form">
                                        <!--<form>-->
                                        <div class="large-12 column">
                                            <div class="row collapse postfix-radius">
                                                <div class="small-9 columns">
                                                    <input type="text" placeholder="Value" class="radius">
                                                </div>
                                                <div class="small-3 columns">
                                                    <a href="#" class="button postfix radius">Go</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--</form>-->
                                    </li>
                                    <li><a href="index.jsp"><i class="fi-home size-24"></i></a></li>
                                    <li><a href="#"><i class="fi-torsos-male-female size-24"></i></a></li>
                                    <li><a href="setting.jsp"><i class="fi-widget size-24"></i></a></li>
                                    <li><a href="ServLogOut"><i class="fi-power size-24"></i></a></li>
                                </ul>
                            </section>
                        </nav>
                    </section>
                </nav>

                <!-- menu pinggir -->
                <aside class="left-off-canvas-menu">
                    <ul class="off-canvas-list">
                        <li><label>Menu Pinggir 1</label></li>
                        <li><a href="#">Menu 1</a></li>
                        <li><a href="#">Menu 2</a></li>
                        <li><a href="#">Menu 3</a></li>
                        <li><a href="#">Dst ..</a></li>
                    </ul>
                    <ul class="off-canvas-list">
                        <li><label>Menu Pinggir 2</label></li>
                        <li><a href="#">Menu 1</a></li>
                        <li><a href="#">Menu 2</a></li>
                        <li><a href="#">Menu 3</a></li>
                        <li><a href="#">Dst ..</a></li>
                    </ul>
                    <ul class="off-canvas-list">
                        <li><label>Menu Pinggir 3</label></li>
                        <li><a href="#">Menu 1</a></li>
                        <li><a href="#">Menu 2</a></li>
                        <li><a href="#">Menu 3</a></li>
                        <li><a href="#">Dst ..</a></li>
                    </ul>
                </aside>
                <!-- menu pinggir end -->
            </div>

            <div class="inner-wrap">
                <a class="exit-off-canvas"></a>
                <div class="main-section">
                    <!-- cover foto parallax -->
                    <section class="parralax" data-type="background" data-bgimg="../img/bg.png" data-speed="4"></section>
                    <!-- cover foto end -->
                    <div class="jarak">

                    </div>
                    <div class="row"><h1 class="title text-center blogtitle"><%= usr.getBlogTitle()%></h1></div>
                    <div class="row">
                        <!-- menu profile utama -->
                        <div class="large-3 columns ">
                            <div class="panel radius">
                                <a href="#"><img src="<%= usr.getPicturePath()%>"/></a>
                                <h5><a href="#"><%= usr.getName()%></a></h5>
                            </div>
                        </div>
                        <!-- menu profil utama end -->

                        <div class="large-9 columns">
                            <%
                                Set<Posts> tes = usr.getPostses();
                                System.out.println("ukuran = " + tes.size());
                                int n = tes.size() - 5 == 0 ? 0 : tes.size() - 5;
                                for (Posts entity : tes) {
                                    arr.add(entity);
                                }
                                if (arr.size() > 0) {
                                    for (int i = tes.size() - 1; i >= 0; i--) {

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
                            <div class="row panel radius">
                                <div class="large-2 columns small-3"><img src="<%= arr.get(i).getUsers().getPicturePath()%>"/></div>
                                <div class="large-10 columns">
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

                                    <!-- popup isi comment -->

                                    <hr/>
                                    <dl class="accordion radius" data-accordion>
                                        <dd class="accordion-navigation">
                                            <a href="#commentView<%= arr.get(i).getPostId()%>" >View Comments</a>
                                            <div id="commentView<%= arr.get(i).getPostId()%>" class="content radius">
                                                <%
                                                    List<Comments> res;
                                                    res = dbc.selectComments(factory.openSession(), arr.get(i).getPostId());
                                                    arrCom = new ArrayList<Comments>();
                                                    for (Comments entity : res) {
                                                        arrCom.add(entity);
                                                    }
                                                    if (arrCom.size() > 0) {
                                                %>
                                                <h6><%= arrCom.size()%> Comments</h6>
                                                <%
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
                            <% }
                                }
                            %>
                        </div>

                        <!-- menu timeline profile end -->
                    </div>
                </div>

            </div>

        </div>
        <a href="#" class="button totop radius"><i class="fi-arrow-up size-48"></i></a>
        <script src="assets/js/vendor/jquery.js"></script>
        <script src="assets/js/foundation.min.js"></script> 
        <!--<script src="http://cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/js/foundation.min.js" ></script>-->
        <script src="assets/js/script.js"></script>
    </body>
</html>

