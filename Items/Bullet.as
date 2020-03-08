package Items
{
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.events.StatusEvent;
	import flash.geom.Point;
	import flash.events.Event;
	import Creatures.Enemy;
	
	public class Bullet extends Sprite
	{
		
		public static var allBullets:Array = new Array();
		
		public const speed:Number = 8;
		
		public static const MAX_BULLETS_ON_SCREEN:int = 10;
		
		public var dx:Number;
		public var dy:Number;
		
		public function Bullet(gunPoint:Point, gunAngle:Number):void
		{
			
			super();
			
			gunAngle = gunAngle * (Math.PI / 180); //back to radians... again(((
			
			this.x = gunPoint.x;
			this.y = gunPoint.y;
			
			this.dx = this.speed*Math.cos(gunAngle);
			this.dy = this.speed * Math.sin(gunAngle);
			
			allBullets.push(this);
			
			Game.currLevel.addChild(this);
			
		}
		
		public function Update():void {
			
			var j:int;
			
			for (j = 0; j < Enemy.allEnemies.length; j++)
			{
				
				if (this.hitTestObject(Enemy.allEnemies[j]))
				{
					
					Enemy.allEnemies[j].getDamage();
					this.deleteBullet();
					return;
					
				}
				
			}
			
			this.x += this.dx; 
			this.y += this.dy;
			
			//var edges:Point = new Point(parent.width, parent.height);
			//edges = Game.currLevel.globalToLocal(edges);
			
			if (this.x > 630 || this.x < 0 || this.y > 420 || this.y < 0) //magic number must be removed
			{
				
				deleteBullet();
				
			}
			
		}
		
		public function deleteBullet():void
		{
			
			parent.removeChild(this);
			allBullets.splice(allBullets.indexOf(this),1);
			delete this;
			
		}
		
		
	}
	
	
}