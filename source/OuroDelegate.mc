//
// Copyright 2016-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Lang;
import Toybox.WatchUi;

//! Input handler to stop timer on menu press
class OuroDelegate extends WatchUi.BehaviorDelegate {
 private
  var _view as OuroView;

  //! Constructor
  //! @param view The app view
 public
  function initialize(view as OuroView) {
    WatchUi.BehaviorDelegate.initialize();
    _view = view;
  }

}