$(document).ready(function() {

    /*
        ### OPEN DIALOG WITH IMG ###
    */
    const dialog = document.querySelector('dialog');
    const showDialogButton = document.querySelectorAll('.openImage');

    function resetImage() {
        document.querySelector('.dialogImg').setAttribute('src', '');
        document.querySelector('.portfolio-wrapper__element--opened').classList.remove('portfolio-wrapper__element--opened');
    }

    if (! dialog.showModal) {
        dialogPolyfill.registerDialog(dialog);
    }

    showDialogButton.forEach(image => image.addEventListener('click', function() {
        dialog.showModal();
        var imageSrc = image.childNodes[1].getAttribute('src');
        document.querySelector('.dialogImg').setAttribute('src', imageSrc);
        image.classList.add('portfolio-wrapper__element--opened');
    }));
    
    dialog.querySelector('.closeDialog').addEventListener('click', function() {
        dialog.close();
        resetImage();
    });
    
    /*
    Close anywhere
    */
    dialog.addEventListener('click', function (event) {
        var rect = dialog.getBoundingClientRect();
        var isInDialog=(rect.top <= event.clientY && event.clientY <= rect.top + rect.height && rect.left <= event.clientX && event.clientX <= rect.left + rect.width);
        if (!isInDialog) {
            dialog.close();
            resetImage();
        }
    });
    /*
        ### END ###
    */

});
