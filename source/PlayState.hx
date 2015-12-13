package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;

import Level;

class PlayState extends FlxState {

    var level:Level;
    var player:Player;

    override public function create():Void {

        super.create();

        bgColor = 0xff333333;

        level = new Level(80, 60);
        player = new Player(32, 32);

        add(level);
        add(player);

    }

    override public function destroy():Void {
        super.destroy();
    }

    override public function update():Void {

        super.update();

        FlxG.collide(player, level);

    }
}
