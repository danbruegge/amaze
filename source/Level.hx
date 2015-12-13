package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class Level extends FlxSpriteGroup {

    // tile IDs:
    // #0 dead
    // #1 life
    // #2 start
    // #3 end

    var tileSize:Int = 32;
    var tiles:Array<Array<Int>> = [
        [ 0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ],
        [ 0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ],
        [ 0,0,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0,0 ],
        [ 0,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0 ],
        [ 0,0,0,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0 ],
        [ 0,0,0,0,0,0,0,1,0,0,0,1,1,1,0,0,0,0 ],
        [ 0,0,0,1,1,1,0,1,0,0,0,1,0,1,0,0,0,0 ],
        [ 0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,1,0,0 ],
        [ 0,0,1,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0 ],
        [ 0,0,1,0,1,1,1,1,1,1,1,1,0,0,1,1,0,0 ],
        [ 0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0 ],
        [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0 ],
        [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0 ]
    ];
    var tileState:Array<Int> = [
        FlxColor.OLIVE, // death
        FlxColor.BROWN, // life
        FlxColor.CRIMSON, // start
        FlxColor.GREEN, // end
        FlxColor.CHARCOAL // blind
    ];

    var startPos:Array<Int> = [0, 0];

    public function new(_x:Int=0, _y:Int=0):Void {

        super(_x, _y, tiles.length * tiles[0].length);

        generate();

    }

    public function setPlayerStartPos(player:Player):Void {

        player.setStart(
            startPos[0] * tileSize,
            startPos[1] * tileSize
        );

    }

    public function onTileCollide(player:FlxSprite, tile:FlxSpriteGroup):Void {

        tile.drawRect(1, 1, tileSize-1, tileSize-1, tileState[tile.ID]);

    }

    function generate():Void {

        for( my in 0...tiles.length ){
            for( mx in 0...tiles[my].length ){

                var _id:Int = tiles[my][mx];

                if (_id == 2) {
                    startPos = [mx + 2, my + 2];
                }

                addTile(mx, my, _id);

            }
        }

    }

    function addTile(_x:Int, _y:Int, _id:Int):Void {

        var tile = new FlxSprite(_x * tileSize, _y * tileSize);
        tile.ID = _id;
        tile.immovable = true;
        tile.moves = false;

        tile.makeGraphic(tileSize, tileSize, FlxColor.WHITE, true);
        tile.drawRect(0, 0, tileSize, tileSize, FlxColor.BLACK);
        tile.drawRect(1, 1, tileSize-1, tileSize-1, tileState[4]);

        add(tile);

    }

}
