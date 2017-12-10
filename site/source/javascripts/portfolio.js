'use strict';

$(document).ready(function () {

    /*
        ### OPEN DIALOG WITH IMG ###
    */
    var dialog = document.querySelector('dialog');
    var showDialogButton = document.querySelectorAll('.openImage');

    function resetImage() {
        document.querySelector('.dialogImg').setAttribute('src', '');
    }

    if (!dialog.showModal) {
        dialogPolyfill.registerDialog(dialog);
    }

    showDialogButton.forEach(function (image) {
        return image.addEventListener('click', function () {
            var imageSrc = image.childNodes[1].getAttribute('src');
            dialog.showModal();
            document.querySelector('.dialogImg').setAttribute('src', imageSrc);
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
});