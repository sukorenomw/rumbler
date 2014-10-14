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

    var thumb = $('img#thumb');

    new AjaxUpload('imageUpload', {
        action: $('form#newHotnessForm').attr('action'),
        name: 'image',
        onSubmit: function (file, extension) {
            $('div.preview').addClass('loading');
        },
        onComplete: function (file, response) {
            thumb.load(function () {
                $('div.preview').removeClass('loading');
                thumb.unbind();
            });
            thumb.attr('src', response);
        }
    });

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
