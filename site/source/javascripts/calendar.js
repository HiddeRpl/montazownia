$(document).ready(function() {
    const isEnglish = window.location.href.includes("/en/");
    const freeText = isEnglish? "Free term" : "Wolny termin";
    const calendarDays =  isEnglish ? [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'] : [ 'Niedziela', 'Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piatek', 'Sobota'];
    const calendarDaysShort = isEnglish ? ['Sun', 'Mon', 'Tu', 'Wed', 'Thu', 'Fri', 'Sat'] : ['Niedz', 'Pon', 'Wt', 'Śr', 'Czw', 'Pt', 'Sob']; 
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyBm05DfEhI2Zo0aX9_RO79FQUSxC1ae1xk',
        header: {
            left: 'prev, next today',
            center: 'title',
            right: 'month, basicWeek, basicDay'
        },
        timeFormat: 'H:mm',
        firstDay: 1,
        dayNames: calendarDays,
        dayNamesShort: calendarDaysShort,
        displayEventEnd: true,
        eventColor: '#3a87ad',
        eventSources: [
            {
                googleCalendarId: 'uud085v5uelfej5jgdfh0ddktk@group.calendar.google.com' //wolne
            }
        ],
        eventAfterAllRender: function() {
            $('.fc-title').text(freeText);
        },
        dayClick: function(date) {
            alert('Date: ' + date.format());
        }
    });
});
