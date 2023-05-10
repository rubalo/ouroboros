import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Timer;
import Toybox.WatchUi;
using Toybox.System;
using Toybox.Time.Gregorian;
using Toybox.Time;

//! Return the current date as a string
function displayDate() {
  var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
  var dateString =
      Lang.format("$1$ $2$ $3$ $4$",
                  [ today.day_of_week, today.day, today.month, today.year ]);
  return dateString;
}

//! Return the current time as a string
function displayTime() {
  var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
  var timeString = Lang.format("$1$:$2$:$3$", [
    today.hour.format("%02d"),
    today.min.format("%02d"),
    today.sec.format("%02d"),
  ]);
  return timeString;
}

//! Show the three timer callback counts
class OuroDatetimeView extends WatchUi.View {
 private
  var _dateLabel as Text?;
 private
  var _timeLabel as Text?;

  //! Constructor
 public
  function initialize() { WatchUi.View.initialize(); }

  //! Callback for timer
 public
  function callback() as Void {
    WatchUi.requestUpdate();
  }

  //! Load your resources here
  //! @param dc Device context
 public
  function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.DateTimeLayout(dc));

    var timer = new Timer.Timer();
    timer.start(method( : callback), 1000, true);
    
    _dateLabel = WatchUi.View.findDrawableById("DateLabel") as Text;
    _timeLabel = WatchUi.View.findDrawableById("TimeLabel") as Text;
    WatchUi.requestUpdate();
  }

  //! Update the view
  //! @param dc Device Context
 public
  function onUpdate(dc as Dc) as Void {
    dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    dc.clear();
    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    if (_dateLabel != null) {
        _dateLabel.setText(displayDate());
    }
    if (_timeLabel != null) {
        _timeLabel.setText(displayTime());
    }
    View.onUpdate(dc);
  }
}
