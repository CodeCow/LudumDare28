package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Gamepopper
	 */
	public class Footprint extends FlxSprite 
	{
		[Embed(source = '../data/sprites/player/shoeprint.png')] public static var ImgPrint:Class;
		private var elapsed: Number = 0;
		public function Footprint() 
		{
			super(FlxG.width/2, FlxG.height/2, ImgPrint);
			//exists = false;
		}
		
		override public function update():void 
		{		
			elapsed += FlxG.elapsed;
			
			if (elapsed > 1)
			{
				alpha -= FlxG.elapsed;
			}
			
			super.update();
		}
		
	}

}