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
			offset.x += 17;
			offset.y += 34.5;
			width -= 34;
			height -= 67;
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
					velocity.y = 0;
				}
			}
			
			if (FlxG.keys.A)
			{
				velocity.x -= speed;
				if (x < 0)
				{
					x = 0;
					velocity.x = 0;
				}
			}
			
			if (FlxG.keys.S)
			{
				velocity.y += speed;
				
				if (y + height > FlxG.height)
				{
					y = FlxG.height - height;
					velocity.y = 0;
				}
			}
			
			if (FlxG.keys.D)
			{
				velocity.x += speed;
				
				if (x + width > FlxG.width)
				{
					x = FlxG.width - width;
					velocity.x = 0;
				}
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