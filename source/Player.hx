package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class Player extends FlxSprite {

    var size:Int = 16;
    var speed:Int = 32;

    public function new(_x:Int=0, _y:Int=0):Void {

        super(_x, _y);

        makeGraphic(size, size, FlxColor.TRANSPARENT, true);
        drawCircle(8, 8, 8, FlxColor.LIME);

    }

    override public function update():Void {

        super.update();

        if (FlxG.keys.anyJustReleased(['LEFT', 'A'])) {

            x -= speed;

        } else if (FlxG.keys.anyJustReleased(['RIGHT', 'D'])) {

            x += speed;

        }

        if (FlxG.keys.anyJustReleased(['UP', 'W'])) {

            y -= speed;

        } else if (FlxG.keys.anyJustReleased(['DOWN', 'S'])) {

            y += speed;

        }

    }

    public function setStart(_x:Int, _y:Int):Void {

        trace(_x, _y);

        setPosition(_x - 24, _y - 24);

    }

}
