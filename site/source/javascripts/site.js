$(document).ready(function() {

    // ### NAVBAR TRANSPARENCY ###
    $(window).scroll(function () {
        const height = $(window).scrollTop();

        if (height > 100) {
            $('.navbarTrans').removeClass('mdl-layout__header--transparent');
        }

        if (height === 0) {
            $('.navbarTrans').addClass('mdl-layout__header--transparent');
        }
    });
    // ### END ###

    // ### OPEN DIALOG WITH IMG ###
    const dialog = document.querySelector('dialog');
    const showDialogButton = document.querySelectorAll('.openImage');
    let imageSrc;

    function resetImage() {
        document.querySelector('.dialogImg').setAttribute('src', '');
        document.querySelector('.portfolio-wrapper__element--opened')
            .classList.remove('portfolio-wrapper__element--opened');
    }

    if (! dialog.showModal) {
        dialogPolyfill.registerDialog(dialog);
    }
    showDialogButton.forEach(image => image.addEventListener('click', function() {
        dialog.showModal();
        imageSrc = image.childNodes[1].getAttribute('src');
        document.querySelector('.dialogImg').setAttribute('src', imageSrc);
        image.classList.add('portfolio-wrapper__element--opened')
    }));
    dialog.querySelector('.closeDialog').addEventListener('click', function() {
        dialog.close();
        resetImage();
    });

    // Close anywhere
    dialog.addEventListener('click', function (event) {
        var rect = dialog.getBoundingClientRect();
        var isInDialog=(rect.top <= event.clientY && event.clientY <= rect.top + rect.height && rect.left <= event.clientX && event.clientX <= rect.left + rect.width);
        if (!isInDialog) {
            dialog.close();
            resetImage()
        }
    });
    // ### END ###
});