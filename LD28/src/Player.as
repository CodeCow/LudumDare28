package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author Gamepopper
	 */
	public class Player extends FlxSprite 
	{
		[Embed(source = '../data/sprites/player/player_sheet.png')] public static var ImgPlayer:Class;
		private var speed = 60;
		
		public function Player(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{			
			super(X, Y, SimpleGraphic);
			//makeGraphic(4, 4, 0xbb888800);
			loadGraphic(ImgPlayer, true, true, 45, 85);
			addAnimation("Stand", [0]);
			addAnimation("Walking", [1, 2, 3, 4, 5], speed / 5, true);
			scale.x = scale.y = 0.2;
			width = 12;
			height = 16;
			offset.x = 0;
			offset.y = 0;
			origin.x = 0;
			origin.y = 0;
			

		}
		
		override public function update():void 
		{	
			velocity = new FlxPoint();
			if (FlxG.keys.W)
			{
				velocity.y -= speed;
				
				if (y < 0)
				{
					y = 0;
				}
			}
			
			if (FlxG.keys.A)
			{
				velocity.x -= speed;
				if (x < 0)
				{
					x = 0;
				}
			}
			
			if (FlxG.keys.S)
			{
				velocity.y += speed;
				
				if (y + height > FlxG.height)
				{
					y = FlxG.height - height;
				}
			}
			
			if (FlxG.keys.D)
			{
				velocity.x += speed;
			}
			
			if (velocity.x != 0 || velocity.y != 0)
			{
				play("Walking");
			}
			else
			{
				play("Stand");
			}
			
			super.update();
		}
		
	}

}