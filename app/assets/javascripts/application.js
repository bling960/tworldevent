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
//= require libs/bootstrap.min
//= require share
//= require_tree .


function getOffset(obj) {
  var curtop = 0;
  if (obj.offsetTop) {
    curtop += parseInt(obj.offsetTop);
  }
  if (obj.scrollTop && obj.scrollTop > 0) {
    curtop -= parseInt(obj.scrollTop);
  }
  if (obj.offsetParent) {
      var pos = getOffset(obj.offsetParent);
      curtop += pos;
  } 
  else if (obj.ownerDocument) {
      var thewindow = obj.ownerDocument.defaultView;
      if(!thewindow && obj.ownerDocument.parentWindow)
          thewindow = obj.ownerDocument.parentWindow;
      if(thewindow) {
          if(thewindow.frameElement) {
              var pos = getOffset(thewindow.frameElement);
              curtop += pos[1];
          }
      }
  }
  return curtop;
}


$(document).ready(function(){ 

  var phone = document.getElementById("phone");

  var getPhonePosition = function() {
    var device = $("#detectWidth").css("content");
    var offset = getOffset(phone)
    var phoneForm = document.getElementById("phone-form");

    if (device == '"large"')
      offset -= 140;
    else if (device == '"desktop"')
      offset -= 110;
    else
      offset -= 90;

    phone.style.height = (phoneForm.clientHeight + 10) + "px";
    phoneForm.style.top = offset + "px";
  }

  if (phone) {

    window.onload = function() {
      setTimeout(getPhonePosition, 800);
    }

    window.onresize = function() {
      setTimeout(getPhonePosition, 200);
    };

    setTimeout(getPhonePosition, 800);
    
  }
});