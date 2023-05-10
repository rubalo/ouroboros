import Toybox.WatchUi;

class OuroDatetimeDelegate extends WatchUi.BehaviorDelegate {

    //! Constructor
    public function initialize() {
        WatchUi.BehaviorDelegate.initialize();
    }

    //! Handle the back key being pressed
    public function onBack() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }
}