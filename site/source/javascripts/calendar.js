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
        // eventAfterRender: function eventAfterRender(event, element, view){
        //     console.log(event.allDay)
        //     view['type']=(event.allDay) ? 'day--free' :'day--partialy--free';
        // },
        eventAfterAllRender: function eventAfterRender(view){
            $('.fc-title').text(dictionary[lang]["freeTerm"]);
            $('.fc-clear, .fc-center').remove();
            if ($('.fc-event-container')) {
                $('.fc-event-container').each(function () {
                    var index = $(this).index(); 
                    $(this).closest('.fc-row').find('.fc-bg td').eq(index).addClass('day--free');
                    $(this).remove();
                });
            }
        }
        // dayClick: function dayClick(date) {
        //     alert('Date: ' + date.format());
        // }
    });
});