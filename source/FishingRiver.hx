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
import flixel.math.FlxMath;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel. util.FlxStringUtil;
import flixel.system.FlxSound;

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

	public static var allTheRiverFish: FlxTypedGroup<RiverFish>;
	public static var allTheClouds: FlxTypedGroup<Cloud>;
	//public static var allTheBirds: FlxTypedGroup<Bird>;

	public var cloudTimer:FlxTimer;
	//public var birdTimer:FlxTimer;

	public static var fishDesc:FlxText;
	public static var newRecordText:FlxText;
	public static var fishRecordWeight:Float = 0;

	public var vo_Bubble:FlxSound;
	public var vo_YouCaughtA:FlxSound;
	public var vo_YouCaughtAn:FlxSound;
	public var vo_FishName:FlxSound;
	public var vo_Digit0:FlxSound;
	public var vo_Digit1:FlxSound;
	public var vo_Digit2:FlxSound;
	public var vo_Digit3:FlxSound;
	public var vo_Digit4:FlxSound;
	public var vo_Digit5:FlxSound;
	public var vo_Unit:FlxSound;
	public var numberReadSpeed:Float;

	//public static var vo_Bubble:FlxSound;


	override public function create():Void
	{
		// there is a delay on initiating controls because it's caused problems before
		// new FlxTimer().start(1.1).onComplete = function(t:FlxTimer):Void
		// 		{
		// 			Controls.init();
		// 		}		
		FlxG.sound.playMusic("assets/music/music_river.wav", .5, true);

		new FlxTimer().start(2).onComplete = function(t:FlxTimer):Void
			{ 
				FlxG.sound.play("assets/sounds/VO/fishinginstructions.wav",.75);
			}

		FlxG.camera.flash(0x00000000,.5);

		var numberReadSpeed = .8;

		var bg:FlxSprite = new FlxSprite(0,0);
		bg.loadGraphic("assets/images/bg.png",false,320,180);
		add (bg);

		allTheClouds = new FlxTypedGroup<Cloud>();
		add (allTheClouds);
		cloudTimer = new FlxTimer().start(4, addACloud, 9);

		// people didn't like the birds so i took them out
		// allTheBirds = new FlxTypedGroup<Bird>();
		// add (allTheBirds);
		// birdTimer = new FlxTimer().start(10, addABird, 4);

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

		

		allTheRiverFish = new FlxTypedGroup<RiverFish>();
		add (allTheRiverFish);

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
		fishDesc.text = "ACTION - cast/reel";
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

 		//FlxG.sound.play("assets/sounds/bubbles.wav",.25);


		vo_Bubble = FlxG.sound.load("assets/sounds/bubbles.wav",.25);
		vo_YouCaughtA = FlxG.sound.load("assets/sounds/VO/fishing/youcaughta.wav",.7,false);
		vo_YouCaughtAn = FlxG.sound.load("assets/sounds/VO/fishing/youcaughtan.wav",.7,false);
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.anyJustPressed([ESCAPE, A]))
		{
		    	FlxG.log.add("switching to map");

				// fades screen to black
				FlxG.camera.fade(0x00000000,1);

				// when the transition is done, switches to Fishingriver
				new FlxTimer().start(1).onComplete = function(t:FlxTimer):Void
					{
					FlxG.switchState(new MapState());
					}
		}

		///////   WINDING UP    ///////
		if (FlxG.keys.anyJustPressed([SPACE, B]) && isCasting == false && isFishing == false && controlsDisabled == false)
		    { 	
		    	FlxG.sound.play("assets/sounds/swish1.wav",.75);
		    	FlxG.log.add("winding up");
		    	controlsDisabled = true;
		    	fisher.animation.play("cast_back");
		    	bobber.visible = false;
		    	
		    	isCasting = true;
		    	powerBarBack.visible = true;
		    	powerBarFill.visible = true;

		    	new FlxTimer().start(.1, toggleControlsDisable, 1);
		    	
				tweeningNumber = FlxTween.num(0, 1, .5, { ease: FlxEase.quadInOut, type: FlxTweenType.PINGPONG }, scaleFillBar.bind(powerBarFill) );
		    }

		//////    CASTING ROD    /////
		else if (FlxG.keys.anyJustPressed([SPACE, B]) && isCasting == true && isFishing == false && controlsDisabled == false && fishHasBitten == false)
		    { 	
		    	FlxG.sound.play("assets/sounds/swoosh1.wav",.75);
		    	FlxG.sound.play("assets/sounds/reelout_fast.wav",.75);
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
		    	
		    	FlxTween.quadMotion(bobber, 248, 111, 199, 12, bobberLandingX, 140, .5, true, { ease: FlxEase.quadIn, type: FlxTweenType.ONESHOT, onComplete: fishingTime});
		   	}

		////////   REELING IN    -    CAUGHT FISH    ////
		else if (FlxG.keys.anyJustPressed([SPACE, B]) && isCasting == false && isFishing == true && fishHasBitten == true && controlsDisabled == false)
		{
			vo_Bubble.stop();
			FlxG.sound.play("assets/sounds/swoosh2.wav",.5);
			FlxG.sound.play("assets/sounds/reelin_fast.wav",.75);
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

			 
			allTheRiverFish.add(new RiverFish(bobber.x,bobber.y));
			

			FlxTween.quadMotion(bobber, bobber.x, bobber.y, 199, 12, 198, 79, .5, true, { type: FlxTweenType.ONESHOT });
			FlxTween.quadMotion(allTheRiverFish.members[fishCaughtNumber], allTheRiverFish.members[fishCaughtNumber].x, allTheRiverFish.members[fishCaughtNumber].y, 
				200, -20, 291 - allTheRiverFish.members[fishCaughtNumber].width/2 + FlxG.random.int(-20, 15), 111 - allTheRiverFish.members[fishCaughtNumber].height/2 - fishCaughtNumber*1.5, 
				.5, true, { ease:FlxEase.quadIn, type: FlxTweenType.ONESHOT, startDelay: .1, onComplete: fishCaughtNotification});
			bobbingAnimation.cancel();
		}    

		//////// REELING IN     -    NO FISH CAUGHT ///////
		else if (FlxG.keys.anyJustPressed([SPACE, B]) && isCasting == false && isFishing == true && fishHasBitten == false && controlsDisabled == false)
		{
			vo_Bubble.stop();
			FlxG.sound.play("assets/sounds/reelin_fast.wav",.75);
			FlxG.sound.play("assets/sounds/swish1.wav",.75);
			bobbingAnimation.cancel();
			exclamation.visible = false;
			FlxG.log.add("reeling in - no fish");
			controlsDisabled = true;
			
		    new FlxTimer().start(.7, toggleControlsDisable, 1);
		    fishBiteTimer.cancel();

			fisher.animation.play("reel_in");
			FlxTween.quadMotion(bobber, bobber.x, bobber.y, 199, 12, 198, 79, .5, true, { type: FlxTweenType.ONESHOT });

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
		FlxG.sound.play("assets/sounds/pop1.wav",.75);
		new FlxTimer().start(.1).onComplete = function(t:FlxTimer):Void
			{
				FlxG.sound.play("assets/sounds/arpeggio2-good.wav",.5);
			}

		new FlxTimer().start(1).onComplete = function(t:FlxTimer):Void
			{

					vo_YouCaughtA.play(true);


					new FlxTimer().start(.5).onComplete = function(t:FlxTimer):Void
						{
							vo_FishName = FlxG.sound.load("assets/sounds/VO/fishing/river/" + allTheRiverFish.members[fishCaughtNumber - 1].fishShortName + ".wav",
									.7, false, null, false, false, null, playVoiceoverFishWeight.bind());
							vo_FishName.play(true);

							//FlxG.log.add("Playing: " + allTheRiverFish.members[fishCaughtNumber - 1].fishTypeNumber + ".wav");
							//FlxG.sound.play("assets/sounds/VO/fishing/river/" + Std.string(allTheRiverFish.members[fishCaughtNumber - 1].fishTypeNumber) + ".wav",.7);
						}	
			}	

			

		FlxG.log.add("displaying fish caught notification");
		isFishing = false;
		fishHasBitten = false;
		fishDesc.alpha = 1;
		bobbingAnimation.cancel();
		if (allTheRiverFish.members[fishCaughtNumber].fishWeight > fishRecordWeight)
		{
			FlxG.log.add("new record weight");
			newRecordText.alpha = 1;
			fishRecordWeight = allTheRiverFish.members[fishCaughtNumber].fishWeight;
		}

		FlxTween.tween(allTheRiverFish.members[fishCaughtNumber], {y: allTheRiverFish.members[fishCaughtNumber].y - 3}, .25, {ease: FlxEase.bounceOut, type: FlxTweenType.PINGPONG, loopDelay: 500});
		FlxG.log.add("caught fish #" + fishCaughtNumber + "-- " + allTheRiverFish.members[fishCaughtNumber].fishName);

		var roundedWeight:Float = FlxMath.roundDecimal(allTheRiverFish.members[fishCaughtNumber].fishWeight,2);

		if (allTheRiverFish.members[fishCaughtNumber].fishWeight / 1000 >= 1.0)
			{
				// fishDesc.text = allTheRiverFish.members[fishCaughtNumber].fishName + " - " + FlxStringUtil.formatMoney(allTheRiverFish.members[fishCaughtNumber].fishWeight / 1000, true, true) + "kg" ;
				fishDesc.text = allTheRiverFish.members[fishCaughtNumber].fishName + " - " + FlxStringUtil.formatMoney(roundedWeight / 1000, true, true) + "kg" ;
			}

		else if (allTheRiverFish.members[fishCaughtNumber].fishWeight / 1000 < 1.0)
			{
				fishDesc.text = allTheRiverFish.members[fishCaughtNumber].fishName + " - " + FlxStringUtil.formatMoney(roundedWeight, true, true) + "g" ;
			}

		fishCaughtNumber += 1;

		FlxTween.tween(fishDesc, {alpha: 0}, 1, {type: FlxTweenType.ONESHOT, startDelay: 3});
		FlxTween.tween(newRecordText, {alpha: 0}, 1, {type: FlxTweenType.ONESHOT, startDelay: 3});
	}

	public function fishingTime(Tween:FlxTween)
	{
		FlxG.sound.play("assets/sounds/bloop.wav",1);
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
				bobbingAnimation = FlxTween.tween(bobber, {y: bobber.y+3}, .5, {ease:FlxEase.quadInOut, type: FlxTweenType.PINGPONG, loopDelay: FlxG.random.int(1, 6)*.5 });
			}

		// old timer, where it got longer between catches
		//fishBiteTimer = new FlxTimer().start(2+fishCaughtNumber*.8, fishBiting, 1);
		//new timer
		fishBiteTimer = new FlxTimer().start(2 + FlxG.random.float(Reg.minFishTimeToBite, Reg.maxFishTimeToBite), fishBiting, 1);
	}


	private function fishBiting(Timer:FlxTimer)
	{
		vo_Bubble.play(true);
		//FlxG.sound.play("assets/sounds/bubbles.wav",.25);
		FlxG.sound.play("assets/sounds/arpeggio-ohno.wav",.55);
		bobbingAnimation.cancel();
		exclamation.visible = true;
		fisher.animation.play("hanging_on");
		FlxG.log.add("fish bit the lure!");
		fishHasBitten = true;
		bobbingAnimation = FlxTween.tween(bobber, {y: bobber.y+3}, .25, {ease:FlxEase.bounceInOut, type: FlxTweenType.PINGPONG });
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

		// var oldestCloud:Cloud = allTheClouds.getFirstAlive();
		// oldestCloud.kill();
	}


	// private function addABird(Timer:FlxTimer)
	// {
	// 	allTheBirds.add(new Bird(-60, -60));
	// }

	

	public function playVoiceoverFishWeight():Void
	{
		var _fishWeight:Float = allTheRiverFish.members[fishCaughtNumber - 1].fishWeight;
		FlxG.log.add("Fish Weight 1: " + _fishWeight);
		var isKilograms:Bool = false;

		if (_fishWeight / 1000 >= 1.0)
			{
			 _fishWeight = _fishWeight / 1000;
			 isKilograms = true;
			}

		else if (_fishWeight / 1000 < 1.0)
			{
				//nothing
			}
		FlxG.log.add("Fish Weight 2: " + _fishWeight);

		var _fishWeightTrunc:Float = FlxMath.roundDecimal(_fishWeight, 2);
		_fishWeightTrunc = Std.parseFloat(FlxStringUtil.formatMoney(_fishWeightTrunc, true, true));
		FlxG.log.add("Fish Weight Trunc: " + _fishWeightTrunc);
		var _fishWeightString:String = Std.string(_fishWeightTrunc);


		
		var _stringArray:Array<String> = _fishWeightString.split("");
		FlxG.log.add("String Array: " + _stringArray);

		var _numOfDigits:Int = _fishWeightString.length;




		if (_numOfDigits == 6)
		{
			if ( Std.parseInt(_stringArray[1]) == 0) 
				{ 
				vo_Digit0 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(Std.parseInt(_stringArray[0]) * 100) + ".wav",.7,false);
				vo_Digit1 = FlxG.sound.load("assets/sounds/VO/numbers/null.wav",.7,false);
				vo_Digit2 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[2]) + ".wav",.7,false);
				}
			else if ( Std.parseInt(_stringArray[1]) == 1) 
				{ 
				vo_Digit0 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(Std.parseInt(_stringArray[0]) * 100) + ".wav",.7,false);
				vo_Digit1 = FlxG.sound.load("assets/sounds/VO/numbers/null.wav",.7,false);
				vo_Digit2 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(Std.parseInt(_stringArray[2]) + 10) + ".wav",.7,false);
				}
			else if (Std.parseInt(_stringArray[1]) > 1) 
				{
				vo_Digit0 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(Std.parseInt(_stringArray[0]) * 100) + ".wav",.7,false);
				vo_Digit1 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(Std.parseInt(_stringArray[1]) * 10) + ".wav",.7,false);
					if (Std.parseInt(_stringArray[2]) > 0) 
						{
							vo_Digit2 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[2]) + ".wav",.7,false);
						}
					else if (Std.parseInt(_stringArray[2]) == 0) 
						{
							vo_Digit2 = FlxG.sound.load("assets/sounds/VO/numbers/null.wav",.7,false);
						}
				}
			
			vo_Digit3 = FlxG.sound.load("assets/sounds/VO/numbers/point.wav",.7,false);
			vo_Digit4 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[4]) + ".wav",.7,false);
			vo_Digit5 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[5]) + ".wav",.7,false);
			

			if (isKilograms == true)
				{
					vo_Unit = FlxG.sound.load("assets/sounds/VO/numbers/kilograms.wav",.7,false);
				}

			else if (isKilograms == false)
				{
					vo_Unit = FlxG.sound.load("assets/sounds/VO/numbers/grams.wav",.7,false);
				}


			//play sound clips

			vo_Digit0.play(true);

			new FlxTimer().start(.5).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit1.play(true);
				}

			new FlxTimer().start(1).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit2.play(true);
				}

			new FlxTimer().start(1.5).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit3.play(true);
				}
			new FlxTimer().start(2).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit4.play(true);
				}	
			new FlxTimer().start(2.5).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit5.play(true);
				}	
			new FlxTimer().start(3).onComplete = function(t:FlxTimer):Void
			{
				vo_Unit.play(true);
			}	
		}

		else if (_numOfDigits == 5)
		{


			function determineFirstNumber():Void
				{
					if ( Std.parseInt(_stringArray[0]) == 1) 
						{ 
						vo_Digit0 = FlxG.sound.load("assets/sounds/VO/numbers/null.wav",.7,false);
						vo_Digit1 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(Std.parseInt(_stringArray[1]) + 10) + ".wav",.7,false);
						}
					else if (Std.parseInt(_stringArray[0]) > 1) 
						{
						vo_Digit0 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(Std.parseInt(_stringArray[0]) * 10) + ".wav",.7,false);
						vo_Digit1 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[1]) + ".wav",.7,false);
						}
					else {return;}
				}

			determineFirstNumber();
			// vo_Digit0 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(Std.parseInt(_stringArray[0]) * 10) + ".wav",.7,false);
			// vo_Digit1 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[1]) + ".wav",.7,false);
			vo_Digit2 = FlxG.sound.load("assets/sounds/VO/numbers/point.wav",.7,false);
			vo_Digit3 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[3]) + ".wav",.7,false);
			vo_Digit4 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[4]) + ".wav",.7,false);
			

			if (isKilograms == true)
				{
					vo_Unit = FlxG.sound.load("assets/sounds/VO/numbers/kilograms.wav",.7,false);
				}

			else if (isKilograms == false)
				{
					vo_Unit = FlxG.sound.load("assets/sounds/VO/numbers/grams.wav",.7,false);
				}

			////// PLAY CLIPS

			vo_Digit0.play(true);

			new FlxTimer().start(.5).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit1.play(true);
				}

			new FlxTimer().start(1).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit2.play(true);
				}

			new FlxTimer().start(1.5).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit3.play(true);
				}
			new FlxTimer().start(2).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit4.play(true);
				}	
			new FlxTimer().start(2.5).onComplete = function(t:FlxTimer):Void
				{
					vo_Unit.play(true);
				}			
					
		}

		else if (_numOfDigits <= 4)
		{
			FlxG.log.add("reading number VO");

			vo_Digit0 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[0]) + ".wav",.7,false);
			vo_Digit1 = FlxG.sound.load("assets/sounds/VO/numbers/point.wav",.7,false);
			vo_Digit2 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[2]) + ".wav",.7,false);
			vo_Digit3 = FlxG.sound.load("assets/sounds/VO/numbers/" + Std.string(_stringArray[3]) + ".wav",.7,false);

			if (isKilograms == true)
				{
					vo_Unit = FlxG.sound.load("assets/sounds/VO/numbers/kilograms.wav",.7,false);
				}

			else if (isKilograms == false)
				{
					vo_Unit = FlxG.sound.load("assets/sounds/VO/numbers/grams.wav",.7,false);
				}

			///// play clips /////

			vo_Digit0.play(true);

			new FlxTimer().start(.5).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit1.play(true);
				}

			new FlxTimer().start(1).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit2.play(true);
				}

			new FlxTimer().start(1.5).onComplete = function(t:FlxTimer):Void
				{
					vo_Digit3.play(true);
				}
			new FlxTimer().start(2).onComplete = function(t:FlxTimer):Void
				{
					vo_Unit.play(true);
				}			
		}
	}


}
