package  
{
	import flash.display.Sprite;
	import org.flixel.system.FlxPreloader;
	
	/**
	 * ...
	 * @author Gamepopper
	 */
	public class Preloader extends FlxPreloader 
	{
		
		public function Preloader() 
		{
			className = "LD28";
			super();
			minDisplayTime = 3;
		}
		
		override protected function create():void 
		{
			_buffer = new Sprite();
			addChild(_buffer);
			super.create();
		}
		
		override protected function update(Percent:Number):void 
		{
			
			super.update(Percent);
		}
		
	}

}