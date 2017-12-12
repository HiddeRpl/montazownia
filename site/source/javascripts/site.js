'use strict';

$(document).ready(function () {

    /*
        ### NAVBAR TRANSPARENCY ###
    */
    function navbarScroll() {
        var height = $(window).scrollTop();
        var urlArray = location.pathname.split('/');

        if (urlArray[2] !== "") {
            $('.navbarTrans').show();
        } else {
            if (height > 100) {
                $('.navbarTrans').fadeIn('fast');
            }

            if (height === 0) {
                $('.navbarTrans').fadeOut('fast');
            }
        }
    }
    navbarScroll();

    $(window).scroll(function () {
        navbarScroll();
    });
    /*
        ### END ###
    */
});