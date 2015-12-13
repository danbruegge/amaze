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

        level = new Level(32, 32);
        player = new Player();

        level.setPlayerStartPos(player);

        add(level);
        add(player);

    }

    override public function destroy():Void {
        super.destroy();
    }

    override public function update():Void {

        super.update();

        FlxG.overlap(player, level, level.onTileCollide);

    }
}
