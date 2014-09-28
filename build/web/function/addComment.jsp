<%-- 
    Document   : addComment
    Created on : Sep 24, 2014, 4:07:51 PM
    Author     : smw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="commentModal" class="reveal-modal small" data-reveal>
    <h2>Post a comment</h2>
    <div class="row">
        <div class="large-2 columns small-3"><span data-tooltip aria-haspopup="true" class="has-tip radius tip-left" title="Nama User"><img src="http://placehold.it/50x50&text=[img]"/></span></div>
        <div class="large-8 columns">
            <textarea placeholder="Write a comment..." style="resize: none;"></textarea>
        </div>
        <div class="large-2 columns small-3">
            <a href="#" class="button" style="margin-left: -30px; height: 3.15rem; width: 4rem; padding: 15px 5px 15px 5px;">Submit</a>
        </div>
    </div>
    <a class="close-reveal-modal">&#215;</a>
</div>
