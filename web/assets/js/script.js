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

$(function () {

    var ul = $('#upload ul');

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

            var tpl = $('<li class="working"><input type="text" value="0" data-width="48" data-height="48"' +
                    ' data-fgColor="#0788a5" data-readOnly="1" data-bgColor="#3e4043" /><p></p><span></span></li>');

            // Append the file name and file size
            tpl.find('p').text(data.files[0].name)
                    .append('<i>' + formatFileSize(data.files[0].size) + '</i>');

            // Add the HTML to the UL element
            data.context = tpl.appendTo(ul);

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

            // Automatically upload the file once it is added to the queue
            var jqXHR = data.submit();
        },
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

$(document).ready(function () {
//    $('#generalSetting').hide();
    $('.flyout').hide();
//    $('#post-text').hide();
    $('#privacySetting').hide();
    $('#notifSetting').hide();
    $('.totop').hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.totop').fadeIn();
        } else {
            $('.totop').fadeOut();
        }
    });
    $(".notif, .notif_badge, .flyout").hover(function () {
        $(".flyout").stop().fadeIn();
        $(".notif_badge").hide();
    }, function () {
        $(".flyout").stop().fadeOut();
    });
    $('#generalSettingBtn').click(function () {
        $('#privacySetting').hide();
        $('#notifSetting').hide();
        $('#generalSetting').show();
    });
    $('#privacySettingBtn').click(function () {
        $('#generalSetting').hide();
        $('#notifSetting').hide();
        $('#privacySetting').show();
    });
    $('#notifSettingBtn').click(function () {
        $('#generalSetting').hide();
        $('#privacySetting').hide();
        $('#notifSetting').show();
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

    $("#newQuote, #newLink").click(function () {
        $("#usr_post_menu").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '+=300px'}, 500, function () {
                $("#post-quote").stop().fadeIn();
            });
        });
    });

    $("#newText").click(function () {
        $("#usr_post_menu").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '+=300px'}, 500, function () {
                $("#post-text").stop().fadeIn();
            });
        });
    });

    $("#newPict").click(function () {
        $("#usr_post_menu").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '+=300px'}, 500, function () {
                $("#post-picture").stop().fadeIn();
            });
        });
    });

    $(".cancelBtn").click(function () {
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
        $("#post-text").stop().fadeOut("slow", function () {
            $("#user-post").stop().animate({height: '130px'}, 500, function () {
                $("#usr_post_menu").stop().fadeIn();
            });
        });

    });

    $contentLoadTriggered = false;
    $(window).scroll(function () {
        if ($(window).scrollTop() + $(window).height() == $(document).height()) {
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
