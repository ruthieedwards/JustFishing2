package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.tweens.motion.CubicMotion;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel. util.FlxStringUtil;

class FishingRiver extends FlxState
{

	public var bobber:FlxSprite;
	public var fisher:FlxSprite;
	public var sploosh:FlxSprite;
	public var bobbingAnimation:FlxTween;
	public var ripple:FlxSprite;
	public var fishCaughtNumber:Int = 0;
	public var exclamation:FlxSprite;


	//public var currentlyCaughtFish:Fish;

	public var controlsDisabled:Bool = false;
	public var isCasting:Bool = false;
	public var isFishing:Bool = false;
	public var fishHasBitten:Bool = false;
	public var caughtFish:Bool = false;


	public var castingPower:Float = 0;
	public var castingLength:Float = 158;
	public var powerBarFill:FlxSprite;
	public var powerBarBack:FlxSprite;
	public var tweeningNumber:FlxTween;
	public var bobberLandingX:Float = 0;
	public var fishBiteTimer:FlxTimer;

	public static var allTheFish: FlxTypedGroup<Fish>;
	public static var allTheClouds: FlxTypedGroup<Cloud>;
	public static var allTheBirds: FlxTypedGroup<Bird>;

	public var cloudTimer:FlxTimer;
	public var birdTimer:FlxTimer;

	public static var fishDesc:FlxText;
	public static var newRecordText:FlxText;
	public static var fishRecordWeight:Float = 0;



	override public function create():Void
	{
		FlxG.camera.flash(0x00000000,.5);

		var bg:FlxSprite = new FlxSprite(0,0);
		bg.loadGraphic("assets/images/bg.png",false,320,180);
		add (bg);

		allTheClouds = new FlxTypedGroup<Cloud>();
		add (allTheClouds);
		cloudTimer = new FlxTimer().start(4, addACloud, 9);

		allTheBirds = new FlxTypedGroup<Bird>();
		add (allTheBirds);
		birdTimer = new FlxTimer().start(10, addABird, 4);

		var waterMoving:FlxSprite = new FlxSprite(0,0);
		waterMoving.loadGraphic("assets/images/water_moving.png",true,320,180);
		waterMoving.animation.add("waterMovingAnim",[0,1,2,3,4,5], 6, true);
		waterMoving.animation.play("waterMovingAnim");
		waterMoving.alpha = .5;
		add (waterMoving);

		var island:FlxSprite = new FlxSprite(0,0);
		island.loadGraphic("assets/images/island.png",false,320,180);
		add (island);

		var dock:FlxSprite = new FlxSprite(0,0);
		dock.loadGraphic("assets/images/dock.png",false,320,180);
		add (dock);
		
		

		ripple = new FlxSprite(-37,-20);
		ripple.loadGraphic("assets/images/ripple.png",true,37,20);
		ripple.animation.add("ripple",[0,1,2,3,4,5,6,7,8,9,10,11,12], 12, false);
		ripple.animation.add("ripple_loop",[0,1,2,3,4,5,6,7,8,9,10,11,12], 12, true);
		add(ripple);

		sploosh = new FlxSprite(-24,-24);
		sploosh.loadGraphic("assets/images/sploosh.png",true,24,24);
		sploosh.animation.add("sploosh",[1,2,3,4,5,6,7,0], 24, false);
		add(sploosh);

		

		bobber = new FlxSprite(-5,-5);
		bobber.loadGraphic("assets/images/bobber.png",false,5,5);
		add (bobber);

		fisher = new FlxSprite(191,50);
		fisher.loadGraphic("assets/images/fisher.png",true,64,64);
		fisher.animation.add("cast_back",[2,3,4], 12, false);
		fisher.animation.add("cast_fwd",[5,5,6,7,8], 12, false);
		fisher.animation.add("hanging_on",[15,16], 6, true);
		fisher.animation.add("reel_in", [9,10,11,12,12,12,13,14], 12, false);

		add(fisher);

		

		powerBarBack = new FlxSprite(211, 69);
		powerBarBack.loadGraphic("assets/images/powerbar_back.png",false,30,6);
		add(powerBarBack);
		powerBarBack.visible = false;

		powerBarFill = new FlxSprite(213,70);
		powerBarFill.loadGraphic("assets/images/powerbar_fill.png",false,26,4);
		add (powerBarFill);
		powerBarFill.visible = false;
		powerBarFill.origin.set(0, 0);

		exclamation = new FlxSprite(213,58);
		exclamation.loadGraphic("assets/images/exclamation_box.png",false,19,19);
		exclamation.visible = false;
		add(exclamation);

		

		allTheFish = new FlxTypedGroup<Fish>();
		add (allTheFish);

		var polesFront:FlxSprite = new FlxSprite(0,0);
		polesFront.loadGraphic("assets/images/poles_front.png",false,320,180);
		add (polesFront);


		FlxG.watch.add(powerBarFill, "scale");
		FlxG.watch.add(bobber, "y");
		FlxG.log.add("is Casting: " + isCasting);
		FlxG.log.add("is Fishing: " + isFishing);


		//FlxG.watch.add(isCasting, "bool");

		fishDesc = new FlxText(0, 5, 315);
		//fishDesc = new FlxText(0,0,200);
		fishDesc.setFormat("assets/fonts/BMdelico.ttf", 16, 0xFFdc8f53, "right");
		//fishDesc.setBorderStyle(OUTLINE, 0x33FFFFFF);
		fishDesc.text = "Press space to cast/reel";
		add (fishDesc);


		newRecordText = new FlxText(-500, -500, 315);
		newRecordText.setFormat("assets/fonts/BMdelico.ttf", 32, 0xFFdc8f53, "right");
		newRecordText.text = "New Record";
		add(newRecordText);

		var waveEffect = new FlxWaveEffect(FlxWaveMode.ALL, 2, .5, 2);
 		var waveSprite = new FlxEffectSprite(newRecordText, [waveEffect]);
 		add(waveSprite);
 		waveSprite.x = 0;
 		waveSprite.y = 26;
 		newRecordText.alpha = 0;

		super.create();
	}

