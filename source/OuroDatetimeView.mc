import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Timer;
import Toybox.WatchUi;
using Toybox.System;
using Toybox.Time.Gregorian;
using Toybox.Time;

//! Return the current date as a string
function displayDate(){
    var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
    var dateString = Lang.format(
        "$1$ $2$ $3$ $4$",
        [
        today.day_of_week,
        today.day,
        today.month,
        today.year
        ]
    );
    return dateString;
}

//! Return the current time as a string
function displayTime() {
    var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
    var timeString = Lang.format(
        "$1$:$2$:$3$",
        [
        today.hour.format( "%02d" ),
        today.min.format( "%02d" ),
        today.sec.format( "%02d" ), 
        ]
    );
    return timeString;
    
}


//! Show the three timer callback counts
class OuroDatetimeView extends WatchUi.View {
    private var _date as String = "";
    private var _time as String = "";

    //! Constructor
    public function initialize() {
        WatchUi.View.initialize();
    }

    //! Callback for timer 
    public function callback() as Void {
        _date = displayDate();
        _time = displayTime();
        WatchUi.requestUpdate();
    }

    //! Load your resources here
    //! @param dc Device context
    public function onLayout(dc as Dc) as Void {
        var timer = new Timer.Timer();
        timer.start(method(:callback), 1000, true);

    }

    //! Update the view
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        var string =  _date;
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() / 2 - 15,
            Graphics.FONT_TINY,
            string,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
        var String = _time;
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() / 2 + 15,
            Graphics.FONT_TINY,
            String,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
    }
}
