import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;



//! This app demonstrates how to use a Timer. Three timers
//! with different callback frequencies will start counting
//! the callbacks and will update the screen with the count.
class OuroApp extends Application.AppBase {

    //! Constructor
    public function initialize() {
        AppBase.initialize();
    }

    //! Handle app startup
    //! @param state Startup arguments
    public function onStart(state as Dictionary?) as Void {
    }

    //! Handle app shutdown
    //! @param state Shutdown arguments
    public function onStop(state as Dictionary?) as Void {
    }

    //! Return the initial view for the app
    //! @return Array Pair [View, Delegate]
    public function getInitialView() as Array<Views or InputDelegates>? {
        var view = new $.OuroView();
        var delegate = new $.OuroDelegate(view);
        return [view, delegate] as Array<Views or InputDelegates>;
    }

}