	override public function update(elapsed:Float):Void
	{

		///////   WINDING UP    ///////
		if (FlxG.keys.justPressed.SPACE && isCasting == false && isFishing == false && controlsDisabled == false)
		    { 	
		    	FlxG.sound.play("assets/sounds/windup.wav",.5);
		    	FlxG.log.add("winding up");
		    	controlsDisabled = true;
		    	fisher.animation.play("cast_back");
		    	bobber.visible = false;
		    	
		    	isCasting = true;
		    	powerBarBack.visible = true;
		    	powerBarFill.visible = true;

		    	new FlxTimer().start(.1, toggleControlsDisable, 1);
		    	
				tweeningNumber = FlxTween.num(0, 1, .5, { ease: FlxEase.quadInOut, type: FlxTween.PINGPONG }, scaleFillBar.bind(powerBarFill) );

		    }

		//////    CASTING ROD    /////
		else if (FlxG.keys.justPressed.SPACE && isCasting == true && isFishing == false && controlsDisabled == false && fishHasBitten == false)
		    { 	
		    	FlxG.sound.play("assets/sounds/cast.wav",.5);
		    	FlxG.log.add("casting rod");
		    	controlsDisabled = true;
		    	new FlxTimer().start(.8, toggleControlsDisable, 1);

		    	powerBarBack.visible = false;
		    	powerBarFill.visible = false;
		    	tweeningNumber.cancel();

		    	
		    	fisher.animation.play("cast_fwd");
		    	bobber.visible = true;
		    	isFishing = true;
		    	isCasting = false;


		    	//new FlxTimer().start(.5, fishingTime, 1);
		    	
		    	FlxTween.quadMotion(bobber, 248, 111, 199, 12, bobberLandingX, 140, .5, true, { ease: FlxEase.quadIn, type: FlxTween.ONESHOT, onComplete: fishingTime});

		    	
		   	}

		////////   REELING IN    -    CAUGHT FISH    ////
		else if (FlxG.keys.justPressed.SPACE && isCasting == false && isFishing == true && fishHasBitten == true && controlsDisabled == false)
		{
			FlxG.sound.play("assets/sounds/reel.wav",.5);
			bobbingAnimation.cancel();
			FlxG.log.add("reeling in - caught fish");
			exclamation.visible = false;

			isFishing = false;
			isCasting = false;

			controlsDisabled = true;
			
		    new FlxTimer().start(.7, toggleControlsDisable, 1);
		    ripple.animation.stop();
		    ripple.animation.frameIndex = 12;

		    fishBiteTimer.cancel();
		  
			fisher.animation.play("reel_in");

			 
			allTheFish.add(new Fish(bobber.x,bobber.y));
			

			FlxTween.quadMotion(bobber, bobber.x, bobber.y, 199, 12, 198, 79, .5, true, { type: FlxTween.ONESHOT });
			FlxTween.quadMotion(allTheFish.members[fishCaughtNumber], allTheFish.members[fishCaughtNumber].x, allTheFish.members[fishCaughtNumber].y, 
				200, -20, 291 - allTheFish.members[fishCaughtNumber].width/2 + FlxG.random.int(-20, 15), 111 - allTheFish.members[fishCaughtNumber].height/2 - fishCaughtNumber*1.5, 
				.5, true, { ease:FlxEase.quadIn, type: FlxTween.ONESHOT, startDelay: .1, onComplete: fishCaughtNotification});
			bobbingAnimation.cancel();

			//caughtFish = true;

			
			
		}    

		//////// REELING IN     -    NO FISH CAUGHT ///////
		else if (FlxG.keys.justPressed.SPACE && isCasting == false && isFishing == true && fishHasBitten == false && controlsDisabled == false)
		{
			FlxG.sound.play("assets/sounds/reel.wav",.5);
			bobbingAnimation.cancel();
			exclamation.visible = false;
			FlxG.log.add("reeling in - no fish");
			controlsDisabled = true;
			
		    new FlxTimer().start(.7, toggleControlsDisable, 1);
		    fishBiteTimer.cancel();

			fisher.animation.play("reel_in");
			FlxTween.quadMotion(bobber, bobber.x, bobber.y, 199, 12, 198, 79, .5, true, { type: FlxTween.ONESHOT });

			isFishing = false;
			
		}  


		super.update(elapsed);
	}

