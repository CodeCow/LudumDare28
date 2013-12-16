package  
{
	import org.flixel.*;
	import org.flixel.plugin.FlxCaveGenerator;
	import mapGen.CellularAutomata;
	
	/**
	 * ...
	 * @author Code Assassin
	 */
	public class PlayState extends FlxState
	{	
		[Embed(source = '../data/map/block.png')] public static var ImgBlock:Class;
		private var player
		private var tileMap:FlxTilemap;
		var debugText : FlxText;
		
		override public function create():void {
			trace("Create Play State Event");
			FlxG.bgColor = 0xFFA9A9A9;
			
			// uncomment these if you want to play around with these
			
			FlxG.debug = true;
			FlxG.visualDebug = true;
			
			var tileSize : int = 18;
			var worldSize : FlxPoint = new FlxPoint(FlxG.width, FlxG.height);
			
			
			// Create cave of size 200x100 tiles
			var cave:FlxCaveGenerator = 
				new FlxCaveGenerator(worldSize.x / tileSize, worldSize.y / tileSize);
				
			// Generate the level and returns a matrix
			// 0 = empty, 1 = wall tile
			var caveMatrix:Array = cave.generateCaveLevel();
			
			// Converts the matrix into a string that is readable by FlxTileMap
			var dataStr:String = FlxCaveGenerator.convertMatrixToStr( caveMatrix );
			//trace(dataStr);
			
			// Loads tilemap of tilesize 16x16
			tileMap = new FlxTilemap();
			tileMap.loadMap(dataStr, ImgBlock, tileSize, tileSize);
			add(tileMap);
			
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
			
			debugText = new FlxText(10, 10, FlxG.width, "X: 0 - Y: 0");
			add(debugText);
			
			super.create();
		}
			
		override public function update():void 
		{
			player.update();
			tileMap.update();
			
			FlxG.collide(player, tileMap);
			
			debugText.text = "X: " +  FlxU.round(player.x) + " - Y: " + FlxU.round(player.y);
			super.update();
		}
		
	}

}