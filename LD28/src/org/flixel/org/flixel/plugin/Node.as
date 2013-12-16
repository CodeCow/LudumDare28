package org.flixel.plugin
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
		public function Node(value : int, x : int, y : int, visited : Boolean)
		{
			this.value = value;
			this.X = x;
			this.Y = y;
			this.visited = visited;
		}
		
		public function isWall() : Boolean
		{
			if (value == 1)
			{
				return true;
			}
			
			return false;
		}
	}

}