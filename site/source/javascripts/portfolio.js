'use strict';

$(document).ready(function () {

    /*
        ### OPEN DIALOG WITH IMG ###
    */
    var dialog = document.querySelector('dialog');
    var showDialogButton = document.querySelectorAll('.openImage');

    function resetImage() {
        document.querySelector('.dialogImg').setAttribute('src', '');
        document.querySelector('.dialogImg').setAttribute('data-index', '');
    }

    if (!dialog.showModal) {
        dialogPolyfill.registerDialog(dialog);
    }

    showDialogButton.forEach(function (image) {
        return image.addEventListener('click', function () {
            var imageSrc = image.childNodes[1].getAttribute('src');
            var imageIndex = image.childNodes[1].getAttribute('data_index');
            dialog.showModal();
            document.querySelector('.dialogImg').setAttribute('src', imageSrc);
            document.querySelector('.dialogImg').setAttribute('data_index', imageIndex);
        });
    });

    dialog.querySelector('.closeDialog').addEventListener('click', function () {
        dialog.close();
        resetImage();
    });

    /*
    Close anywhere
    */
    dialog.addEventListener('click', function (event) {
        var rect = dialog.getBoundingClientRect();
        var isInDialog = rect.top <= event.clientY && event.clientY <= rect.top + rect.height && rect.left <= event.clientX && event.clientX <= rect.left + rect.width;
        if (!isInDialog) {
            dialog.close();
            resetImage();
        }
    });
    /*
        ### END ###
    */

    /*
        ### IMAGE SLIDER ###
    */

    var prevButton = document.querySelector('.prevImage');
    var nextButton = document.querySelector('.nextImage');

    function slider(direction) {
        var dialogImg = document.querySelector('.dialogImg');
        var imgIndex = parseInt(dialogImg.getAttribute('data_index'));
        var isReachRange = imgIndex + direction > showDialogButton.length - 1 || imgIndex + direction < 0;
        if (isReachRange) return;
        var img = document.querySelector('.thumbnail[data_index="' + (imgIndex + direction) + '"]');
        var imgSrc = img.getAttribute('src');
        var imgIndex = img.getAttribute('data_index');
        $('.dialogImg').fadeOut('fast', function () {
            dialogImg.setAttribute('src', imgSrc);
            dialogImg.setAttribute('data_index', imgIndex);
            $('.dialogImg').fadeIn('fast');
        });
    }

    nextButton.addEventListener('click', function () {
        slider(1);
    });
    prevButton.addEventListener('click', function () {
        slider(-1);
    });
    document.addEventListener('keydown', function (e) {
        var isDialogOpen = document.querySelector('.dialog-content').hasAttribute('open');
        if (isDialogOpen) {
            if (e.keyCode === 37) {
                slider(-1);
            } else if (e.keyCode === 39) {
                slider(1);
            }
        }
    });
    /*
        ### END ###
    */
});