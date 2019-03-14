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
		
		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR2i26112R3y4:FONTy9:classNamey34:__ASSET__assets_fonts_bmdelico_ttfR5y29:assets%2Ffonts%2FBMdelico.ttfR6tgoR2i20380R3R7R8y35:__ASSET__assets_fonts_bmfeather_ttfR5y30:assets%2Ffonts%2FBMfeather.ttfR6tgoR2i21460R3R7R8y34:__ASSET__assets_fonts_bmgermar_ttfR5y29:assets%2Ffonts%2FBMgermar.ttfR6tgoR2i22428R3R7R8y34:__ASSET__assets_fonts_bmleaves_ttfR5y29:assets%2Ffonts%2FBMleaves.ttfR6tgoR2i16968R3R7R8y49:__ASSET__assets_fonts_chevyray___express_mono_ttfR5y50:assets%2Ffonts%2FChevyRay%20-%20Express%20Mono.ttfR6tgoR2i16068R3R7R8y44:__ASSET__assets_fonts_chevyray___express_ttfR5y43:assets%2Ffonts%2FChevyRay%20-%20Express.ttfR6tgoR2i14852R3R7R8y44:__ASSET__assets_fonts_chevyray___tentown_ttfR5y43:assets%2Ffonts%2FChevyRay%20-%20Tentown.ttfR6tgoR2i28168R3R7R8y31:__ASSET__assets_fonts_munro_ttfR5y26:assets%2Ffonts%2FMunro.ttfR6tgoR0y36:assets%2Fimages%2Fbg%2Fbg1_trail.pngR2i1180R3y5:IMAGER5R25R6tgoR0y36:assets%2Fimages%2Fbg%2Fbg2_grass.pngR2i685R3R26R5R27R6tgoR0y36:assets%2Fimages%2Fbg%2Fbg3_grass.pngR2i907R3R26R5R28R6tgoR0y37:assets%2Fimages%2Fbg%2Fbg4_trees1.pngR2i2709R3R26R5R29R6tgoR0y37:assets%2Fimages%2Fbg%2Fbg5_trees2.pngR2i2486R3R26R5R30R6tgoR0y36:assets%2Fimages%2Fbg%2Fbg6_mtns1.pngR2i1427R3R26R5R31R6tgoR0y36:assets%2Fimages%2Fbg%2Fbg7_mtns2.pngR2i2429R3R26R5R32R6tgoR0y34:assets%2Fimages%2Fbg%2Fbg8_sky.pngR2i755R3R26R5R33R6tgoR0y24:assets%2Fimages%2Fbg.pngR2i2812R3R26R5R34R6tgoR0y30:assets%2Fimages%2Fbg_beach.pngR2i20375R3R26R5R35R6tgoR0y30:assets%2Fimages%2Fbg_grass.pngR2i697R3R26R5R36R6tgoR0y29:assets%2Fimages%2Fbg_pond.pngR2i18044R3R26R5R37R6tgoR0y35:assets%2Fimages%2Fbg_pondplants.pngR2i23398R3R26R5R38R6tgoR0y30:assets%2Fimages%2Fbg_trail.pngR2i1487R3R26R5R39R6tgoR0y28:assets%2Fimages%2Fbird_1.pngR2i157R3R26R5R40R6tgoR0y28:assets%2Fimages%2Fbird_2.pngR2i162R3R26R5R41R6tgoR0y28:assets%2Fimages%2Fbird_3.pngR2i148R3R26R5R42R6tgoR0y28:assets%2Fimages%2Fbobber.pngR2i121R3R26R5R43R6tgoR0y29:assets%2Fimages%2Fcloud_0.pngR2i228R3R26R5R44R6tgoR0y29:assets%2Fimages%2Fcloud_1.pngR2i154R3R26R5R45R6tgoR0y30:assets%2Fimages%2Fcloud_10.pngR2i251R3R26R5R46R6tgoR0y29:assets%2Fimages%2Fcloud_2.pngR2i101R3R26R5R47R6tgoR0y29:assets%2Fimages%2Fcloud_3.pngR2i146R3R26R5R48R6tgoR0y29:assets%2Fimages%2Fcloud_4.pngR2i143R3R26R5R49R6tgoR0y29:assets%2Fimages%2Fcloud_5.pngR2i108R3R26R5R50R6tgoR0y29:assets%2Fimages%2Fcloud_6.pngR2i171R3R26R5R51R6tgoR0y29:assets%2Fimages%2Fcloud_7.pngR2i201R3R26R5R52R6tgoR0y29:assets%2Fimages%2Fcloud_8.pngR2i230R3R26R5R53R6tgoR0y29:assets%2Fimages%2Fcloud_9.pngR2i120R3R26R5R54R6tgoR0y26:assets%2Fimages%2Fdock.pngR2i1573R3R26R5R55R6tgoR0y37:assets%2Fimages%2Fexclamation_box.pngR2i175R3R26R5R56R6tgoR0y51:assets%2Fimages%2Ffish%2Focean%2Fatlanticsalmon.pngR2i360R3R26R5R57R6tgoR0y48:assets%2Fimages%2Ffish%2Focean%2Fbluefintuna.pngR2i882R3R26R5R58R6tgoR0y47:assets%2Fimages%2Ffish%2Focean%2Fbluemarlin.pngR2i2933R3R26R5R59R6tgoR0y45:assets%2Fimages%2Ffish%2Focean%2Fbluetang.pngR2i343R3R26R5R60R6tgoR0y51:assets%2Fimages%2Ffish%2Focean%2Fgreatbarracuda.pngR2i3049R3R26R5R61R6tgoR0y47:assets%2Fimages%2Ffish%2Focean%2Fhermitcrab.pngR2i423R3R26R5R62R6tgoR0y49:assets%2Fimages%2Ffish%2Focean%2Flongfinsquid.pngR2i764R3R26R5R63R6tgoR0y51:assets%2Fimages%2Ffish%2Focean%2Fnorthernpuffer.pngR2i379R3R26R5R64R6tgoR0y50:assets%2Fimages%2Ffish%2Focean%2Fspeckledtrout.pngR2i1253R3R26R5R65R6tgoR0y51:assets%2Fimages%2Ffish%2Focean%2Fsummerflounder.pngR2i930R3R26R5R66R6tgoR0y51:assets%2Fimages%2Ffish%2Fpond%2Fbluntnoseminnow.pngR2i258R3R26R5R67R6tgoR0y49:assets%2Fimages%2Ffish%2Fpond%2Fbroadtailmoor.pngR2i311R3R26R5R68R6tgoR0y40:assets%2Fimages%2Ffish%2Fpond%2Fgoby.pngR2i355R3R26R5R69R6tgoR0y46:assets%2Fimages%2Ffish%2Fpond%2Fgoldenrudd.pngR2i518R3R26R5R70R6tgoR0y41:assets%2Fimages%2Ffish%2Fpond%2Fguppy.pngR2i313R3R26R5R71R6tgoR0y39:assets%2Fimages%2Ffish%2Fpond%2Fide.pngR2i597R3R26R5R72R6tgoR0y39:assets%2Fimages%2Ffish%2Fpond%2Fkoi.pngR2i596R3R26R5R73R6tgoR0y47:assets%2Fimages%2Ffish%2Fpond%2Fpumpkinseed.pngR2i478R3R26R5R74R6tgoR0y42:assets%2Fimages%2Ffish%2Fpond%2Fryukin.pngR2i440R3R26R5R75R6tgoR0y52:assets%2Fimages%2Ffish%2Fpond%2Fsiberiansturgeon.pngR2i645R3R26R5R76R6tgoR0y49:assets%2Fimages%2Ffish%2Friver%2Fblackcrappie.pngR2i1021R3R26R5R77R6tgoR0y48:assets%2Fimages%2Ffish%2Friver%2Fbluecatfish.pngR2i1441R3R26R5R78R6tgoR0y45:assets%2Fimages%2Ffish%2Friver%2Fbluegill.pngR2i1024R3R26R5R79R6tgoR0y51:assets%2Fimages%2Ffish%2Friver%2Flargemouthbass.pngR2i1372R3R26R5R80R6tgoR0y48:assets%2Fimages%2Ffish%2Friver%2Flongnosegar.pngR2i1121R3R26R5R81R6tgoR0y49:assets%2Fimages%2Ffish%2Friver%2Frainbowtrout.pngR2i379R3R26R5R82R6tgoR0y45:assets%2Fimages%2Ffish%2Friver%2Frockbass.pngR2i1157R3R26R5R83R6tgoR0y48:assets%2Fimages%2Ffish%2Friver%2Fyellowperch.pngR2i719R3R26R5R84R6tgoR0y28:assets%2Fimages%2Ffisher.pngR2i4681R3R26R5R85R6tgoR0y32:assets%2Fimages%2Ficon_beach.pngR2i2008R3R26R5R86R6tgoR0y31:assets%2Fimages%2Ficon_pond.pngR2i3147R3R26R5R87R6tgoR0y32:assets%2Fimages%2Ficon_river.pngR2i2735R3R26R5R88R6tgoR0y28:assets%2Fimages%2Fisland.pngR2i3336R3R26R5R89R6tgoR0y35:assets%2Fimages%2FlocationIcon1.pngR2i2192R3R26R5R90R6tgoR0y26:assets%2Fimages%2Flogo.pngR2i602R3R26R5R91R6tgoR0y31:assets%2Fimages%2Fmap_beach.pngR2i2985R3R26R5R92R6tgoR0y30:assets%2Fimages%2Fmap_pond.pngR2i4178R3R26R5R93R6tgoR0y31:assets%2Fimages%2Fmap_river.pngR2i3606R3R26R5R94R6tgoR0y30:assets%2Fimages%2Focean_bg.pngR2i752R3R26R5R95R6tgoR0y33:assets%2Fimages%2Fpoles_front.pngR2i692R3R26R5R96R6tgoR0y35:assets%2Fimages%2Fpowerbar_back.pngR2i146R3R26R5R97R6tgoR0y35:assets%2Fimages%2Fpowerbar_fill.pngR2i92R3R26R5R98R6tgoR0y33:assets%2Fimages%2Fpress-space.pngR2i353R3R26R5R99R6tgoR0y28:assets%2Fimages%2Fripple.pngR2i1384R3R26R5R100R6tgoR0y28:assets%2Fimages%2Fshadow.pngR2i224R3R26R5R101R6tgoR0y29:assets%2Fimages%2Fsploosh.pngR2i491R3R26R5R102R6tgoR0y34:assets%2Fimages%2Ftap-to-start.pngR2i299R3R26R5R103R6tgoR0y32:assets%2Fimages%2Ftruck_back.pngR2i180R3R26R5R104R6tgoR0y32:assets%2Fimages%2Ftruck_body.pngR2i938R3R26R5R105R6tgoR0y34:assets%2Fimages%2Ftruck_person.pngR2i408R3R26R5R106R6tgoR0y33:assets%2Fimages%2Ftruck_wheel.pngR2i275R3R26R5R107R6tgoR0y34:assets%2Fimages%2Fwater_moving.pngR2i52554R3R26R5R108R6tgoR2i593502R3y5:MUSICR5y45:assets%2Fmusic%2Ffishin-up-something-good.mp3y9:pathGroupaR110hR6tgoR2i5372106R3y5:SOUNDR5y32:assets%2Fmusic%2Fmusic_beach.wavR111aR113hR6tgoR2i5412042R3R112R5y34:assets%2Fmusic%2Fmusic_driving.wavR111aR114hR6tgoR2i5131192R3R112R5y31:assets%2Fmusic%2Fmusic_pond.wavR111aR115hR6tgoR2i5239944R3R112R5y32:assets%2Fmusic%2Fmusic_river.wavR111aR116hR6tgoR2i5042302R3R112R5y38:assets%2Fmusic%2Fmusic_titlescreen.wavR111aR117hR6tgoR2i388300R3R112R5y34:assets%2Fsounds%2Farpeggio-bad.wavR111aR118hR6tgoR2i477280R3R112R5y35:assets%2Fsounds%2Farpeggio-ohno.wavR111aR119hR6tgoR2i407362R3R112R5y33:assets%2Fsounds%2Farpeggio-ok.wavR111aR120hR6tgoR2i377844R3R112R5y36:assets%2Fsounds%2Farpeggio1-good.wavR111aR121hR6tgoR2i436052R3R112R5y36:assets%2Fsounds%2Farpeggio2-good.wavR111aR122hR6tgoR2i412282R3R112R5y36:assets%2Fsounds%2Farpeggio3-good.wavR111aR123hR6tgoR2i65192R3R112R5y27:assets%2Fsounds%2Fbloop.wavR111aR124hR6tgoR2i1151176R3R112R5y29:assets%2Fsounds%2Fbubbles.wavR111aR125hR6tgoR2i42544R3R112R5y26:assets%2Fsounds%2Fcast.wavR111aR126hR6tgoR2i130474R3R112R5y28:assets%2Fsounds%2Fengine.wavR111aR127hR6tgoR2i16530R3R112R5y26:assets%2Fsounds%2Fplop.wavR111aR128hR6tgoR2i25194R3R112R5y27:assets%2Fsounds%2Fplop2.wavR111aR129hR6tgoR2i64040R3R112R5y26:assets%2Fsounds%2Fpop1.wavR111aR130hR6tgoR2i335812R3R112R5y33:assets%2Fsounds%2Fpress-start.wavR111aR131hR6tgoR2i42544R3R112R5y26:assets%2Fsounds%2Freel.wavR111aR132hR6tgoR2i441418R3R112R5y28:assets%2Fsounds%2Freelin.wavR111aR133hR6tgoR2i152802R3R112R5y33:assets%2Fsounds%2Freelin_fast.wavR111aR134hR6tgoR2i440520R3R112R5y29:assets%2Fsounds%2Freelout.wavR111aR135hR6tgoR2i226058R3R112R5y34:assets%2Fsounds%2Freelout_fast.wavR111aR136hR6tgoR2i48942R3R112R5y28:assets%2Fsounds%2Fswish1.wavR111aR137hR6tgoR2i69860R3R112R5y29:assets%2Fsounds%2Fswoosh1.wavR111aR138hR6tgoR2i45482R3R112R5y29:assets%2Fsounds%2Fswoosh2.wavR111aR139hR6tgoR2i192004R3R112R5y59:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fatlanticsalmon.wavR111aR140hR6tgoR2i176776R3R112R5y56:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fbluefintuna.wavR111aR141hR6tgoR2i158768R3R112R5y55:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fbluemarlin.wavR111aR142hR6tgoR2i135784R3R112R5y53:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fbluetang.wavR111aR143hR6tgoR2i208782R3R112R5y59:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fgreatbarracuda.wavR111aR144hR6tgoR2i155954R3R112R5y55:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fhermitcrab.wavR111aR145hR6tgoR2i204878R3R112R5y57:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Flongfinsquid.wavR111aR146hR6tgoR2i172732R3R112R5y59:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fnorthernpuffer.wavR111aR147hR6tgoR2i170038R3R112R5y58:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fspeckledtrout.wavR111aR148hR6tgoR2i175346R3R112R5y59:assets%2Fsounds%2FVO%2Ffishing%2Focean%2Fsummerflounder.wavR111aR149hR6tgoR2i202046R3R112R5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F1.wavR111aR150hR6tgoR2i256328R3R112R5y46:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F10.wavR111aR151hR6tgoR2i119568R3R112R5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F2.wavR111aR152hR6tgoR2i112526R3R112R5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F3.wavR111aR153hR6tgoR2i135936R3R112R5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F4.wavR111aR154hR6tgoR2i184138R3R112R5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F5.wavR111aR155hR6tgoR2i154932R3R112R5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F6.wavR111aR156hR6tgoR2i157982R3R112R5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F7.wavR111aR157hR6tgoR2i86878R3R112R5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F8.wavR111aR158hR6tgoR2i96318R3R112R5y45:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2F9.wavR111aR159hR6tgoR2i202046R3R112R5y59:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fbluntnoseminnow.wavR111aR160hR6tgoR2i184138R3R112R5y57:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fbroadtailmoor.wavR111aR161hR6tgoR2i112526R3R112R5y48:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fgoby.wavR111aR162hR6tgoR2i157982R3R112R5y54:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fgoldenrudd.wavR111aR163hR6tgoR2i119568R3R112R5y49:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fguppy.wavR111aR164hR6tgoR2i61988R3R112R5y47:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fide.wavR111aR165hR6tgoR2i96318R3R112R5y47:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fkoi.wavR111aR166hR6tgoR2i154932R3R112R5y55:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fpumpkinseed.wavR111aR167hR6tgoR2i135936R3R112R5y50:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fryukin.wavR111aR168hR6tgoR2i256328R3R112R5y60:assets%2Fsounds%2FVO%2Ffishing%2Fpond%2Fsiberiansturgeon.wavR111aR169hR6tgoR2i168450R3R112R5y57:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Fblackcrappie.wavR111aR170hR6tgoR2i170108R3R112R5y56:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Fbluecatfish.wavR111aR171hR6tgoR2i134810R3R112R5y53:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Fbluegill.wavR111aR172hR6tgoR2i193746R3R112R5y59:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Flargemouthbass.wavR111aR173hR6tgoR2i177558R3R112R5y56:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Flongnosegar.wavR111aR174hR6tgoR2i169952R3R112R5y57:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Frainbowtrout.wavR111aR175hR6tgoR2i110212R3R112R5y53:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Frockbass.wavR111aR176hR6tgoR2i137894R3R112R5y56:assets%2Fsounds%2FVO%2Ffishing%2Friver%2Fyellowperch.wavR111aR177hR6tgoR2i114754R3R112R5y47:assets%2Fsounds%2FVO%2Ffishing%2Fyoucaughta.wavR111aR178hR6tgoR2i135746R3R112R5y48:assets%2Fsounds%2FVO%2Ffishing%2Fyoucaughtan.wavR111aR179hR6tgoR2i649604R3R112R5y46:assets%2Fsounds%2FVO%2Ffishinginstructions.wavR111aR180hR6tgoR2i108582R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F0.wavR111aR181hR6tgoR2i92766R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F1.wavR111aR182hR6tgoR2i103374R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F10.wavR111aR183hR6tgoR2i163096R3R112R5y40:assets%2Fsounds%2FVO%2Fnumbers%2F100.wavR111aR184hR6tgoR2i125556R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F11.wavR111aR185hR6tgoR2i110574R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F12.wavR111aR186hR6tgoR2i137416R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F13.wavR111aR187hR6tgoR2i153198R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F14.wavR111aR188hR6tgoR2i149160R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F15.wavR111aR189hR6tgoR2i169002R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F16.wavR111aR190hR6tgoR2i191368R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F17.wavR111aR191hR6tgoR2i145690R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F18.wavR111aR192hR6tgoR2i159496R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F19.wavR111aR193hR6tgoR2i89896R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F2.wavR111aR194hR6tgoR2i116734R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F20.wavR111aR195hR6tgoR2i142234R3R112R5y40:assets%2Fsounds%2FVO%2Fnumbers%2F200.wavR111aR196hR6tgoR2i94886R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F3.wavR111aR197hR6tgoR2i120952R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F30.wavR111aR198hR6tgoR2i154748R3R112R5y40:assets%2Fsounds%2FVO%2Fnumbers%2F300.wavR111aR199hR6tgoR2i109334R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F4.wavR111aR200hR6tgoR2i99460R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F40.wavR111aR201hR6tgoR2i144334R3R112R5y40:assets%2Fsounds%2FVO%2Fnumbers%2F400.wavR111aR202hR6tgoR2i110152R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F5.wavR111aR203hR6tgoR2i135796R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F50.wavR111aR204hR6tgoR2i170856R3R112R5y40:assets%2Fsounds%2FVO%2Fnumbers%2F500.wavR111aR205hR6tgoR2i111130R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F6.wavR111aR206hR6tgoR2i134282R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F60.wavR111aR207hR6tgoR2i184110R3R112R5y40:assets%2Fsounds%2FVO%2Fnumbers%2F600.wavR111aR208hR6tgoR2i111948R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F7.wavR111aR209hR6tgoR2i150216R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F70.wavR111aR210hR6tgoR2i146782R3R112R5y40:assets%2Fsounds%2FVO%2Fnumbers%2F700.wavR111aR211hR6tgoR2i87642R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F8.wavR111aR212hR6tgoR2i124226R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F80.wavR111aR213hR6tgoR2i129596R3R112R5y40:assets%2Fsounds%2FVO%2Fnumbers%2F800.wavR111aR214hR6tgoR2i119400R3R112R5y38:assets%2Fsounds%2FVO%2Fnumbers%2F9.wavR111aR215hR6tgoR2i131736R3R112R5y39:assets%2Fsounds%2FVO%2Fnumbers%2F90.wavR111aR216hR6tgoR2i136658R3R112R5y40:assets%2Fsounds%2FVO%2Fnumbers%2F900.wavR111aR217hR6tgoR2i113902R3R112R5y42:assets%2Fsounds%2FVO%2Fnumbers%2Fgrams.wavR111aR218hR6tgoR2i138888R3R112R5y46:assets%2Fsounds%2FVO%2Fnumbers%2Fkilograms.wavR111aR219hR6tgoR2i7254R3R112R5y41:assets%2Fsounds%2FVO%2Fnumbers%2Fnull.wavR111aR220hR6tgoR2i81428R3R112R5y42:assets%2Fsounds%2FVO%2Fnumbers%2Fpoint.wavR111aR221hR6tgoR2i676480R3R112R5y39:assets%2Fsounds%2FVO%2Fvo_location0.wavR111aR222hR6tgoR2i676480R3R112R5y39:assets%2Fsounds%2FVO%2Fvo_location1.wavR111aR223hR6tgoR2i676480R3R112R5y39:assets%2Fsounds%2FVO%2Fvo_location2.wavR111aR224hR6tgoR2i41018R3R112R5y28:assets%2Fsounds%2Fwiggle.wavR111aR225hR6tgoR2i23310R3R112R5y28:assets%2Fsounds%2Fwindup.wavR111aR226hR6tgoR2i2114R3R109R5y26:flixel%2Fsounds%2Fbeep.mp3R111aR227y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R109R5y28:flixel%2Fsounds%2Fflixel.mp3R111aR229y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R112R5R228R111aR227R228hgoR2i33629R3R112R5R230R111aR229R230hgoR2i15744R3R7R8y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R7R8y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R26R5R235R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R26R5R236R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmdelico_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmfeather_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmgermar_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bmleaves_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_chevyray___express_mono_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_chevyray___express_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_chevyray___tentown_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_munro_ttf extends null { }
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
@:keep @:bind #if display private #end class __ASSET__assets_music_fishin_up_something_good_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_beach_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_driving_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_pond_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_river_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_titlescreen_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio_bad_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio_ohno_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio_ok_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio1_good_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio2_good_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpeggio3_good_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bloop_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bubbles_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cast_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_engine_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_plop_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_plop2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pop1_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_press_start_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reel_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reelin_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reelin_fast_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reelout_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_reelout_fast_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_swish1_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_swoosh1_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_swoosh2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_atlanticsalmon_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_bluefintuna_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_bluemarlin_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_bluetang_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_greatbarracuda_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_hermitcrab_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_longfinsquid_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_northernpuffer_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_speckledtrout_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_ocean_summerflounder_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_1_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_10_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_3_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_4_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_5_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_6_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_7_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_8_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_9_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_bluntnoseminnow_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_broadtailmoor_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_goby_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_goldenrudd_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_guppy_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_ide_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_koi_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_pumpkinseed_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_ryukin_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_pond_siberiansturgeon_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_blackcrappie_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_bluecatfish_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_bluegill_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_largemouthbass_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_longnosegar_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_rainbowtrout_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_rockbass_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_river_yellowperch_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_youcaughta_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishing_youcaughtan_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_fishinginstructions_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_0_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_1_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_10_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_100_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_11_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_12_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_13_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_14_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_15_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_16_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_17_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_18_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_19_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_20_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_200_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_3_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_30_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_300_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_4_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_40_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_400_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_5_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_50_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_500_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_6_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_60_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_600_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_7_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_70_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_700_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_8_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_80_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_800_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_9_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_90_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_900_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_grams_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_kilograms_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_null_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_numbers_point_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_vo_location0_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_vo_location1_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_vo_vo_location2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_wiggle_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_windup_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/BMdelico.ttf") #if display private #end class __ASSET__assets_fonts_bmdelico_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/BMfeather.ttf") #if display private #end class __ASSET__assets_fonts_bmfeather_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/BMgermar.ttf") #if display private #end class __ASSET__assets_fonts_bmgermar_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/BMleaves.ttf") #if display private #end class __ASSET__assets_fonts_bmleaves_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/ChevyRay - Express Mono.ttf") #if display private #end class __ASSET__assets_fonts_chevyray___express_mono_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/ChevyRay - Express.ttf") #if display private #end class __ASSET__assets_fonts_chevyray___express_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/ChevyRay - Tentown.ttf") #if display private #end class __ASSET__assets_fonts_chevyray___tentown_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/Munro.ttf") #if display private #end class __ASSET__assets_fonts_munro_ttf extends lime.text.Font {}
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
@:keep @:file("C:/HaxeToolkit/lib/flixel/4,5,1/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/lib/flixel/4,5,1/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/lib/flixel/4,5,1/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/lib/flixel/4,5,1/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/lib/flixel/4,5,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/lib/flixel/4,5,1/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_bmdelico_ttf') #if display private #end class __ASSET__assets_fonts_bmdelico_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/BMdelico"; #else ascender = 650; descender = -150; height = 800; numGlyphs = 259; underlinePosition = -72; underlineThickness = 10; unitsPerEM = 800; #end name = "BM delico A16"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_bmfeather_ttf') #if display private #end class __ASSET__assets_fonts_bmfeather_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/BMfeather"; #else ascender = 1300; descender = -700; height = 2000; numGlyphs = 93; underlinePosition = -143; underlineThickness = 20; unitsPerEM = 2000; #end name = "BM feather A20"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_bmgermar_ttf') #if display private #end class __ASSET__assets_fonts_bmgermar_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/BMgermar"; #else ascender = 900; descender = -300; height = 1200; numGlyphs = 99; underlinePosition = -143; underlineThickness = 20; unitsPerEM = 1200; #end name = "BM germar A12"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_bmleaves_ttf') #if display private #end class __ASSET__assets_fonts_bmleaves_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/BMleaves"; #else ascender = 900; descender = -200; height = 1100; numGlyphs = 95; underlinePosition = -143; underlineThickness = 20; unitsPerEM = 1100; #end name = "BM leaves A11"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_chevyray___express_mono_ttf') #if display private #end class __ASSET__assets_fonts_chevyray___express_mono_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/ChevyRay - Express Mono"; #else ascender = 3185; descender = -910; height = 4095; numGlyphs = 102; underlinePosition = 307; underlineThickness = 204; unitsPerEM = 4096; #end name = "ChevyRay - Express Mono Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_chevyray___express_ttf') #if display private #end class __ASSET__assets_fonts_chevyray___express_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/ChevyRay - Express"; #else ascender = 3185; descender = -910; height = 4095; numGlyphs = 102; underlinePosition = 307; underlineThickness = 204; unitsPerEM = 4096; #end name = "ChevyRay - Express Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_chevyray___tentown_ttf') #if display private #end class __ASSET__assets_fonts_chevyray___tentown_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/ChevyRay - Tentown"; #else ascender = 3276; descender = -2048; height = 5324; numGlyphs = 102; underlinePosition = 307; underlineThickness = 204; unitsPerEM = 4096; #end name = "ChevyRay - Tentown Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_munro_ttf') #if display private #end class __ASSET__assets_fonts_munro_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Munro"; #else ascender = 1491; descender = -431; height = 2229; numGlyphs = 115; underlinePosition = -292; underlineThickness = 150; unitsPerEM = 2048; #end name = "Munro"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


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