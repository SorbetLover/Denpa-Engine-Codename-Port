import funkin.backend.Conductor;
import funkin.menus.PauseSubState;
import funkin.game.PlayState;
import flixel.addons.display.FlxBackdrop;

function create(event) {
    backdrop = new FlxBackdrop().loadGraphic(Paths.image("menuBGHexL6"));
    add(backdrop);
    backdrop2 = new FlxBackdrop().loadGraphic(Paths.image("menuBGHexL6"));
    add(backdrop2);
    backdrop.velocity.set(29,30);
    backdrop2.velocity.set(-29,-30);
    event.music = "property-surgery";

    backdrop.antialiasing = true;
    backdrop2.antialiasing = true;
}
