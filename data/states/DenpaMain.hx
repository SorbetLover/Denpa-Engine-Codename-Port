import funkin.editors.EditorPicker;
import funkin.options.OptionsMenu;
import funkin.menus.ModSwitchMenu;
import flixel.addons.display.FlxBackdrop;
import funkin.menus.credits.CreditsMain;
import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;

var bg:FunkinSprite;
var gradient:FunkinSprite;

var backdrop:FlxBackdrop;
var backdrop2:FlxBackdrop;

var story:FunkinSprite;
var freeplay:FunkinSprite;
var credits:FunkinSprite;
var options:FunkinSprite;
var patches:FunkinSprite;

var logo:FunkinSprite;

var errorText:FlxText;
function create(){
    bg = new FunkinSprite().loadGraphic(Paths.image("menus/menuDesat"));
    add(bg);
    
    backdrop = new FlxBackdrop().loadGraphic(Paths.image("menuBGHexL6"));
    add(backdrop);
    backdrop2 = new FlxBackdrop().loadGraphic(Paths.image("menuBGHexL6"));
    add(backdrop2);
    backdrop.velocity.set(29,30);
    backdrop2.velocity.set(-29,-30);
    
    logo = new FunkinSprite();
    logo.frames = Paths.getSparrowAtlas("menus/titlescreen/logo");
    logo.animation.addByPrefix("beat", "logo bumpin0", 24);
    logo.animation.pause();
	// logo.setGraphicSize(Std.int(0.55));
    logo.scale.set(0.9,0.9);
    logo.updateHitbox();

    add(logo);
    logo.screenCenter();
    logo.y -= 110;


    gradient = new FunkinSprite().loadGraphic(Paths.image("gradient"));
    add(gradient);

    story = new FunkinSprite();
    story.frames = Paths.getSparrowAtlas("menus/mainmenu/menu_story_mode");
    add(story);

    freeplay = new FunkinSprite();
    freeplay.frames = Paths.getSparrowAtlas("menus/mainmenu/menu_freeplay");
    add(freeplay);
    
    options = new FunkinSprite();
    options.frames = Paths.getSparrowAtlas("menus/mainmenu/menu_options");
    add(options);
    
    credits = new FunkinSprite();
    credits.frames = Paths.getSparrowAtlas("menus/mainmenu/menu_credits");
    add(credits);
    
    patches = new FunkinSprite();
    patches.frames = Paths.getSparrowAtlas("menus/mainmenu/menu_patch");
    add(patches);
    
    addg = [story, freeplay, credits, options, patches];
    for(i in 0...5){
        addg[i].x = 135 + (i * addg[i].width);
        addg[i].y = 450;
    }

    story.animation.addByPrefix("idle", "story_mode basic0", 24);
    story.animation.addByPrefix("selected", "story_mode white0", 24);
    
    freeplay.animation.addByPrefix("idle", "freeplay basic0", 24);
    freeplay.animation.addByPrefix("selected", "freeplay white0", 24);
    
    options.animation.addByPrefix("idle", "options basic0", 24);
    options.animation.addByPrefix("selected", "options white0", 24);
    
    credits.animation.addByPrefix("idle", "credits basic0", 24);
    credits.animation.addByPrefix("selected", "credits white0", 24);
    
    patches.animation.addByPrefix("idle", "patch basic0", 24);
    patches.animation.addByPrefix("selected", "patch white0", 24);
    
    for(e in members){
        e.antialiasing = true;
    }

    FlxG.mouse.visible = true;
    Conductor.changeBPM(100);
    CoolUtil.playMenuSong();
}
function songJsonPopup() {
    // trace(poop + '\'s .ogg does not exist!');
    FlxG.sound.play(Paths.sound('invalidJSON'));
    FlxG.camera.shake(0.05, 0.05);
    var funnyText = new FlxText(12, FlxG.height - 24, 0, "This wont be made u silly! \nWe dont need it :P");
    funnyText.scrollFactor.set();
    funnyText.screenCenter();
    funnyText.x = 5;
    funnyText.y = FlxG.height/2 - 64;
    funnyText.setFormat("VCR OSD Mono", 64, FlxColor.RED, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    add(funnyText);
    FlxTween.tween(funnyText, {alpha: 0}, 0.9, {
        onComplete: _ -> {
            remove(funnyText, true);
            funnyText.destroy();
        }
    });
}
function update(){
    if (FlxG.keys.justPressed.SEVEN) {
		persistentUpdate = false;
		persistentDraw = true;
		openSubState(new EditorPicker());
	}

	if (controls.SWITCHMOD) {
		openSubState(new ModSwitchMenu());
		persistentUpdate = false;
		persistentDraw = true;
	}

	if(controls.BACK){
		FlxG.switchState(new TitleState());
	}
	if(controls.RESET){
		FlxG.switchState(new MainMenuState());
	}	

    if(FlxG.mouse.justPressed){
        if(FlxG.mouse.overlaps(story)){
            FlxG.switchState(new StoryMenuState());
        } else
        if(FlxG.mouse.overlaps(freeplay)){
            FlxG.switchState(new FreeplayState());
        } else
        if(FlxG.mouse.overlaps(credits)){
            FlxG.switchState(new CreditsMain());
        } else
        if(FlxG.mouse.overlaps(options)){
            FlxG.switchState(new OptionsMenu());
        } else
        if(FlxG.mouse.overlaps(patches)){
            // FlxG.switchState(new OptionsMenu());
            songJsonPopup();
        }
        
    }
    bg.scale.x = FlxMath.lerp(bg.scale.x, 1, 0.06);
    bg.scale.y = bg.scale.x;

    for(i in [story, freeplay, credits, options, patches]){
        if(FlxG.mouse.overlaps(i)){
            i.playAnim("selected");
        } else {
            i.playAnim("idle");
            // trace("cj");
        }
    }
}

function beatHit(){
    if(curBeat % 2 == 0){
        bg.scale.set(1.03,1.03);
        logo.playAnim("beat", true);
    }
}