import Toybox.WatchUi;
import Toybox.Graphics;


class OuroEditView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    public function onLayout(dc as Dc){
        setLayout($.Rez.Layouts.OuroEditLayout(dc));
    }

    public function onUpdate(dc as Dc) as Void{
        View.onUpdate(dc);
    }

    public function onShow() as Void{
    }

    public function onHide()  as Void{
    }

}