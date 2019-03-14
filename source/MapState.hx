package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.tweens.motion.CubicMotion;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxSpriteGroup;


class MapState extends FlxState
{


	public var allTheLocationSprites:FlxTypedGroup<MapLocation>;

	public var hotDogText:FlxText;

	private var truck:Truck;
	public var scoreText:FlxText;
	public var canEnterLocation:Bool = true;
	public var locationTween:FlxTween;
	public var firstLocationTween:FlxTween;
	public var currentNumber:Int = 0;


	// lower speed = faster
	public var locationSpawnSpeed:Int = 10;
	public var cameraScrollSpeed:Int = -1;

	override public function create():Void
	{
		FlxG.sound.playMusic("assets/music/music_driving.wav", 1, true);
		FlxG.sound.music.fadeIn(3,0,1);
		FlxG.camera.flash(0x00000000,.5);

	

		////// BACKGROUND ART /////
		FlxG.camera.bgColor = 0xff5b5f73;

		var bg8_sky:FlxSprite = new FlxSprite(0, 0);
		bg8_sky.loadGraphic("assets/images/bg/bg8_sky.png");
		add(bg8_sky);
		bg8_sky.scrollFactor.x = 0;

		var bg7_mtns2:FlxBackdrop = new FlxBackdrop("assets/images/bg/bg7_mtns2.png", .05, 0, true, false);
		add(bg7_mtns2);

		var bg6_mtns1:FlxBackdrop = new FlxBackdrop("assets/images/bg/bg6_mtns1.png", .15, 0, true, false);
		add(bg6_mtns1);

		var bg5_trees2:FlxBackdrop = new FlxBackdrop("assets/images/bg/bg5_trees2.png", .45, 0, true, false);
		add(bg5_trees2);
		
		var bg4_trees1:FlxBackdrop = new FlxBackdrop("assets/images/bg/bg4_trees1.png", .65, 0, true, false);
		add(bg4_trees1);

		var bg3_grass:FlxBackdrop = new FlxBackdrop("assets/images/bg/bg3_grass.png", .85, 0, true, false);
		add(bg3_grass);
		
		var bg2_grass:FlxBackdrop = new FlxBackdrop("assets/images/bg/bg2_grass.png", 1.05, 0, true, false);
		add(bg2_grass);
		
		var bg1_trail:FlxBackdrop = new FlxBackdrop("assets/images/bg/bg1_trail.png", 1.45, 0, true, false);
		add(bg1_trail);

		///// FISHING LOCATIONS /////

		allTheLocationSprites = new FlxTypedGroup();
		add (allTheLocationSprites);

		allTheLocationSprites.add(new MapLocation(-320,0,currentNumber));
		locationTween = FlxTween.tween(allTheLocationSprites.members[allTheLocationSprites.length - 1], { x: allTheLocationSprites.members[allTheLocationSprites.length - 1].x + 650}, locationSpawnSpeed, {type: FlxTweenType.ONESHOT});
		
		new FlxTimer().start(2).onComplete = function(t:FlxTimer):Void
			{ FlxG.sound.play("assets/sounds/VO/vo_location0.wav",.75);
			}

		new FlxTimer().start(locationSpawnSpeed/2,0).onComplete = function(t:FlxTimer):Void
			{	currentNumber = (currentNumber+1)%3;

				allTheLocationSprites.add(new MapLocation(-320,0, currentNumber));
				locationTween = FlxTween.tween(allTheLocationSprites.members[allTheLocationSprites.length - 1], { x: allTheLocationSprites.members[allTheLocationSprites.length - 1].x + 650}, locationSpawnSpeed, {type: FlxTweenType.ONESHOT});
				new FlxTimer().start(2).onComplete = function(t:FlxTimer):Void
					{ 
						FlxG.sound.play("assets/sounds/VO/vo_location" + currentNumber + ".wav",.75);
					}

			}

		///// TRUCK SPRITE /////	
				
		truck = new Truck(200, 121);
		add(truck);
		truck.scrollFactor.x = 0;

		var _truckTween:FlxTween = FlxTween.tween(truck, { y: truck.y + 2}, .25, {type: FlxTweenType.PINGPONG, ease: FlxEase.sineInOut });

		///// GUI /////

		var scoreBox = new FlxSprite(0,0);
		scoreBox.makeGraphic(360,15, 0xff2d2a21, false);
		add(scoreBox);
		scoreBox.scrollFactor.x = 0;

		scoreText = new FlxText (2, 2, 0, "", 30);
		scoreText.text = "Press ACTION to travel";
		scoreText.setFormat("assets/fonts/ChevyRay - Express.ttf", 9, FlxColor.WHITE, LEFT);
		add(scoreText);	
		scoreText.scrollFactor.x = 0;

		// hotDogText = new FlxText (FlxG.width-150, 2, 150, "", 30);
		// hotDogText.text = "Hot Dogs: " + Reg.hotdogs;
		// hotDogText.setFormat("assets/fonts/ChevyRay - Express.ttf", 9, FlxColor.WHITE, RIGHT);
		// add(hotDogText);	
		// hotDogText.scrollFactor.x = 0;


		super.create();

	}

	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);

		FlxG.camera.scroll.add(cameraScrollSpeed, 0);


		///// TO ENTER A LOCATION /////

		if (FlxG.keys.anyJustPressed([SPACE, B]))
		{
			FlxG.log.add("pressed Space");	
			FlxG.overlap(truck, allTheLocationSprites, enterLocation);
		}

		if (FlxG.keys.anyJustPressed([ESCAPE, A]))
		{
			goBackToMenu();
		}

		///// DEBUG KEYS /////

		// if (FlxG.keys.justPressed.UP)
		// {
		// 	locationSpawnSpeed += 1;
		// 	FlxG.log.add("Spawn speed: " + locationSpawnSpeed);
		// }

		// if (FlxG.keys.justPressed.DOWN)
		// {
		// 	locationSpawnSpeed -= 1;
		// 	FlxG.log.add("Spawn speed: " + locationSpawnSpeed);
		// }

	}

	private function goBackToMenu():Void
	{

		FlxG.log.add("switching to menu");

		// fades screen to black
		FlxG.camera.fade(0x00000000,.5);

		// when the transition is done, switches to FishingRiver
		new FlxTimer().start(.5).onComplete = function(t:FlxTimer):Void
			{
			FlxG.switchState(new MenuState());
			}
	}

	private function enterLocation(P:FlxSprite, T:MapLocation):Void
	{
		 if (canEnterLocation == false) // because there was a bug where it would fire multiple times
		 {
		 	return;
		 }

		else if (canEnterLocation == true)
		{
			if (P.alive && P.exists && T.alive && T.exists)
		    {
		    	FlxG.log.add("entering pond");
		    	canEnterLocation = false;
		    	cameraScrollSpeed = 0;
		    	
			    		locationTween.cancel();
				    
		    	//firstLocationTween.cancel();

		    	FlxG.log.add("switching to");

				// fades screen to black
				FlxG.camera.fade(0x00000000,2);

				// when the transition is done, switches to FishingPond
				new FlxTimer().start(2).onComplete = function(t:FlxTimer):Void
					{
						if (T.location == 0)
							{FlxG.switchState(new FishingPond());}
						else if (T.location == 1)
							{FlxG.switchState(new FishingRiver());}
						else if (T.location == 2)
							{FlxG.switchState(new FishingBeach());}
					}
		    }
		}

	}

}
