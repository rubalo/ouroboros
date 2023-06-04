import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Timer;
import Toybox.WatchUi;
using Toybox.Application.Storage;
using Toybox.Time.Gregorian;
using Toybox.Time;
using Toybox.System;

const INITIAL_TIMESTAMP = 1672527600;

//! Load timestamp from the storage
function loadTimestampFromStorage() {
  var timestamp = Storage.getValue("timestamp");
  if (timestamp != null) {
    return timestamp;
  }
  return INITIAL_TIMESTAMP;
}

//! Save timestamp to the storage
function saveTimestampToStorage(timestamp) {
  Storage.setValue("timestamp", timestamp);
}

//! Show the three timer callback counts
class OuroDatetimeView extends WatchUi.View {
 private
  var _dateLabel as Text ? ;
 private
  var _timeLabel as Text ? ;
 private
  var _elapsed as TimeElapse ? ;

  //! Constructor
 public
  function initialize() { WatchUi.View.initialize(); }

  //! Callback for timer
 public
  function callback() as Void { WatchUi.requestUpdate(); }

  //! Load your resources here
  //! @param dc Device context
 public
  function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.DateTimeLayout(dc));
    var elapsedMoment = new Time.Moment(loadTimestampFromStorage());
    _elapsed = new TimeElapse(elapsedMoment);
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

    _elapsed.update();

    if (_dateLabel != null) {
      displayElapsedDate();
    }
    if (_timeLabel != null) {
      displayElapsedTime();
    }
    View.onUpdate(dc);
  }

  function displayElapsedDate() as Void {
    var dateString = Lang.format("$1$\n$2$\n$3$", [
      _elapsed.getYearString(), _elapsed.getMonthString(),
      _elapsed.getDayString()
    ]);
    _dateLabel.setText(dateString);
  }

  function displayElapsedTime() as Void {
    var timeString = Lang.format("$1$\n$2$\n$3$", [
      _elapsed.getHourString(),
      _elapsed.getMinuteString(),
      _elapsed.getSecondString(),
    ]);
    _timeLabel.setText(timeString);
  }
}
