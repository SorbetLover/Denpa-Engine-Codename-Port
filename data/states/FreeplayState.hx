function beatHit(){
    if(curBeat % 2 == 0){
        for(i in iconArray){
            i.scale.set(1.2,1.2);
        }
                bg.scale.set(1.03,1.03);

    }
}

function update(){
    for(i in iconArray){
        i.angle = FlxMath.lerp(i.angle, 1, Conductor.crochet / 10000);
        i.scale.x = FlxMath.lerp(i.scale.x, 1, Conductor.crochet / 10000);
        i.scale.y = i.scale.x;
    }
    bg.scale.x = FlxMath.lerp(bg.scale.x, 1, 0.06);
    bg.scale.y = bg.scale.x;
}