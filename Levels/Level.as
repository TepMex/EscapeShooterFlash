package Levels
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import Creatures.Character;
	import Items.Bullet;
	import Creatures.Enemy;
	
	public class Level extends Sprite
	{
		
		public var entryPoint:Point;
		public var exitPoint:Point;
		
		public var heroLink:Character;
		
		public var walls:Array; //contains references to obstacles (impenterable)
		
		public function Level():void
		{
			
			super();
			
		}
		
		public function Update():void
		{
			
			
			
		}
		
		public function deleteLevel():void
		{
			
			Bullet.allBullets = new Array();
			Enemy.allEnemies = new Array();
			parent.removeChild(this);
			delete this;
			
		}
		
	}
	
}