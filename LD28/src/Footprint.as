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
		private var elapsed: Number;
		public function Footprint(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, ImgPrint);
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