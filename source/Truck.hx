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
import flixel.input.gamepad.FlxGamepad;
import flixel.group.FlxSpriteGroup;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class Truck extends FlxSprite
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */

	public var truckBody:FlxSprite;
	public var avatar:FlxSpriteGroup;
	
	//public var gamepad:FlxGamepad;


	 public function new(X:Float=0, Y:Float=0)
     {
        super(X, Y);

		loadGraphic("assets/images/truck_body.png",false,93,43);

		var truck_back = new FlxSprite(200,121);
		truck_back.loadGraphic("assets/images/truck_back.png",false,93,43);
		FlxG.state.add(truck_back);
		truck_back.scrollFactor.x = 0;
		var _truckbacktween:FlxTween = FlxTween.tween(truck_back, { y: truck_back.y + 2}, .25, {type: FlxTweenType.PINGPONG, ease: FlxEase.sineInOut });

		var truck_person = new FlxSprite(200,121);
		truck_person.loadGraphic("assets/images/truck_person.png",false,93,43);
		FlxG.state.add(truck_person);
		truck_person.scrollFactor.x = 0;

		new FlxTimer().start(.035).onComplete = function(t:FlxTimer):Void
				{
					var _avatarHeadTween:FlxTween = FlxTween.tween(truck_person, { y: truck_person.y + 2}, .25, {type: FlxTweenType.PINGPONG, ease: FlxEase.sineInOut });
				}

		var truck_frontWheel = new FlxSprite(203,25+121);
		truck_frontWheel.loadGraphic("assets/images/truck_wheel.png",false,18,18);
		FlxG.state.add(truck_frontWheel);
		truck_frontWheel.scrollFactor.x = 0;
		
		var _avatarFrontWheelTween:FlxTween = FlxTween.angle(truck_frontWheel, 360, 0, 1, {type: FlxTweenType.LOOPING});
		
		var truck_backWheel = new FlxSprite(267,25+121);
		truck_backWheel.loadGraphic("assets/images/truck_wheel.png",false,18,18);
		FlxG.state.add(truck_backWheel);
		truck_backWheel.scrollFactor.x = 0;
		
		var _avatarBackWheelTween:FlxTween = FlxTween.angle(truck_backWheel, 360, 0, 1, {type: FlxTweenType.LOOPING});
 	}

 	 override public function update(elapsed:Float):Void
 	{
     movement();
     super.update(elapsed);
 	}

private function movement():Void
	{
		
	}


}