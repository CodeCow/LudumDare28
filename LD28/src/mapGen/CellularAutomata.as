package mapGen 
{
	import org.flixel.*;
	
	public class CellularAutomata 
	{
		private var map:Map;
		
		public function CellularAutomata(map: Map) 
		{
			if (map.mapLength > 0)
			{
			
			}
			
			this.map = map; 
			
		}
		
		public function MakeCaverns(){
			for (var column : int = 0, row : int = 0; row <= map.mapHeight - 1; row++)
			{
				for (column = 0; column <= map.mapWidth - 1; column++)
				{
					map.mapArray[column][row] == PlaceWallLogic(column, row);
				}
			}
		}
		
		public function RandomFillMap(){
			var mapMiddle : int = 0;
			for (var column:int = 0, row:int = 0; row < map.mapHeight; row++)
			{
				for (column = 0; column < map.mapWidth; column++)
				{
					if (column == 0)
					{
						this.map.mapArray[column][row] = 1;
					}
					else if (row == 0)
					{
						this.map.mapArray[column][row] = 1;
					}
					else if (column == map.mapWidth - 1)
					{
						this.map.mapArray[column][row] = 1;
					}
					else if (row == map.mapHeight - 1)
					{
						this.map.mapArray[column][row] = 1;
					}
					
					else
					{
						mapMiddle = (map.mapHeight / 2 );
						if (row == mapMiddle)
						{
						  this.map.mapArray[column][row] = 0;
						}
						 
					}
				}
			}
		}
		
		private function RandomPerecent(percent:int) : int{
			if (percent >= randomRange(1, 101))
			{
				return 1;
			}
			
			return 0;
		}
		
		private function randomRange(minNum : int, maxNum : int) : int {
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		private function PlaceWallLogic(x : int, y : int) : int{
			var numWalls : int = GetAdjacentWalls(x, y, 1, 1);
			
			if (map.mapArray[x][y] == 1 )
			{
				if ( numWalls >= 4)
				{
					return 1;
				}
				if (numWalls < 2)
				{
					return 0;
				}
			}
			else
			{
				if (numWalls >= 5)
				{
					return 1;
				}
			}
			
			return 0;
		}
		
		private function GetAdjacentWalls(x : int, y : int, scopeX : int, scopeY : int) : int {
			var startX : int = x - scopeX;
			var startY : int = y - scopeY;
			var endX : int = x + scopeX;
			var endY : int = y + scopeY;
			
			var iX : int = startX;
			var iY : int = startY;
			
			var wallCounter : int = 0;
			
			for (iY = startY; iY <= endY; iY++)
			{
				for (iX = startX; iX <= endX; iX++)
				{
					if (!(iX == x && iY == y))
					{
						if (IsWall(iX, iY))
						{
							wallCounter += 1;
						}
					}
				}
			}
			
			return wallCounter;
			
		}
		
		
		
		private function IsWall( x : int, y : int) : Boolean{
			
			if (IsOutOfBounds(x, y))
			{
				return true;
			}
			
			if (this.map.mapArray[x][y] == 1 )
			{
				return true;
			}
			
			if (this.map.mapArray[x][y] == 0)
			{
				return false;
			}
			
			return false;
		}
		
		private function IsOutOfBounds( x : int, y : int) : Boolean{
			if ( x < 0 || y < 0)
			{
				return true;
			}else if ( x > map.mapWidth - 1 || y > map.mapHeight - 1 )
			{
				return true;
			}
			
			return false;
		}
	
		public function get cellularMap() : Array{
			return map.mapArray;
		}
	}

}