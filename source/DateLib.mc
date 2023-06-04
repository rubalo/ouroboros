import Toybox.Time;
import Toybox.Lang;

class TimeElapse {
  var years as Number ? ;
  var months as Number ? ;
  var days as Number ? ;
  var hours as Number ? ;
  var minutes as Number ? ;
  var seconds as Number ? ;
  var _date as Time.Moment;

 public
  function initialize(date as Time.Moment) {
    _date = date;
    update();
  }

 public
  function update() {
    var today = new Time.Moment(Time.now().value());
    var duration = today.subtract(_date);
    duration = duration.value();

    years = duration / (365 * 24 * 3600);  // Calculate the number of years
    duration -= years * (365 * 24 * 3600);

    months = duration / (30 * 24 * 3600);  // Calculate the number of months
    duration -= months * (30 * 24 * 3600);

    days = duration / (24 * 3600);  // Calculate the number of days
    duration -= days * (24 * 3600);

    hours = duration / 3600;  // Calculate the number of hours
    duration -= hours * 3600;

    minutes = duration / 60;  // Calculate the number of minutes

    seconds = duration % 60;  // Calculate the number of seconds
  }

 public
  function getYearString() {
    if (years == 0) {
      return "0 year";
    } else {
      return years + " years";
    }
  }

 public
  function getMonthString() {
    if (months == 0) {
      return "0 month";
    } else {
      return months + " months";
    }
  }

 public
  function getDayString() {
    if (days == 0) {
      return "0 day";
    } else {
      return days + " days";
    }
  }

 public
  function getHourString() {
    if (hours == 0) {
      return "0 hour";
    } else {
      return hours + " hours";
    }
  }

 public
  function getMinuteString() {
    if (minutes == 0) {
      return "0 minute";
    } else {
      return minutes + " minutes";
    }
  }

 public
  function getSecondString() {
    if (seconds == 0) {
      return "0 second";
    } else {
      return seconds + " seconds";
    }
  }
}