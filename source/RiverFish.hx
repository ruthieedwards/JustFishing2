package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxTimer;



class RiverFish extends FlxSprite
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
			fishName = "Yellow Perch";
			fishShortName = "yellowperch";
			loadGraphic("assets/images/fish/river/yellowperch.png", false, 30, 20);
			fishWeight = FlxG.random.float(680,900);

		}

		if (fishTypeNumber == 2)
		{
			fishName = "Rock Bass";
			fishShortName = "rockbass";
			loadGraphic("assets/images/fish/river/rockbass.png", false, 49, 20);
			fishWeight = FlxG.random.float(680,900);
		}

		if (fishTypeNumber == 3)
		{
			fishName = "Black Crappie";
			fishShortName = "blackcrappie";
			loadGraphic("assets/images/fish/river/blackcrappie.png", false, 40, 20);
			fishWeight = FlxG.random.float(10,80);
		}

		if (fishTypeNumber == 4)
		{
			fishName = "Largemouth Bass";
			fishShortName = "largemouthbass";
			loadGraphic("assets/images/fish/river/largemouthbass.png", false, 65, 32);
			fishWeight = FlxG.random.float(6000, 11000);
		}

		if (fishTypeNumber == 5)
		{
			fishName = "Rainbow Trout";
			fishShortName = "rainbowtrout";
			loadGraphic("assets/images/fish/river/rainbowtrout.png", false, 26, 11);
			fishWeight = FlxG.random.float(1000, 5000);
		}

		if (fishTypeNumber == 6)
		{
			fishName = "Rainbow Trout";
			fishShortName = "rainbowtrout";
			loadGraphic("assets/images/fish/river/rainbowtrout.png", false, 26, 11);
			fishWeight = FlxG.random.float(1000, 5000);
		}

		if (fishTypeNumber == 7)
		{
			fishName = "Bluegill";
			fishShortName = "bluegill";
			loadGraphic("assets/images/fish/river/bluegill.png", false, 38, 20);
			fishWeight = FlxG.random.float(900,1900);
		}

		if (fishTypeNumber == 8)
		{
			fishName = "Bluegill";
			fishShortName = "bluegill";
			loadGraphic("assets/images/fish/river/bluegill.png", false, 38, 20);
			fishWeight = FlxG.random.float(900,1900);
		}

		if (fishTypeNumber == 9)
		{
			fishName = "Blue Catfish";
			fishShortName = "bluecatfish";
			loadGraphic("assets/images/fish/river/bluecatfish.png", false, 95, 35);
			fishWeight = FlxG.random.float(10000, 20000);
		}

		if (fishTypeNumber == 10)
		{
			fishName = "Longnose Gar";
			fishShortName = "longnosegar";
			loadGraphic("assets/images/fish/river/longnosegar.png", false, 98, 21);
			fishWeight = FlxG.random.float(20000,25000);
		}
		
		
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	


}
