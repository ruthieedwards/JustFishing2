package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxTimer;



class PondFish extends FlxSprite
{

	public var fishNameShort: String; // NS
	public var fishName: String; // N
	public var fishWeight: Float; // W
	public var fishChance: Float; // C

	public function new(X:Float, Y:Float, N:Float) 
	{
		super(X, Y, N, C);
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
