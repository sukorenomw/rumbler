<%-- 
    Document   : index
    Created on : Sep 19, 2014, 9:31:17 PM
    Author     : smw
--%>

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
            SessionFactory factory;
        %>
        <%
            try {
                factory = util.HibernateUtil.getSessionFactory();
            } catch (Throwable ex) {
                System.err.println("Failed to create sessionFactory object." + ex);
                throw new ExceptionInInitializerError(ex);
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
                    <div class="row"><h1 class="title text-center blogtitle"><%= ModelStatic.useRumbler.getBlogTitle()%></h1></div>
                    <div class="row">
                        <!-- menu profile utama -->
                        <div class="large-3 columns ">
                            <div class="panel radius">
                                <a href="#"><img src="<%= ModelStatic.useRumbler.getPicturePath()%>"/></a>
                                <h5><a href="#"><%= ModelStatic.useRumbler.getName()%></a></h5>
                            </div>
                        </div>
                        <!-- menu profil utama end -->

                        <div class="large-9 columns">
                            <%
                                Set<Posts> tes = ModelStatic.useRumbler.getPostses();
                                System.out.println(tes.size());
                                int n = tes.size() - 5 == 0 ? 0 : tes.size() - 5;
                                for (Posts entity : tes) {
                                    arr.add(entity);
                                }
                                for (int i = tes.size() - 1; i >= n; i--) {

                            %>
                            <div class="row panel radius">
                                <div class="large-2 columns small-3"><img src="http://placehold.it/80x80&text=[img]"/></div>
                                <div class="large-10 columns">
                                    <section>
                                        <header><h1 class="title"><%= arr.get(i).getTitle()%></h1></header>
                                        <p><%= arr.get(i).getContent()%></p>
                                        <span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Gambar"><img src="<%= arr.get(i).getImage()%>" width="480" height="320" />
                                        </span>
                                        <hr/>
                                        <p><%= arr.get(i).getTag()%></p>
                                        <ul class="inline-list">
                                            <li><a href=""><i class="step fi-heart size-36"></i></a></li>
                                            <li><a href="#" data-reveal-id="commentModal"><i class="step fi-comment size-36"></i></a></li>
                                        </ul>
                                    </section>

                                    <!-- popup isi comment -->
                                    <jsp:include flush="true" page="function/addComment.jsp"></jsp:include>

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
                                                %>
                                                <h6><%= arrCom.size()%> Comments</h6>
                                                <%
                                                    if (arrCom.size() > 0) {
                                                        for (int j = 0; j < arrCom.size(); j++) {
                                                %>
                                                <div class="row">
                                                    <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="<%  %>"><img src="http://placehold.it/50x50&text=[img]"/></span></div>
                                                    <div class="large-10 columns"><p><%= arrCom.get(j).getContent()%></p></div>
                                                </div>
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
                            <% }%>
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

