package  
{
	import org.flixel.*;
	
	public class MenuState extends FlxState 
	{
		override public function create():void 
		{
			FlxG.flash(1);
			FlxG.mouse.show();
			
			var TitleText : FlxText = new FlxText(0, FlxG.height / 4, FlxG.width, "You Only Get One");
			TitleText.alignment = "center";
			TitleText.size = 24;
			
			var LudumDareText : FlxText = new FlxText(-FlxG.width/30, FlxG.height - FlxG.height/15, FlxG.width, "Ludum Dare 28");
			LudumDareText.alignment = "right";
			
			var CreditsText : FlxText = new FlxText(0, FlxG.height / 4 +  + (FlxG.height / 8), FlxG.width, "CodeAssassin & Gamepopper");
			CreditsText.alignment = "center"
			
			var PlayButton : FlxButton = new FlxButton(0, FlxG.height / 2, "Play", FadeToPlay);
			PlayButton.x = FlxG.width / 2 - PlayButton.width / 2;
			
			add(TitleText);
			add(LudumDareText);
			add(CreditsText);
			add(PlayButton);
			super.create();
		}
		
		override public function update():void 
		{
			
			super.update();
		}
		
		public function FadeToPlay() : void	
		{
			FlxG.fade(0xff000000, 0.25, GoToPlay, true);
		}
		
		public function GoToPlay() : void
		{
			FlxG.switchState(new PlayState());
		}
	}

}