package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class Player extends FlxSprite {

    var size:Int = 16;
    var speed:Int = 2;

    public function new(_x:Int=0, _y:Int=0):Void {

        super(_x, _y);

        makeGraphic(size, size, FlxColor.TRANSPARENT, true);
        drawCircle(8, 8, 8, FlxColor.LIME);

    }

    override public function update():Void {

        super.update();

        if (FlxG.keys.anyPressed(['LEFT', 'A'])) {

            x -= speed;

        } else if (FlxG.keys.anyPressed(['RIGHT', 'D'])) {

            x += speed;

        }

        if (FlxG.keys.anyPressed(['UP', 'W'])) {

            y -= speed;

        } else if (FlxG.keys.anyPressed(['DOWN', 'S'])) {

            y += speed;

        }

    }

}
