import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
var sideText:FlxText;
function postCreate(){
    sideText = new FlxText(20,300,1000,"Max Combo", 0xFFFFFFFF, 3);
    add(sideText);
    sideText.setFormat(Paths.font("vcr.ttf"), 20, 0xFFFFFFFF, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, 0xFF000000 );
    sideText.cameras = [camHUD];
}
var maxCombo:Int = 0;
var perfects:Int = 0;
var sicks:Int = 0;
var goods:Int = 0;
var bads:Int = 0;
var shits:Int = 0;
var wtfs:Int = 0;
var misses:Int = 0;

// perfect and wtf doesnt exist here :(
function onPlayerHit(event){
    trace(event.rating);
    switch(event.rating){
        case "perfect":
        perfects += 1;
        case "sick":
        sicks += 1;
        case "good":
        goods += 1;
        case "bad":
        bads += 1;
        case "shit":
        shits += 1;
        case "wtf":
        wtfs += 1;
    }
}
function update(){
    if(combo >= maxCombo){
        maxCombo = combo;
        }
        sideText.text =   'Max Combo: ' + maxCombo + 
                        "\nCombo:  " + combo + 
                        "\nPerfects:  " + perfects + 
                        "\nSicks:  " + sicks + 
                        "\nGoods:  " + goods + 
                        "\nBads:  " + bads + 
                        "\nShits:  " + shits + 
                        "\nWTFS:  " + wtfs + 

                        "\nMisses:  " + PlayState.instance.misses;

}