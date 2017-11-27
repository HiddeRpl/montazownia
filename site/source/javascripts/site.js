$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyBm05DfEhI2Zo0aX9_RO79FQUSxC1ae1xk',
        header: {
            left: 'prev, next today',
            center: 'title',
            right: 'month, basicWeek, basicDay'
        },
        height: 700,
        timeFormat: 'H:mm',
        firstDay: 1,
        dayNames: [ 'Niedziela', 'Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piatek', 'Sobota'],
        dayNamesShort: ['Niedz', 'Pon', 'Wt', 'Śr', 'Czw', 'Pt', 'Sob'],
        displayEventEnd: true,
        eventColor: '#3a87ad',
        eventSources: [
            {
                googleCalendarId: 'montazownia.tattoo@gmail.com', //montazownia calendar
            },
            {
                googleCalendarId: '8mlrp5c1kuslrt6q3pp5abcuto@group.calendar.google.com', //laser hard calendar
            },
            {
                googleCalendarId: '880rmk27v04c37gtert5qin4s8@group.calendar.google.com', //laser soft calendar
            },
            {
                googleCalendarId: 'i51jdjg50gnmr9a7mc5rr4im5s@group.calendar.google.com', //private calendar
            },
            {
                googleCalendarId: '60cecrdf8t9lg6g0ldunrdtuo4@group.calendar.google.com', //tattoo hard calendar
            },
            {
                googleCalendarId: 'tpkrkqf9h18ait78i63gm4qr5s@group.calendar.google.com', //tattoo undefined calendar
            },
            {
                googleCalendarId: 'uo5vhkk4togfp51j1ttoedpdo0@group.calendar.google.com', //tattoo soft calendar
            }
        ]

    });
    setTimeout(function () {
        $('.fc-title').text("Zajęty(a)");
    }, 400);
});

