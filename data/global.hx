import funkin.backend.utils.WindowUtils;
import openfl.Lib;
import lime.graphics.Image;



import funkin.backend.utils.WindowUtils;

function postStateSwitch() {
    if(FlxG.random.bool(50)){
        WindowUtils.winTitle = "Friday Night Funkin' - Denpa Engine";
    } else {
        WindowUtils.winTitle = "Friday Night Funkin' - Depia Enggin";

    }
}

function destroy() {
    WindowUtils.resetTitle();
}



static var redirectStates:Map<FlxState, String> = [
    MainMenuState => "DenpaMain",
];

function preStateSwitch() {
    for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

