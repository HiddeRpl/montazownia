"use strict";

$(document).ready(function () {
    var lang = $('html')[0].lang;
    console.log(lang);
    var isEnglish = window.location.href.includes("/en/");
    var freeText = isEnglish ? "Free term" : "Wolny termin";
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyBm05DfEhI2Zo0aX9_RO79FQUSxC1ae1xk',
        locale: lang,
        header: {
            left: 'title',
            right: 'prev, next'
        },
        timeFormat: 'H:mm',
        firstDay: 1,
        displayEventEnd: true,
        eventColor: '#3a87ad',
        events: {
            googleCalendarId: 'uud085v5uelfej5jgdfh0ddktk@group.calendar.google.com'
        },
        eventAfterAllRender: function eventAfterAllRender() {
            $('.fc-title').text(freeText);
            $('.fc-clear, .fc-center').remove();

            if ($('.fc-event-container')) {
                $('.fc-event-container').each(function () {
                    var index = $(this).index();
                    $(this).closest('.fc-row').find('.fc-bg td').eq(index).addClass('day--busy');
                    $(this).remove();
                });
            }
        },
        dayClick: function dayClick(date) {
            alert('Date: ' + date.format());
        }
    });
});