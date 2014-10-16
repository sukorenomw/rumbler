/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).foundation();
var menu = $('.left-off-canvas-menu');
$(document).on('resize', function () {
    menu.height($(this).height());
});
$(document).trigger('resize');

$(document).ready(function () {

//    $('#generalSetting').hide();
    $('.flyout').hide();
//    $('#post-text').hide();
    $('.totop').hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.totop').fadeIn();
        } else {
            $('.totop').fadeOut();
        }
    });
//    $(".notif, .notif_badge, .flyout").hover(function () {
//        $(".flyout").stop().fadeIn();
//        $(".notif_badge").hide();
//    }, function () {
//        $(".flyout").stop().fadeOut();
//    });
    $notifShow = false;
    $('.notif, .notif_badge').click(function (e) {
        if ($notifShow == false) {
            $(".flyout").stop().fadeIn();
            $(".notif_badge").hide();
            $notifShow = true;
        } else {
            $(".flyout").stop().fadeOut();
            $notifShow = false;
        }
        e.preventDefault();
    });
    $('#generalSettingBtn').click(function (e) {
        $('#privacySetting').hide();
        $('#notifSetting').hide();
        $('#myFollower').hide();
        $('#generalSetting').show();
        e.preventDefault();
    });
    $('#privacySettingBtn').click(function (e) {
        $('#generalSetting').hide();
        $('#notifSetting').hide();
        $('#myFollower').hide();
        $('#privacySetting').show();
        e.preventDefault();
    });
    $('#notifSettingBtn').click(function (e) {
        $('#generalSetting').hide();
        $('#privacySetting').hide();
        $('#myFollower').hide();
        $('#notifSetting').show();
        e.preventDefault();
    });
    $('#myFollowerBtn').click(function (e) {
        $('#generalSetting').hide();
        $('#privacySetting').hide();
        $('#notifSetting').hide();
        $('#myFollower').show();
        e.preventDefault();
    });
    $('.totop').click(function () {
        $('html, body').animate({scrollTop: 0}, 800);
        return false;
    });
    $(".accordion").on("click", "dd", function () {
        $("dd.active").find(".content").stop().slideUp("slow");
        if (!$(this).hasClass("active")) {
            $(this).find(".content").stop().slideToggle("slow");
        }
    });

    $("#newQuote, #newLink").click(function (e) {
        $("#usr_post_menu").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '+=300px'}, 500, function () {
                $("#post-quote").stop().fadeIn();
            });
        });
        e.preventDefault();
    });

    $("#newText").click(function (e) {
        $("#usr_post_menu").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '+=300px'}, 500, function () {
                $("#post-text").stop().fadeIn();
            });
        });
        e.preventDefault();
    });

    $("#newVideo").click(function (e) {
        $("#usr_post_menu").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '+=350px'}, 500, function () {
                $("#post-video").stop().fadeIn();
            });
        });
        e.preventDefault();
    });

    $("#newPict").click(function (e) {
        $("#usr_post_menu").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '+=350px'}, 500, function () {
                $("#post-picture").stop().fadeIn();
            });
        });
        e.preventDefault();
    });

    $(".cancelBtn").click(function (e) {
        $("#post-quote").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '130px'}, 500, function () {
                $("#usr_post_menu").stop().fadeIn();
            });
        });
        $("#post-picture").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '130px'}, 500, function () {
                $("#usr_post_menu").stop().fadeIn();
            });
        });
        $("#post-video").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '130px'}, 500, function () {
                $("#usr_post_menu").stop().fadeIn();
            });
        });

        $("#post-text").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '130px'}, 500, function () {
                $("#usr_post_menu").stop().fadeIn();
            });
        });
        e.preventDefault();

    });

    $(".unfollow").hover(function () {
        $(this).find('span').removeClass('success', 1000, 'easing');
        $(this).find('span').addClass('alert', 1000, 'easing');
        $(this).find('span').html('unfollow');
    }, function () {
        $(this).find('span').removeClass('alert', 1000, 'easing');
        $(this).find('span').addClass('success', 1000, 'easing');
        $(this).find('span').html('following');
    });

    $('.unfollow').click(function (e) {
        var unfollow = $(this).attr("data-unfol");
        var myId = $(this).attr("data-user");
        $.ajax({
            type: "POST",
            url: "Unfollow",
            data: {unfollow: unfollow, userid: myId},
            success: function (responseText) {
                alert("you are not longer following " + responseText);
                $.post("ReloadFollower", function (data) {
                    setTimeout(function () {
//                        $("#post-box").append(data);
//                        $(data).html("#changeAjax").fadeIn('slow');
                        $("#myFollower").html(data).fadeIn('slow');
                    }, 500);

                });
            }
        });
        console.log(unfollow + " " + myId);
        e.preventDefault();
    })

    $('.followTo').click(function (e) {
        var followTo = $(this).attr("data-user");
        var myId = $("#hidden").attr("data-user");
        $.ajax({
            type: "POST",
            url: "FollowTo",
            data: {followTo: followTo, userid: myId},
            success: function (responseText) {
                alert("you are now following " + responseText);
                $.post("infiniteScroll", function (data) {
                    setTimeout(function () {
//                        $("#post-box").append(data);
                        $(data).prependTo("#post-box").fadeIn('slow');
                    });

                });
                $.post("ReloadRecommend", function (data) {
                    setTimeout(function () {
//                        $("#post-box").append(data);
//                        $(data).html("#changeAjax").fadeIn('slow');
                        $("#changeAjax").html(data).fadeIn('slow');
                        $contentLoadTriggered = false;
                    }, 1500);

                });
            }
        });

        console.log(followTo + " " + myId);
        e.preventDefault();
    })

    $contentLoadTriggered = false;
    $(window).scroll(function () {
        if ($(window).scrollTop() + $(window).height() == $(document).height() && document.location.pathname.match(/[^\/]+$/)[0] === 'index.jsp') {
            if ($contentLoadTriggered == false) {
                $contentLoadTriggered = true;
                $.post("infiniteScroll", function (data) {
                    setTimeout(function () {
//                        $("#post-box").append(data);
                        $(data).appendTo("#post-box").fadeIn('slow');
                        $contentLoadTriggered = false;
                    }, 1500);

                });
            }
        }
    });
