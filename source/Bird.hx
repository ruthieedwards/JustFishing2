package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;




class Bird extends FlxSprite
{
	public var cloudTypeNumber: Int;

	public function new(X:Float, Y:Float) 
	{

		super(X, Y);

		cloudTypeNumber = FlxG.random.int(1, 3);
		//this.alpha = FlxG.random.float(.1, 1);

		loadGraphic("assets/images/bird_" + cloudTypeNumber + ".png", false, 20, 17);
		

		FlxTween.quadMotion(this, -40, 0 + FlxG.random.int(0, 10), 199, 90, 270 +FlxG.random.int(1, 30) , -20, cloudTypeNumber*1.5+.5, true, { type: FlxTweenType.LOOPING, loopDelay: 5});


		//FlxTween.tween(this, {x: 400}, FlxG.random.int(30, 60), {type: FlxTween.LOOPING});
		
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	


}
