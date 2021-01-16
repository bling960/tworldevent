
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
        alert("링크 복사 성공!");
        console.log('Fallback: Copying text command was ' + msg);
    } catch (err) {
        console.error('Fallback: Oops, unable to copy', err);
        alert("죄송합니다. 에러가 발생했습니다. 다시 시도해주세요.")
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
  
function openInNewTab(url) {
    var win = window.open(url, "_blank", "toolbar=yes, scrollbars=yes,status=no, resizable=yes,left=500, width=600, height=400");
    win.focus();
}

var Share = {
    defaultOptions: {

        twitterButton: "",
        naverButton: "",
        kakaotalkButton: "",
        facebookButton: "",
        urlcopyButton: "",

        kakaoJavascriptID: "",
        facebookAppID: "",
        url: "",
        title: "",
        solutionTitle: ""
    },
    twitter: function () {
        openInNewTab("https://twitter.com/intent/tweet?url=" + location.href);
    },
    naver: function () {
        openInNewTab("http://blog.naver.com/openapi/share?url=" + location.href);
    },
    kakaotalk: function () {
        // try {
        //     var url = this.defaultOptions.url;

        //     Kakao.Link.sendScrap({
        //         requestUrl: url
        //     });

        // }
        // catch (e) {
        //     alert(e.message);
        // }
    },
    facebook: function () {
        openInNewTab("http://www.facebook.com/sharer.php?u=" + location.href);
    },
    copyLink: function () {
        copyTextToClipboard(location.href);
    }
};

