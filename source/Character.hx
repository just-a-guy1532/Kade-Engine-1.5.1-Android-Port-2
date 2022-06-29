package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';
	
	public var iconColor:String;

	public var holdTimer:Float = 0;
	
	var pre:String = "";

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;
		iconColor = isPlayer ? 'FF66FF33' : 'FFFF0000';

		var tex:FlxAtlasFrames;
		antialiasing = true;
		pre = "";

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('characters/gfCar');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('characters/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				playAnim('idle');
				
			case 'hd-senpai-giddy' | 'hd-senpai-giddy-b3':
				switch (curCharacter)
				{
					case 'hd-senpai-giddy':
						frames = Paths.getSparrowAtlas('characters/HD_SENPAI_GIDDY');
						iconColor = 'FFFFAA6F';
					case 'hd-senpai-giddy-b3':
						frames = Paths.getSparrowAtlas('characters/b3/HD_SENPAI_GIDDY');
						iconColor = 'FFBB2626';
				}
							
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);
				animation.addByPrefix('singDOWN-alt', 'Dad Die', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Dad UGH', 24, false);

				loadOffsetFile('hd-senpai-giddy');

				playAnim('idle');
				
			case 'hd-senpai-happy' | 'hd-senpai-giddy-bw' | 'hd-senpai-angry' | 'hd-senpai-angry-b3':
				switch (curCharacter)
				{
					case 'hd-senpai-happy':
						frames = Paths.getSparrowAtlas('characters/HD_SENPAI_HAPPY');
						iconColor = 'FFFFAA6F';
					case 'hd-senpai-giddy-bw':
						frames = Paths.getSparrowAtlas('characters/bw/HD_SENPAI_GIDDY');
					case 'hd-senpai-angry':
						frames = Paths.getSparrowAtlas('characters/HD_SENPAI_ANGRY');
						iconColor = 'FFFFAA6F';
					case 'hd-senpai-angry-b3':
						frames = Paths.getSparrowAtlas('characters/b3/HD_SENPAI_ANGRY');
						iconColor = 'FFBB2626';
				}
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);

				loadOffsetFile('hd-senpai-angry');	

				playAnim('idle');
				
			case 'garcello' | 'garcellodead':
				switch (curCharacter)
				{
					case 'garcello': 
						frames = Paths.getSparrowAtlas('characters/garcello_assets');
						iconColor = 'FF8E40A5';
					case 'garcellodead':
						frames = Paths.getSparrowAtlas('characters/garcellodead_assets');
						iconColor = 'FF8E40A5';
				}

				animation.addByPrefix('idle', 'garcello idle dance', 24, false);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24, false);

				if (curCharacter == 'garcellodead')
				{
					animation.addByPrefix('lame', 'garcello coolguy', 24, false);
					loadOffsetFile('garcellodead');
				}
				else
				{
					loadOffsetFile('garcello');
				}

				playAnim('idle');
				
			case 'bf-annie' | 'bf-exgf':
				switch (curCharacter)
				{
					case 'bf-annie':
						tex = Paths.getSparrowAtlas('characters/annie');
						iconColor = 'FF1D2A2C';
					case 'bf-exgf':
						tex = Paths.getSparrowAtlas('characters/playableexGF');
						iconColor = 'FF64FFC1';
				}
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -10, 50);
				addOffset("singUP", -10, 50);
				addOffset("singRIGHT", -10, 50);
				addOffset("singLEFT", -10, 50);
				addOffset("singDOWN", -10, 50);
				addOffset("singUPmiss", -10, 50);
				addOffset("singRIGHTmiss", -10, 50);
				addOffset("singLEFTmiss", -10, 50);
				addOffset("singDOWNmiss", -10, 50);

				playAnim('idle');

				flipX = true;
				
			case 'zardy' | 'starecrown' | 'whitty-minus' | 'whitty-minus-b3' | 'lexi-b3' | 'happymouse' | 'papyrus' | 'kirbo' | 'dr-springheel' | 'noke' | 'ron' | 'cablecrow' | 'mario'
			| 'trollge' | 'jester' | 'tornsketchy' | 'happymouse2' | 'sunky' | 'herobrine' | 'mokey' | 'geese-minus' | 'geese' | 'monika-real' | 'natsuki' | 'yuri' | 'kalisa' | 'kkslider'
			| 'mami' | 'taeyai' | 'taeyai-b3' | 'neonight' | 'baldi-angry' | 'retro' | 'alucard' | 'bipolarmouse' | 'auditor' | 'gold-side' | 'zipper' | 'geese-fly' | 'richard1' 
			| 'mara' | 'v-calm' | 'kadedev' | 'cerbera'  | 'happymouse-bw' | 'sadmouse-bw' | 'sadmouse' | 'dust-sans' | 'doxxie' | 'cjClone' | 'gold-side-blue' | 'king' | 'gf-standing'
			| 'gf-standing-halloween' | 'coco2' | 'scott' | 'sketch' | 'monokuma' | 'hank-antipathy' | 'hallow' | 'soul-tails' | 'daidem' | 'betty' | 'betty-bw': 
			// this is a long af list
				switch (curCharacter)
				{
					case 'zardy':
						frames = Paths.getSparrowAtlas('characters/Zardy');
						iconColor = 'FF2C253B';
					case 'starecrown':
						frames = Paths.getSparrowAtlas('characters/starecrown');
						iconColor = 'FFFCC60F';
					case 'whitty-minus':
						frames = Paths.getSparrowAtlas('characters/WhittyMinusSprites');
						iconColor = 'FF1D1E35';
					case 'whitty-minus-b3':
						frames = Paths.getSparrowAtlas('characters/b3/WhittyMinusSprites');
						iconColor = 'FF1D1E35';
					case 'lexi-b3':
						frames = Paths.getSparrowAtlas('characters/b3/Lexi_Assets');
						iconColor = 'FF66FF33';
					case 'mario':
						frames = Paths.getSparrowAtlas('characters/mario_assets');
						iconColor = 'FFCC0000';
					case 'happymouse' | 'happymouse-bw' | 'sadmouse-bw' | 'sadmouse':
						iconColor = 'FFAFAFAF';
						switch (curCharacter)
						{			
							case 'happymouse-bw': pre = 'bw/happy';
							case 'sadmouse-bw': 
								pre = 'bw/sad';
							case 'happymouse': 
								pre = 'happy';
								iconColor = 'FFFAFAFA';
							case 'sadmouse':
								pre = 'sad';
								iconColor = 'FFFAFAFA';
						}
						frames = Paths.getSparrowAtlas('characters/'+pre+'mouse_assets');
					case 'papyrus':
						frames = Paths.getSparrowAtlas('characters/papyrus');
						iconColor = 'FFFFFFFF';
					case 'kirbo':
						frames = Paths.getSparrowAtlas('characters/kirbo');
						iconColor = 'FFEE8BCE';
					case 'dr-springheel':
						frames = Paths.getSparrowAtlas('characters/jack');
						iconColor = 'FFAF68CE';
					case 'noke':
						frames = Paths.getSparrowAtlas('characters/noke');
						iconColor = 'FF705878';
					case 'cablecrow':
						frames = Paths.getSparrowAtlas('characters/Cablecrow');
						iconColor = 'FFB97C41';
					case 'ron':
						frames = Paths.getSparrowAtlas('characters/ron');
						iconColor = 'FF7F6A00';
					case 'trollge':
						frames = Paths.getSparrowAtlas('characters/trollge');
						iconColor = 'FFB5B5B5';
					case 'jester':
						frames = Paths.getSparrowAtlas('characters/Jester','shared');
						iconColor = 'FFF14CF1';
					case 'tornsketchy':
						frames = Paths.getSparrowAtlas('characters/crumple');
						iconColor = 'FFB5B5B5';
					case 'happymouse2':
						frames = Paths.getSparrowAtlas('characters/happymouse2_assets');
						iconColor = 'FFFAFAFA';
					case 'sunky':
						frames = Paths.getSparrowAtlas('characters/Sunky');
						iconColor = 'FF2547FB';
					case 'herobrine':
						frames = Paths.getSparrowAtlas('characters/herobrine');
						iconColor = 'FF056B82';
					case 'mokey':
						frames = Paths.getSparrowAtlas('characters/Mokey_AAAAssets');
						iconColor = 'FF686868';
					case 'geese-minus':
						frames = Paths.getSparrowAtlas('characters/MasonMinus');
						iconColor = 'FF933F9E';
					case 'geese':
						frames = Paths.getSparrowAtlas('characters/Mason');
						iconColor = 'FF933F9E';
					case 'monika-real':
						frames = Paths.getSparrowAtlas('characters/Doki_MonikaNonPixel_Assets');
						iconColor = 'FF8CD465';
					case 'natsuki':
						frames = Paths.getSparrowAtlas('characters/Doki_Nat_Assets');
						iconColor = 'FFFC95D3';
					case 'yuri':
						frames = Paths.getSparrowAtlas('characters/Doki_Yuri_Assets');
						iconColor = 'FF9E72D2';
					case 'kalisa':
						frames = Paths.getSparrowAtlas('characters/Kalisa');
						iconColor = 'FF703BC6';
					case 'kkslider':
						frames = Paths.getSparrowAtlas('characters/kk_assets');
						iconColor = 'FFFFFFFF';
					case 'mami':
						frames = Paths.getSparrowAtlas('characters/Mami');
						iconColor = 'FFFFF196';
					case 'taeyai':
						frames = Paths.getSparrowAtlas('characters/Taeyai');
						iconColor = 'FF666666'; //unholy number
					case 'taeyai-b3':
						frames = Paths.getSparrowAtlas('characters/b3/Taeyai');
						iconColor = 'FF4DC66B';
					case 'neonight':
						frames = Paths.getSparrowAtlas('characters/Neonight');
						iconColor = 'FFCC3399';
					case 'retro':
						frames = Paths.getSparrowAtlas('characters/RetroSpecter','shared');
						iconColor = 'FF17D8E4';
					case 'baldi-angry':
						frames = Paths.getSparrowAtlas('characters/BALDI');
						iconColor = 'FF00DF3B';
					case 'alucard':
						frames = Paths.getSparrowAtlas('characters/alucard');
						iconColor = 'FF3100FF';
					case 'bipolarmouse':
						frames = Paths.getSparrowAtlas('characters/bipolarmouse_assets');
						iconColor = 'FF0D0D0D';
					case 'auditor':
						frames = Paths.getSparrowAtlas('characters/auditor');
						iconColor = 'FFFF0000';
					case 'gold-side' | 'gold-side-blue':
						iconColor = 'FFFFFFFF';
						if (curCharacter == 'gold-side-blue')
						{
							pre = 'blue/';
							iconColor = 'FFE6E6FF';
						}			
						frames = Paths.getSparrowAtlas('characters/'+pre+'gold_side');
					case 'zipper':
						frames = Paths.getSparrowAtlas('characters/zipper');
						iconColor = 'FFA41F3E';
					case 'geese-fly':
						frames = Paths.getSparrowAtlas('characters/MasonFly');
						iconColor = 'FF933F9E';
					case 'richard1':
						frames = Paths.getSparrowAtlas('characters/richard1');
						iconColor = 'FFFFCE5B';
					case 'mara':
						frames = Paths.getSparrowAtlas('characters/Mara_assets');
						iconColor = 'FFFF0000';
					case 'v-calm':
						frames = Paths.getSparrowAtlas('characters/v-calm');
						iconColor = 'FFFFFFFF';
					case 'kadedev':
						frames = Paths.getSparrowAtlas('characters/kadedev');
						iconColor = 'FF008000';
					case 'cerbera':
						frames = Paths.getSparrowAtlas('characters/Cerb');
						iconColor = "FF484848";
					case 'dust-sans':
						frames = Paths.getSparrowAtlas('characters/dustsans');
						iconColor = "FF999999";
					case 'doxxie':
						frames = Paths.getSparrowAtlas('characters/doxxie_assets');
						iconColor = 'FFFFFF00';
					case 'cjClone':
						frames = Paths.getSparrowAtlas('characters/CJCLONE');
						iconColor = 'FFFF0000';	
					case 'king':
						frames = Paths.getSparrowAtlas('characters/king');
						iconColor = 'FF74628B';			
					case 'gf-standing':
						frames =  Paths.getSparrowAtlas('characters/GIOFIEND');
						iconColor = 'FF9A1652';
					case 'gf-standing-halloween':
						frames =  Paths.getSparrowAtlas('characters/gf_standing_halloween');
						iconColor = 'FF9A1652';
					case 'coco2':
						frames =  Paths.getSparrowAtlas('characters/CocoMunchkin_assets');
						iconColor = 'FFA37E6A';
					case 'scott':
						frames =  Paths.getSparrowAtlas('characters/ScottRemade');
						iconColor = 'FF6576E6';
					case 'sketch':
						frames =  Paths.getSparrowAtlas('characters/sketch_assets'); // i needed to save space so i cropped it
						iconColor = 'FF6B4436';
					case 'monokuma':
						frames =  Paths.getSparrowAtlas('characters/monokuma_assets');
						iconColor = 'FFFFFFFF';
					case 'hank-antipathy':
						frames =  Paths.getSparrowAtlas('characters/PIPEMAN');
						iconColor = 'FFFF0000';
					case 'hallow':
						frames =  Paths.getSparrowAtlas('characters/Hallow');
						iconColor = 'FFC6C1F3';
					case 'soul-tails':
						frames = Paths.getSparrowAtlas('characters/Soul_Tails');
						iconColor = 'FF666666';
					case 'daidem':
						frames = Paths.getSparrowAtlas('characters/DaidemAssetsREwork','shared');
						iconColor = 'FFFF863D';
					case 'betty' | 'betty-bw':
						if (curCharacter.contains('bw')) pre = 'bw/';
						frames = Paths.getSparrowAtlas('characters/'+pre+'Bete_Noire');
						iconColor = 'FFFF6BAB';
				}
				
				animation.addByPrefix('idle', 'Idle', 24, false);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
					
				switch (curCharacter)
				{
					case 'happymouse2' | 'bipolarmouse':
						animation.addByPrefix('singDOWN-alt', 'Laugh', 24, false);
						addOffset('singDOWN-alt');
					case 'yuri':
						animation.addByPrefix('breath', 'Breath', 24, false);
					case 'zipper':
						animation.addByPrefix('singUP-alt', 'scream', 24, false);
						animation.addByPrefix('singRIGHT-alt', 'scream', 24, false);
						animation.addByPrefix('singDOWN-alt', 'scream', 24, false);
						animation.addByPrefix('singLEFT-alt', 'scream', 24, false);
					case 'richard1':
						animation.addByPrefix('chaChing', 'cha ching', 24, false);
						animation.addByPrefix('troll', 'troll', 24, false);
						animation.addByPrefix('sell', 'sell', 24, false);
						animation.addByPrefix('surprised', 'surprised', 24, false);	
					case 'dust-sans':
						animation.addByPrefix('swingDOWN', 'swingDown0', 24, false);
						animation.addByPrefix('swingUP', 'swingUp0', 24, false);	
					case 'doxxie':
						animation.addByPrefix('giggle', 'Giggle0', 24, false);
						animation.addByPrefix('laugh', 'Laugh0', 24, false);
					case 'cjClone':
						animation.addByPrefix('Hank', 'Showtime', 24, false);
					case 'coco2':
						animation.addByPrefix('go', "let's go", 24, false);
					case 'hank-antipathy':
						animation.addByPrefix('block', "Block", 24, false);
				}

				switch (curCharacter)
				{
					case 'whitty-minus' | 'whitty-minus-b3':
						loadOffsetFile('whitty-minus');
					case 'taeyai-b3':
						loadOffsetFile('taeyai');
					case 'happymouse' | 'sunky' | 'kkslider' | 'happymouse-bw' | 'king':
						loadOffsetFile('no');
					case 'gold-side' | 'gold-side-blue':
						loadOffsetFile('gold-side');
					case 'betty' | 'betty-bw':
						loadOffsetFile('betty');
					default:
						loadOffsetFile(curCharacter);
				}	

				playAnim('idle');
				
			case 'whitty' | 'whitty-bw' | 'whitty-b3':			
				switch (curCharacter)
				{
					case 'whitty':
						tex = Paths.getSparrowAtlas('characters/WhittySprites');
						iconColor = 'FF1D1E35';
					case 'whitty-bw':
						tex = Paths.getSparrowAtlas('characters/bw/WhittySprites');
					case 'whitty-b3':
						tex = Paths.getSparrowAtlas('characters/b3/WhittySprites');
						iconColor = 'FF1D1E35';
				}
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24, false);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singUP-alt', 'Whitty Ballistic', 24, false);

				loadOffsetFile('whitty');		

				playAnim('idle');

			case 'whittyCrazy':
				frames = Paths.getSparrowAtlas('characters/WhittyCrazy');
				iconColor = 'FFFF0000';
				animation.addByPrefix('idle', 'Whitty idle dance', 24, false);
				animation.addByPrefix('singUP', 'Whitty Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'whitty sing note right', 24, false);
				animation.addByPrefix('singDOWN', 'Whitty Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Whitty Sing Note LEFT', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
				
			case 'bf-carol':
				frames = Paths.getSparrowAtlas('characters/carol');
				iconColor = 'FF282833';
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
				
			// Normal Alt is Dark Sarv and Alt2 is Concerned Sarv
			case 'sarvente':
				frames = Paths.getSparrowAtlas('characters/sarvente_sheet');
				iconColor = 'FFF691C5';

				animation.addByPrefix('idle', "SarventeIdle", 24, false);
				animation.addByPrefix('singUP', "SarventeUp", 24, false);
				animation.addByPrefix('singDOWN', "SarventeDown", 24, false);
				animation.addByPrefix('singLEFT', 'SarventeLeft', 24, false);
				animation.addByPrefix('singRIGHT', 'SarventeRight', 24, false);
				animation.addByPrefix('idle-alt', "SarvDarkIdle", 24, false);
				animation.addByPrefix('singUP-alt', "SarvDarkUp2", 24, false);
				animation.addByPrefix('singLEFT-alt', 'SarvDarkLeft2', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'SarvDarkRight2', 24, false);
				animation.addByPrefix('singDOWN-alt', "SarvDarkDown2", 24, false);
				animation.addByPrefix('idle-alt2', "SarvDarkIdle", 24, false);
				animation.addByPrefix('singUP-alt2', "SarvDarkUp0", 24, false);
				animation.addByPrefix('singLEFT-alt2', 'SarvDarkLeft0', 24, false);
				animation.addByPrefix('singRIGHT-alt2', 'SarvDarkRight0', 24, false);
				animation.addByPrefix('singDOWN-alt2', "SarvDarkDown0", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
				
			case 'ruv' | 'ruv-mad':
				switch (curCharacter)
				{
					case 'ruv':
						frames = Paths.getSparrowAtlas('characters/ruv_sheet');
					case 'ruv-mad':
						frames = Paths.getSparrowAtlas('characters/ruv_mad');
				}
				iconColor = 'FF978AA6';

				animation.addByPrefix('idle', "RuvIdle", 24, false);
				animation.addByPrefix('idle-alt', "RuvIdle", 24, false);
				animation.addByPrefix('singUP', "RuvUp", 24, false);
				animation.addByPrefix('singDOWN', "RuvDown", 24, false);
				animation.addByPrefix('singLEFT', 'RuvLeft', 24, false);
				animation.addByPrefix('singRIGHT', 'RuvRight', 24, false);

				if (isPlayer)
				{
					addOffset('idle');
					addOffset('idle-alt');
					addOffset("singUP", 160, 0);
					addOffset("singRIGHT", 20, -60);
					addOffset("singLEFT", 90, 0);
					addOffset("singDOWN", 110, 5);
				}
				else
				{
					addOffset('idle');
					addOffset('idle-alt');
					addOffset("singUP", -10, 0);
					addOffset("singRIGHT", -30, 0);
					addOffset("singLEFT", 90, -60);
					addOffset("singDOWN", 40, 5);
				}	

				playAnim('idle');
				
			case 'bf-sky':
				frames = Paths.getSparrowAtlas('characters/sky_assets');
				iconColor = 'FF9C6ECC';
				animation.addByPrefix('singUP', 'sky annoyed up', 24, false);
				animation.addByPrefix('singDOWN', 'sky annoyed down', 24, false);
				animation.addByPrefix('singUP-alt', 'sky annoyed alt up', 24, false);
				animation.addByPrefix('singDOWN-alt', 'sky annoyed alt down', 24, false);
				animation.addByPrefix('singUPmiss', 'sky annoyed alt up', 24, false);
				animation.addByPrefix('singDOWNmiss', 'sky annoyed alt down', 24, false);
				animation.addByIndices('danceLeft', 'sky annoyed idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'sky annoyed idle', [8, 10, 12, 14], "", 12, false);
				animation.addByIndices('danceLeft-alt', 'sky annoyed alt idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight-alt', 'sky annoyed alt idle', [8, 10, 12, 14], "", 12, false);
				animation.addByPrefix('singLEFT', 'sky annoyed left', 24, false);
				animation.addByPrefix('singRIGHT', 'sky annoyed right', 24, false);
				animation.addByPrefix('singLEFTmiss', 'sky annoyed alt left', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'sky annoyed alt right', 24, false);
				animation.addByPrefix('singLEFT-alt', 'sky annoyed alt left', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'sky annoyed alt right', 24, false);	
				
				loadOffsetFile(curCharacter);

				playAnim('danceRight');

				flipX = true;
				
			case 'tricky' | 'trickward':
				switch (curCharacter)
				{
					case 'tricky':
						frames = Paths.getSparrowAtlas('characters/tricky');
						iconColor = 'FF185F40';
					case 'trickward':
						frames = Paths.getSparrowAtlas('characters/TRICKWARD');
						iconColor = 'FF80CAAA';
				}

				animation.addByPrefix('idle', 'Idle', 24, false);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);

				if (curCharacter == 'tricky')
					animation.addByPrefix('singDOWN-alt', 'Scream', 24, false);		

				loadOffsetFile(curCharacter);
				
				playAnim('idle');
				
			case 'hex' | 'peasus':
				// DAD ANIMATION LOADING CODE
				switch (curCharacter)
				{
					case 'hex':
						frames = Paths.getSparrowAtlas('characters/hex');
						iconColor = 'FFF46C4E';
					case 'peasus':
						frames = Paths.getSparrowAtlas('characters/peaky_horny');
						iconColor = 'FF99D4F4';
				}
				
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24, false);
				animation.addByPrefix('singUP-alt', 'Dad Jump', 24, false);

				if (isPlayer && curCharacter == 'hex')
				{
					animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT Purple', 24, false);
					animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT Red', 24, false);
				}

				loadOffsetFile(curCharacter);

				playAnim('idle');
				
			case 'nogf' | 'emptygf' | 'nogf-night' | 'nogf-wire' | 'nogf-christmas' | 'nogf-rebecca' | 'nogf-glitcher' | 'nogf-bw' | 'nogf-r':
				// GIRLFRIEND CODE
				switch (curCharacter)
				{
					case 'nogf':
						frames = Paths.getSparrowAtlas('characters/nogf_assets');
					case 'nogf-r':
						frames = Paths.getSparrowAtlas('characters/nogfr_assets');
					case 'emptygf':
						frames = Paths.getSparrowAtlas('characters/emptygf_assets');
					case 'nogf-night':
						frames = Paths.getSparrowAtlas('characters/nogf_night');
					case 'nogf-wire':
						frames = Paths.getSparrowAtlas('characters/nogf_assets_WIRE');
					case 'nogf-christmas':
						frames = Paths.getSparrowAtlas('characters/nogf_christmas_assets');
					case 'nogf-rebecca':
						frames = Paths.getSparrowAtlas('characters/nogf_rebecca');
					case 'nogf-glitcher':
						frames = Paths.getSparrowAtlas('characters/nogf_glitcher');
					case 'nogf-bw':
						frames = Paths.getSparrowAtlas('characters/bw/nogf_assets');
				}
				
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByIndices('sad', 'GF Dancing Beat', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('hairBlow', 'GF Dancing Beat', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('hairFall', 'GF Dancing Beat', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('scared', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('cheer');
				addOffset('sad', 0, -9);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset('scared', 0, -9);

				playAnim('danceRight');
				
			case 'bf-gf':
				frames = Paths.getSparrowAtlas('characters/playableGF');
				iconColor = 'FF9A1652';
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				
				loadOffsetFile('bf');
				
				playAnim('idle');

				flipX = true;
				
			case 'bf-mom' | 'bf-mom-car':
				switch (curCharacter)
				{
					case 'bf-mom':
						frames = Paths.getSparrowAtlas('characters/mombf');
					case 'bf-mom-car':
						frames = Paths.getSparrowAtlas('characters/mombfCar');
				}
				iconColor = 'FF0EAEFE';
				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singLEFT', 'Mom Pose Left', 24, false);
				
				if (!isPlayer)
				{
					addOffset('idle');
					addOffset("singUP", 4, 71);
					addOffset("singRIGHT", -20, -60);
					addOffset("singLEFT", 250, -23);
					addOffset("singDOWN", -10, -160);
				}
				else
				{
					addOffset('idle');
					addOffset("singUP", 95, 50);
					addOffset("singLEFT", 10, -50);
					addOffset("singRIGHT", 120, -33);
					addOffset("singDOWN", 160, -150);
				}
				
				playAnim('idle');
				
			case 'knuckles':
				frames = Paths.getSparrowAtlas('characters/knuckles');
				iconColor = 'FFCC0000';

				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singDOWN-alt', 'Knuckles Oh No', 24, true);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);

				if (isPlayer)
				{
					addOffset('idle');
					addOffset("singUP", -12, 50);
					addOffset("singRIGHT", -40, 10);
					addOffset("singLEFT", 40, 27);
					addOffset("singDOWN", 40, -30);
					addOffset("singDOWN-alt", 110, -200);
				}
				else
				{
					addOffset('idle');
					addOffset("singUP", -6, 50);
					addOffset("singRIGHT", 0, 27);
					addOffset("singLEFT", -10, 10);
					addOffset("singDOWN", 0, -30);
					addOffset("singDOWN-alt", 70, -200);
				}		

				playAnim('idle');
				
			case 'lila' | 'lila-pelo':
				switch (curCharacter)
				{
					case 'lila':
						frames = Paths.getSparrowAtlas('characters/lila');
					case 'lila-pelo':
						frames = Paths.getSparrowAtlas('characters/lila_pelo');
				}	
				iconColor = 'FF725585';
				
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);
				animation.addByPrefix('singDOWN-alt', 'Dad Clear Throat', 24, false);

				addOffset('idle');

				if (isPlayer)
				{
					switch (curCharacter)
					{
						case 'lila-pelo':
							addOffset("singUP", -12, 50);
							addOffset("singRIGHT", -40, 10);
							addOffset("singLEFT", 40, 27);
							addOffset("singDOWN", 40, -30);
							addOffset("singDOWN-alt", 40, -30);
						case 'lila':
							addOffset("singUP", 38, 50);
							addOffset("singRIGHT", -10, 10);
							addOffset("singLEFT", 40, 27);
							addOffset("singDOWN", 10, -30);
							addOffset("singDOWN-alt", 10, -30);
					}			
				}
				else
				{
					addOffset("singUP", -6, 50);
					addOffset("singRIGHT", 0, 27);
					addOffset("singLEFT", -10, 10);
					addOffset("singDOWN", 0, -30);
					addOffset("singDOWN-alt", 0, -30);
				}
				
				playAnim('idle');
				
			case 'tord' | 'tom':
				switch (curCharacter)
				{
					case 'tord':
						tex = Paths.getSparrowAtlas('characters/tord_assets');
						iconColor = 'FFC11200';
					case 'tom':
						tex = Paths.getSparrowAtlas('characters/tom_assets');
						iconColor = 'FF265D86';
				}
				
				frames = tex;

				animation.addByPrefix('idle', "tord idle", 24, false);
				animation.addByPrefix('singUP', "tord up", 24, false);
				animation.addByPrefix('singDOWN', "tord down", 24, false);
				animation.addByPrefix('singLEFT', 'tord left', 24, false);
				animation.addByPrefix('singRIGHT', 'tord right', 24, false);

				if (curCharacter == 'tom')
				{
					animation.addByPrefix('singLEFT-alt', "tord ugh", 24, false);
					if (isPlayer)
						addOffset("singLEFT-alt", 0, 80);
					else
						addOffset("singLEFT-alt", 80, 80);
				}

				loadOffsetFile('tord');

				playAnim('idle');
				
			case 'gura-amelia' | 'gura-amelia-walfie' | 'gura-amelia-bw' | 'gura-amelia-corrupt':
				if (!curCharacter.contains('bw')){
					iconColor = 'FFFFA054';
				}

				switch (curCharacter)
				{
					case 'gura-amelia':
						frames = Paths.getSparrowAtlas('characters/gura_amelia');
					case 'gura-amelia-corrupt':
						frames = Paths.getSparrowAtlas('characters/corruption/gura_amelia');
						iconColor = 'FFE22D7A';
					case 'gura-amelia-walfie':
						frames = Paths.getSparrowAtlas('characters/AmeSame_assets_WALFIE');
					case 'gura-amelia-bw':
						frames = Paths.getSparrowAtlas('characters/bw/gura_amelia');
				}
						
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('singUPmiss', 'spooky UPNOTE MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'spooky DOWNnote MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'note singleft MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'spooky singright MISS', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);
				animation.addByIndices('danceLeft-alt', 'spooky dance idle alt', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight-alt', 'spooky dance idle alt', [8, 10, 12, 14], "", 12, false);	
				animation.addByPrefix('ah', 'spooky ah0', 24, false);
				animation.addByPrefix('ah-charged', 'spooky ah charge', 24);
				animation.addByPrefix('chu', 'spooky chu0', 24, false);
				animation.addByPrefix('chu-charged', 'spooky chu charge', 24, false);
				if (PlayState.SONG.song == 'Nerves')
				{
					animation.addByPrefix('singDOWN-alt', 'spooky sneeze', 24, false);
				}

				addOffset('danceLeft');
				addOffset('danceRight');

				if (isPlayer)
				{
					addOffset("singUP", -50, 31);
					addOffset("singDOWN", -20, -150);	
					addOffset("singLEFT", 45, -17);
					addOffset("singRIGHT", -15, -10);

					addOffset("singUPmiss", -60, 28);
					addOffset("singDOWNmiss", -15, -140);		
					addOffset("singLEFTmiss", 41, -25);
					addOffset("singRIGHTmiss", -10, -20);

					addOffset("ah", -53, 26);
					addOffset("chu", 45, -17);
					addOffset("ah-charged", -40, 26);
					addOffset("chu-charged", 53, -17);
					if (PlayState.SONG.song == 'Nerves')
						addOffset("singDOWN-alt", -8, 198);
				}
				else
				{
					addOffset("singUP", -20, 26);
					addOffset("singRIGHT", -92, -17);
					addOffset("singLEFT", 130, -10);
					addOffset("singDOWNmiss", 50, -150);
					addOffset("singUPmiss", -20, 26);
					addOffset("singRIGHTmiss", -92, -17);
					addOffset("singLEFTmiss", 130, -10);
					addOffset("singDOWN", 45, -150);
					addOffset("ah", -20, 26);
					addOffset("chu", -87, -17);
					addOffset("ah-charged", -20, 26);
					addOffset("chu-charged", -87, -17);
					if (PlayState.SONG.song == 'Nerves')
						addOffset("singDOWN-alt", -8, 198);
				}

				playAnim('danceRight');
				
			case 'botan' | 'botan-b3':
				switch(curCharacter)
				{
					case 'botan':
						frames = Paths.getSparrowAtlas('characters/botan');
						iconColor = 'FF7DA8C5';
					case 'botan-b3':
						frames = Paths.getSparrowAtlas('characters/b3/botan');
						iconColor = 'FFF3EAE8';
				}
					
				animation.addByPrefix('idle', "Pico Idle Dance", 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24, false);

				loadOffsetFile('botan');
				
				playAnim('idle');

				flipX = true;
				
			case 'tabi' | 'tabi-glitcher' | 'tabi-wire':
				iconColor = 'FFFFBB81';
				switch (curCharacter)
				{
					case 'tabi':			
						frames = Paths.getSparrowAtlas('characters/TABI');
					case 'tabi-wire':
						frames = Paths.getSparrowAtlas('characters/TABI_WIRE');
						iconColor = 'FF00137F';
					case 'tabi-glitcher':
						frames = Paths.getSparrowAtlas('characters/TABI_glitcher');
				}
				
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);

				loadOffsetFile('tabi');
				
				playAnim('idle');
				
			case 'bf-blantad':
				switch (curCharacter)
				{
					case 'bf-blantad':
						frames = Paths.getSparrowAtlas('characters/blantad');
						iconColor = 'FF64B3FE';
				}
			
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

				loadOffsetFile('no');

				playAnim('idle');

				flipX = true;
				
			case 'miku':
				frames = Paths.getSparrowAtlas('characters/ev_miku_assets');
				iconColor = 'FF32CDCC';
				animation.addByPrefix('idle', 'Miku idle dance', 24, false);
				animation.addByPrefix('hey', 'miku hey', 24, false);
				animation.addByPrefix('singUP', 'Miku Sing Note UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'Miku Sing Note RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'Miku Sing Note DOWN0', 24, false);
				animation.addByPrefix('singLEFT', 'Miku Sing Note LEFT0', 24, false);
				animation.addByPrefix('singUPmiss', 'Miku Sing Note UP MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Miku Sing Note RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Miku Sing Note DOWN MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Miku Sing Note LEFT MISS', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
				
			case 'agoti':
				// DAD ANIMATION LOADING CODE
				frames = Paths.getSparrowAtlas('characters/AGOTI');
				iconColor = 'FF494949';

				animation.addByPrefix('idle', 'Agoti_Idle', 24, false);
				animation.addByPrefix('singUP', 'Agoti_Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Agoti_Right', 24, false);
				animation.addByPrefix('singDOWN', 'Agoti_Down', 24, false);
				animation.addByPrefix('singLEFT', 'Agoti_Left', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
				
			case 'kapi' | 'kapi-angry' | 'hubert' | 'teto' | 'fujiwara':
				iconColor = 'FF4E68C2';
				switch (curCharacter)
				{
					case 'kapi':
						frames = Paths.getSparrowAtlas('characters/KAPI');
					case 'kapi-angry':
						frames = Paths.getSparrowAtlas('characters/KAPI_ANGRY');
					case 'hubert':
						frames = Paths.getSparrowAtlas('characters/MrSaladHubert');
						iconColor = 'FF8A9C5E';
					case 'teto':
						frames = Paths.getSparrowAtlas('characters/TETO');
						iconColor = 'FFE24767';
					case 'fujiwara':
						frames = Paths.getSparrowAtlas('characters/FUJIWARA');
						iconColor = 'FFEAD0D4';
				}
							
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);

				if (curCharacter == 'fujiwara')
					loadOffsetFile(curCharacter);
				else
					loadOffsetFile('kapi');				

				playAnim('idle');
				
			case 'liz':
				frames = Paths.getSparrowAtlas('characters/liz_assets');
				iconColor = 'FFAB219D';

				animation.addByPrefix('idle', 'liz idle', 24, false);
				animation.addByPrefix('singUP', 'liz up pose', 24, false);				
				animation.addByPrefix('singDOWN', 'liz down pose', 24, false);
				animation.addByPrefix('singUPmiss', 'liz up miss', 24, false);				
				animation.addByPrefix('singDOWNmiss', 'liz down miss', 24, false);
				animation.addByPrefix('singRIGHT', 'liz right pose', 24, false);
				animation.addByPrefix('singLEFT', 'liz left pose', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'liz right miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'liz left miss', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
				
			case 'tankman' | 'tankman-mad' | 'tankman-sad-blue' | 'tankman-bw':
				switch (curCharacter)
				{
					case 'tankman':
						frames = Paths.getSparrowAtlas('characters/tankmanCaptain');
					case 'tankman-mad':
						frames = Paths.getSparrowAtlas('characters/tankman_mad');
					case 'tankman-sad-blue':
						frames = Paths.getSparrowAtlas('characters/blue/tankmanSad');
					case 'tankman-bw':
						frames = Paths.getSparrowAtlas('characters/bw/tankmanCaptain');
				}
				iconColor = 'FF2C2D41';
					
				animation.addByPrefix('idle', "Tankman Idle Dance", 24, false);
				animation.addByPrefix('singUP', 'Tankman UP note', 24, false);
				animation.addByPrefix('singDOWN', 'Tankman DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'Tankman Right Note', 24, false);
				animation.addByPrefix('singRIGHT', 'Tankman Note Left', 24, false);
				animation.addByPrefix('singUP-alt', 'TANKMAN UGH', 24, false);
				animation.addByPrefix('singDOWN-alt', 'PRETTY GOOD', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Lil Dude', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'TANKMAN UGH', 24, false);

				loadOffsetFile('tankman');

				playAnim('idle');

				flipX = true;
				
			case 'senpaighosty' | 'edd2' | 'senpaighosty-blue' | 'hd-spirit':
				switch (curCharacter)
				{
					case 'senpaighosty':
						frames = Paths.getSparrowAtlas('characters/senpaighosty_assets');
						iconColor = 'FFFF3C6E';
					case 'senpaighosty-blue':
						frames = Paths.getSparrowAtlas('characters/blue/senpaighosty_assets');
					case 'edd2':
						frames = Paths.getSparrowAtlas('characters/edd_assets_2');
						iconColor = 'FF029835';
					case 'hd-spirit':
						frames = Paths.getSparrowAtlas('characters/HD_SPIRIT');
						iconColor = 'FFFF3C6E';
				}
				
				animation.addByPrefix('idle', 'garcello idle dance', 24, false);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24,  false);
				animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24, false);
				animation.addByPrefix('disappear', 'garcello coolguy', 24, false);

				loadOffsetFile('edd2');

				playAnim('idle');	
				
			case 'bf-dad' | 'bf-dad-b3':
				switch (curCharacter)
				{
					case 'bf-dad':
						frames =  Paths.getSparrowAtlas('characters/BFDAD');
						iconColor = 'FF0EAEFE';
					case 'bf-dad-b3':
						frames =  Paths.getSparrowAtlas('characters/b3/BFDAD');
						iconColor = 'FF10A448';
				}
				
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24, false);

				addOffset('idle');
				
				if (isPlayer)
				{	
					addOffset("singUP", -10, 50);
					addOffset("singRIGHT", -49, 13);
					addOffset("singLEFT", 24, 29);	
					addOffset("singDOWN", 40, -30);		
				}
				else
				{
					addOffset("singUP", -6, 50);
					addOffset("singLEFT", -7, 13);
					addOffset("singRIGHT", 18, 29);	
					addOffset("singDOWN", 0, -30);		
				}

				playAnim('idle');
				
			case 'nene2':
				frames = Paths.getSparrowAtlas('characters/Nene_FNF_assets');
				iconColor = 'FFFF6690';
				animation.addByPrefix('idle', "Pico Idle Dance", 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'PICO NOTE LEFT0', 24, false);

				loadOffsetFile(curCharacter);
				
				playAnim('idle');
				
			case 'hd-monika' | 'hd-monika-angry':
				switch (curCharacter)
				{
					case 'hd-monika':
						frames = Paths.getSparrowAtlas('characters/HD_MONIKA');
					case 'hd-monika-angry':
						frames = Paths.getSparrowAtlas('characters/HD_MONIKA_ANGRY');
				}
				iconColor = 'FFFFB8E3';
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);

				loadOffsetFile('hd-monika');

				playAnim('idle');
				
			case 'cassandra' | 'cassandra-bw':
				switch (curCharacter)
				{
					case 'cassandra':
						tex = Paths.getSparrowAtlas('characters/cassandra');
						iconColor = 'FF454545';
					case 'cassandra-bw':
						tex = Paths.getSparrowAtlas('characters/bw/cassandra');
				}
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('idle-alt', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singUP-alt', 'Mom UGH', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				if (isPlayer)
				{
					addOffset('idle');
					addOffset('idle-alt');
					addOffset("singUP", 35, 60);
					addOffset("singLEFT", 120, -55);
					addOffset("singRIGHT", -35, -25);
					addOffset("singDOWN", 80, -160);
					addOffset("singUP-alt", -35, -25);	
				}
				else
				{
					addOffset('idle');
					addOffset('idle-alt');
					addOffset("singUP", 14, 71);
					addOffset("singRIGHT", 10, -60);
					addOffset("singLEFT", 250, -23);
					addOffset("singDOWN", 20, -160);
					addOffset("singUP-alt", 250, -23);
				}
				playAnim('idle');
				
			case 'spooky':
				tex = Paths.getSparrowAtlas('characters/spooky_kids_assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", -20, 26);
				addOffset("singRIGHT", -130, -14);
				addOffset("singLEFT", 130, -10);
				addOffset("singDOWN", -50, -130);

				playAnim('danceRight');
			case 'mom':
				tex = Paths.getSparrowAtlas('characters/Mom_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');

			case 'mom-car' | 'exgf' | 'freddy':
				switch (curCharacter)
				{
					case 'mom-car':
						tex = Paths.getSparrowAtlas('characters/momCar');
						iconColor = 'FFd8558e';
					case 'exgf':
						tex = Paths.getSparrowAtlas('characters/exGF');
						iconColor = 'FF64FFC1';
					case 'freddy':
						tex = Paths.getSparrowAtlas('characters/freddy');
						iconColor = 'FF6D3B0E';
				}
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				if (curCharacter == 'freddy')
				{
					loadOffsetFile(curCharacter);
				}
				else
				{
					addOffset('idle');
					addOffset("singUP", 14, 71);
					addOffset("singRIGHT", 10, -60);
					addOffset("singLEFT", 250, -23);
					addOffset("singDOWN", 20, -160);
				}

				playAnim('idle');
			case 'monster':
				tex = Paths.getSparrowAtlas('characters/Monster_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -30, -40);
				playAnim('idle');
			case 'monster-christmas':
				tex = Paths.getSparrowAtlas('characters/monsterChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -40, -94);
				playAnim('idle');
			case 'pico':
				tex = Paths.getSparrowAtlas('characters/Pico_FNF_assetss');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				addOffset('idle');
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -68, -7);
				addOffset("singLEFT", 65, 9);
				addOffset("singDOWN", 200, -70);
				addOffset("singUPmiss", -19, 67);
				addOffset("singRIGHTmiss", -60, 41);
				addOffset("singLEFTmiss", 62, 64);
				addOffset("singDOWNmiss", 210, -28);

				playAnim('idle');

				flipX = true;

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

			case 'bf-christmas':
				var tex = Paths.getSparrowAtlas('characters/bfChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);

				playAnim('idle');

				flipX = true;
			case 'bf-car':
				var tex = Paths.getSparrowAtlas('characters/bfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				playAnim('idle');

				flipX = true;
			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('characters/bfPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'senpai':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-angry':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				frames = Paths.getPackerAtlas('characters/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				addOffset('idle', -220, -280);
				addOffset('singUP', -220, -240);
				addOffset("singRIGHT", -220, -280);
				addOffset("singLEFT", -200, -280);
				addOffset("singDOWN", 170, 110);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;

			case 'parents-christmas':
				frames = Paths.getSparrowAtlas('characters/mom_dad_christmas_assets');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				addOffset('idle');
				addOffset("singUP", -47, 24);
				addOffset("singRIGHT", -1, -23);
				addOffset("singLEFT", -30, 16);
				addOffset("singDOWN", -31, -29);
				addOffset("singUP-alt", -47, 24);
				addOffset("singRIGHT-alt", -1, -24);
				addOffset("singLEFT-alt", -30, 15);
				addOffset("singDOWN-alt", -30, -27);

				playAnim('idle');
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	function loadOffsetFile(a:String) 
	{
        var g:Array<String> = CoolUtil.coolTextFile(Paths.txtOffsets("characters/" + a + "Offsets"));
        for (b in 0 ... g.length) 
        {
        	var c:String = g[b];
        	var j:Array<String> = c.split(" ");
        	addOffset(j[0], Std.parseInt(j[1]), Std.parseInt(j[2]));
        }
        
    }

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
