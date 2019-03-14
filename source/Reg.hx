package;

import flixel.util.FlxSave;
import flixel.FlxG;


class Reg
{
	
	public static var score:Int = 0;
	public static var hotdogs:Int = 10;
	//public static var isPigDead:Bool = false;
	public static var highScore:Int = 0;
	public static var minFishTimeToBite:Float = 1; // build: 1
	public static var maxFishTimeToBite:Float = 10; // build: 10

	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];

	//public static var isFullscreen:Bool = false;
	//public static var currentVolume:Float = 1.0;

	/*public static function set_FULLSCREEN(value:Bool):Bool
	{
		isFullscreen = value;
		FlxG.fullscreen = isFullscreen;
		return value;
	}*/

	public static function resetLevel():Void
	{
		score = 0;
	}

}