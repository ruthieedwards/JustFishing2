package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxTimer;



class PondFish extends FlxSprite
{
	public var randNum100: Int;
	public var fishTypeNumber: Int;
	public var fishName: String;
	public var fishShortName: String; // for sound file names
	public var fishWeight: Float; // in grams

	public function new(X:Float, Y:Float) 
	{
		//fishTypeNumber = x;
		randNum100 = FlxG.random.int(1, 100);
		FlxG.log.add("Fish # rolled: " + randNum100);

		if 		(randNum100 == 100)		 {fishTypeNumber = 10;}
		else if (randNum100 >= 96 && randNum100 <= 99) {fishTypeNumber = 9;}
		else if (randNum100 >= 91 && randNum100 <= 95) {fishTypeNumber = 8;}
		else if (randNum100 >= 81 && randNum100 <= 90) {fishTypeNumber = 7;}
		else if (randNum100 >= 71 && randNum100 <= 80) {fishTypeNumber = 6;}
		else if (randNum100 >= 61 && randNum100 <= 70) {fishTypeNumber = 5;}
		else if (randNum100 >= 51 && randNum100 <= 60) {fishTypeNumber = 4;}
		else if (randNum100 >= 36 && randNum100 <= 50) {fishTypeNumber = 3;}
		else if (randNum100 >= 20 && randNum100 <= 35) {fishTypeNumber = 2;}
		else {fishTypeNumber = 1;};

		super(X, Y);


		if (fishTypeNumber == 1)
		{
			fishName = "Bluntnose Minnow";
			fishShortName = "bluntnoseminnow";
			loadGraphic("assets/images/fish/pond/bluntnoseminnow.png", false, 20, 16);
			fishWeight = FlxG.random.float(2,5);

		}

		if (fishTypeNumber == 2)
		{
			fishName = "Guppy";
			fishShortName = "guppy";
			loadGraphic("assets/images/fish/pond/guppy.png", false, 18, 10);
			fishWeight = FlxG.random.float(5,20);
		}

		if (fishTypeNumber == 3)
		{
			fishName = "Goby";
			fishShortName = "goby";
			loadGraphic("assets/images/fish/pond/goby.png", false, 20, 16);
			fishWeight = FlxG.random.float(10,80);
		}

		if (fishTypeNumber == 4)
		{
			fishName = "Ryukin";
			fishShortName = "ryukin";
			loadGraphic("assets/images/fish/pond/ryukin.png", false, 18, 16);
			fishWeight = FlxG.random.float(200,600);
		}

		if (fishTypeNumber == 5)
		{
			fishName = "Broadtail Moor";
			fishShortName = "broadtailmoor";
			loadGraphic("assets/images/fish/pond/broadtailmoor.png", false, 12, 12);
			fishWeight = FlxG.random.float(150,500);
		}

		if (fishTypeNumber == 6)
		{
			fishName = "Pumpkinseed";
			fishShortName = "pumpkinseed";
			loadGraphic("assets/images/fish/pond/pumpkinseed.png", false, 20, 16);
			fishWeight = FlxG.random.float(300,600);
		}

		if (fishTypeNumber == 7)
		{
			fishName = "Golden Rudd";
			fishShortName = "goldenrudd";
			loadGraphic("assets/images/fish/pond/goldenrudd.png", false, 30, 20);
			fishWeight = FlxG.random.float(300,600);
		}

		if (fishTypeNumber == 8)
		{
			fishName = "Ide";
			fishShortName = "ide";
			loadGraphic("assets/images/fish/pond/ide.png", false, 30, 20);
			fishWeight = FlxG.random.float(750,1800);
		}

		if (fishTypeNumber == 9)
		{
			fishName = "Koi";
			fishShortName = "koi";
			loadGraphic("assets/images/fish/pond/koi.png", false, 30, 20);
			fishWeight = FlxG.random.float(1000,3000);
		}

		if (fishTypeNumber == 10)
		{
			fishName = "Siberian Sturgeon";
			fishShortName = "siberiansturgeon";
			loadGraphic("assets/images/fish/pond/siberiansturgeon.png", false, 50, 20);
			fishWeight = FlxG.random.float(5000,10000);
		}
		
		
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	


}
