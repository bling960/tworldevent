// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require libs/jquery-2.1.0.min
//= require jquery_ujs
//= require libs/bootstrap.min
//= require libs/kakao.min
//= require libs/aos.min
//= require share
//= require_tree .

var ONLYONETIME_EXECUTE = null;

$(window).scroll(function() {
    if (document.querySelector(".video-overlay")) {
        var scroll = $(window).scrollTop();
        var box = $('.video-overlay').height();
        var header = $('header').height();

        if (scroll >= box - header) {
        $("header").addClass("background-header");
        } else {
        $("header").removeClass("background-header");
        }
    }
});

$(document).ready(function() {
    Kakao.init("fd91668c1400d5c353e5c8a8aa4d6cd9");
    AOS.init({
        // Global settings:
        // startEvent: 'turbolinks:load', // name of the event dispatched on the document, that AOS should initialize on
    });

    var video = document.getElementById("bg-video");

    if (video) {
        if (ONLYONETIME_EXECUTE == null) {   

            video.play();

            ONLYONETIME_EXECUTE = 0;
        }

        document.body.addEventListener('touchstart', function(e){
        
            if (ONLYONETIME_EXECUTE == null) {   

                video.play();

                ONLYONETIME_EXECUTE = 0;
            }

        }, false);
    }
});

