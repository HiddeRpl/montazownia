'use strict';

$(document).ready(function () {
    $(".showAnswer").on('click', function () {
        $(this).siblings('.answerShown').slideToggle('fast');
        $(this).find('.rotateIcon').toggleClass('question__title__icon--active');
    });
});