package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;

import Level;

class PlayState extends FlxState {

    override public function create():Void {
        super.create();

        bgColor = 0xff333333;

        var level = new Level(80, 60);

        add(level);

    }

    override public function destroy():Void {
        super.destroy();
    }

    override public function update():Void {
        super.update();
    }
}
