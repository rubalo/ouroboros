import Toybox.Time;
import Toybox.Lang;

function timeDifference(date as Time.Moment) {
  var today = new Time.Moment(Time.today().value());
  var duration = today.subtract(date);
  duration = duration.value();

  var years = duration / (365 * 24 * 3600);  // Calculate the number of years
  duration -= years * (365 * 24 * 3600);
  var months = duration / (30 * 24 * 3600);  // Calculate the number of months
  duration -= months * (30 * 24 * 3600);
  var days = duration / (24 * 3600);  // Calculate the number of days
  duration -= days * (24 * 3600);
  var hours = duration / 3600;  // Calculate the number of hours
  duration -= hours * 3600;
  var minutes = duration / 60;  // Calculate the number of minutes
  var seconds = duration % 60;  // Calculate the number of seconds

  var elapsedTimeString = Lang.format(
      "$1$ years, $2$ months, $3$ days \n $4$ hours, $5$ minutes, $6$ " +
          "seconds\n",
      [ years, months, days, hours, minutes, seconds ]);

  return elapsedTimeString;
}