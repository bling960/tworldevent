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
//= require turbolinks
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

function fallbackCopyTextToClipboard(text) {
  var textArea = document.createElement("textarea");
  textArea.value = text;
  
  // Avoid scrolling to bottom
  textArea.style.top = "0";
  textArea.style.left = "0";
  textArea.style.position = "fixed";

  document.body.appendChild(textArea);
  textArea.focus();
  textArea.select();

  try {
    var successful = document.execCommand('copy');
    var msg = successful ? 'successful' : 'unsuccessful';
    console.log('Fallback: Copying text command was ' + msg);
  } catch (err) {
    console.error('Fallback: Oops, unable to copy', err);
  }

  document.body.removeChild(textArea);
}
function copyTextToClipboard(text) {
  if (!navigator.clipboard) {
    fallbackCopyTextToClipboard(text);
    return;
  }
  navigator.clipboard.writeText(text).then(function() {
    alert("링크 복사 성공!");
  }, function(err) {
    console.error('Async: Could not copy text: ', err);
    alert("죄송합니다. 에러가 발생했습니다. 다시 시도해주세요.")
  });
}
function CopyLink() {
  copyTextToClipboard(location.href);
}

function openInNewTab(url) {
  var win = window.open(url, '_blank');
  win.focus();
}
function ShareFacebook() {
  openInNewTab("http://www.facebook.com/sharer.php?u=" + location.href)
}

$(document).ready(function(){ 

  let phone = document.getElementById("phone");

  let getPhonePosition = function() {
    let device = $("#detectWidth").css("content");
    let offset = getOffset(phone)
    let phoneForm = document.getElementById("phone-form");

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

    window.onresize = function(event) {
      setTimeout(getPhonePosition, 200);
    };

    setTimeout(getPhonePosition, 800);
    
  }
});