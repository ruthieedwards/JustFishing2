package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_bmdelico_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_bmfeather_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_bmgermar_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_bmleaves_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_munro_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/fonts/BMdelico.TTF", __ASSET__assets_fonts_bmdelico_ttf);
		type.set ("assets/fonts/BMdelico.TTF", AssetType.FONT);
		className.set ("assets/fonts/BMfeather.TTF", __ASSET__assets_fonts_bmfeather_ttf);
		type.set ("assets/fonts/BMfeather.TTF", AssetType.FONT);
		className.set ("assets/fonts/BMgermar.ttf", __ASSET__assets_fonts_bmgermar_ttf);
		type.set ("assets/fonts/BMgermar.ttf", AssetType.FONT);
		className.set ("assets/fonts/BMleaves.ttf", __ASSET__assets_fonts_bmleaves_ttf);
		type.set ("assets/fonts/BMleaves.ttf", AssetType.FONT);
		className.set ("assets/fonts/Munro.ttf", __ASSET__assets_fonts_munro_ttf);
		type.set ("assets/fonts/Munro.ttf", AssetType.FONT);
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", AssetType.IMAGE);
		className.set ("assets/images/bird_1.png", __ASSET__assets_images_bird_1_png);
		type.set ("assets/images/bird_1.png", AssetType.IMAGE);
		className.set ("assets/images/bird_2.png", __ASSET__assets_images_bird_2_png);
		type.set ("assets/images/bird_2.png", AssetType.IMAGE);
		className.set ("assets/images/bird_3.png", __ASSET__assets_images_bird_3_png);
		type.set ("assets/images/bird_3.png", AssetType.IMAGE);
		className.set ("assets/images/bobber.png", __ASSET__assets_images_bobber_png);
		type.set ("assets/images/bobber.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_0.png", __ASSET__assets_images_cloud_0_png);
		type.set ("assets/images/cloud_0.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_1.png", __ASSET__assets_images_cloud_1_png);
		type.set ("assets/images/cloud_1.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_10.png", __ASSET__assets_images_cloud_10_png);
		type.set ("assets/images/cloud_10.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_2.png", __ASSET__assets_images_cloud_2_png);
		type.set ("assets/images/cloud_2.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_3.png", __ASSET__assets_images_cloud_3_png);
		type.set ("assets/images/cloud_3.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_4.png", __ASSET__assets_images_cloud_4_png);
		type.set ("assets/images/cloud_4.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_5.png", __ASSET__assets_images_cloud_5_png);
		type.set ("assets/images/cloud_5.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_6.png", __ASSET__assets_images_cloud_6_png);
		type.set ("assets/images/cloud_6.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_7.png", __ASSET__assets_images_cloud_7_png);
		type.set ("assets/images/cloud_7.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_8.png", __ASSET__assets_images_cloud_8_png);
		type.set ("assets/images/cloud_8.png", AssetType.IMAGE);
		className.set ("assets/images/cloud_9.png", __ASSET__assets_images_cloud_9_png);
		type.set ("assets/images/cloud_9.png", AssetType.IMAGE);
		className.set ("assets/images/dock.png", __ASSET__assets_images_dock_png);
		type.set ("assets/images/dock.png", AssetType.IMAGE);
		className.set ("assets/images/exclamation_box.png", __ASSET__assets_images_exclamation_box_png);
		type.set ("assets/images/exclamation_box.png", AssetType.IMAGE);
		className.set ("assets/images/fisher.png", __ASSET__assets_images_fisher_png);
		type.set ("assets/images/fisher.png", AssetType.IMAGE);
		className.set ("assets/images/fish_0.png", __ASSET__assets_images_fish_0_png);
		type.set ("assets/images/fish_0.png", AssetType.IMAGE);
		className.set ("assets/images/fish_1.png", __ASSET__assets_images_fish_1_png);
		type.set ("assets/images/fish_1.png", AssetType.IMAGE);
		className.set ("assets/images/fish_2.png", __ASSET__assets_images_fish_2_png);
		type.set ("assets/images/fish_2.png", AssetType.IMAGE);
		className.set ("assets/images/fish_3.png", __ASSET__assets_images_fish_3_png);
		type.set ("assets/images/fish_3.png", AssetType.IMAGE);
		className.set ("assets/images/fish_4.png", __ASSET__assets_images_fish_4_png);
		type.set ("assets/images/fish_4.png", AssetType.IMAGE);
		className.set ("assets/images/fish_5.png", __ASSET__assets_images_fish_5_png);
		type.set ("assets/images/fish_5.png", AssetType.IMAGE);
		className.set ("assets/images/fish_6.png", __ASSET__assets_images_fish_6_png);
		type.set ("assets/images/fish_6.png", AssetType.IMAGE);
		className.set ("assets/images/fish_7.png", __ASSET__assets_images_fish_7_png);
		type.set ("assets/images/fish_7.png", AssetType.IMAGE);
		className.set ("assets/images/fish_8.png", __ASSET__assets_images_fish_8_png);
		type.set ("assets/images/fish_8.png", AssetType.IMAGE);
		className.set ("assets/images/island.ase", __ASSET__assets_images_island_ase);
		type.set ("assets/images/island.ase", AssetType.BINARY);
		className.set ("assets/images/island.png", __ASSET__assets_images_island_png);
		type.set ("assets/images/island.png", AssetType.IMAGE);
		className.set ("assets/images/logo.png", __ASSET__assets_images_logo_png);
		type.set ("assets/images/logo.png", AssetType.IMAGE);
		className.set ("assets/images/ocean_bg.ase", __ASSET__assets_images_ocean_bg_ase);
		type.set ("assets/images/ocean_bg.ase", AssetType.BINARY);
		className.set ("assets/images/ocean_bg.png", __ASSET__assets_images_ocean_bg_png);
		type.set ("assets/images/ocean_bg.png", AssetType.IMAGE);
		className.set ("assets/images/poles_front.png", __ASSET__assets_images_poles_front_png);
		type.set ("assets/images/poles_front.png", AssetType.IMAGE);
		className.set ("assets/images/powerbar_back.png", __ASSET__assets_images_powerbar_back_png);
		type.set ("assets/images/powerbar_back.png", AssetType.IMAGE);
		className.set ("assets/images/powerbar_fill.png", __ASSET__assets_images_powerbar_fill_png);
		type.set ("assets/images/powerbar_fill.png", AssetType.IMAGE);
		className.set ("assets/images/press-space.ase", __ASSET__assets_images_press_space_ase);
		type.set ("assets/images/press-space.ase", AssetType.BINARY);
		className.set ("assets/images/press-space.png", __ASSET__assets_images_press_space_png);
		type.set ("assets/images/press-space.png", AssetType.IMAGE);
		className.set ("assets/images/ripple.png", __ASSET__assets_images_ripple_png);
		type.set ("assets/images/ripple.png", AssetType.IMAGE);
		className.set ("assets/images/sploosh.png", __ASSET__assets_images_sploosh_png);
		type.set ("assets/images/sploosh.png", AssetType.IMAGE);
		className.set ("assets/images/water_moving.ase", __ASSET__assets_images_water_moving_ase);
		type.set ("assets/images/water_moving.ase", AssetType.BINARY);
		className.set ("assets/images/water_moving.png", __ASSET__assets_images_water_moving_png);
		type.set ("assets/images/water_moving.png", AssetType.IMAGE);
		className.set ("assets/music/fishin-up-something-good.mp3", __ASSET__assets_music_fishin_up_something_good_mp3);
		type.set ("assets/music/fishin-up-something-good.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/cast.wav", __ASSET__assets_sounds_cast_wav);
		type.set ("assets/sounds/cast.wav", AssetType.SOUND);
		className.set ("assets/sounds/plop.wav", __ASSET__assets_sounds_plop_wav);
		type.set ("assets/sounds/plop.wav", AssetType.SOUND);
		className.set ("assets/sounds/plop2.wav", __ASSET__assets_sounds_plop2_wav);
		type.set ("assets/sounds/plop2.wav", AssetType.SOUND);
		className.set ("assets/sounds/reel.wav", __ASSET__assets_sounds_reel_wav);
		type.set ("assets/sounds/reel.wav", AssetType.SOUND);
		className.set ("assets/sounds/wiggle.wav", __ASSET__assets_sounds_wiggle_wav);
		type.set ("assets/sounds/wiggle.wav", AssetType.SOUND);
		className.set ("assets/sounds/windup.wav", __ASSET__assets_sounds_windup_wav);
		type.set ("assets/sounds/windup.wav", AssetType.SOUND);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/fonts/BMdelico.TTF";
		className.set (id, __ASSET__assets_fonts_bmdelico_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/BMfeather.TTF";
		className.set (id, __ASSET__assets_fonts_bmfeather_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/BMgermar.ttf";
		className.set (id, __ASSET__assets_fonts_bmgermar_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/BMleaves.ttf";
		className.set (id, __ASSET__assets_fonts_bmleaves_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/Munro.ttf";
		className.set (id, __ASSET__assets_fonts_munro_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/images/bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bird_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bird_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bird_3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bobber.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud_9.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/exclamation_box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fisher.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fish_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fish_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fish_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fish_3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fish_4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fish_5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fish_6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fish_7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fish_8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/island.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/island.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ocean_bg.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/ocean_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/poles_front.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/powerbar_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/powerbar_fill.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/press-space.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/press-space.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ripple.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sploosh.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/water_moving.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/water_moving.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/fishin-up-something-good.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/cast.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/plop.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/plop2.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/reel.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/wiggle.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/windup.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/fonts/BMdelico.TTF", __ASSET__assets_fonts_bmdelico_ttf);
		type.set ("assets/fonts/BMdelico.TTF", AssetType.FONT);
		
		className.set ("assets/fonts/BMfeather.TTF", __ASSET__assets_fonts_bmfeather_ttf);
		type.set ("assets/fonts/BMfeather.TTF", AssetType.FONT);
		
		className.set ("assets/fonts/BMgermar.ttf", __ASSET__assets_fonts_bmgermar_ttf);
		type.set ("assets/fonts/BMgermar.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/BMleaves.ttf", __ASSET__assets_fonts_bmleaves_ttf);
		type.set ("assets/fonts/BMleaves.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/Munro.ttf", __ASSET__assets_fonts_munro_ttf);
		type.set ("assets/fonts/Munro.ttf", AssetType.FONT);
		
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/bird_1.png", __ASSET__assets_images_bird_1_png);
		type.set ("assets/images/bird_1.png", AssetType.IMAGE);
		
		className.set ("assets/images/bird_2.png", __ASSET__assets_images_bird_2_png);
		type.set ("assets/images/bird_2.png", AssetType.IMAGE);
		
		className.set ("assets/images/bird_3.png", __ASSET__assets_images_bird_3_png);
		type.set ("assets/images/bird_3.png", AssetType.IMAGE);
		
		className.set ("assets/images/bobber.png", __ASSET__assets_images_bobber_png);
		type.set ("assets/images/bobber.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_0.png", __ASSET__assets_images_cloud_0_png);
		type.set ("assets/images/cloud_0.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_1.png", __ASSET__assets_images_cloud_1_png);
		type.set ("assets/images/cloud_1.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_10.png", __ASSET__assets_images_cloud_10_png);
		type.set ("assets/images/cloud_10.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_2.png", __ASSET__assets_images_cloud_2_png);
		type.set ("assets/images/cloud_2.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_3.png", __ASSET__assets_images_cloud_3_png);
		type.set ("assets/images/cloud_3.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_4.png", __ASSET__assets_images_cloud_4_png);
		type.set ("assets/images/cloud_4.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_5.png", __ASSET__assets_images_cloud_5_png);
		type.set ("assets/images/cloud_5.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_6.png", __ASSET__assets_images_cloud_6_png);
		type.set ("assets/images/cloud_6.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_7.png", __ASSET__assets_images_cloud_7_png);
		type.set ("assets/images/cloud_7.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_8.png", __ASSET__assets_images_cloud_8_png);
		type.set ("assets/images/cloud_8.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud_9.png", __ASSET__assets_images_cloud_9_png);
		type.set ("assets/images/cloud_9.png", AssetType.IMAGE);
		
		className.set ("assets/images/dock.png", __ASSET__assets_images_dock_png);
		type.set ("assets/images/dock.png", AssetType.IMAGE);
		
		className.set ("assets/images/exclamation_box.png", __ASSET__assets_images_exclamation_box_png);
		type.set ("assets/images/exclamation_box.png", AssetType.IMAGE);
		
		className.set ("assets/images/fisher.png", __ASSET__assets_images_fisher_png);
		type.set ("assets/images/fisher.png", AssetType.IMAGE);
		
		className.set ("assets/images/fish_0.png", __ASSET__assets_images_fish_0_png);
		type.set ("assets/images/fish_0.png", AssetType.IMAGE);
		
		className.set ("assets/images/fish_1.png", __ASSET__assets_images_fish_1_png);
		type.set ("assets/images/fish_1.png", AssetType.IMAGE);
		
		className.set ("assets/images/fish_2.png", __ASSET__assets_images_fish_2_png);
		type.set ("assets/images/fish_2.png", AssetType.IMAGE);
		
		className.set ("assets/images/fish_3.png", __ASSET__assets_images_fish_3_png);
		type.set ("assets/images/fish_3.png", AssetType.IMAGE);
		
		className.set ("assets/images/fish_4.png", __ASSET__assets_images_fish_4_png);
		type.set ("assets/images/fish_4.png", AssetType.IMAGE);
		
		className.set ("assets/images/fish_5.png", __ASSET__assets_images_fish_5_png);
		type.set ("assets/images/fish_5.png", AssetType.IMAGE);
		
		className.set ("assets/images/fish_6.png", __ASSET__assets_images_fish_6_png);
		type.set ("assets/images/fish_6.png", AssetType.IMAGE);
		
		className.set ("assets/images/fish_7.png", __ASSET__assets_images_fish_7_png);
		type.set ("assets/images/fish_7.png", AssetType.IMAGE);
		
		className.set ("assets/images/fish_8.png", __ASSET__assets_images_fish_8_png);
		type.set ("assets/images/fish_8.png", AssetType.IMAGE);
		
		className.set ("assets/images/island.ase", __ASSET__assets_images_island_ase);
		type.set ("assets/images/island.ase", AssetType.BINARY);
		
		className.set ("assets/images/island.png", __ASSET__assets_images_island_png);
		type.set ("assets/images/island.png", AssetType.IMAGE);
		
		className.set ("assets/images/logo.png", __ASSET__assets_images_logo_png);
		type.set ("assets/images/logo.png", AssetType.IMAGE);
		
		className.set ("assets/images/ocean_bg.ase", __ASSET__assets_images_ocean_bg_ase);
		type.set ("assets/images/ocean_bg.ase", AssetType.BINARY);
		
		className.set ("assets/images/ocean_bg.png", __ASSET__assets_images_ocean_bg_png);
		type.set ("assets/images/ocean_bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/poles_front.png", __ASSET__assets_images_poles_front_png);
		type.set ("assets/images/poles_front.png", AssetType.IMAGE);
		
		className.set ("assets/images/powerbar_back.png", __ASSET__assets_images_powerbar_back_png);
		type.set ("assets/images/powerbar_back.png", AssetType.IMAGE);
		
		className.set ("assets/images/powerbar_fill.png", __ASSET__assets_images_powerbar_fill_png);
		type.set ("assets/images/powerbar_fill.png", AssetType.IMAGE);
		
		className.set ("assets/images/press-space.ase", __ASSET__assets_images_press_space_ase);
		type.set ("assets/images/press-space.ase", AssetType.BINARY);
		
		className.set ("assets/images/press-space.png", __ASSET__assets_images_press_space_png);
		type.set ("assets/images/press-space.png", AssetType.IMAGE);
		
		className.set ("assets/images/ripple.png", __ASSET__assets_images_ripple_png);
		type.set ("assets/images/ripple.png", AssetType.IMAGE);
		
		className.set ("assets/images/sploosh.png", __ASSET__assets_images_sploosh_png);
		type.set ("assets/images/sploosh.png", AssetType.IMAGE);
		
		className.set ("assets/images/water_moving.ase", __ASSET__assets_images_water_moving_ase);
		type.set ("assets/images/water_moving.ase", AssetType.BINARY);
		
		className.set ("assets/images/water_moving.png", __ASSET__assets_images_water_moving_png);
		type.set ("assets/images/water_moving.png", AssetType.IMAGE);
		
		className.set ("assets/music/fishin-up-something-good.mp3", __ASSET__assets_music_fishin_up_something_good_mp3);
		type.set ("assets/music/fishin-up-something-good.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/cast.wav", __ASSET__assets_sounds_cast_wav);
		type.set ("assets/sounds/cast.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/plop.wav", __ASSET__assets_sounds_plop_wav);
		type.set ("assets/sounds/plop.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/plop2.wav", __ASSET__assets_sounds_plop2_wav);
		type.set ("assets/sounds/plop2.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/reel.wav", __ASSET__assets_sounds_reel_wav);
		type.set ("assets/sounds/reel.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/wiggle.wav", __ASSET__assets_sounds_wiggle_wav);
		type.set ("assets/sounds/wiggle.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/windup.wav", __ASSET__assets_sounds_windup_wav);
		type.set ("assets/sounds/windup.wav", AssetType.SOUND);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmdelico_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmfeather_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmgermar_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmleaves_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_munro_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bird_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bird_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bird_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bobber_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_exclamation_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fisher_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_island_ase extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_island_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ocean_bg_ase extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_ocean_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_poles_front_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_powerbar_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_powerbar_fill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_press_space_ase extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_press_space_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ripple_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sploosh_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_water_moving_ase extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_water_moving_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_fishin_up_something_good_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cast_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_plop_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_plop2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reel_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_wiggle_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_windup_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5


@:keep #if display private #end class __ASSET__assets_fonts_bmdelico_ttf extends lime.text.Font { public function new () { super (); name = "BM delico A16"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_bmfeather_ttf extends lime.text.Font { public function new () { super (); name = "BM feather A20"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_bmgermar_ttf extends lime.text.Font { public function new () { super (); name = "BM germar A12"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_bmleaves_ttf extends lime.text.Font { public function new () { super (); name = "BM leaves A11"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_munro_ttf extends lime.text.Font { public function new () { super (); name = "Munro"; } } 



















































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:font("assets/fonts/BMdelico.TTF") #if display private #end class __ASSET__assets_fonts_bmdelico_ttf extends lime.text.Font {}
@:font("assets/fonts/BMfeather.TTF") #if display private #end class __ASSET__assets_fonts_bmfeather_ttf extends lime.text.Font {}
@:font("assets/fonts/BMgermar.ttf") #if display private #end class __ASSET__assets_fonts_bmgermar_ttf extends lime.text.Font {}
@:font("assets/fonts/BMleaves.ttf") #if display private #end class __ASSET__assets_fonts_bmleaves_ttf extends lime.text.Font {}
@:font("assets/fonts/Munro.ttf") #if display private #end class __ASSET__assets_fonts_munro_ttf extends lime.text.Font {}
@:image("assets/images/bg.png") #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:image("assets/images/bird_1.png") #if display private #end class __ASSET__assets_images_bird_1_png extends lime.graphics.Image {}
@:image("assets/images/bird_2.png") #if display private #end class __ASSET__assets_images_bird_2_png extends lime.graphics.Image {}
@:image("assets/images/bird_3.png") #if display private #end class __ASSET__assets_images_bird_3_png extends lime.graphics.Image {}
@:image("assets/images/bobber.png") #if display private #end class __ASSET__assets_images_bobber_png extends lime.graphics.Image {}
@:image("assets/images/cloud_0.png") #if display private #end class __ASSET__assets_images_cloud_0_png extends lime.graphics.Image {}
@:image("assets/images/cloud_1.png") #if display private #end class __ASSET__assets_images_cloud_1_png extends lime.graphics.Image {}
@:image("assets/images/cloud_10.png") #if display private #end class __ASSET__assets_images_cloud_10_png extends lime.graphics.Image {}
@:image("assets/images/cloud_2.png") #if display private #end class __ASSET__assets_images_cloud_2_png extends lime.graphics.Image {}
@:image("assets/images/cloud_3.png") #if display private #end class __ASSET__assets_images_cloud_3_png extends lime.graphics.Image {}
@:image("assets/images/cloud_4.png") #if display private #end class __ASSET__assets_images_cloud_4_png extends lime.graphics.Image {}
@:image("assets/images/cloud_5.png") #if display private #end class __ASSET__assets_images_cloud_5_png extends lime.graphics.Image {}
@:image("assets/images/cloud_6.png") #if display private #end class __ASSET__assets_images_cloud_6_png extends lime.graphics.Image {}
@:image("assets/images/cloud_7.png") #if display private #end class __ASSET__assets_images_cloud_7_png extends lime.graphics.Image {}
@:image("assets/images/cloud_8.png") #if display private #end class __ASSET__assets_images_cloud_8_png extends lime.graphics.Image {}
@:image("assets/images/cloud_9.png") #if display private #end class __ASSET__assets_images_cloud_9_png extends lime.graphics.Image {}
@:image("assets/images/dock.png") #if display private #end class __ASSET__assets_images_dock_png extends lime.graphics.Image {}
@:image("assets/images/exclamation_box.png") #if display private #end class __ASSET__assets_images_exclamation_box_png extends lime.graphics.Image {}
@:image("assets/images/fisher.png") #if display private #end class __ASSET__assets_images_fisher_png extends lime.graphics.Image {}
@:image("assets/images/fish_0.png") #if display private #end class __ASSET__assets_images_fish_0_png extends lime.graphics.Image {}
@:image("assets/images/fish_1.png") #if display private #end class __ASSET__assets_images_fish_1_png extends lime.graphics.Image {}
@:image("assets/images/fish_2.png") #if display private #end class __ASSET__assets_images_fish_2_png extends lime.graphics.Image {}
@:image("assets/images/fish_3.png") #if display private #end class __ASSET__assets_images_fish_3_png extends lime.graphics.Image {}
@:image("assets/images/fish_4.png") #if display private #end class __ASSET__assets_images_fish_4_png extends lime.graphics.Image {}
@:image("assets/images/fish_5.png") #if display private #end class __ASSET__assets_images_fish_5_png extends lime.graphics.Image {}
@:image("assets/images/fish_6.png") #if display private #end class __ASSET__assets_images_fish_6_png extends lime.graphics.Image {}
@:image("assets/images/fish_7.png") #if display private #end class __ASSET__assets_images_fish_7_png extends lime.graphics.Image {}
@:image("assets/images/fish_8.png") #if display private #end class __ASSET__assets_images_fish_8_png extends lime.graphics.Image {}
@:file("assets/images/island.ase") #if display private #end class __ASSET__assets_images_island_ase extends lime.utils.Bytes {}
@:image("assets/images/island.png") #if display private #end class __ASSET__assets_images_island_png extends lime.graphics.Image {}
@:image("assets/images/logo.png") #if display private #end class __ASSET__assets_images_logo_png extends lime.graphics.Image {}
@:file("assets/images/ocean_bg.ase") #if display private #end class __ASSET__assets_images_ocean_bg_ase extends lime.utils.Bytes {}
@:image("assets/images/ocean_bg.png") #if display private #end class __ASSET__assets_images_ocean_bg_png extends lime.graphics.Image {}
@:image("assets/images/poles_front.png") #if display private #end class __ASSET__assets_images_poles_front_png extends lime.graphics.Image {}
@:image("assets/images/powerbar_back.png") #if display private #end class __ASSET__assets_images_powerbar_back_png extends lime.graphics.Image {}
@:image("assets/images/powerbar_fill.png") #if display private #end class __ASSET__assets_images_powerbar_fill_png extends lime.graphics.Image {}
@:file("assets/images/press-space.ase") #if display private #end class __ASSET__assets_images_press_space_ase extends lime.utils.Bytes {}
@:image("assets/images/press-space.png") #if display private #end class __ASSET__assets_images_press_space_png extends lime.graphics.Image {}
@:image("assets/images/ripple.png") #if display private #end class __ASSET__assets_images_ripple_png extends lime.graphics.Image {}
@:image("assets/images/sploosh.png") #if display private #end class __ASSET__assets_images_sploosh_png extends lime.graphics.Image {}
@:file("assets/images/water_moving.ase") #if display private #end class __ASSET__assets_images_water_moving_ase extends lime.utils.Bytes {}
@:image("assets/images/water_moving.png") #if display private #end class __ASSET__assets_images_water_moving_png extends lime.graphics.Image {}
@:file("assets/music/fishin-up-something-good.mp3") #if display private #end class __ASSET__assets_music_fishin_up_something_good_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/cast.wav") #if display private #end class __ASSET__assets_sounds_cast_wav extends lime.utils.Bytes {}
@:file("assets/sounds/plop.wav") #if display private #end class __ASSET__assets_sounds_plop_wav extends lime.utils.Bytes {}
@:file("assets/sounds/plop2.wav") #if display private #end class __ASSET__assets_sounds_plop2_wav extends lime.utils.Bytes {}
@:file("assets/sounds/reel.wav") #if display private #end class __ASSET__assets_sounds_reel_wav extends lime.utils.Bytes {}
@:file("assets/sounds/wiggle.wav") #if display private #end class __ASSET__assets_sounds_wiggle_wav extends lime.utils.Bytes {}
@:file("assets/sounds/windup.wav") #if display private #end class __ASSET__assets_sounds_windup_wav extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/lib/flixel/4,3,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/lib/flixel/4,3,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_bmdelico_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_bmdelico_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_bmfeather_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_bmfeather_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_bmgermar_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_bmgermar_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_bmleaves_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_bmleaves_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_munro_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_munro_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end