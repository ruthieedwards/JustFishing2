 package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.group.FlxGroup;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;


class MenuState extends FlxState
{

	public var bg:FlxSprite;
	public var bg2:FlxSprite;

	public var fishTimer:FlxTimer;

	public static var schoolOfFish: FlxTypedGroup<FishMenu>;


	override public function create():Void
	{
		super.create();


	     FlxG.sound.playMusic("assets/music/music_titlescreen.wav", .75, true);
	     FlxG.sound.music.fadeIn(3,0,1);


		new FlxTimer().start(3).onComplete = function(t:FlxTimer):Void
			{
				FlxG.sound.play("assets/sounds/press-start.wav",.75);
			}	 

		
		 


		var bg:FlxSprite = new FlxSprite(0,0);
		bg.loadGraphic("assets/images/ocean_bg.png",false,320,180);
		add (bg);

		var waveEffect = new FlxWaveEffect(FlxWaveMode.ALL, 5, .5, 5, 5, HORIZONTAL);
 		var waveSprite = new FlxEffectSprite(bg, [waveEffect]);
 		add(waveSprite);
 


 		var bg2:FlxSprite = new FlxSprite(0,0);
		bg2.loadGraphic("assets/images/ocean_bg.png",false,320,180);
		add (bg2);
		bg2.alpha = .5;

		var waveEffect2 = new FlxWaveEffect(FlxWaveMode.ALL, 6, .5, 6, 6, HORIZONTAL);
 		var waveSprite2 = new FlxEffectSprite(bg2, [waveEffect2]);
 		add(waveSprite2);

 		schoolOfFish = new FlxTypedGroup<FishMenu>();
		add (schoolOfFish);
		fishTimer = new FlxTimer().start(1, addAFish, 20);
		schoolOfFish.add(new FishMenu(-60, FlxG.random.int(0,175)));
		schoolOfFish.add(new FishMenu(-60, FlxG.random.int(0,175)));


		var logo:FlxSprite = new FlxSprite(85,62);
		logo.loadGraphic("assets/images/logo.png",false,152,54);
		add (logo);
		FlxTween.tween(logo, { x:85, y:67 }, 2, {type:FlxTweenType.PINGPONG, ease:FlxEase.sineInOut});

		var pressSpace:FlxSprite = new FlxSprite(85,131);
		pressSpace.loadGraphic("assets/images/press-space.png",false,150,22);
		add (pressSpace);
		FlxTween.tween(pressSpace,{alpha:0},1,{type:FlxTweenType.PINGPONG, ease:FlxEase.sineInOut, loopDelay:1});

 		
	}



	private function playGame():Void
	{

		FlxG.log.add("switching to FishingRiver");

		// fades screen to black
		FlxG.camera.fade(0x00000000,.5);

		// when the transition is done, switches to FishingRiver
		new FlxTimer().start(.5).onComplete = function(t:FlxTimer):Void
			{
			FlxG.switchState(new MapState());
			}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);


		if (FlxG.keys.anyJustPressed([SPACE, B]))
		{
			playGame();
		}


	}


	private function addAFish(Timer:FlxTimer)
	{
		schoolOfFish.add(new FishMenu(-90, FlxG.random.int(-5,175)));
		//allTheFish.add(new Fish(bobber.x,bobber.y));
	}


}

