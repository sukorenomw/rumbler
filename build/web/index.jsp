<%-- 
    Document   : header
    Created on : Sep 24, 2014, 12:47:12 PM
    Author     : smw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Rumbler</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="assets/css/foundation-icons.css" />
        <link rel="stylesheet" href="assets/css/foundation.css" />
        <link rel="stylesheet" href="assets/css/custom.css" />
        <!--<link rel="stylesheet" href="assets/css/normalize.css" />-->

        <script src="assets/js/vendor/modernizr.js"></script>
    </head>
    <body class="timeline-page">
        <jsp:include flush="true" page="header.jsp" />
        <div class="row mainbg radius">
            <!--<div class="large-12 collapse ">-->
            <div class="row">
                <div class="large-2 columns small-3 profpict"><img class="radius" src="http://placehold.it/80x80&text=[img]"/></div>
                <div class="large-6 pull-4 columns bubble radius small-padding">
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
                        </ul>
                    </section>
                </div>
            </div>
            <div class="jarak"></div>
            <div class="row">
                <div class="large-2 columns small-3 profpict"><img class="radius" src="http://placehold.it/80x80&text=[img]"/></div>
                <div class="large-8 pull-2 columns bubble radius">
                    <section>
                        <p class="size-14"><a href="#">Sukoreno Mukti</a></p>
                        <header><h3 class="title">Judul Postingan</h3></header>
                        <p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong.</p>
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
                                    <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Nama User"><img src="http://placehold.it/50x50&text=[img]"/></span></div>
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
            <div class="row">
                <div class="large-2 columns small-3 profpict"><img class="radius" src="http://placehold.it/80x80&text=[img]"/></div>
                <div class="large-8 pull-2 columns bubble radius">
                    <section>
                        <p class="size-14"><a href="#">Raiven Teguh</a></p>
                        <header><h3 class="title">Judul Postingan</h3></header>
                        <span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Gambar"><img src="http://zurb.com/university/assets/courses/foundation-sass.png" width="480" height="320" />
                        </span>
                        <hr/>
                        <p>#photos, #gambar, #bagus, #keren, #testes</p>
                        <ul class="inline-list">
                            <li><a href=""><i class="step fi-heart size-36"></i></a></li>
                            <li><a href="#" data-reveal-id="commentModal"><i class="step fi-comment size-36"></i></a></li>
                        </ul>
                    </section>
                    <hr/>
                    <dl class="accordion radius" data-accordion>
                        <dd class="accordion-navigation">
                            <a href="#commentView1" >View Comments</a>
                            <div id="commentView1" class="content radius">
                                <h6>2 Comments</h6>
                                <div class="row">
                                    <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Nama User"><img src="http://placehold.it/50x50&text=[img]"/></span></div>
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
        </div>
        <a href="#" class="button totop radius"><i class="fi-arrow-up size-48"></i></a>

        <jsp:include flush="true" page="function/addComment.jsp"></jsp:include>
        <script src="assets/js/vendor/jquery.js"></script>
        <script src="assets/js/foundation.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>
