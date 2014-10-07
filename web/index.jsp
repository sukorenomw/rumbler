<%-- 
    Document   : header
    Created on : Sep 24, 2014, 12:47:12 PM
    Author     : smw
--%>

<%@page import="model.Posts"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
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
        <jsp:include flush="true" page="header.jsp" />
        <%
            if (session.getAttribute("user") == null) {
                String site = new String("login.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
        %>
        <div class="row mainbg radius">
            <aside>
                <div class="large-2 right">
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
            <!--<div class="large-12 collapse ">-->
            <div class="row">
                <div class="large-2 columns small-3 profpict"><img class="radius" src="<% out.print(controller.ModelStatic.useRumbler.getPicturePath());%>"/></div>
                <div class="large-7 pull-3 columns bubble radius small-padding">
                    <section>
                        <ul class="inline-list">
                            <li>
                                <a href="#"><i class="fi-text-color size-72 gray"></i></a>
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
                    </section>
                </div>
            </div>
            <div class="jarak"></div>
            <%
                int n = 5;
                if (ModelStatic.useRumbler.getPostses().size() < 5) {
                    n = ModelStatic.useRumbler.getPostses().size();
                }
                ArrayList<Posts> arr = new ArrayList<Posts>();

                for (Posts obj : ModelStatic.useRumbler.getPostses()) {
                    System.out.println(obj.getTitle());
                    arr.add(obj);
                }
                for (int i = 0; i < n; i++) {

            %>
            <div class="row">
                <div class="large-2 columns small-3 profpict"><img class="radius" src="http://placehold.it/80x80&text=[img]"/></div>
                <div class="large-7 pull-3 columns bubble radius">
                    <section>
                        <p class="size-14"><a href="#"><% out.print(ModelStatic.useRumbler.getName()); %></a></p>
                        <header><h3 class="title"><% out.print(arr.get(i).getContent()); %></h3></header>
                        <p><% out.print(arr.get(i).getTitle()); %></p>
                        <span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Gambar"><img src="<% out.print(arr.get(i).getImage()); %>" width="480" height="320" />
                        </span>
                        <hr/>
                        <p><% out.print(arr.get(i).getTag()); %></p>
                        <ul class="inline-list">
                            <li><a href=""><i class="step fi-heart size-36"></i></a></li>
                            <li><a href="#" data-reveal-id="commentModal"><i class="step fi-comment size-36"></i></a></li>
                        </ul>
                    </section>
                    <hr/>
                    <dl class="accordion radius" data-accordion>
                        <dd class="accordion-navigation">
                            <a href="#commentView" >View Comments</a>
                            <div id="commentView" class="content radius">
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
        <a href="#" class="button totop radius"><i class="fi-arrow-up size-48"></i></a>

        <jsp:include flush="true" page="function/addComment.jsp"></jsp:include>
        <jsp:include flush="true" page="footer.jsp" />
        <script src="assets/js/vendor/jquery.js"></script>
        <script src="assets/js/foundation.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>
