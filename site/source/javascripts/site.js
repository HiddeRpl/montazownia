// ### NAVBAR TRANSPARENCY ###
$(window).scroll(function() {
    const height = $(window).scrollTop();

    if(height  > 100) {
        $('.navbarTrans').removeClass('mdl-layout__header--transparent');
    }

    if(height === 0) {
        $('.navbarTrans').addClass('mdl-layout__header--transparent');
    }
});
// ### END ###