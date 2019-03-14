package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;



class FishMenu extends FlxSprite
{
	public var randNum100: Int;
	public var fishTypeNumber: Int;
	public var fishName: String;
	public var fishWeight: Float;
	public var fishShortName: String; // for sound file names


	public function new(X:Float, Y:Float) 
	{
		super(X, Y);

		randNum100 = FlxG.random.int(1, 100);

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

		
		this.flipX = true;
		this.scale.x = 2;
		this.scale.y = 2;

		//// POND FISH /////

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

		////// RIVER FISH ///////

		// if (fishTypeNumber == 1)
		// {
		// 	fishName = "Yellow Perch";
		// 	fishShortName = "yellowperch";
		// 	loadGraphic("assets/images/fish/river/yellowperch.png", false, 30, 20);
		// 	fishWeight = FlxG.random.float(680,900);

		// }

		// if (fishTypeNumber == 2)
		// {
		// 	fishName = "Rock Bass";
		// 	fishShortName = "rockbass";
		// 	loadGraphic("assets/images/fish/river/rockbass.png", false, 49, 20);
		// 	fishWeight = FlxG.random.float(680,900);
		// }

		// if (fishTypeNumber == 3)
		// {
		// 	fishName = "Black Crappie";
		// 	fishShortName = "blackcrappie";
		// 	loadGraphic("assets/images/fish/river/blackcrappie.png", false, 40, 20);
		// 	fishWeight = FlxG.random.float(10,80);
		// }

		// if (fishTypeNumber == 4)
		// {
		// 	fishName = "Largemouth Bass";
		// 	fishShortName = "largemouthbass";
		// 	loadGraphic("assets/images/fish/river/largemouthbass.png", false, 65, 32);
		// 	fishWeight = FlxG.random.float(6000, 11000);
		// }

		// if (fishTypeNumber == 5)
		// {
		// 	fishName = "Rainbow Trout";
		// 	fishShortName = "rainbowtrout";
		// 	loadGraphic("assets/images/fish/river/rainbowtrout.png", false, 26, 11);
		// 	fishWeight = FlxG.random.float(1000, 5000);
		// }

		// if (fishTypeNumber == 6)
		// {
		// 	fishName = "Bluegill";
		// 	fishShortName = "bluegill";
		// 	loadGraphic("assets/images/fish/river/bluegill.png", false, 38, 20);
		// 	fishWeight = FlxG.random.float(900,1900);
		// }

		// if (fishTypeNumber == 7)
		// {
		// 	fishName = "Bluegill";
		// 	fishShortName = "bluegill";
		// 	loadGraphic("assets/images/fish/river/bluegill.png", false, 38, 20);
		// 	fishWeight = FlxG.random.float(900,1900);
		// }

		// if (fishTypeNumber == 8)
		// {
		// 	fishName = "Blue Catfish";
		// 	fishShortName = "bluecatfish";
		// 	loadGraphic("assets/images/fish/river/bluecatfish.png", false, 95, 35);
		// 	fishWeight = FlxG.random.float(10000, 20000);
		// }

		// if (fishTypeNumber == 9)
		// {
		// 	fishName = "Longnose Gar";
		// 	fishShortName = "longnosegar";
		// 	loadGraphic("assets/images/fish/river/longnosegar.png", false, 98, 21);
		// 	fishWeight = FlxG.random.float(15000,20000);
		// }

		// if (fishTypeNumber == 10)
		// {
		// 	fishName = "Longnose Gar";
		// 	fishShortName = "longnosegar";
		// 	loadGraphic("assets/images/fish/river/longnosegar.png", false, 98, 21);
		// 	fishWeight = FlxG.random.float(20000,25000);
		// }


		///// OCEAN FISH

		// if (fishTypeNumber == 1)
		// {
		// 	fishName = "Hermit Crab";
		// 	fishShortName = "hermitcrab";
		// 	loadGraphic("assets/images/fish/ocean/hermitcrab.png", false, 20, 17);
		// 	fishWeight = FlxG.random.float(200, 500);

		// }

		// if (fishTypeNumber == 2)
		// {
		// 	fishName = "Blue Tang";
		// 	fishShortName = "bluetang";
		// 	loadGraphic("assets/images/fish/ocean/bluetang.png", false, 22, 11);
		// 	fishWeight = FlxG.random.float(400, 650);
		// }

		// if (fishTypeNumber == 3)
		// {
		// 	fishName = "Speckled Trout";
		// 	fishShortName = "speckledtrout";
		// 	loadGraphic("assets/images/fish/ocean/speckledtrout.png", false, 50, 20);
		// 	fishWeight = FlxG.random.float(1360,6800);
		// }

		// if (fishTypeNumber == 4)
		// {
		// 	fishName = "Atlantic Salmon";
		// 	fishShortName = "atlanticsalmon";
		// 	loadGraphic("assets/images/fish/ocean/atlanticsalmon.png", false, 26, 11);
		// 	fishWeight = FlxG.random.float(3600, 5400);
		// }

		// if (fishTypeNumber == 5)
		// {
		// 	fishName = "Summer Flounder";
		// 	fishShortName = "summerflounder";
		// 	loadGraphic("assets/images/fish/ocean/summerflounder.png", false, 50, 20);
		// 	fishWeight = FlxG.random.float(1000, 5000);
		// }

		// if (fishTypeNumber == 6)
		// {
		// 	fishName = "Northern Puffer";
		// 	fishShortName = "northernpuffer";
		// 	loadGraphic("assets/images/fish/ocean/northernpuffer.png", false, 20,16);
		// 	fishWeight = FlxG.random.float(400, 800);
		// }

		// if (fishTypeNumber == 7)
		// {
		// 	fishName = "Longfin Squid";
		// 	fishShortName = "longfinsquid";
		// 	loadGraphic("assets/images/fish/ocean/longfinsquid.png", false, 31, 52);
		// 	fishWeight = FlxG.random.float(12000, 13000);
		// }

		// if (fishTypeNumber == 8)
		// {
		// 	fishName = "Great Barracuda";
		// 	fishShortName = "greatbarracuda";
		// 	loadGraphic("assets/images/fish/ocean/greatbarracuda.png", false, 100, 27);
		// 	fishWeight = FlxG.random.float(15000,20000);
		// }

		// if (fishTypeNumber == 9)
		// {
		// 	fishName = "Blue Marlin";
		// 	fishShortName = "bluemarlin";
		// 	loadGraphic("assets/images/fish/ocean/bluemarlin.png", false, 142, 44);
		// 	fishWeight = FlxG.random.float(110000, 450000);
		// }

		// if (fishTypeNumber == 10)
		// {
		// 	fishName = "Bluefin Tuna";
		// 	fishShortName = "bluefintuna";
		// 	loadGraphic("assets/images/fish/ocean/bluefintuna.png", false, 60, 28);
		// 	fishWeight = FlxG.random.float(225000, 600000);
		// }
		

		FlxTween.tween(this, {x: 380}, FlxG.random.int(20, 50), {type: FlxTweenType.LOOPING});
		
	}


	override public function update(elapsed:Float):Void
	{
		//x = PlayState.bobber.x;
		//y = PlayState.bobber.y;

		super.update(elapsed);
	}

	


}
