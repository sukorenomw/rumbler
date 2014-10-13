<%-- 
    Document   : header
    Created on : Sep 24, 2014, 2:18:45 PM
    Author     : smw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="jarak"></div>
<div class="row">
    <div class="large-12">
        <div class="large-4 columns">
            <h1 class="size-48 titel">rumbler.</h1>
        </div>
        <div class="large-4 five-up columns icon-bar push-2" role="navigation">
            <ul class="inline-list">
                <li>
                    <a href="index.jsp"class="white item"> 
                        <i class="fi-home size-36"></i> 
                    </a>
                </li>
                <li>
                    <a class="white item notif" href="notification.jsp"> 
                        <i class="fi-info size-36"></i> 
                    </a>
                    <span class="label alert radius notif_badge">100</span>
                    <div class="flyout">
                        <h2>Notifications</h2>
                        <ul class="no-bullet size-14">
                            <li><a href="#"><i class="fi-heart"></i> Jeremy Gunawan likes your photos.</a></li>
                            <li><a href="#"><i class="fi-heart"></i> Kevin likes your photos.</a></li>
                            <li><a href="#"><i class="fi-comment gray-light"></i> Egia commented on your photos.</a></li>
                        </ul>
                        <!--tes.-->
                    </div>
                </li>
                <li>
                    <a class="white item" href="blog.jsp"> 
                        <i class="fi-torsos-male-female size-36"></i> 
                    </a>
                </li>
                <li>
                    <a href="setting.jsp" class="white item"> 
                        <i class="fi-widget size-36"></i> 
                    </a>
                </li>
                <li>
                    <a href="ServLogOut" class="white item"> 
                        <i class="fi-power size-36"></i> 
                    </a>
                </li>
            </ul>
        </div>
        <form>  
            <div class="row search-form"> 
                <div class="large-3 columns"> 
                    <div class="row collapse postfix-round"> 
                        <div class="small-9 columns"> 
                            <input type="text" placeholder="Search something.." style="background: rgba(255,255,255,0.5);border: 0px;color: #6d6d6d;"> 
                        </div> 
                        <div class="small-3 columns"> 
                            <a href="#" class="postfix" style="background: rgba(255,255,255,0.5); border: 0px;"><i class="fi-magnifying-glass size-16"></i></a> 
                        </div> 
                    </div> 
                </div> 
            </div> 
        </form>
    </div>

</div>
