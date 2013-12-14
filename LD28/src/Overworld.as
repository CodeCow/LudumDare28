package  
{
	import org.flixel.*;
	import map.Map;
	import map.CellularAutomata;
	
	public class Overworld extends Map 
	{
		private var automataGenerator : CellularAutomata;
		
		public function Overworld(width:int, height:int) 
		{
			super(width, height);
		}
		
		override public function Generate()
		{
				automataGenerator = new CellularAutomata(this);
				automataGenerator.RandomFillMap();
				automataGenerator.MakeCaverns();
				
				mapArray = automataGenerator.cellularMap;
				
				trace(mapArray);
				
		}
		
		override public function Draw(sprite : FlxSprite)
		{
			
		}
		
		
		
	}

}