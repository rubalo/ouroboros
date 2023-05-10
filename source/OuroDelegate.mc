//
// Copyright 2016-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Graphics;

//! Input handler to stop timer on menu press
class OuroDelegate extends WatchUi.BehaviorDelegate {
  //! Constructor
  //! @param view The app view
 public
  function initialize(view as OuroView) {
    WatchUi.BehaviorDelegate.initialize();
  }

  //! Called when the menu button is pressed
  //! @return true if the event was handled
  public function onMenu(){
    var view =  new OuroDatetimeView();
    var delegate = new OuroDatetimeDelegate();
    WatchUi.pushView(view, delegate, WatchUi.SLIDE_LEFT);
    return true;
  }
}