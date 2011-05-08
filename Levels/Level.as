package Levels
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Level extends Sprite
	{
		
		public var pause:Boolean = false;
		
		public var entryPoint:Point;
		public var exitPoint:Sprite;
		
		public var heroLink:Character;
		
		public var walls:Array; //contains references to obstacles (impenterable)
		
		public function Level():void
		{
			
			super();
			
		}
		
		public function Update():void
		{
			
			
			
		}
		
	}
	
}