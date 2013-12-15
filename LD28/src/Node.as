package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class Node 
	{
		public var value : int; // the actual value it holds, so is it a wall or something
		public var X, Y : int; // Position
		public var visited : Boolean = false; // Have we visited it
		// Constructor
		public function Node()
		{
			// nothing needs to go in here
		}
		public function isWall() :Boolean
		{
			if (value == 0)
			{
				return true;
			}
			
			return false;
		}
		
	}

}