//    $("#post-box").scroll(function () {
//        if ($("#post-box").scrollTop() >= ($("#post-wrapper").height() - $("#post-box").height()) && $contentLoadTriggered == false)
//        {
//            $contentLoadTriggered = true;
//            $.post("infiniteScroll", function (data) {
//                document.write("tes");
//                $("#post-wrapper").append(data);
//                $contentLoadTriggered = false;
//            });
//        }
//
//    });
//    $("#showMore").click(function () {
//        if ($contentLoadTriggered == false) {
//            $contentLoadTriggered = true;
//            $.post("infiniteScroll", function (data) {
//                $("#post-box").delay(3000).append(data);
//                $contentLoadTriggered = false;
//            });
//        }
//    });

    // Cache the Window object
    $window = $(window);
    $('section[data-type="background"]').each(function () {
        var $bgobj = $(this); // assigning the object

        $(window).scroll(function () {

// Scroll the background at var speed
// the yPos is a negative value because we're scrolling it UP!								
            var yPos = -($window.scrollTop() / $bgobj.data('speed'));
            // Put together our final background position
            var coords = '50% ' + yPos + 'px';
            // Move the background
            $bgobj.css({backgroundPosition: coords});
        }); // window scroll Ends

    });
});

$(function () {

    var ul_vid = $('#upload-vid ul');

    $('#drop-vid a').click(function () {
        // Simulate a click on the file input button
        // to show the file browser dialog
        $(this).parent().find('input').click();
    });

    // Initialize the jQuery File Upload plugin
    $('#upload-vid').fileupload({
        // This element will accept file drag/drop uploading
        dropZone: $('#drop-vid'),
        // This function is called when a file is added to the queue;
        // either via the browse button, or via drag/drop:
        add: function (e, data) {
            console.log("masuk ke fileupload id upload-vid");

            var tpl_vid = $('<li class="working"><input type="text" value="0" data-width="48" data-height="48"' +
                    ' data-fgColor="#0788a5" data-readOnly="1" data-bgColor="#3e4043" /><p></p><span></span></li>');

            // Append the file name and file size
            tpl_vid.find('p').text(data.files[0].name)
                    .append('<i>' + formatFileSize(data.files[0].size) + '</i>');

            // Add the HTML to the UL element
            data.context = tpl_vid.appendTo(ul_vid);

            // Initialize the knob plugin
            tpl_vid.find('input').knob();

            // Listen for clicks on the cancel icon
            tpl_vid.find('span').click(function () {

                if (tpl_vid.hasClass('working')) {
                    jqXHR.abort();
                }

                tpl_vid.fadeOut(function () {
                    tpl_vid.remove();
                });

            });

            data.context.removeClass('working');
            data.context.find('input').val(100).change();
            // Automatically upload the file once it is added to the queue
//            var jqXHR = data.submit();
            $("#sbmtVid").click(function () {
                var jqXHR = data.submit();
            });
        }
        ,
        progress: function (e, data) {

            // Calculate the completion percentage of the upload
            var progress = parseInt(data.loaded / data.total * 100, 10);

            // Update the hidden input field and trigger a change
            // so that the jQuery knob plugin knows to update the dial
            data.context.find('input').val(progress).change();

            if (progress == 100) {
                data.context.removeClass('working');
            }
        },
        fail: function (e, data) {
            // Something has gone wrong!
            data.context.addClass('error');
        }

    });

    var ul_pict = $('#upload ul');

    $('#drop a').click(function () {
        // Simulate a click on the file input button
        // to show the file browser dialog
        $(this).parent().find('input').click();
    });

    // Initialize the jQuery File Upload plugin
    $('#upload').fileupload({
        // This element will accept file drag/drop uploading
        dropZone: $('#drop'),
        // This function is called when a file is added to the queue;
        // either via the browse button, or via drag/drop:
        add: function (e, data) {
            console.log("masuk ke fileupload id upload");
            $('#sbmtPict').show();
            var tpl = $('<li class="working"><input type="text" value="0" data-width="48" data-height="48"' +
                    ' data-fgColor="#0788a5" data-readOnly="1" data-bgColor="#3e4043" /><p></p><span></span></li>');

            // Append the file name and file size
            tpl.find('p').text(data.files[0].name)
                    .append('<i>' + formatFileSize(data.files[0].size) + '</i>');

            // Add the HTML to the UL element
            data.context = tpl.appendTo(ul_pict);

            // Initialize the knob plugin
            tpl.find('input').knob();

            // Listen for clicks on the cancel icon
            tpl.find('span').click(function () {

                if (tpl.hasClass('working')) {
                    jqXHR.abort();
                }

                tpl.fadeOut(function () {
                    tpl.remove();
                });

            });

            data.context.removeClass('working');
            data.context.find('input').val(100).change();
            // Automatically upload the file once it is added to the queue
//            var jqXHR = data.submit();
            $("#sbmtPict").click(function () {
                var jqXHR = data.submit();
            });

        }
        ,
        progress: function (e, data) {

            // Calculate the completion percentage of the upload
            var progress = parseInt(data.loaded / data.total * 100, 10);

            // Update the hidden input field and trigger a change
            // so that the jQuery knob plugin knows to update the dial
            data.context.find('input').val(progress).change();

            if (progress == 100) {
                data.context.removeClass('working');
            }
        },
        fail: function (e, data) {
            // Something has gone wrong!
            data.context.addClass('error');
            console.log("failed nih kaks");
        }

    });


    // Prevent the default action when a file is dropped on the window
    $(document).on('drop dragover', function (e) {
        e.preventDefault();
    });

    // Helper function that formats the file sizes
    function formatFileSize(bytes) {
        if (typeof bytes !== 'number') {
            return '';
        }

        if (bytes >= 1000000000) {
            return (bytes / 1000000000).toFixed(2) + ' GB';
        }

        if (bytes >= 1000000) {
            return (bytes / 1000000).toFixed(2) + ' MB';
        }

        return (bytes / 1000).toFixed(2) + ' KB';
    }

});