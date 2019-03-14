package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Dynamic):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_bmdelico_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_bmfeather_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_bmgermar_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_bmleaves_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_chevyray___express_mono_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_chevyray___express_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_chevyray___tentown_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_munro_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end
		
		var data, manifest, library;
		
		#if kha
		
		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);
		
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");
		
		#else
		
		data = '{"name":null,"assets":"aoy4:sizezy4:typey4:TEXTy9:classNamey39:__ASSET__assets_data_data_goes_here_txty2:idy34:assets%2Fdata%2Fdata-goes-here.txtgoR0i26112R1y4:FONTR3y34:__ASSET__assets_fonts_bmdelico_ttfR5y29:assets%2Ffonts%2FBMdelico.ttfgoR0i20380R1R7R3y35:__ASSET__assets_fonts_bmfeather_ttfR5y30:assets%2Ffonts%2FBMfeather.ttfgoR0i21460R1R7R3y34:__ASSET__assets_fonts_bmgermar_ttfR5y29:assets%2Ffonts%2FBMgermar.ttfgoR0i22428R1R7R3y34:__ASSET__assets_fonts_bmleaves_ttfR5y29:assets%2Ffonts%2FBMleaves.ttfgoR0i16968R1R7R3y49:__ASSET__assets_fonts_chevyray___express_mono_ttfR5y50:assets%2Ffonts%2FChevyRay%20-%20Express%20Mono.ttfgoR0i16068R1R7R3y44:__ASSET__assets_fonts_chevyray___express_ttfR5y43:assets%2Ffonts%2FChevyRay%20-%20Express.ttfgoR0i14852R1R7R3y44:__ASSET__assets_fonts_chevyray___tentown_ttfR5y43:assets%2Ffonts%2FChevyRay%20-%20Tentown.ttfgoR0i28168R1R7R3y31:__ASSET__assets_fonts_munro_ttfR5y26:assets%2Ffonts%2FMunro.ttfgoR0i1180R1y5:IMAGER3y39:__ASSET__assets_images_bg_bg1_trail_pngR5y36:assets%2Fimages%2Fbg%2Fbg1_trail.pnggoR0i685R1R24R3y39:__ASSET__assets_images_bg_bg2_grass_pngR5y36:assets%2Fimages%2Fbg%2Fbg2_grass.pnggoR0i907R1R24R3y39:__ASSET__assets_images_bg_bg3_grass_pngR5y36:assets%2Fimages%2Fbg%2Fbg3_grass.pnggoR0i2709R1R24R3y40:__ASSET__assets_images_bg_bg4_trees1_pngR5y37:assets%2Fimages%2Fbg%2Fbg4_trees1.pnggoR0i2486R1R24R3y40:__ASSET__assets_images_bg_bg5_trees2_pngR5y37:assets%2Fimages%2Fbg%2Fbg5_trees2.pnggoR0i1427R1R24R3y39:__ASSET__assets_images_bg_bg6_mtns1_pngR5y36:assets%2Fimages%2Fbg%2Fbg6_mtns1.pnggoR0i2429R1R24R3y39:__ASSET__assets_images_bg_bg7_mtns2_pngR5y36:assets%2Fimages%2Fbg%2Fbg7_mtns2.pnggoR0i755R1R24R3y37:__ASSET__assets_images_bg_bg8_sky_pngR5y34:assets%2Fimages%2Fbg%2Fbg8_sky.pnggoR0i2812R1R24R3y29:__ASSET__assets_images_bg_pngR5y24:assets%2Fimages%2Fbg.pnggoR0i20375R1R24R3y35:__ASSET__assets_images_bg_beach_pngR5y30:assets%2Fimages%2Fbg_beach.pnggoR0i697R1R24R3y35:__ASSET__assets_images_bg_grass_pngR5y30:assets%2Fimages%2Fbg_grass.pnggoR0i18044R1R24R3y34:__ASSET__assets_images_bg_pond_pngR5y29:assets%2Fimages%2Fbg_pond.pnggoR0i23398R1R24R3y40:__ASSET__assets_images_bg_pondplants_pngR5y35:assets%2Fimages%2Fbg_pondplants.pnggoR0i1487R1R24R3y35:__ASSET__assets_images_bg_trail_pngR5y30:assets%2Fimages%2Fbg_trail.pnggoR0i157R1R24R3y33:__ASSET__assets_images_bird_1_pngR5y28:assets%2Fimages%2Fbird_1.pnggoR0i162R1R24R3y33:__ASSET__assets_images_bird_2_pngR5y28:assets%2Fimages%2Fbird_2.pnggoR0i148R1R24R3y33:__ASSET__assets_images_bird_3_pngR5y28:assets%2Fimages%2Fbird_3.pnggoR0i121R1R24R3y33:__ASSET__assets_images_bobber_pngR5y28:assets%2Fimages%2Fbobber.pnggoR0i228R1R24R3y34:__ASSET__assets_images_cloud_0_pngR5y29:assets%2Fimages%2Fcloud_0.pnggoR0i154R1R24R3y34:__ASSET__assets_images_cloud_1_pngR5y29:assets%2Fimages%2Fcloud_1.pnggoR0i251R1R24R3y35:__ASSET__assets_images_cloud_10_pngR5y30:assets%2Fimages%2Fcloud_10.pnggoR0i101R1R24R3y34:__ASSET__assets_images_cloud_2_pngR5y29:assets%2Fimages%2Fcloud_2.pnggoR0i146R1R24R3y34:__ASSET__assets_images_cloud_3_pngR5y29:assets%2Fimages%2Fcloud_3.pnggoR0i143R1R24R3y34:__ASSET__assets_images_cloud_4_pngR5y29:assets%2Fimages%2Fcloud_4.pnggoR0i108R1R24R3y34:__ASSET__assets_images_cloud_5_pngR5y29:assets%2Fimages%2Fcloud_5.pnggoR0i171R1R24R3y34:__ASSET__assets_images_cloud_6_pngR5y29:assets%2Fimages%2Fcloud_6.pnggoR0i201R1R24R3y34:__ASSET__assets_images_cloud_7_pngR5y29:assets%2Fimages%2Fcloud_7.pnggoR0i230R1R24R3y34:__ASSET__assets_images_cloud_8_pngR5y29:assets%2Fimages%2Fcloud_8.pnggoR0i120R1R24R3y34:__ASSET__assets_images_cloud_9_pngR5y29:assets%2Fimages%2Fcloud_9.pnggoR0i1573R1R24R3y31:__ASSET__assets_images_dock_pngR5y26:assets%2Fimages%2Fdock.pnggoR0i175R1R24R3y42:__ASSET__assets_images_exclamation_box_pngR5y37:assets%2Fimages%2Fexclamation_box.pnggoR0i360R1R24R3y52:__ASSET__assets_images_fish_ocean_atlanticsalmon_pngR5y51:assets%2Fimages%2Ffish%2Focean%2Fatlanticsalmon.pnggoR0i882R1R24R3y49:__ASSET__assets_images_fish_ocean_bluefintuna_pngR5y48:assets%2Fimages%2Ffish%2Focean%2Fbluefintuna.pnggoR0i2933R1R24R3y48:__ASSET__assets_images_fish_ocean_bluemarlin_pngR5y47:assets%2Fimages%2Ffish%2Focean%2Fbluemarlin.pnggoR0i343R1R24R3y46:__ASSET__assets_images_fish_ocean_bluetang_pngR5y45:assets%2Fimages%2Ffish%2Focean%2Fbluetang.pnggoR0i3049R1R24R3y52:__ASSET__assets_images_fish_ocean_greatbarracuda_pngR5y51:assets%2Fimages%2Ffish%2Focean%2Fgreatbarracuda.pnggoR0i423R1R24R3y48:__ASSET__assets_images_fish_ocean_hermitcrab_pngR5y47:assets%2Fimages%2Ffish%2Focean%2Fhermitcrab.pnggoR0i764R1R24R3y50:__ASSET__assets_images_fish_ocean_longfinsquid_pngR5y49:assets%2Fimages%2Ffish%2Focean%2Flongfinsquid.pnggoR0i379R1R24R3y52:__ASSET__assets_images_fish_ocean_northernpuffer_pngR5y51:assets%2Fimages%2Ffish%2Focean%2Fnorthernpuffer.pnggoR0i1253R1R24R3y51:__ASSET__assets_images_fish_ocean_speckledtrout_pngR5y50:assets%2Fimages%2Ffish%2Focean%2Fspeckledtrout.pnggoR0i930R1R24R3y52:__ASSET__assets_images_fish_ocean_summerflounder_pngR5y51:assets%2Fimages%2Ffish%2Focean%2Fsummerflounder.pnggoR0i258R1R24R3y52:__ASSET__assets_images_fish_pond_bluntnoseminnow_pngR5y51:assets%2Fimages%2Ffish%2Fpond%2Fbluntnoseminnow.pnggoR0i311R1R24R3y50:__ASSET__assets_images_fish_pond_broadtailmoor_pngR5y49:assets%2Fimages%2Ffish%2Fpond%2Fbroadtailmoor.pnggoR0i355R1R24R3y41:__ASSET__assets_images_fish_pond_goby_pngR5y40:assets%2Fimages%2Ffish%2Fpond%2Fgoby.pnggoR0i518R1R24R3y47:__ASSET__assets_images_fish_pond_goldenrudd_pngR5y46:assets%2Fimages%2Ffish%2Fpond%2Fgoldenrudd.pnggoR0i313R1R24R3y42:__ASSET__assets_images_fish_pond_guppy_pngR5y41:assets%2Fimages%2Ffish%2Fpond%2Fguppy.pnggoR0i597R1R24R3y40:__ASSET__assets_images_fish_pond_ide_pngR5y39:assets%2Fimages%2Ffish%2Fpond%2Fide.pnggoR0i596R1R24R3y40:__ASSET__assets_images_fish_pond_koi_pngR5y39:assets%2Fimages%2Ffish%2Fpond%2Fkoi.pnggoR0i478R1R24R3y48:__ASSET__assets_images_fish_pond_pumpkinseed_pngR5y47:assets%2Fimages%2Ffish%2Fpond%2Fpumpkinseed.pnggoR0i440R1R24R3y43:__ASSET__assets_images_fish_pond_ryukin_pngR5y42:assets%2Fimages%2Ffish%2Fpond%2Fryukin.pnggoR0i645R1R24R3y53:__ASSET__assets_images_fish_pond_siberiansturgeon_pngR5y52:assets%2Fimages%2Ffish%2Fpond%2Fsiberiansturgeon.pnggoR0i1021R1R24R3y50:__ASSET__assets_images_fish_river_blackcrappie_pngR5y49:assets%2Fimages%2Ffish%2Friver%2Fblackcrappie.pnggoR0i1441R1R24R3y49:__ASSET__assets_images_fish_river_bluecatfish_pngR5y48:assets%2Fimages%2Ffish%2Friver%2Fbluecatfish.pnggoR0i1024R1R24R3y46:__ASSET__assets_images_fish_river_bluegill_pngR5y45:assets%2Fimages%2Ffish%2Friver%2Fbluegill.pnggoR0i1372R1R24R3y52:__ASSET__assets_images_fish_river_largemouthbass_pngR5y51:assets%2Fimages%2Ffish%2Friver%2Flargemouthbass.pnggoR0i1121R1R24R3y49:__ASSET__assets_images_fish_river_longnosegar_pngR5y48:assets%2Fimages%2Ffish%2Friver%2Flongnosegar.pnggoR0i379R1R24R3y50:__ASSET__assets_images_fish_river_rainbowtrout_pngR5y49:assets%2Fimages%2Ffish%2Friver%2Frainbowtrout.pnggoR0i1157R1R24R3y46:__ASSET__assets_images_fish_river_rockbass_pngR5y45:assets%2Fimages%2Ffish%2Friver%2Frockbass.pnggoR0i719R1R24R3y49:__ASSET__assets_images_fish_river_yellowperch_pngR5y48:assets%2Fimages%2Ffish%2Friver%2Fyellowperch.pnggoR0i4681R1R24R3y33:__ASSET__assets_images_fisher_pngR5y28:assets%2Fimages%2Ffisher.pnggoR0i2008R1R24R3y37:__ASSET__assets_images_icon_beach_pngR5y32:assets%2Fimages%2Ficon_beach.pnggoR0i3147R1R24R3y36:__ASSET__assets_images_icon_pond_pngR5y31:assets%2Fimages%2Ficon_pond.pnggoR0i2735R1R24R3y37:__ASSET__assets_images_icon_river_pngR5y32:assets%2Fimages%2Ficon_river.pnggoR0i3336R1R24R3y33:__ASSET__assets_images_island_pngR5y28:assets%2Fimages%2Fisland.pnggoR0i2192R1R24R3y40:__ASSET__assets_images_locationicon1_pngR5y35:assets%2Fimages%2FlocationIcon1.pnggoR0i602R1R24R3y31:__ASSET__assets_images_logo_pngR5y26:assets%2Fimages%2Flogo.pnggoR0i2985R1R24R3y36:__ASSET__assets_images_map_beach_pngR5y31:assets%2Fimages%2Fmap_beach.pnggoR0i4178R1R24R3y35:__ASSET__assets_images_map_pond_pngR5y30:assets%2Fimages%2Fmap_pond.pnggoR0i3606R1R24R3y36:__ASSET__assets_images_map_river_pngR5y31:assets%2Fimages%2Fmap_river.pnggoR0i752R1R24R3y35:__ASSET__assets_images_ocean_bg_pngR5y30:assets%2Fimages%2Focean_bg.pnggoR0i692R1R24R3y38:__ASSET__assets_images_poles_front_pngR5y33:assets%2Fimages%2Fpoles_front.pnggoR0i146R1R24R3y40:__ASSET__assets_images_powerbar_back_pngR5y35:assets%2Fimages%2Fpowerbar_back.pnggoR0i92R1R24R3y40:__ASSET__assets_images_powerbar_fill_pngR5y35:assets%2Fimages%2Fpowerbar_fill.pnggoR0i353R1R24R3y38:__ASSET__assets_images_press_space_pngR5y33:assets%2Fimages%2Fpress-space.pnggoR0i1384R1R24R3y33:__ASSET__assets_images_ripple_pngR5y28:assets%2Fimages%2Fripple.pnggoR0i224R1R24R3y33:__ASSET__assets_images_shadow_pngR5y28:assets%2Fimages%2Fshadow.pnggoR0i491R1R24R3y34:__ASSET__assets_images_sploosh_pngR5y29:assets%2Fimages%2Fsploosh.pnggoR0i299R1R24R3y39:__ASSET__assets_images_tap_to_start_pngR5y34:assets%2Fimages%2Ftap-to-start.pnggoR0i180R1R24R3y37:__ASSET__assets_images_truck_back_pngR5y32:assets%2Fimages%2Ftruck_back.pnggoR0i938R1R24R3y37:__ASSET__assets_images_truck_body_pngR5y32:assets%2Fimages%2Ftruck_body.pnggoR0i408R1R24R3y39:__ASSET__assets_images_truck_person_pngR5y34:assets%2Fimages%2Ftruck_person.pnggoR0i275R1R24R3y38:__ASSET__assets_images_truck_wheel_pngR5y33:assets%2Fimages%2Ftruck_wheel.pnggoR0i52554R1R24R3y39:__ASSET__assets_images_water_moving_pngR5y34:assets%2Fimages%2Fwater_moving.pnggoR0i593502R1y5:MUSICR3y50:__ASSET__assets_music_fishin_up_something_good_mp3R5y45:assets%2Fmusic%2Ffishin-up-something-good.mp3goR0i5372106R1y5:SOUNDR3y37:__ASSET__assets_music_music_beach_wavR5y32:assets%2Fmusic%2Fmusic_beach.wavgoR0i5412042R1R194R3y39:__ASSET__assets_music_music_driving_wavR5y34:assets%2Fmusic%2Fmusic_driving.wavgoR0i5131192R1R194R3y36:__ASSET__assets_music_music_pond_wavR5y31:assets%2Fmusic%2Fmusic_pond.wavgoR0i5239944R1R194R3y37:__ASSET__assets_music_music_river_wavR5y32:assets%2Fmusic%2Fmusic_river.wavgoR0i5042302R1R194R3y43:__ASSET__assets_music_music_titlescreen_wavR5y38:assets%2Fmusic%2Fmusic_titlescreen.wavgoR0i388300R1R194R3y39:__ASSET__assets_sounds_arpeggio_bad_wavR5y34:assets%2Fsounds%2Farpeggio-bad.wavgoR0i477280R1R194R3y40:__ASSET__assets_sounds_arpeggio_ohno_wavR5y35:assets%2Fsounds%2Farpeggio-ohno.wavgoR0i407362R1R194R3y38:__ASSET__assets_sounds_arpeggio_ok_wavR5y33:assets%2Fsounds%2Farpeggio-ok.wavgoR0i377844R1R194R3y41:__ASSET__assets_sounds_arpeggio1_good_wavR5y36:assets%2Fsounds%2Farpeggio1-good.wavgoR0i436052R1R194R3y41:__ASSET__assets_sounds_arpeggio2_good_wavR5y36:assets%2Fsounds%2Farpeggio2-good.wavgoR0i412282R1R194R3y41:__ASSET__assets_sounds_arpeggio3_good_wavR5y36:assets%2Fsounds%2Farpeggio3-good.wavgoR0i65192R1R194R3y32:__ASSET__assets_sounds_bloop_wavR5y27:assets%2Fsounds%2Fbloop.wavgoR0i1151176R1R194R3y34:__ASSET__assets_sounds_bubbles_wavR5y29:assets%2Fsounds%2Fbubbles.wavgoR0i42544R1R194R3y31:__ASSET__assets_sounds_cast_wavR5y26:assets%2Fsounds%2Fcast.wavgoR0i130474R1R194R3y33:__ASSET__assets_sounds_engine_wavR5y28:assets%2Fsounds%2Fengine.wavgoR0i16530R1R194R3y31:__ASSET__assets_sounds_plop_wavR5y26:assets%2Fsounds%2Fplop.wavgoR0i25194R1R194R3y32:__ASSET__assets_sounds_plop2_wavR5y27:assets%2Fsounds%2Fplop2.wavgoR0i64040R1R194R3y31:__ASSET__assets_sounds_pop1_wavR5y26:assets%2Fsounds%2Fpop1.wavgoR0i335812R1R194R3y38:__ASSET__assets_sounds_press_start_wavR5y33:assets%2Fsounds%2Fpress-start.wavgoR0i42544R1R194R3y31:__ASSET__assets_sounds_reel_wavR5y26:assets%2Fsounds%2Freel.wavgoR0i441418R1R194R3y33:__ASSET__assets_sounds_reelin_wavR5y28:assets%2Fsounds%2Freelin.wavgoR0i152802R1R194R3y38:__ASSET__assets_sounds_reelin_fast_wavR5y33:assets%2Fsounds%2Freelin_fast.wavgoR0i440520R1R194R3y34:__ASSET__assets_sounds_reelout_wavR5y29:assets%2Fsounds%2Freelout.wavgoR0i226058R1R194R3y39:__ASSET__assets_sounds_reelout_fast_wavR5y34:assets%2Fsounds%2Freelout_fast.wavgoR0i48942R1R194R3y33:__ASSET__assets_sounds_swish1_wavR5y28:assets%2Fsounds%2Fswish1.wavgoR0i69860R1R194R3y34:__ASSET__assets_sounds_swoosh1_wavR5y29:assets%2Fsounds%2Fswoosh1.wavgoR0i45482R1R194R3y34:__ASSET__assets_sounds_swoosh2_wavR5y29:assets%2Fsounds%2Fswoosh2.wavgoR0i192004R1R194R3y58:__ASSET__assets_sounds_vo_fishing_ocean_atlanticsalmon_wavR5y59:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fatlanticsalmon.wavgoR0i176776R1R194R3y55:__ASSET__assets_sounds_vo_fishing_ocean_bluefintuna_wavR5y56:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fbluefintuna.wavgoR0i158768R1R194R3y54:__ASSET__assets_sounds_vo_fishing_ocean_bluemarlin_wavR5y55:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fbluemarlin.wavgoR0i135784R1R194R3y52:__ASSET__assets_sounds_vo_fishing_ocean_bluetang_wavR5y53:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fbluetang.wavgoR0i208782R1R194R3y58:__ASSET__assets_sounds_vo_fishing_ocean_greatbarracuda_wavR5y59:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fgreatbarracuda.wavgoR0i155954R1R194R3y54:__ASSET__assets_sounds_vo_fishing_ocean_hermitcrab_wavR5y55:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fhermitcrab.wavgoR0i204878R1R194R3y56:__ASSET__assets_sounds_vo_fishing_ocean_longfinsquid_wavR5y57:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Flongfinsquid.wavgoR0i172732R1R194R3y58:__ASSET__assets_sounds_vo_fishing_ocean_northernpuffer_wavR5y59:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fnorthernpuffer.wavgoR0i170038R1R194R3y57:__ASSET__assets_sounds_vo_fishing_ocean_speckledtrout_wavR5y58:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fspeckledtrout.wavgoR0i175346R1R194R3y58:__ASSET__assets_sounds_vo_fishing_ocean_summerflounder_wavR5y59:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fsummerflounder.wavgoR0i202046R1R194R3y44:__ASSET__assets_sounds_vo_fishing_pond_1_wavR5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F1.wavgoR0i256328R1R194R3y45:__ASSET__assets_sounds_vo_fishing_pond_10_wavR5y46:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F10.wavgoR0i119568R1R194R3y44:__ASSET__assets_sounds_vo_fishing_pond_2_wavR5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F2.wavgoR0i112526R1R194R3y44:__ASSET__assets_sounds_vo_fishing_pond_3_wavR5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F3.wavgoR0i135936R1R194R3y44:__ASSET__assets_sounds_vo_fishing_pond_4_wavR5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F4.wavgoR0i184138R1R194R3y44:__ASSET__assets_sounds_vo_fishing_pond_5_wavR5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F5.wavgoR0i154932R1R194R3y44:__ASSET__assets_sounds_vo_fishing_pond_6_wavR5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F6.wavgoR0i157982R1R194R3y44:__ASSET__assets_sounds_vo_fishing_pond_7_wavR5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F7.wavgoR0i86878R1R194R3y44:__ASSET__assets_sounds_vo_fishing_pond_8_wavR5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F8.wavgoR0i96318R1R194R3y44:__ASSET__assets_sounds_vo_fishing_pond_9_wavR5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F9.wavgoR0i202046R1R194R3y58:__ASSET__assets_sounds_vo_fishing_pond_bluntnoseminnow_wavR5y59:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fbluntnoseminnow.wavgoR0i184138R1R194R3y56:__ASSET__assets_sounds_vo_fishing_pond_broadtailmoor_wavR5y57:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fbroadtailmoor.wavgoR0i112526R1R194R3y47:__ASSET__assets_sounds_vo_fishing_pond_goby_wavR5y48:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fgoby.wavgoR0i157982R1R194R3y53:__ASSET__assets_sounds_vo_fishing_pond_goldenrudd_wavR5y54:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fgoldenrudd.wavgoR0i119568R1R194R3y48:__ASSET__assets_sounds_vo_fishing_pond_guppy_wavR5y49:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fguppy.wavgoR0i61988R1R194R3y46:__ASSET__assets_sounds_vo_fishing_pond_ide_wavR5y47:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fide.wavgoR0i96318R1R194R3y46:__ASSET__assets_sounds_vo_fishing_pond_koi_wavR5y47:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fkoi.wavgoR0i154932R1R194R3y54:__ASSET__assets_sounds_vo_fishing_pond_pumpkinseed_wavR5y55:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fpumpkinseed.wavgoR0i135936R1R194R3y49:__ASSET__assets_sounds_vo_fishing_pond_ryukin_wavR5y50:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fryukin.wavgoR0i256328R1R194R3y59:__ASSET__assets_sounds_vo_fishing_pond_siberiansturgeon_wavR5y60:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fsiberiansturgeon.wavgoR0i168450R1R194R3y56:__ASSET__assets_sounds_vo_fishing_river_blackcrappie_wavR5y57:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Fblackcrappie.wavgoR0i170108R1R194R3y55:__ASSET__assets_sounds_vo_fishing_river_bluecatfish_wavR5y56:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Fbluecatfish.wavgoR0i134810R1R194R3y52:__ASSET__assets_sounds_vo_fishing_river_bluegill_wavR5y53:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Fbluegill.wavgoR0i193746R1R194R3y58:__ASSET__assets_sounds_vo_fishing_river_largemouthbass_wavR5y59:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Flargemouthbass.wavgoR0i177558R1R194R3y55:__ASSET__assets_sounds_vo_fishing_river_longnosegar_wavR5y56:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Flongnosegar.wavgoR0i169952R1R194R3y56:__ASSET__assets_sounds_vo_fishing_river_rainbowtrout_wavR5y57:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Frainbowtrout.wavgoR0i110212R1R194R3y52:__ASSET__assets_sounds_vo_fishing_river_rockbass_wavR5y53:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Frockbass.wavgoR0i137894R1R194R3y55:__ASSET__assets_sounds_vo_fishing_river_yellowperch_wavR5y56:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Fyellowperch.wavgoR0i114754R1R194R3y48:__ASSET__assets_sounds_vo_fishing_youcaughta_wavR5y47:assets%2Fsounds%2FVO%2Ffishing%2Fyoucaughta.wavgoR0i135746R1R194R3y49:__ASSET__assets_sounds_vo_fishing_youcaughtan_wavR5y48:assets%2Fsounds%2FVO%2Ffishing%2Fyoucaughtan.wavgoR0i649604R1R194R3y49:__ASSET__assets_sounds_vo_fishinginstructions_wavR5y46:assets%2Fsounds%2FVO%2Ffishinginstructions.wavgoR0i108582R1R194R3y39:__ASSET__assets_sounds_vo_numbers_0_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F0.wavgoR0i92766R1R194R3y39:__ASSET__assets_sounds_vo_numbers_1_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F1.wavgoR0i103374R1R194R3y40:__ASSET__assets_sounds_vo_numbers_10_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F10.wavgoR0i163096R1R194R3y41:__ASSET__assets_sounds_vo_numbers_100_wavR5y40:assets%2Fsounds%2FVO%2Fnumbers%2F100.wavgoR0i125556R1R194R3y40:__ASSET__assets_sounds_vo_numbers_11_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F11.wavgoR0i110574R1R194R3y40:__ASSET__assets_sounds_vo_numbers_12_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F12.wavgoR0i137416R1R194R3y40:__ASSET__assets_sounds_vo_numbers_13_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F13.wavgoR0i153198R1R194R3y40:__ASSET__assets_sounds_vo_numbers_14_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F14.wavgoR0i149160R1R194R3y40:__ASSET__assets_sounds_vo_numbers_15_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F15.wavgoR0i169002R1R194R3y40:__ASSET__assets_sounds_vo_numbers_16_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F16.wavgoR0i191368R1R194R3y40:__ASSET__assets_sounds_vo_numbers_17_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F17.wavgoR0i145690R1R194R3y40:__ASSET__assets_sounds_vo_numbers_18_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F18.wavgoR0i159496R1R194R3y40:__ASSET__assets_sounds_vo_numbers_19_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F19.wavgoR0i89896R1R194R3y39:__ASSET__assets_sounds_vo_numbers_2_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F2.wavgoR0i116734R1R194R3y40:__ASSET__assets_sounds_vo_numbers_20_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F20.wavgoR0i142234R1R194R3y41:__ASSET__assets_sounds_vo_numbers_200_wavR5y40:assets%2Fsounds%2FVO%2Fnumbers%2F200.wavgoR0i94886R1R194R3y39:__ASSET__assets_sounds_vo_numbers_3_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F3.wavgoR0i120952R1R194R3y40:__ASSET__assets_sounds_vo_numbers_30_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F30.wavgoR0i154748R1R194R3y41:__ASSET__assets_sounds_vo_numbers_300_wavR5y40:assets%2Fsounds%2FVO%2Fnumbers%2F300.wavgoR0i109334R1R194R3y39:__ASSET__assets_sounds_vo_numbers_4_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F4.wavgoR0i99460R1R194R3y40:__ASSET__assets_sounds_vo_numbers_40_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F40.wavgoR0i144334R1R194R3y41:__ASSET__assets_sounds_vo_numbers_400_wavR5y40:assets%2Fsounds%2FVO%2Fnumbers%2F400.wavgoR0i110152R1R194R3y39:__ASSET__assets_sounds_vo_numbers_5_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F5.wavgoR0i135796R1R194R3y40:__ASSET__assets_sounds_vo_numbers_50_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F50.wavgoR0i170856R1R194R3y41:__ASSET__assets_sounds_vo_numbers_500_wavR5y40:assets%2Fsounds%2FVO%2Fnumbers%2F500.wavgoR0i111130R1R194R3y39:__ASSET__assets_sounds_vo_numbers_6_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F6.wavgoR0i134282R1R194R3y40:__ASSET__assets_sounds_vo_numbers_60_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F60.wavgoR0i184110R1R194R3y41:__ASSET__assets_sounds_vo_numbers_600_wavR5y40:assets%2Fsounds%2FVO%2Fnumbers%2F600.wavgoR0i111948R1R194R3y39:__ASSET__assets_sounds_vo_numbers_7_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F7.wavgoR0i150216R1R194R3y40:__ASSET__assets_sounds_vo_numbers_70_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F70.wavgoR0i146782R1R194R3y41:__ASSET__assets_sounds_vo_numbers_700_wavR5y40:assets%2Fsounds%2FVO%2Fnumbers%2F700.wavgoR0i87642R1R194R3y39:__ASSET__assets_sounds_vo_numbers_8_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F8.wavgoR0i124226R1R194R3y40:__ASSET__assets_sounds_vo_numbers_80_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F80.wavgoR0i129596R1R194R3y41:__ASSET__assets_sounds_vo_numbers_800_wavR5y40:assets%2Fsounds%2FVO%2Fnumbers%2F800.wavgoR0i119400R1R194R3y39:__ASSET__assets_sounds_vo_numbers_9_wavR5y38:assets%2Fsounds%2FVO%2Fnumbers%2F9.wavgoR0i131736R1R194R3y40:__ASSET__assets_sounds_vo_numbers_90_wavR5y39:assets%2Fsounds%2FVO%2Fnumbers%2F90.wavgoR0i136658R1R194R3y41:__ASSET__assets_sounds_vo_numbers_900_wavR5y40:assets%2Fsounds%2FVO%2Fnumbers%2F900.wavgoR0i113902R1R194R3y43:__ASSET__assets_sounds_vo_numbers_grams_wavR5y42:assets%2Fsounds%2FVO%2Fnumbers%2Fgrams.wavgoR0i138888R1R194R3y47:__ASSET__assets_sounds_vo_numbers_kilograms_wavR5y46:assets%2Fsounds%2FVO%2Fnumbers%2Fkilograms.wavgoR0i7254R1R194R3y42:__ASSET__assets_sounds_vo_numbers_null_wavR5y41:assets%2Fsounds%2FVO%2Fnumbers%2Fnull.wavgoR0i81428R1R194R3y43:__ASSET__assets_sounds_vo_numbers_point_wavR5y42:assets%2Fsounds%2FVO%2Fnumbers%2Fpoint.wavgoR0i676480R1R194R3y42:__ASSET__assets_sounds_vo_vo_location0_wavR5y39:assets%2Fsounds%2FVO%2Fvo_location0.wavgoR0i676480R1R194R3y42:__ASSET__assets_sounds_vo_vo_location1_wavR5y39:assets%2Fsounds%2FVO%2Fvo_location1.wavgoR0i676480R1R194R3y42:__ASSET__assets_sounds_vo_vo_location2_wavR5y39:assets%2Fsounds%2FVO%2Fvo_location2.wavgoR0i41018R1R194R3y33:__ASSET__assets_sounds_wiggle_wavR5y28:assets%2Fsounds%2Fwiggle.wavgoR0i23310R1R194R3y33:__ASSET__assets_sounds_windup_wavR5y28:assets%2Fsounds%2Fwindup.wavgoR0i2114R1R191R3y31:__ASSET__flixel_sounds_beep_mp3R5y26:flixel%2Fsounds%2Fbeep.mp3goR0i39706R1R191R3y33:__ASSET__flixel_sounds_flixel_mp3R5y28:flixel%2Fsounds%2Fflixel.mp3goR0i15744R1R7R3y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfgoR0i29724R1R7R3y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfgoR0i519R1R24R3y36:__ASSET__flixel_images_ui_button_pngR5y33:flixel%2Fimages%2Fui%2Fbutton.pnggoR0i3280R1R24R3y39:__ASSET__flixel_images_logo_default_pngR5y36:flixel%2Fimages%2Flogo%2Fdefault.pnggh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
		#end
		
	}
	
	
}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmdelico_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmfeather_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmgermar_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmleaves_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_chevyray___express_mono_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_chevyray___express_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_chevyray___tentown_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_munro_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_bg1_trail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_bg2_grass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_bg3_grass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_bg4_trees1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_bg5_trees2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_bg6_mtns1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_bg7_mtns2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_bg8_sky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_beach_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_grass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_pond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_pondplants_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_trail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
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
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_atlanticsalmon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_bluefintuna_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_bluemarlin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_bluetang_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_greatbarracuda_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_hermitcrab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_longfinsquid_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_northernpuffer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_speckledtrout_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_ocean_summerflounder_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_bluntnoseminnow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_broadtailmoor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_goby_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_goldenrudd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_guppy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_ide_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_koi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_pumpkinseed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_ryukin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_pond_siberiansturgeon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_river_blackcrappie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_river_bluecatfish_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_river_bluegill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_river_largemouthbass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_river_longnosegar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_river_rainbowtrout_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_river_rockbass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fish_river_yellowperch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fisher_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_icon_beach_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_icon_pond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_icon_river_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_island_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_locationicon1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_map_beach_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_map_pond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_map_river_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ocean_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_poles_front_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_powerbar_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_powerbar_fill_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_press_space_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ripple_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_shadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sploosh_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tap_to_start_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_truck_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_truck_body_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_truck_person_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_truck_wheel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_water_moving_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_fishin_up_something_good_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_beach_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_driving_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_pond_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_river_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_titlescreen_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio_bad_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio_ohno_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio_ok_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio1_good_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio2_good_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio3_good_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bloop_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bubbles_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cast_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_engine_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_plop_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_plop2_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pop1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_press_start_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reel_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reelin_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reelin_fast_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reelout_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reelout_fast_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_swish1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_swoosh1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_swoosh2_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_atlanticsalmon_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_bluefintuna_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_bluemarlin_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_bluetang_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_greatbarracuda_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_hermitcrab_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_longfinsquid_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_northernpuffer_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_speckledtrout_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_summerflounder_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_10_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_2_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_3_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_4_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_5_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_6_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_7_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_8_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_9_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_bluntnoseminnow_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_broadtailmoor_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_goby_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_goldenrudd_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_guppy_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_ide_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_koi_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_pumpkinseed_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_ryukin_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_siberiansturgeon_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_blackcrappie_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_bluecatfish_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_bluegill_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_largemouthbass_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_longnosegar_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_rainbowtrout_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_rockbass_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_yellowperch_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_youcaughta_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_youcaughtan_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishinginstructions_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_0_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_10_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_100_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_11_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_12_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_13_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_14_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_15_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_16_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_17_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_18_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_19_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_2_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_20_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_200_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_3_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_30_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_300_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_4_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_40_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_400_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_5_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_50_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_500_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_6_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_60_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_600_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_7_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_70_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_700_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_8_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_80_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_800_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_9_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_90_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_900_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_grams_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_kilograms_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_null_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_point_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_vo_location0_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_vo_location1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_vo_location2_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_wiggle_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_windup_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:font("assets/fonts/BMdelico.ttf") #if display private #end class __ASSET__assets_fonts_bmdelico_ttf extends lime.text.Font {}
@:keep @:font("assets/fonts/BMfeather.ttf") #if display private #end class __ASSET__assets_fonts_bmfeather_ttf extends lime.text.Font {}
@:keep @:font("assets/fonts/BMgermar.ttf") #if display private #end class __ASSET__assets_fonts_bmgermar_ttf extends lime.text.Font {}
@:keep @:font("assets/fonts/BMleaves.ttf") #if display private #end class __ASSET__assets_fonts_bmleaves_ttf extends lime.text.Font {}
@:keep @:font("assets/fonts/ChevyRay - Express Mono.ttf") #if display private #end class __ASSET__assets_fonts_chevyray___express_mono_ttf extends lime.text.Font {}
@:keep @:font("assets/fonts/ChevyRay - Express.ttf") #if display private #end class __ASSET__assets_fonts_chevyray___express_ttf extends lime.text.Font {}
@:keep @:font("assets/fonts/ChevyRay - Tentown.ttf") #if display private #end class __ASSET__assets_fonts_chevyray___tentown_ttf extends lime.text.Font {}
@:keep @:font("assets/fonts/Munro.ttf") #if display private #end class __ASSET__assets_fonts_munro_ttf extends lime.text.Font {}
@:keep @:image("assets/images/bg/bg1_trail.png") #if display private #end class __ASSET__assets_images_bg_bg1_trail_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg/bg2_grass.png") #if display private #end class __ASSET__assets_images_bg_bg2_grass_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg/bg3_grass.png") #if display private #end class __ASSET__assets_images_bg_bg3_grass_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg/bg4_trees1.png") #if display private #end class __ASSET__assets_images_bg_bg4_trees1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg/bg5_trees2.png") #if display private #end class __ASSET__assets_images_bg_bg5_trees2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg/bg6_mtns1.png") #if display private #end class __ASSET__assets_images_bg_bg6_mtns1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg/bg7_mtns2.png") #if display private #end class __ASSET__assets_images_bg_bg7_mtns2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg/bg8_sky.png") #if display private #end class __ASSET__assets_images_bg_bg8_sky_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg.png") #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg_beach.png") #if display private #end class __ASSET__assets_images_bg_beach_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg_grass.png") #if display private #end class __ASSET__assets_images_bg_grass_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg_pond.png") #if display private #end class __ASSET__assets_images_bg_pond_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg_pondplants.png") #if display private #end class __ASSET__assets_images_bg_pondplants_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg_trail.png") #if display private #end class __ASSET__assets_images_bg_trail_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bird_1.png") #if display private #end class __ASSET__assets_images_bird_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bird_2.png") #if display private #end class __ASSET__assets_images_bird_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bird_3.png") #if display private #end class __ASSET__assets_images_bird_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bobber.png") #if display private #end class __ASSET__assets_images_bobber_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_0.png") #if display private #end class __ASSET__assets_images_cloud_0_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_1.png") #if display private #end class __ASSET__assets_images_cloud_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_10.png") #if display private #end class __ASSET__assets_images_cloud_10_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_2.png") #if display private #end class __ASSET__assets_images_cloud_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_3.png") #if display private #end class __ASSET__assets_images_cloud_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_4.png") #if display private #end class __ASSET__assets_images_cloud_4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_5.png") #if display private #end class __ASSET__assets_images_cloud_5_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_6.png") #if display private #end class __ASSET__assets_images_cloud_6_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_7.png") #if display private #end class __ASSET__assets_images_cloud_7_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_8.png") #if display private #end class __ASSET__assets_images_cloud_8_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cloud_9.png") #if display private #end class __ASSET__assets_images_cloud_9_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dock.png") #if display private #end class __ASSET__assets_images_dock_png extends lime.graphics.Image {}
@:keep @:image("assets/images/exclamation_box.png") #if display private #end class __ASSET__assets_images_exclamation_box_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/atlanticsalmon.png") #if display private #end class __ASSET__assets_images_fish_ocean_atlanticsalmon_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/bluefintuna.png") #if display private #end class __ASSET__assets_images_fish_ocean_bluefintuna_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/bluemarlin.png") #if display private #end class __ASSET__assets_images_fish_ocean_bluemarlin_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/bluetang.png") #if display private #end class __ASSET__assets_images_fish_ocean_bluetang_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/greatbarracuda.png") #if display private #end class __ASSET__assets_images_fish_ocean_greatbarracuda_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/hermitcrab.png") #if display private #end class __ASSET__assets_images_fish_ocean_hermitcrab_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/longfinsquid.png") #if display private #end class __ASSET__assets_images_fish_ocean_longfinsquid_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/northernpuffer.png") #if display private #end class __ASSET__assets_images_fish_ocean_northernpuffer_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/speckledtrout.png") #if display private #end class __ASSET__assets_images_fish_ocean_speckledtrout_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/ocean/summerflounder.png") #if display private #end class __ASSET__assets_images_fish_ocean_summerflounder_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/bluntnoseminnow.png") #if display private #end class __ASSET__assets_images_fish_pond_bluntnoseminnow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/broadtailmoor.png") #if display private #end class __ASSET__assets_images_fish_pond_broadtailmoor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/goby.png") #if display private #end class __ASSET__assets_images_fish_pond_goby_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/goldenrudd.png") #if display private #end class __ASSET__assets_images_fish_pond_goldenrudd_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/guppy.png") #if display private #end class __ASSET__assets_images_fish_pond_guppy_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/ide.png") #if display private #end class __ASSET__assets_images_fish_pond_ide_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/koi.png") #if display private #end class __ASSET__assets_images_fish_pond_koi_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/pumpkinseed.png") #if display private #end class __ASSET__assets_images_fish_pond_pumpkinseed_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/ryukin.png") #if display private #end class __ASSET__assets_images_fish_pond_ryukin_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/pond/siberiansturgeon.png") #if display private #end class __ASSET__assets_images_fish_pond_siberiansturgeon_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/river/blackcrappie.png") #if display private #end class __ASSET__assets_images_fish_river_blackcrappie_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/river/bluecatfish.png") #if display private #end class __ASSET__assets_images_fish_river_bluecatfish_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/river/bluegill.png") #if display private #end class __ASSET__assets_images_fish_river_bluegill_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/river/largemouthbass.png") #if display private #end class __ASSET__assets_images_fish_river_largemouthbass_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/river/longnosegar.png") #if display private #end class __ASSET__assets_images_fish_river_longnosegar_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/river/rainbowtrout.png") #if display private #end class __ASSET__assets_images_fish_river_rainbowtrout_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/river/rockbass.png") #if display private #end class __ASSET__assets_images_fish_river_rockbass_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fish/river/yellowperch.png") #if display private #end class __ASSET__assets_images_fish_river_yellowperch_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fisher.png") #if display private #end class __ASSET__assets_images_fisher_png extends lime.graphics.Image {}
@:keep @:image("assets/images/icon_beach.png") #if display private #end class __ASSET__assets_images_icon_beach_png extends lime.graphics.Image {}
@:keep @:image("assets/images/icon_pond.png") #if display private #end class __ASSET__assets_images_icon_pond_png extends lime.graphics.Image {}
@:keep @:image("assets/images/icon_river.png") #if display private #end class __ASSET__assets_images_icon_river_png extends lime.graphics.Image {}
@:keep @:image("assets/images/island.png") #if display private #end class __ASSET__assets_images_island_png extends lime.graphics.Image {}
@:keep @:image("assets/images/locationIcon1.png") #if display private #end class __ASSET__assets_images_locationicon1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/logo.png") #if display private #end class __ASSET__assets_images_logo_png extends lime.graphics.Image {}
@:keep @:image("assets/images/map_beach.png") #if display private #end class __ASSET__assets_images_map_beach_png extends lime.graphics.Image {}
@:keep @:image("assets/images/map_pond.png") #if display private #end class __ASSET__assets_images_map_pond_png extends lime.graphics.Image {}
@:keep @:image("assets/images/map_river.png") #if display private #end class __ASSET__assets_images_map_river_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ocean_bg.png") #if display private #end class __ASSET__assets_images_ocean_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/poles_front.png") #if display private #end class __ASSET__assets_images_poles_front_png extends lime.graphics.Image {}
@:keep @:image("assets/images/powerbar_back.png") #if display private #end class __ASSET__assets_images_powerbar_back_png extends lime.graphics.Image {}
@:keep @:image("assets/images/powerbar_fill.png") #if display private #end class __ASSET__assets_images_powerbar_fill_png extends lime.graphics.Image {}
@:keep @:image("assets/images/press-space.png") #if display private #end class __ASSET__assets_images_press_space_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ripple.png") #if display private #end class __ASSET__assets_images_ripple_png extends lime.graphics.Image {}
@:keep @:image("assets/images/shadow.png") #if display private #end class __ASSET__assets_images_shadow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/sploosh.png") #if display private #end class __ASSET__assets_images_sploosh_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tap-to-start.png") #if display private #end class __ASSET__assets_images_tap_to_start_png extends lime.graphics.Image {}
@:keep @:image("assets/images/truck_back.png") #if display private #end class __ASSET__assets_images_truck_back_png extends lime.graphics.Image {}
@:keep @:image("assets/images/truck_body.png") #if display private #end class __ASSET__assets_images_truck_body_png extends lime.graphics.Image {}
@:keep @:image("assets/images/truck_person.png") #if display private #end class __ASSET__assets_images_truck_person_png extends lime.graphics.Image {}
@:keep @:image("assets/images/truck_wheel.png") #if display private #end class __ASSET__assets_images_truck_wheel_png extends lime.graphics.Image {}
@:keep @:image("assets/images/water_moving.png") #if display private #end class __ASSET__assets_images_water_moving_png extends lime.graphics.Image {}
@:keep @:file("assets/music/fishin-up-something-good.mp3") #if display private #end class __ASSET__assets_music_fishin_up_something_good_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/music_beach.wav") #if display private #end class __ASSET__assets_music_music_beach_wav extends haxe.io.Bytes {}
@:keep @:file("assets/music/music_driving.wav") #if display private #end class __ASSET__assets_music_music_driving_wav extends haxe.io.Bytes {}
@:keep @:file("assets/music/music_pond.wav") #if display private #end class __ASSET__assets_music_music_pond_wav extends haxe.io.Bytes {}
@:keep @:file("assets/music/music_river.wav") #if display private #end class __ASSET__assets_music_music_river_wav extends haxe.io.Bytes {}
@:keep @:file("assets/music/music_titlescreen.wav") #if display private #end class __ASSET__assets_music_music_titlescreen_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/arpeggio-bad.wav") #if display private #end class __ASSET__assets_sounds_arpeggio_bad_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/arpeggio-ohno.wav") #if display private #end class __ASSET__assets_sounds_arpeggio_ohno_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/arpeggio-ok.wav") #if display private #end class __ASSET__assets_sounds_arpeggio_ok_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/arpeggio1-good.wav") #if display private #end class __ASSET__assets_sounds_arpeggio1_good_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/arpeggio2-good.wav") #if display private #end class __ASSET__assets_sounds_arpeggio2_good_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/arpeggio3-good.wav") #if display private #end class __ASSET__assets_sounds_arpeggio3_good_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/bloop.wav") #if display private #end class __ASSET__assets_sounds_bloop_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/bubbles.wav") #if display private #end class __ASSET__assets_sounds_bubbles_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/cast.wav") #if display private #end class __ASSET__assets_sounds_cast_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/engine.wav") #if display private #end class __ASSET__assets_sounds_engine_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/plop.wav") #if display private #end class __ASSET__assets_sounds_plop_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/plop2.wav") #if display private #end class __ASSET__assets_sounds_plop2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/pop1.wav") #if display private #end class __ASSET__assets_sounds_pop1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/press-start.wav") #if display private #end class __ASSET__assets_sounds_press_start_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/reel.wav") #if display private #end class __ASSET__assets_sounds_reel_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/reelin.wav") #if display private #end class __ASSET__assets_sounds_reelin_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/reelin_fast.wav") #if display private #end class __ASSET__assets_sounds_reelin_fast_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/reelout.wav") #if display private #end class __ASSET__assets_sounds_reelout_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/reelout_fast.wav") #if display private #end class __ASSET__assets_sounds_reelout_fast_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/swish1.wav") #if display private #end class __ASSET__assets_sounds_swish1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/swoosh1.wav") #if display private #end class __ASSET__assets_sounds_swoosh1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/swoosh2.wav") #if display private #end class __ASSET__assets_sounds_swoosh2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/atlanticsalmon.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_atlanticsalmon_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/bluefintuna.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_bluefintuna_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/bluemarlin.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_bluemarlin_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/bluetang.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_bluetang_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/greatbarracuda.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_greatbarracuda_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/hermitcrab.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_hermitcrab_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/longfinsquid.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_longfinsquid_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/northernpuffer.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_northernpuffer_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/speckledtrout.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_speckledtrout_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/ocean/summerflounder.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_summerflounder_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/1.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/10.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_10_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/2.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/3.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/4.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_4_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/5.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_5_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/6.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_6_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/7.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_7_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/8.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_8_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/9.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_9_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/bluntnoseminnow.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_bluntnoseminnow_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/broadtailmoor.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_broadtailmoor_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/goby.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_goby_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/goldenrudd.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_goldenrudd_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/guppy.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_guppy_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/ide.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_ide_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/koi.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_koi_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/pumpkinseed.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_pumpkinseed_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/ryukin.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_ryukin_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/pond/siberiansturgeon.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_siberiansturgeon_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/river/blackcrappie.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_river_blackcrappie_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/river/bluecatfish.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_river_bluecatfish_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/river/bluegill.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_river_bluegill_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/river/largemouthbass.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_river_largemouthbass_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/river/longnosegar.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_river_longnosegar_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/river/rainbowtrout.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_river_rainbowtrout_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/river/rockbass.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_river_rockbass_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/river/yellowperch.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_river_yellowperch_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/youcaughta.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_youcaughta_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishing/youcaughtan.wav") #if display private #end class __ASSET__assets_sounds_vo_fishing_youcaughtan_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/fishinginstructions.wav") #if display private #end class __ASSET__assets_sounds_vo_fishinginstructions_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/0.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_0_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/1.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/10.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_10_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/100.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_100_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/11.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_11_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/12.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_12_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/13.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_13_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/14.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_14_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/15.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_15_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/16.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_16_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/17.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_17_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/18.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_18_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/19.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_19_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/2.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/20.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_20_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/200.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_200_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/3.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/30.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_30_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/300.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_300_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/4.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_4_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/40.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_40_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/400.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_400_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/5.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_5_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/50.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_50_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/500.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_500_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/6.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_6_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/60.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_60_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/600.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_600_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/7.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_7_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/70.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_70_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/700.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_700_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/8.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_8_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/80.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_80_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/800.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_800_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/9.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_9_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/90.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_90_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/900.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_900_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/grams.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_grams_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/kilograms.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_kilograms_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/null.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_null_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/numbers/point.wav") #if display private #end class __ASSET__assets_sounds_vo_numbers_point_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/vo_location0.wav") #if display private #end class __ASSET__assets_sounds_vo_vo_location0_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/vo_location1.wav") #if display private #end class __ASSET__assets_sounds_vo_vo_location1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/VO/vo_location2.wav") #if display private #end class __ASSET__assets_sounds_vo_vo_location2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/wiggle.wav") #if display private #end class __ASSET__assets_sounds_wiggle_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/windup.wav") #if display private #end class __ASSET__assets_sounds_windup_wav extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,5,1/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,5,1/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:font("/usr/local/lib/haxe/lib/flixel/4,5,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("/usr/local/lib/haxe/lib/flixel/4,5,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/4,5,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/4,5,1/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_bmdelico_ttf') #if display private #end class __ASSET__assets_fonts_bmdelico_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/BMdelico.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "BM delico A16"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_bmfeather_ttf') #if display private #end class __ASSET__assets_fonts_bmfeather_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/BMfeather.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "BM feather A20"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_bmgermar_ttf') #if display private #end class __ASSET__assets_fonts_bmgermar_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/BMgermar.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "BM germar A12"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_bmleaves_ttf') #if display private #end class __ASSET__assets_fonts_bmleaves_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/BMleaves.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "BM leaves A11"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_chevyray___express_mono_ttf') #if display private #end class __ASSET__assets_fonts_chevyray___express_mono_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/ChevyRay - Express Mono.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "ChevyRay - Express Mono Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_chevyray___express_ttf') #if display private #end class __ASSET__assets_fonts_chevyray___express_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/ChevyRay - Express.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "ChevyRay - Express Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_chevyray___tentown_ttf') #if display private #end class __ASSET__assets_fonts_chevyray___tentown_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/ChevyRay - Tentown.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "ChevyRay - Tentown Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_munro_ttf') #if display private #end class __ASSET__assets_fonts_munro_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Munro.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Munro"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_bmdelico_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_bmdelico_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_bmdelico_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_bmfeather_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_bmfeather_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_bmfeather_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_bmgermar_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_bmgermar_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_bmgermar_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_bmleaves_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_bmleaves_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_bmleaves_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_chevyray___express_mono_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_chevyray___express_mono_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_chevyray___express_mono_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_chevyray___express_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_chevyray___express_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_chevyray___express_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_chevyray___tentown_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_chevyray___tentown_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_chevyray___tentown_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_munro_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_munro_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_munro_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_bmdelico_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_bmdelico_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_bmdelico_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_bmfeather_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_bmfeather_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_bmfeather_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_bmgermar_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_bmgermar_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_bmgermar_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_bmleaves_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_bmleaves_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_bmleaves_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_chevyray___express_mono_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_chevyray___express_mono_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_chevyray___express_mono_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_chevyray___express_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_chevyray___express_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_chevyray___express_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_chevyray___tentown_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_chevyray___tentown_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_chevyray___tentown_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_munro_ttf') #if display private #end class __ASSET__OPENFL__assets_fonts_munro_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_munro_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end