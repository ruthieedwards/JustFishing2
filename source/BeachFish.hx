package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxTimer;



class BeachFish extends FlxSprite
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
			fishName = "Hermit Crab";
			fishShortName = "hermitcrab";
			loadGraphic("assets/images/fish/ocean/hermitcrab.png", false, 20, 17);
			fishWeight = FlxG.random.float(200, 500);

		}

		if (fishTypeNumber == 2)
		{
			fishName = "Blue Tang";
			fishShortName = "bluetang";
			loadGraphic("assets/images/fish/ocean/bluetang.png", false, 22, 11);
			fishWeight = FlxG.random.float(400, 650);
		}

		if (fishTypeNumber == 3)
		{
			fishName = "Speckled Trout";
			fishShortName = "speckledtrout";
			loadGraphic("assets/images/fish/ocean/speckledtrout.png", false, 50, 20);
			fishWeight = FlxG.random.float(1360,6800);
		}

		if (fishTypeNumber == 4)
		{
			fishName = "Atlantic Salmon";
			fishShortName = "atlanticsalmon";
			loadGraphic("assets/images/fish/ocean/atlanticsalmon.png", false, 26, 11);
			fishWeight = FlxG.random.float(3600, 5400);
		}

		if (fishTypeNumber == 5)
		{
			fishName = "Summer Flounder";
			fishShortName = "summerflounder";
			loadGraphic("assets/images/fish/ocean/summerflounder.png", false, 50, 20);
			fishWeight = FlxG.random.float(1000, 5000);
		}

		if (fishTypeNumber == 6)
		{
			fishName = "Northern Puffer";
			fishShortName = "northernpuffer";
			loadGraphic("assets/images/fish/ocean/northernpuffer.png", false, 20,16);
			fishWeight = FlxG.random.float(400, 800);
		}

		if (fishTypeNumber == 7)
		{
			fishName = "Longfin Squid";
			fishShortName = "longfinsquid";
			loadGraphic("assets/images/fish/ocean/longfinsquid.png", false, 31, 52);
			fishWeight = FlxG.random.float(12000, 13000);
		}

		if (fishTypeNumber == 8)
		{
			fishName = "Bluefin Tuna";
			fishShortName = "bluefintuna";
			loadGraphic("assets/images/fish/ocean/bluefintuna.png", false, 60, 28);
			fishWeight = FlxG.random.float(225000, 600000);
		}

		if (fishTypeNumber == 9)
		{
			fishName = "Great Barracuda";
			fishShortName = "greatbarracuda";
			loadGraphic("assets/images/fish/ocean/greatbarracuda.png", false, 100, 27);
			fishWeight = FlxG.random.float(15000,20000);
		}

		if (fishTypeNumber == 10)
		{
			fishName = "Blue Marlin";
			fishShortName = "bluemarlin";
			loadGraphic("assets/images/fish/ocean/bluemarlin.png", false, 142, 44);
			fishWeight = FlxG.random.float(110000, 450000);
		}
		
		
		
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	


}
