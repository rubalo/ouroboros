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

  var title; 

    //! Constructor
    public function initialize() {
        BehaviorDelegate.initialize();
        title = WatchUi.loadResource($.Rez.Strings.AppName); 
    }

    //! Handle the menu event
    //! @return true if handled, false otherwise
    public function onMenu() as Boolean {
        // Generate a new Menu with a drawable Title
        var menu = new WatchUi.Menu2({:title=>title});

        // Add menu items for demonstrating toggles, checkbox and icon menu items
        menu.addItem(new WatchUi.MenuItem("Date1", "y0/d0/m0/h1/m2", "date", null));
        menu.addItem(new WatchUi.MenuItem("Edit", null, "edit", null));
        WatchUi.pushView(menu, new $.OuroMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
}