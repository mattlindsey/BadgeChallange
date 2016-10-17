var VideoRunner = {

    setup: function() {
        var popupDiv = $('<div id="videoPlay"></div>');
        popupDiv.hide().appendTo($('body'));
        $('#watch').click(VideoRunner.watch);
    },

    watch: function (){
        var v = document.getElementById('watch')
        var user_id = v.dataset.userId;
        $.ajax({type: 'GET',
            url:  this.formAction,
            data: JSON.stringify({ user_id: user_id }),
            timeout: 5000,
            success: VideoRunner.showVideo,
            error: function(xhrObj, textStatus, exception) {alert('Error!');}
        })
        return(false);
    },

    showVideo: function(data, requestStatus, xhrObject) {
        // center a floater 1/2 as wide and 1/4 as tall as screen
        var oneFourth = Math.ceil($(window).width() / 4);
        $('#videoPlay').
        css({'left': oneFourth,  'width': 2*oneFourth, 'top': 250}).
        html(data).
        show();
        // make the Close link in the hidden element work
        $('#closeLink').click(VideoRunner.hideVideoPlay);
        return(false);  // prevent default link action
    },

    hideVideoPlay: function() {
        $('#videoPlay').hide();
        $(document).refresh();
        return(false);
    }
}
$(VideoRunner.setup);  // run setup when document ready
