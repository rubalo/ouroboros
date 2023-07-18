import Toybox.Time;
import Toybox.Lang;

const DAYS = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
const SECONDSINMINUTE = 60;
const SECONDSINHOUR = 60 * SECONDSINMINUTE;
const SECONDSINDAY = 24 * SECONDSINHOUR;

function isLeapYear(year as Number) {
  return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

function daysInMonth(year as Number, month as Number) {
  return (month == 2 && isLeapYear(year)) ? 29 : DAYS[month - 1];
}

function _elapsed_time(totalSeconds as Number) {
  var duration = {} as Dictionary<String, Number>;

  duration["year"] = totalSeconds / (365 * SECONDSINDAY);
  totalSeconds %= (365 * SECONDSINDAY);

  var year = duration["year"];
  var month = 1;
  while (totalSeconds >= (daysInMonth(year, month) * SECONDSINDAY)) {
    totalSeconds -= (daysInMonth(year, month) * SECONDSINDAY);
    month++;
    if (month > 12) {
      year++;
      month = 1;
    }
  }

  duration["month"] = month - 1;
  duration["day"] = totalSeconds / SECONDSINDAY;
  totalSeconds %= SECONDSINDAY;

  duration["hour"] = totalSeconds / SECONDSINHOUR;
  totalSeconds %= SECONDSINHOUR;

  duration["minute"] = totalSeconds / SECONDSINMINUTE;
  duration["second"] = totalSeconds % SECONDSINMINUTE;

  return duration;
}

function elapsed_time(timestamp1, timestamp2) {
  if (timestamp1 < timestamp2) {
    return _elapsed_time(timestamp2 - timestamp1);
  } else {
    return _elapsed_time(timestamp1 - timestamp2);
  }
}

class TimeElapse {
  var _dt as Dictionary ? ;
  var _timestamp as Number;

 public
  function initialize(timestamp as Number) {
    _timestamp = timestamp;
    update();
  }

 public
  function update() { _dt = elapsed_time(_timestamp, Time.now().value()); }

 public
  function getYearString() {
    if (_dt["year"] == 0) {
      return "0 year";
    } else {
      return _dt["year"] + " years";
    }
  }

 public
  function getMonthString() {
    if (_dt["month"] == 0) {
      return "0 month";
    } else {
      return _dt["month"] + " months";
    }
  }

 public
  function getDayString() {
    if (_dt["day"] == 0) {
      return "0 day";
    } else {
      return _dt["day"] + " days";
    }
  }

 public
  function getHourString() {
    if (_dt["hour"] == 0) {
      return "0 hour";
    } else {
      return _dt["hour"] + " hours";
    }
  }

 public
  function getMinuteString() {
    if (_dt["minute"] == 0) {
      return "0 minute";
    } else {
      return _dt["minute"] + " minutes";
    }
  }

 public
  function getSecondString() {
    if (_dt["second"] == 0) {
      return "0 second";
    } else {
      return _dt["second"] + " seconds";
    }
  }
}
