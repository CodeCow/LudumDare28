package org.flixel.plugin
{
	/**
	 * This class uses the cellular automata algorithm
	 * to generate very sexy caves.
	 * (Coded by Eddie Lee, October 16, 2010)
	 */
	public class FlxCaveGenerator
	{
		private var _numTilesCols:uint = 10;
		private var _numTilesRows:uint = 10;
		
		/**
		 * How many times do you want to "smooth" the cave.
		 * The higher number the smoother.
		 */ 
		public static var numSmoothingIterations:uint = 3;
		
		/**
		 * During initial state, how percent of matrix are walls?
		 * The closer the value is to 1.0, more wall-e the area is
		 */
		public static var initWallRatio:Number = 0.5;
		
		
		/**
		 * 
		 * @param	nCols	Number of columns in the cave tilemap
		 * @param	nRows	Number of rows in the cave tilemap
		 */
		public function FlxCaveGenerator( nCols:uint, nRows:uint ) 
		{
			_numTilesCols = nCols;
			_numTilesRows = nRows;
		}
		
		/**
		 * @param 	mat		A matrix of data
		 * 
		 * @return 	A string that is usuable for FlxTileMap.loadMap(...)
		 */
		static public function convertMatrixToStr( mat:Array ):String
		{
			var mapString:String = "";
			
			for ( var y:uint = 0; y < mat.length; ++y )
			{
				for ( var x:uint = 0; x < mat[y].length; ++x )
				{
					mapString += mat[y][x].toString() + ",";
				}
				
				mapString += "\n";
			}
			
			return mapString;
		}
		
		/**
		 * 
		 * @param	rows 	Number of rows for the matrix
		 * @param	cols	Number of cols for the matrix
		 * 
		 * @return Spits out a matrix that is cols x rows, zero initiated
		 */
		private function genInitMatrix( rows:uint, cols:uint ):Array
		{
			// Build array of 1s
			var mat:Array = new Array();
			for ( var y:uint = 0; y < rows; ++y )
			{
				mat.push( new Array );
				for ( var x:uint = 0; x < cols; ++x ) mat[y].push(0);
			}
			
			return mat;
		}
		
		/**
		 * 
		 * @param	mat		Matrix of data (0=empty, 1 = wall)
		 * @param	xPos	Column we are examining
		 * @param	yPos	Row we are exampining
		 * @param	dist	Radius of how far to check for neighbors
		 * 
		 * @return	Number of walls around the target, including itself
		 */
		private function countNumWallsNeighbors( mat:Array, xPos:int, yPos:int, dist:uint = 1 ):int
		{
			var count:int = 0;
			
			for ( var y:int = -dist; y <= dist; ++y )
			{
				for ( var x:int = -dist; x <= dist; ++x )
				{
					// Boundary
					if ( xPos + x < 0 || xPos + x > _numTilesCols - 1
						|| yPos + y < 0 || yPos + y > _numTilesRows - 1 ) continue;
					
					// Neighbor is non-wall
					if ( mat[yPos + y][xPos + x] != 0 ) ++count;
				}
			}
			
			return count;
		}
		
		/**
		 * Use the 4-5 rule to smooth cells
		 */
		private function runCelluarAutomata( inMat:Array, outMat:Array ):void
		{
			const numRows:uint = inMat.length;
			const numCols:uint = inMat[0].length;
			
			for ( var y:uint = 0; y < numRows; ++y )
			{
				for ( var x:uint = 0; x < numCols; ++x )
				{
					var numWalls:int = countNumWallsNeighbors( inMat, x, y, 1 );
					
					if ( numWalls >= 5 ) outMat[y][x] = 1;
					else outMat[y][x] = 0;
				}
			}
		}
		
		/**
		 * 
		 * @return Returns a matrix of a cave!
		 */
		public function generateCaveLevel():Array
		{
			// Initialize random array
			var mat:Array = genInitMatrix( _numTilesRows, _numTilesCols );
			for ( var y:uint = 0; y < _numTilesRows; ++y )
			{
				for ( var x:uint = 0; x < _numTilesCols; ++x ) 
					mat[y][x]=( Math.random() < initWallRatio ? 1:0 );
			}
		
			// Secondary buffer
			var mat2:Array = genInitMatrix( _numTilesRows, _numTilesCols );
			
			// Run automata
			for ( var i:int = 0; i < numSmoothingIterations; ++i )
			{
				runCelluarAutomata( mat, mat2 );
				
				// Swap
				var temp:Array = mat;
				mat = mat2;
				mat2 = temp;
			}
			borderGeneration(mat);
			floodFill(mat);
			return mat;
		}
		
		private function borderGeneration(mat : Array) 
		{
			for ( var y : uint = 0; y < _numTilesRows; ++y)
			{
				for ( var x:uint = 0; x < _numTilesCols; ++x)
				{
					if (x == 0 || y == 0 || x == _numTilesCols - 1)
					{
						mat[y][x] = 0;
					}
				}
			}

		}
		
		private function floodFill(mat : Array)
		{
			
			var tile : Node = new Node();
			
			for ( var y : uint = 0; y < _numTilesRows; ++y)
			{
				for ( var x : uint = 0; x < _numTilesCols; ++x)
				{
					tile.value = mat[y][x];
					tile.X = x;
					tile.Y = y;
					var cavern : Array = [];
					var total_cavern_area : Array = [];
					//trace("loop");
					if (tile.visited == false && tile.isWall() == false)
					{
						cavern.push(tile);
						trace("actually triggered");
						
						while (cavern.length > 0)
						{
							
							var node : Object = cavern.pop();
							
							
							
							if (!node.visited && !node.isWall())
							{
								node.visited = true;
								total_cavern_area.push(node);
								
								if (node.X - 1 > 0 && !mat[node.Y][node.X - 1] == 0)
								{
									cavern.push(mat[node.Y][node.X - 1]);
								}
								
								if (node.X + 1 < mat.length && !mat[node.Y][node.X + 1] == 0)
								{
									cavern.push(mat[node.Y][node.X + 1]);
								}
								
								if (node.Y - 1 > 0 && !mat[node.Y - 1][node.X] == 0)
								{
									cavern.push(mat[node.Y - 1][node.X]);
								}
								
								if (node.Y + 1 < mat.length && !mat[node.Y + 1][node.X] == 0)
								{
									cavern.push(mat[node.X][node.Y + 1]);
								}
								
								cavern.push(total_cavern_area);
								
								
							}
							else {
								
								tile.visited = true;
							}
						
						}
						
					
						
						
					
						
					}
				}
			}
			
		}
	}
}