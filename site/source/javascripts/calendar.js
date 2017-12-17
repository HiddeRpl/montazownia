"use strict";

$(document).ready(function () {
    var dictionary={
        "pl":{
            freeTerm: "Wolny termin"
        },
        "en":{
            freeTerm: "Free term"
        }
    };
    var lang = $('html')[0].lang;

    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyBm05DfEhI2Zo0aX9_RO79FQUSxC1ae1xk',
        locale: lang,
        header: {
            left: 'title',
            right: 'prev, next'
        },
        timeFormat: 'H:mm',
        firstDay: 1,
        contentHeight: 500,
        displayEventEnd: true,
        eventColor: '#3a87ad',
        events: {
            googleCalendarId: 'uud085v5uelfej5jgdfh0ddktk@group.calendar.google.com'
        },
        eventAfterRender: function eventAfterRender(event, element, view){
            $('.fc-title').text(dictionary[lang]["freeTerm"]);
            $('.fc-clear, .fc-center').remove();
            if ($('.fc-event-container')) {
                $('.fc-event-container').each(function () {
                    var index = $(this).index();
                    var dayStyleClass;
                    console.log(event.allDay)
                    if (event.allDay){
                        dayStyleClass='day--free';
                    }
                    else
                        dayStyleClass='day--partialy--free';
                    $(this).closest('.fc-row').find('.fc-bg td').eq(index).addClass(dayStyleClass);
                    $(this).remove();
                });
            }
        }
        // dayClick: function dayClick(date) {
        //     alert('Date: ' + date.format());
        // }
    });
});