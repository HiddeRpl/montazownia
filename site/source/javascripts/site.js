'use strict';

$(document).ready(function () {

    /*
        ### NAVBAR TRANSPARENCY ###
    */
    // function navbarScroll() {
    //     var height = $(window).scrollTop();
    //
    //     if (height > 100) {
    //         $('.navbarTrans').fadeIn('fast');
    //     }
    //
    //     if (height === 0) {
    //         $('.navbarTrans').fadeOut('fast');
    //     }
    //
    // }
    var urlArray = location.pathname.split('/');

    if (urlArray[2] === undefined) {
        setTimeout(function () {
            $('.navbarTrans').fadeIn();
        }, 1200)
    } else {
        $('.navbarTrans').show();
    }

    $(window).scroll(function () {
        navbarScroll();
    });
    /*
        ### END ###
    */
});