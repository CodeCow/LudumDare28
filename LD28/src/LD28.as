package
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width = "640", height = "480", backgroundColor = "#000000")] //Set the size and color of the Flash file
	[Frame(factoryClass = "Preloader")]
	
	public class LD28 extends FlxGame
	{
		//var debugLevel : Overworld = new Overworld(20, 20);
		public function LD28()
		{
			super(320,240,MenuState,2); //Create a new FlxGame object at 320x240 with 2x pixels, then load PlayState
		    //debugLevel.Generate();
		}
	}
}