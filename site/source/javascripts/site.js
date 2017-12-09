$(document).ready(function() {

    /*
        ### NAVBAR TRANSPARENCY ###
    */
    function navbarScroll() {
        const height = $(window).scrollTop();

        if (height > 100) {
            $('.navbarTrans').fadeIn('fast');
        }

        if (height === 0) {
            $('.navbarTrans').fadeOut('fast');
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