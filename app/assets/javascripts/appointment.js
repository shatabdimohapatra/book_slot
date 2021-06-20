$(document).ready(function() {
    $("#calendar").fullCalendar({
        header:  {
            left: "prev,next today",
            center: "title",
            right: "month, agendaDay, agendaWeek"
        },
        defaultView: "agendaWeek",
        height: 500,
        slotMinutes: 15,
        events: {
            url: "/appointments",
            color: 'cyan',
            textColor: 'black'
        },
        timeFormat: "h:mma",
        dragOpacity: "0.5",
        allDaySlot: false,
        editable: true,
        selectable: true,
        eventOverlap: false,

        select: function(start, end, allDay) {
            end_at = $.fullCalendar.formatDate(end,'h:mm a');
            start_at = $.fullCalendar.formatDate(start,'ddd, MMM d, h:mm a');
            var when = start_at + ' - ' + end_at;
            $('#eventModal #start_at').val(start);
            $('#eventModal #end_at').val(end);
            $('#eventModal #when').text(when);
            $('#eventModal').modal('show');
        },

        eventDrop: function(event){
            updateEvent(event);
        },

        eventResize: function(event){
            updateEvent(event);
        }
    });

    function updateEvent(event) {
        $.ajax({
            url: '/appointments/'+ event.id,
            type: 'PUT',
            data: { start_at: event.start._d, end_at: event.end._d}
        });
    };
});
