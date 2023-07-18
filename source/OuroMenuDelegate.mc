import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class OuroMenuDelegate extends WatchUi.Menu2InputDelegate {

    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item) as Void {
        var id = item.getId() as String;
        if (id.equals("date") ) {
            WatchUi.pushView(new $.OuroDatetimeView(), new $.OuroDatetimeDelegate(), WatchUi.SLIDE_UP);
        } else if (id.equals("edit")) { 
            WatchUi.pushView(new $.OuroEditView(), new $.OuroEditDelegate(), WatchUi.SLIDE_UP);
        } 
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}