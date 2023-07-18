import Toybox.WatchUi;


class OuroEditDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    public function onBack(){
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }
}