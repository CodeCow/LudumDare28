package  
{
	
	public class Populater 
	{
		
		public var copyOfMap : Array;
		var coins : int;
		var width: int;
		var height: int;
		
		
		
		public function Populater(mat : Array, rows: int, col: int, coins: int) 
		{
			copyOfMap = mat;
			this.width = rows;
			this.height = col;
			this.coins = coins;
		}
		
		public function determineSpawns()
		{
			
			var coinCounter : int = 0;
			var exitCounter : int = 0;
			
				for ( var y : uint = 0; y < width; ++y)
				{
					for ( var x:uint = 0; x < height; ++x)
					{
						if (coinCounter <= coins)
						{
							if (randRange(0, 100) > 60)
							{
								if (copyOfMap[y][x] != 1) // we do this check to make sure we don't somehow spawn inbetween a wall
								{
									copyOfMap[y][x] = 2; // 2's are coins
									
								}
								coinCounter += 1;
							}
						}
						
						if (exitCounter < 1)
						{
							if (randRange(0, 100) < 34)
							{
								copyOfMap[y][x] = 3; // 3's are exits
								exitCounter += 1;
							}
						}
					}
				}
				
				if (exitCounter <= 0)
				{
					copyOfMap[randRange(0, height)][randRange(0, width)] = 3; // if we somehow don't spawn an exit we force one
				}
				
		}
		
			private function randRange(minNum:Number, maxNum:Number):Number 
			{
				return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
			}
			
			
		
		
		
	}

}