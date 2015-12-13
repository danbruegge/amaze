package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class Level extends FlxSpriteGroup {

    var tileSize:Int = 32;
    var tiles:Array<Array<Int>> = [
        [ 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0 ],
        [ 0,1,1,0,1,1,1,1,0,0,0,0,0,0,0 ],
        [ 0,0,1,0,1,0,0,1,0,0,0,0,0,0,0 ],
        [ 0,0,1,1,1,0,1,1,0,0,0,0,0,0,0 ],
        [ 0,0,0,0,0,0,1,0,0,0,1,1,1,0,0 ],
        [ 0,0,1,1,1,0,1,0,0,0,1,0,1,0,0 ],
        [ 0,0,1,0,1,1,1,0,0,0,1,0,1,1,1 ],
        [ 0,1,1,0,0,0,0,0,0,0,1,0,0,0,1 ],
        [ 0,1,0,1,1,1,1,1,1,1,1,0,0,1,1 ],
        [ 0,1,1,1,0,0,0,0,0,0,0,0,0,1,0 ]
    ];
    var tileState:Array<Int> = [
        FlxColor.OLIVE,
        FlxColor.BROWN
    ];

    public function new(_x:Int=0, _y:Int=0):Void {

        super(_x, _y, tiles.length * tiles[0].length);

        generate();

    }

    function generate():Void {

        for( my in 0...tiles.length ){
            for( mx in 0...tiles[my].length ){
                addTile(mx, my, tiles[my][mx]);
            }
        }

    }

    function addTile(_x:Int, _y:Int, _id:Int):Void {

        var tile = new FlxSprite(_x * tileSize, _y * tileSize);
        tile.makeGraphic(tileSize, tileSize, FlxColor.WHITE, true);
        tile.drawRect(0, 0, tileSize, tileSize, FlxColor.BLACK);
        tile.drawRect(1, 1, tileSize-1, tileSize-1, tileState[_id]);
        tile.immovable = true;
        tile.moves = false;

        if (_id == 1) {
            tile.allowCollisions = FlxObject.NONE;
        }

        add(tile);

    }

}
