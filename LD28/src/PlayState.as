package  
{
	import org.flixel.*;
	import org.flixel.plugin.FlxCaveGenerator;
	
	/**
	 * ...
	 * @author Code Assassin
	 */
	public class PlayState extends FlxState
	{		
		[Embed(source = '../data/map/block.png')] public static var ImgBlock:Class;
		
		override public function create():void {
			var tileSize : int = 16;
			var worldSize : FlxPoint = new FlxPoint(FlxG.width, FlxG.height);
			
			
			// Create cave of size 200x100 tiles
			var cave:FlxCaveGenerator = 
				new FlxCaveGenerator(worldSize.x / tileSize, worldSize.y / tileSize);
				
			// Generate the level and returns a matrix
			// 0 = empty, 1 = wall tile
			var caveMatrix:Array = cave.generateCaveLevel();
			
			// Converts the matrix into a string that is readable by FlxTileMap
			var dataStr:String = FlxCaveGenerator.convertMatrixToStr( caveMatrix );
			trace(dataStr);
			
			// Loads tilemap of tilesize 16x16
			var tileMap:FlxTilemap = new FlxTilemap();
			tileMap.loadMap(dataStr, ImgBlock, tileSize, tileSize);
			add(tileMap);
			
			super.create();
		}
			
		override public function update():void 
		{
			
			super.update();
		}
		
	}

}