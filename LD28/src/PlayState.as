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
		
		override public function create():void {
			trace("Create Play State Event");
			FlxG.bgColor = 0xff112233;
				
			var tileSize : int = 5;
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
			add(player);
			
			super.create();
		}
			
		override public function update():void 
		{
			player.update();
			tileMap.update();
			
			FlxG.collide(player, tileMap);
			super.update();
		}
		
	}

}