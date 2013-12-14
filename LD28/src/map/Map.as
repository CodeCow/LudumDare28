package map 
{
	import org.flixel.*;
	 
	
	public class Map 
	{
		private var width:int;
		private var height:int;
		
		public var mapArray:Array;
		
		public function Map(width:int, height:int) {
			this.width = width;
			this.height = height;
			
			mapArray = new Array(width, height); // initalize the array
			FillWithEmpty(mapArray);
		}
		
		private function FillWithEmpty(map:Array){
			
			for (var column:int=0, row:int=0; row < height; row++)
			{
				for (column = 0; column < width; column++)
				{
					map[column, row] = 0; 
				}
			}
		}
		
		private function MapToString(){
			
		//TODO Needs To Print Map To Console For Debug Purposes			
		}
		
		public function Generate()
		{
		}
		
		public function Draw(sprite : FlxSprite)
		{
		}
		
		// Accessors
		public function get mapWidth(): int{
			return width;
		}
		
		public function get mapHeight(): int{
			return height;
		}
		
		public function get mapLength(): int{
			
			return mapArray.length;
			
		}
	
		public function PrintMap(){
			
		
		
		}

}

}