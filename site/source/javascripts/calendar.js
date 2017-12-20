"use strict";

$(document).ready(function () {
    var dictionary = {
        "pl": {
            freeTerm: "Wolny termin"
        },
        "en": {
            freeTerm: "Free term"
        }
    };
    var lang = $('html')[0].lang;
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyBm05DfEhI2Zo0aX9_RO79FQUSxC1ae1xk',
        locale: lang,
        header: {
            left: 'prev',
            center: 'title',
            right: 'next'
        },
        timeFormat: 'H:mm',
        firstDay: 1,
        contentHeight: 500,
        displayEventEnd: true,
        eventColor: '#3a87ad',
        events: {
            googleCalendarId: 'uud085v5uelfej5jgdfh0ddktk@group.calendar.google.com'
        },
        eventAfterAllRender: function eventAfterAllRender() {
            $('.fc-title').text(dictionary[lang]['freeTerm']);
            $('.fc-clear').remove();

            if ($('.fc-event-container')) {
                $('.fc-content-skeleton tr:first-of-type .fc-event-container').each(function () {
                    var index = $(this).index();
                    $(this).closest('.fc-row').find('.fc-bg td').eq(index).addClass('day--free');
                    $('.fc-event-container').css('visibility', 'hidden');
                });
            }

            if ($('.fc-time')) {
                $('.fc-content-skeleton tr:first-of-type .fc-time').each(function () {
                    var index = $(this).closest('.fc-event-container').index();
                    $(this).closest('.fc-row').find('.fc-bg td').eq(index).addClass('day--partially');
                });
            }
        }
        // dayClick: function dayClick(date) {
        //     alert('Date: ' + date.format());
        // }
    });
});