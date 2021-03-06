package  
{
	import flash.display.InteractiveObject;
	import org.flixel.*;
	import org.flixel.plugin.FlxCaveGenerator;
	import org.flixel.plugin.photonstorm.*;
	
	import mapGen.CellularAutomata;
	
	/**
	 * ...
	 * @author Code Assassin
	 */
	public class PlayState extends FlxState
	{	
		[Embed(source = '../data/map/block.png')] public static var ImgBlock:Class;
		[Embed(source = '../data/map/coin.png')] public static var ImgCoin:Class;
		[Embed(source = '../data/map/door.png')] public static var ImgDoor:Class;
		[Embed(source = '../data/music/maybemusic-b.mp3')] public static var PlayMusic:Class;
		[Embed(source = '../data/map/background.png')] public static var Background : Class;
		private var player:Player;
		private var tileMap:FlxTilemap;
		private var debugText : FlxText;
		private var Door:FlxSprite;
		//private var p:Footprint;
		//private var prints:FlxGroup;
		
		override public function create():void {
			trace("Create Play State Event");
			FlxG.bgColor = 0xFFA9A9A9;
			FlxG.mouse.hide();
			FlxG.play(PlayMusic, 1, true, true).fadeIn(1);
			FlxG.flash(1);
			
			// uncomment these if you want to play around with these
			
			//FlxG.debug = true;
			//FlxG.visualDebug = true;
			
			var tileSize : int = 18;
			var worldSize : FlxPoint = new FlxPoint(FlxG.width, FlxG.height);
			var bg : FlxSprite = new FlxSprite(0, 0, Background);
			FlxGridOverlay.overlay(bg, tileSize, tileSize, -1, -1, false, true, 0x44e7e6e6, 0x44d9d5d5);
			add(bg);
			
			var cave:FlxCaveGenerator = 
				new FlxCaveGenerator(worldSize.x / tileSize, worldSize.y / tileSize);
				
			// Generate the level and returns a matrix
			// 0 = empty, 1 = wall tile
			var caveMatrix:Array = cave.generateCaveLevel();
			
			// Converts the matrix into a string that is readable by FlxTileMap
			var dataStr:String = FlxCaveGenerator.convertMatrixToStr( caveMatrix );
			//trace(dataStr);
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(dataStr, ImgBlock, tileSize, tileSize);
			add(tileMap);
			
			/*for (dx = 0; dx < tileMap.widthInTiles; dx++)
			{
				for (dy = 0; dy < tileMap.heightInTiles; dy++)
				{
					if (tileMap.getTile(dx, dy) == 3)
					{
						trace(dx + " - " + dy);
						Door.x = tileMap.getTileCoords(tileMap.get;
						Door.y = dy * tileSize;
					}
				}
			}*/
			
			add(Door);
			
			player = new Player();
			var x : int = (int)(FlxG.random() * tileMap.widthInTiles), 
			y : int = (int)(FlxG.random() * tileMap.heightInTiles);
			
			while (tileMap.getTile(x, y) == 1)
			{
				x = (int)(FlxG.random() * tileMap.widthInTiles) - 1;
				y = (int)(FlxG.random() * tileMap.heightInTiles) - 1;
			}
			
			player.x = x * tileSize;
			player.y = y * tileSize;
			add(player);
			
			super.create();
		}
			
		override public function update():void 
		{
			player.update();
			tileMap.update();
			//p.update();
			FlxG.collide(player, tileMap);
			
			if (FlxG.keys.justReleased("ESCAPE") || FlxG.keys.justReleased("BACKSPACE"))
			{
				FlxG.switchState(new MenuState);
			}
			
			//debugText.text = "X: " +  FlxU.round(player.x) + " - Y: " + FlxU.round(player.y);
			super.update();
		}
		
	}

}