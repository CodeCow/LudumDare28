package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Gamepopper
	 */
	public class FootprintManager extends FlxGroup 
	{
		
		public function FootprintManager(MaxSize:uint=0) 
		{
			super(MaxSize);
			
			for (var i:int = 0; i < MaxSize; i++)
			{
				add(new Footprint);
			}
		}
		
		public function Step(bX:int, bY:int, bAngle:Number):void
		{
			if (getFirstAvailable())
			{
				Footprint(getFirstAvailable()).Step(bX, bY, bAngle);
			}
		}
		
	}

}