	public function toggleControlsDisable(Timer:FlxTimer)
	{
		controlsDisabled = false;
		FlxG.log.add("Controls disabled: " + controlsDisabled);
	}

	public function toggleCasting(Tween:FlxTween)
	{
		isCasting = !isCasting;
		FlxG.log.add("isCasting: "+ isCasting);

		if(isCasting == false)
			{
				FlxG.log.add("bobber hitting water");
				sploosh.x = bobber.x-10;
				sploosh.y = bobber.y-10;
				sploosh.animation.play("sploosh");
				ripple.x = bobber.x-17;
				ripple.y = bobber.y-5;
				ripple.animation.play("ripple");

			}
	}

	public function toggleFishing(Timer:FlxTimer)
	{
		FlxG.log.add("isFishing: " + isFishing);
		isFishing = !isFishing;
	}

	public function fishCaughtNotification(Tween:FlxTween)
	{
		FlxG.sound.play("assets/sounds/plop2.wav",.75);
		FlxG.log.add("displaying fish caught notification");
		isFishing = false;
		fishHasBitten = false;
		fishDesc.alpha = 1;
		bobbingAnimation.cancel();
		if (allTheFish.members[fishCaughtNumber].fishWeight > fishRecordWeight)
		{
			FlxG.log.add("new record weight");
			newRecordText.alpha = 1;
			fishRecordWeight = allTheFish.members[fishCaughtNumber].fishWeight;
		}

		FlxTween.tween(allTheFish.members[fishCaughtNumber], {y: allTheFish.members[fishCaughtNumber].y - 3}, .25, {ease: FlxEase.bounceOut, type: FlxTween.PINGPONG, loopDelay: 500});
		FlxG.log.add("caught fish #" + fishCaughtNumber + "-- " + allTheFish.members[fishCaughtNumber].fishName);



		fishDesc.text = allTheFish.members[fishCaughtNumber].fishName + " - " + FlxStringUtil.formatMoney(allTheFish.members[fishCaughtNumber].fishWeight, true, true) + "kg" ;
		fishCaughtNumber += 1;

		FlxTween.tween(fishDesc, {alpha: 0}, 1, {type: FlxTween.ONESHOT, startDelay: 3});
		FlxTween.tween(newRecordText, {alpha: 0}, 1, {type: FlxTween.ONESHOT, startDelay: 3});
		
		
	}

	public function fishingTime(Tween:FlxTween)
	{
		FlxG.sound.play("assets/sounds/plop.wav",.5);
		FlxG.log.add("bobber hitting water");
			sploosh.x = bobber.x-10;
			sploosh.y = bobber.y-10;
			sploosh.animation.play("sploosh");
			ripple.x = bobber.x-17;
			ripple.y = bobber.y-5;
			ripple.animation.play("ripple");

		FlxG.log.add("fishing time!");
		//new FlxTimer().start(3, toggleControlsDisable, 1);
		new FlxTimer().start(.1).onComplete = function(t:FlxTimer):Void
			{
				
				FlxG.log.add("slow bob animation");
				bobbingAnimation = FlxTween.tween(bobber, {y: bobber.y+3}, .5, {ease:FlxEase.quadInOut, type: FlxTween.PINGPONG, loopDelay: FlxG.random.int(1, 6)*.5 });
				
			}

		fishBiteTimer = new FlxTimer().start(2+fishCaughtNumber*.8, fishBiting, 1);
				

	}


	private function fishBiting(Timer:FlxTimer)
	{
		FlxG.sound.play("assets/sounds/wiggle.wav",.5);
		bobbingAnimation.cancel();
		exclamation.visible = true;
		fisher.animation.play("hanging_on");
		FlxG.log.add("fish bit the lure!");
		fishHasBitten = true;
		bobbingAnimation = FlxTween.tween(bobber, {y: bobber.y+3}, .25, {ease:FlxEase.bounceInOut, type: FlxTween.PINGPONG });
		ripple.animation.play("ripple_loop");

	}

	private function scaleFillBar(s:FlxSprite, v:Float) 
	{

	powerBarFill.scale.set(v, 1);
	castingPower = v;
	bobberLandingX = 158 - castingLength*v + 12;
	}

	private function addACloud(Timer:FlxTimer)
	{
		allTheClouds.add(new Cloud(-60, FlxG.random.int(4, 42)));
		//allTheFish.add(new Fish(bobber.x,bobber.y));
	}

	private function addABird(Timer:FlxTimer)
	{
		allTheBirds.add(new Bird(-60, -60));
		//allTheFish.add(new Fish(bobber.x,bobber.y));
	}

}
