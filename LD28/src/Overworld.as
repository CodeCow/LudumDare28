package  
{
	import org.flixel.*;
	import maplib.*;
	
	public class Overworld extends Map 
	{
		private var automataGenerator : CellularAutomata;
		
		public function Overworld(width:int, height:int) 
		{
			super(width, height);
		}
		
		override public function Generate():void 
		{
			automataGenerator = new CellularAutomata(this);
			automataGenerator.RandomFillMap();
			automataGenerator.MakeCaverns();
			
			mapArray = automataGenerator.cellularMap.mapArray;
			
			trace(mapArray);
			
			super.Generate();
		}
		
		override public function Draw(sprite:FlxSprite):void 
		{
			super.Draw(sprite);
		}	
	}

}