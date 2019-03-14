package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.math.FlxAngle;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
import flixel.FlxObject;
import flixel.group.FlxSpriteGroup;

/**
 * A FlxSprite that contains the icon & other info for the locations on the overworld map
 */
class MapLocation extends FlxSprite
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */

	public var location:Int;

	 public function new(X:Float=0, Y:Float=0, L:Int)
     {
        super(X, Y);

        scrollFactor.x = 0;

        location = L;

        if (location == 0)
	        {
				loadGraphic("assets/images/map_pond.png",false,320,180);
			}
		else if (location == 1)
	        {
				loadGraphic("assets/images/map_river.png",false,320,180);
			}
		else if (location == 2)
	        {
				loadGraphic("assets/images/map_beach.png",false,320,180);
			}		
		//setSize(260, 180);
		//offset.x = 30;
		//offset.y = 0;
 	}

 	 override public function update(elapsed:Float):Void
 	{
     	super.update(elapsed);

 	}

}