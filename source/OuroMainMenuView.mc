import Toybox.WatchUi;
import Toybox.Graphics;

class OuroMainMenuView extends WatchUi.View {
    
    //! Constructor
    function initialize() {
        View.initialize();
    }

    //! Load the resources here
    //! @param dc Device Context
    public function onLayout(dc as Dc) {
        //setLayout(Rez.Layouts.MainLayout(dc));
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    public function onShow() as Void{
    }

    //! Update the view
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
    }


    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    public function onHide() as Void {
    }


}