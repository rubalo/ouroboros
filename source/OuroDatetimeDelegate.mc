import Toybox.WatchUi;

class OuroDatetimeDelegate extends WatchUi.BehaviorDelegate {

    //! Constructor
    public function initialize() {
        WatchUi.BehaviorDelegate.initialize();
    }

    //! Handle the back key being pressed
    public function onSelect() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }

    //! Handle the back key being pressed
    public function onNextPage() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }

    public function  onBack() {
        return true;
    }
}